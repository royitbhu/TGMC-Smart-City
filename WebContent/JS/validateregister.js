function show(ele,ele1,ele2,ele3) 
{
	var srcElement = document.getElementById(ele);
      	if(srcElement != null) 
	{
		if(srcElement.style.display == "block") 
		{
			srcElement.style.display= 'none';

		}
		else 
		{
			srcElement.style.display='block';
		}
	}
}
function numbersonly(e){
	var unicode=e.charCode? e.charCode : e.keyCode
	if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
		if (unicode<48||unicode>57) //if not a number
			return false //disable key press
	}
}
function Showdiv(ele){
	var srcElement = document.getElementById(ele);
	
   	if(srcElement != null && srcElement.style.display!='block')
   	{
    		srcElement.style.display= 'block';
   	}
}
function Hidediv(ele){
	var srcElement = document.getElementById(ele);
	
     	if(srcElement != null && srcElement.style.display!='none')
     	{
     		srcElement.style.display= 'none';
		
      	}
}	
function ShowHide(ele){
	var srcElement = document.getElementById(ele);
     	if(srcElement != null) 
	{
		if(srcElement.style.display == "block") 
		{
			srcElement.style.display= 'none';
		}
		else 
		{
			srcElement.style.display='block';
		}
	}
}
