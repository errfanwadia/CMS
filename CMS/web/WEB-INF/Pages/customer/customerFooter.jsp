<%-- 
    Document   : customerFooter
    Created on : 19 Oct, 2013, 3:45:04 PM
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
        <title>JSP Page</title>
        <style>
            .footer{
                text-align:center;
                background: #EDEBEB;
            }
        </style>
    </head>
    <body>
        <div class="footer"><br/>&nbsp;&nbsp;&nbsp;&nbsp;<s:a href="#">Contact Us </s:a> &nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:a href="feedback">  Feedback</s:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:a href="#">FAQ</s:a><br/><br/></div>
    </body>
</html>
