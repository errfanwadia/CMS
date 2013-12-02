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
        <s:form action="fundTransfer" method="post">
            <iframe  src="<s:url value="findUser" ><s:param name="userIDTo" value="%{userIDTo}"></s:param></s:url>" scrolling="yes" height="200" width="200" frameborder="0" name="imgbox" id="imgbox" >         
    </iframe>
            <s:textfield name="amount" placeholder="Enter amount" requiredposition="true"/></br>
            <s:password name="pass" id="pass" placeholder="Enter your password" cssClass="input-xlarge" required="true" />
            <s:submit value="Transfer" cssClass="btn-info btn"/>
            
        </s:form>
        <%@include  file="customerFooter.jsp" %> 
    </body>
</html>