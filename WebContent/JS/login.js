function checkusername()
{		
			var str=document.login.username.value;
			var form=document.login;
			if (str.length==0)
			{ 
				alert("Please enter the username");
  				form.username.focus();
  				return false;
  			}
			
			
			for(var i=0; i <= (str.length - 1); i++)
				{
					var theChar = str.substring(i,i+1);
					 if( !( (theChar >= '0' && theChar <= '9') || (theChar >= 'a' && theChar <= 'z') || (theChar >= "A" && theChar <= "Z") || (theChar == '_')||(theChar=='@')||(theChar=='.')) )
					{
						
						alert("Username Should not contain any special characters.");
						form.username.focus();			
						return false ;
					}
				}
			var passwd=document.login.password.value;
			
			 if (passwd.length==0)
			{ 
  				alert("Password is blank");
  				form.password.focus();
  				return false;
  			}
  			 if(passwd.length<6)
			{
				alert("Enter a password that has at least six characters.");
				form.password.focus();
  				return false;
			}
			 
			 return true;
			
		
		
		
}
