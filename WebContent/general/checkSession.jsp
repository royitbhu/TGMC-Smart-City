
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    //response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    %>
<%
session = request.getSession(false);
if (session.getAttribute("SessionUser")== null || !((session.getAttribute("SessionType").toString()).equals("general")))
    {
     request.setAttribute("error", "Session has ended.  Please login.");
        
 	response.sendRedirect("/smartCityVaranasi/accessNotAllowed.jsp");
	return;

}
    %>
