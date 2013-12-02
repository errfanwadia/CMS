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
        <title>Advance Search Page</title> 
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/jquery.js"></script>
        <link media="screen" rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/datepicker.css" />                
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js"></script>                        
        <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
        <script type="text/javascript">
            function load()
            {
                alert("Page Loaded");
                $('.datepicker').DatePicker();
            }
        </script>
        <style>
            body
            {
                padding: 50px;
            }
            .mydate input
            {
                height:30px;
            }
        </style>
    </head>
    <body onload="load();">                        
        <div style="color: red;">
            <s:actionmessage />
            <s:actionerror />
        </div>
        <h1>Welcome Customer!</h1>  
        
            <input type="text" class="datepicker" data-format="dd-MM-yyyy"  placeholder="Select .." />
        
        <%@include  file="customerFooter.jsp" %>        
    </body>

</html>
