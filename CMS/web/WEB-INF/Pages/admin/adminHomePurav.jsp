<%-- 
    Document   : adminHome
    Created on : 16 Oct, 2013, 4:39:07 PM
    Author     : errfanwadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=application.getContextPath()%>bootstrap/css/bootstrap-responsive.css">                
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
        <title>Admin Home page</title>
        <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
        %>
    </head>
    <body>
        <table style="margin-left: 5%">
            <tr>
                <td><jsp:include page="sideBar.jsp"></jsp:include></td>
                <td><div style="margin-left: 40%">
        <legend>Admin Home</legend>
        
      </div></td>
            </tr>
        </table>
    </body>
</html>
