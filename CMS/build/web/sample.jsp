<%-- 
    Document   : sample
    Created on : 24 Oct, 2013, 11:23:21 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <table>
            
             <%@include file="Image.jsp" %>
            <h1>This is a sample page</h1>
            <s:textfield name="fname" />
        </table>
    </body>
</html>
