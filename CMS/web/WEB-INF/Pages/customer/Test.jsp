<%-- 
    Document   : Test
    Created on : 13 Nov, 2013, 10:13:46 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>Customer Home Page</title>
    </head>
    <body>
        <s:action name="history" namespace="/" executeResult="true" />
    </body>
</html>
