<%-- 
    Document   : applet
    Created on : 15 Nov, 2013, 6:33:32 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>JSP Page</title>
    </head>
    <body>
        <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
        </APPLET>
    </body>
</html>
