<%-- 
    Document   : Image
    Created on : 31 Oct, 2013, 2:39:26 AM
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
        <img src="<s:url value="findUser"/>">
        Hello World
        <s:property value="%{fname}" /> 
        <s:property value="%{lname}" />
    </body>
</html>
