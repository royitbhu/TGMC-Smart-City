!window.$j && (function($){

	$.jswaf = {};
	$j = $.jswaf

	var resources={},
	    modules={},
	    depends={},
	    events={},
		eventfired={},
		modulepath={},
		themepath={};
	var _nullf=function(){}; // for internal use..

	var WAIT_TIME_RECHECK_FETCHED = 300; // time to wait between checks for loaded module
	var WAIT_TIME_LOAD_CALLBACK = 20;
	var WAIT_TIME_UNLOAD_CALLBACK = 20;
	var WAIT_TIME_EVENT_FIRE = 20;
	var WAIT_TIME_ADD_REPO_CALLBACK=20;

	// todo: these are for debugging purposes only, remove them later
	$j.resources = resources;
	$j.modules = modules;
	$j.depends = depends; 
	$j.events = events;
	$j.eventfired = eventfired;
	$j.modulepath = modulepath;
	$j.themepath = themepath;

	function getListeners(evt) {
		if( events[evt] != undefined )
			return events[evt];
		events[evt] = [];
		eventfired[evt] = 0;
		return events[evt];
	}
	$.jswaf.fireEvent = function(evt) {
		if( evt==undefined ) return;
		var evtListeners = getListeners(evt);
		for( ind in evtListeners ) {
			setTimeout( evtListeners[ind], WAIT_TIME_EVENT_FIRE);
		}
		eventfired[evt]++;
	}
	$.jswaf.registerListener = function(evt, callback, getPastEvents, once) {
		if( evt==undefined ) return;
		if( typeof callback != 'function' ) return;
		var evtListeners = getListeners(evt);
		evtListeners[ evtListeners.length ] = callback;

		if(getPastEvents==true) {
			if( once ) {
				if( eventfired[evt]>0 ) {
					setTimeout( callback, WAIT_TIME_EVENT_FIRE);
				}
			} else {
				for( i=eventfired[evt]; i>0; i-- ) {
					setTimeout( callback, WAIT_TIME_EVENT_FIRE);
				}
			}
		}
	}
	
	$.jswaf.addRepository = function(path, callback) {
		if( callback==undefined ) callback=_nullf;
		if( path.charAt(path.length-1) !='/' ) path += '/';
		var modpath = path+'modules/module-list.js';
		var thpath = path+'themes/theme-list.js';
		function finish(val) {
			if( val!=true ) val=false;
			setTimeout( function(){callback(val);},WAIT_TIME_ADD_REPO_CALLBACK ); 
		}

		$.ajax({type:'GET', url:modpath, error: finish, success:modsuccess, 
		        dataType: 'json', cache:false});

		function modsuccess(modlist){
			$.ajax({type:'GET', url:thpath, error: finish, success:thsuccess, 
		        dataType: 'json', cache:false});

			function thsuccess(thlist) {
				for( var module in modlist ) {
					module = modlist[module];
					if( modulepath[module]==undefined ) {
						modulepath[module] = path +'modules/' + module + '/';
					}
				}
				for( var theme in thlist ) {
					theme = thlist[theme];
					if( themepath[theme]==undefined ) {
						themepath[theme] = path +'themes/' + theme + '/';
					}
				}
				finish(true);
			}
		}
	}
	$.jswaf.getModulePath = function(moduleid) { return modulepath[moduleid]; };
	$.jswaf.getThemePath = function(theme) { return themepath[theme]; }

	function fetchModule(path,callback) {
		$.getScript(path,callback);
	}
	function moduleExists(id) { return window[id]!=undefined; }
	function augmentResources(resList, module) {
		for( var res in resList )
			resources[res] = module;
	}
	function moduleNotAvailable(id) { $j.fireEvent('module-not-available'); /*$.log( "module '"+id+"' not available!" );*/ }
	function moduleIsValid(obj, id) {
		var validStructure = !(!obj.id || obj.id!=id || !obj.init || !obj.main || !obj.unload || 
		!obj.serviceRequest || obj.req==undefined || obj.prod==undefined);
		if( validStructure==false ) return false;
		for( var res in obj.prod )
			if( resources[res] ) return false;
		return true;
	}
	function handleInvalidModule(i){$.log("module '"+i+"' is invalid, and shall not be loaded." );}
	function canInitializeModule(module) {
		for( var req in module.req )
			if(resources[req]==undefined) return false;
		return true;
	}
	function handleInadequateResources(i){
		$.log("module '"+i+"' cannot be loaded because its requruirements are not available");
	}
	function handleFailedInitalization(i){ $.log("module '"+i+"' failed during initialization");}
	function addModule(obj) { modules[obj.id]=obj; }
	function addDependencies(module) {
		for( var req in module.req ) {
			var found = false;
			var dependents = depends[ resources[req].id ];
			for( var moduleIdIndex in dependents ) {
				if( moduleIdIndex ==  module.id ) { found=true; break; }
			}
			if( found==false )
				dependents[ module.id ] = true;
		}
		if( !depends[ module.id ] )
			depends[ module.id ] = {};
	}
	$.jswaf.loadModule = function(arg1, arg2, arg3) {
		var id = "";
		var conf = {};
		var callback = _nullf;
		if( typeof arg1 == "string" ) {
			id = arg1;
			if( typeof arg2 == "object" ) {
				conf = arg2;
				if( arg3 != undefined ) callback = arg3;
			} else if( typeof arg2 == "function" ) {
				callback = arg2;
			}
		} else if( typeof arg1 == "object" ) {
			if( arg1['id'] != undefined ) id = arg1['id'];
			if( arg1['conf'] != undefined ) conf = arg1['conf'];
			if( arg2 != undefined ) callback = arg2;
		}
		_loadModule(id, conf, callback);
	}
	function _loadModule(id, conf, callback) {
		function finish(val) {
			setTimeout( function(){callback(val);},WAIT_TIME_LOAD_CALLBACK ); 
		}
		if( modules[id] ) {finish(true); return;} // module already exists and is loaded
		var path = $.jswaf.getModulePath(id);
		if( path==undefined ) { $.log('trying to load unavailable module '+id); return; }

		path =  path + 'module.js';
		var done = false;

		function fetchDoneCallback(){ done=true; }
		if( moduleExists(id) ) { done=true; } // module has already been fetched, but is not executing
		else fetchModule(path,fetchDoneCallback); // todo: check the response code of ajax fetching.. what if 404?

		(function _w(c) { // wait until done=true
			if( !done ) { setTimeout(function(){_w(c);},WAIT_TIME_RECHECK_FETCHED);return; } c();
		})(function() {

		if( !moduleExists(id) ) { moduleNotAvailable(id); finish(false); return; }
		var obj = new (window[id])();
		if( !moduleIsValid(obj,id) ){ handleInvalidModule(id); finish(false); return; }
		if( !canInitializeModule(obj) ){ handleInadequateResources(id); finish(false); return; }
		if( !obj.init(conf) ){ handleFailedInitalization(id); finish(false); return; }
		augmentResources( obj.prod, obj );
		addModule(obj);
		addDependencies(obj);
		obj.main();
		finish(true);

		});
	}

	$.jswaf.unloadModule = function(moduleId, arg1, arg2) {
		if( moduleId==undefined ) return;
		if( modules[moduleId]==undefined ) return;
		var callback = null;
		var recursive = null;

		if( typeof arg1 == "function" ) callback = arg1;
		else if( typeof arg1 == "boolean" )	recursive = arg1;

		if( typeof arg2 == "function" )	callback = arg2;
		else if( typeof arg2 == "boolean" )	recursive = arg2;

		if( callback == null ) callback = _nullf;
		if( recursive == null ) recursive = true;

		function finalize(modId) {
			modules[modId].unload();
			delete depends[modId];
			for( mod in depends ) {
				var deps = depends[mod];
				for( dep in deps ) {
					if( dep == modId )
						delete deps[dep];
				}
			}
			for( var prod in modules[modId].prod )
				delete resources[prod];
			delete modules[modId];
		}
		function finish(val) {
			setTimeout( function(){callback(val);},WAIT_TIME_UNLOAD_CALLBACK ); 
		}
		if( recursive ) {
			if( depends[moduleId].length==0 ) {
				finalize(moduleId);
				finish(true);
				return;
			} else {
				var dependents = depends[moduleId];
				for( var index in dependents ) {
					$.jswaf.unloadModule(dependents[index], true, _nullf);
				}
				finalize(moduleId);
				finish(true);
			}
		} else {
			if( depends[moduleId].length != 0 ) {
				finish(false);
				return;
			}
			finalize(moduleId);
			finish(true);
		}
	}

	$.jswaf.getResource = function(res) {
		if( !resources[res] ) return null;
		return resources[res].serviceRequest(res);
	}
	$.jswaf.hasResource = function(res) {
		if( resources[res]!=undefined ) return true;
		else return false;
	}

	$.jswaf.getCSS = function(url, media) { // from Jason Stahl
		var link = document.createElement('link');
		link.href = url;
		link.rel = 'stylesheet';
		link.type = 'text/css';
		document.getElementsByTagName('head')[0].appendChild(link);
	};

	$.jswaf.loadTheme = function(theme) {
		var path = $.jswaf.getThemePath(theme);
		$.get(path+"theme.js", function(data) {
		var conf = eval(data);
		var css = conf.css;
		for( i in css )
			$.jswaf.getCSS( path+css[i] );
		$.get(path+conf.body,function(d){
		$('body').prepend(d);
		});		
	});}
	
})(jQuery);

