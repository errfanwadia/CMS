<%-- 
    Document   : fundTransfer
    Created on : Nov 4, 2013, 11:10:48 AM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fund Transfer Page</title>
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script>
            function empty()
            {                
                document.getElementById("amt").value="";
            }
        </script>
    </head>
    <body onload="empty();" background="bg.gif">
        <%@include  file="customerHeader.jsp" %> 
        <s:actionmessage></s:actionmessage>
             <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
            <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
            </script>
            <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
            </script>

            <script>
                $(document).ready(function() {
                    // binds form submission and fields to the validation engine
                    $("#myform").validationEngine();
                });

            </script>
            <div class="well" style="margin-top:5%; height: 200px; margin-left: 20%; width: 45%;">
        <s:form action="fundTransfer" method="post" id="myform">
            
                 
                    <iframe style="float: left;"  src="<s:url value="findUser" ><s:param name="id" value="%{userIDTo}"></s:param></s:url>" scrolling="yes" height="200" width="200" frameborder="0" name="imgbox" id="imgbox" >         
                    </iframe>
                
                    <div style="margin-left: 30%; margin-top: -28%; border: thin; width: 80%; float: left;">
                    <s:hidden name="userIDTo" value="%{userIDTo}" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="amt" id="amt" placeholder="Enter the amount"  cssClass="validate[required,custom[integer]]" requiredposition="true"/></br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:password name="pass" id="pass" placeholder="Enter your password" cssClass="validate[required,minSize[6]]" required="true" />
            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <s:submit value="Transfer" cssClass="btn-info btn"/>
                    </div>
           
        </s:form>
             </div>
      <%--  <%@include  file="customerFooter.jsp" %> --%>
    </body>
</html>