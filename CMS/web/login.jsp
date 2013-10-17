<%-- 
    Document   : login
    Created on : 8 Oct, 2013, 9:26:01 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
         <SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
        </SCRIPT>
        
    </head>
    <s:head />
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        
    <s:actionmessage />

    <s:actionerror />

    <s:form id="idLoginForm" action="loginCheck" >
		<s:textfield name="userID" placeholder="Username" label="Username" />
		<s:password name="pass" placeholder="Password" label="Password" />
		<s:submit value="Submit" />
    </s:form>    
    </body>
</html>
