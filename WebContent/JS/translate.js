<script type="text/javascript"
        src="http://www.google.com/jsapi"></script>
<script type="text/javascript">

 // Initialize version 1.0 of Google AJAX API
 google.load("language", "1");

 function translate(lang) {
   var source = document.getElementById("article").innerHTML;
   var len = content.length;

   // Google Language API accepts 500 characters per request 
   var words = 500;

   // This is for English pages, you can change the
   // sourcelang variable for other languages
   var sourcelang = "en";
   document.getElementById("translation").innerHTML = "";

   for(i=0; i<=(len/words); i++) {
     google.language.translate (source.substr(i*words, words),
                 "en", lang, function (result) {
     if (!result.error) {
     document.getElementById("translation").innerHTML
           = document.getElementById("translation").innerHTML
           + result.translation;
    } }); }  

  // Hide the text written in the original language
  document.getElementById("article").style.display = 'none';
  return false;
 }

 // Switch to the original language

 function original() {
  document.getElementById("translation").style.display='none';
  document.getElementById("article").style.display = 'block';
  return false;
 }
</script>