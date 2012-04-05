var request;
var divis;
var file;

function getRequestObject() {
  if (window.ActiveXObject) {
    return(new ActiveXObject("Microsoft.XMLHTTP"));
  } else if (window.XMLHttpRequest) {
    return(new XMLHttpRequest());
  } else {
    return(null);
  }
}

function sendRequest(file,di) {
	
  request = getRequestObject();
  divis=di;	
  request.onreadystatechange = handleResponse;
  //alert(request.responseText);
  request.open("get", file, true);
  request.send(null);
}

function handleResponse() {

  if (request.readyState == 4) {
 document.getElementById(divis).innerHTML = request.responseText;
//alert(request.responseText);
  }
}
