<%-- 
    Document   : fundTransfer
    Created on : Nov 4, 2013, 11:10:48 AM
    Author     : Al-Hujjat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fund Transfer Page</title>
    </head>
    <body>
        <%@include  file="customerHeader.jsp" %> 
        <s:actionmessage></s:actionmessage>
        <s:form action="find" method="post">
            <s:textfield name="userIDTo" placeholder="Enter DA-IICT ID of user to Transfer Fund" />
            <s:submit value="Find User" cssClass="btn-info btn"/>            
        </s:form>
        <%@include  file="customerFooter.jsp" %> 
    </body>
</html>
