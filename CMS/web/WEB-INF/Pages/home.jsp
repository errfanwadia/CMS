<%-- 
    Document   : home
    Created on : 8 Oct, 2013, 9:35:30 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
        %>

       
    </head>
    <body >
        <h1>You have Successfully Logged In !</h1>
        <h5><a href="logout" >Log Out</a></h5>
    </body>
</html>
