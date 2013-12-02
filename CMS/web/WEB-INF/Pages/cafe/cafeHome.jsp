<%-- 
    Document   : cafeHome
    Created on : 16 Oct, 2013, 4:44:24 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafe Owner's Home Page</title>
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
        %>
    </head>
    <body>
        <%@include file="cafeHeader.jsp" %>
        <h1>Welcome Cafe Owner !</h1>       
        <s:hidden name="cafeID" />
    </body>
</html>
