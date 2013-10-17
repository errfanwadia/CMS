<%-- 
    Document   : cmcHome
    Created on : 16 Oct, 2013, 4:40:11 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CMC Home Page</title>
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
        %>
    </head>
    <body>
        <h1>Welcome CMC Member !</h1>
         <h5><a href="logout" >Log Out</a></h5>
    </body>
</html>
