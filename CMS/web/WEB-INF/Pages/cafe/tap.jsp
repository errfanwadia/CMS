<%-- 
    Document   : Tap
    Created on : 10 Nov, 2013, 2:59:50 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>Tap Card Page</title>     
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
         <script>
         function printNumber(number) {
                document.getElementById("rfid").value = number;
                document.getElementById("form").submit();
            }
    </script>
    </head>
    <body>                    
          
    <%@include file="cafeHeader.jsp" %>       
    <div style="color: red;margin-left: 40%">
        <s:actionmessage />
        <s:actionerror />
    </div>
    <div style="color: black;text-align: center">
        <h1>Waiting For RFID Tap</h1>
        <h3>If you are not automatically redirected to order placing page then reload this page and try again</h3>
    </div>
    <div style="display:none">
        <s:form action="getUserData" method="post" id="form">
            <s:hidden name="rfid" id="rfid" />
        </s:form>
    </div>   
     <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
    </APPLET>
</body>
</html>
