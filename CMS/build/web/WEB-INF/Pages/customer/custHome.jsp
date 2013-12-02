<%-- 
    Document   : custHome
    Created on : 16 Oct, 2013, 4:40:48 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Home Page</title>
        <SCRIPT type="text/javascript">             
            window.history.forward();
            function noBack() { window.history.forward(); }
        </SCRIPT>  
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
        %>
        
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">                 
         <%@include  file="customerHeader.jsp" %> 
        <h1>Welcome Customer!</h1>        
        <%@include  file="customerFooter.jsp" %> 
       
    </body>
      
</html>
