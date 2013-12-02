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
    </head>
    <body background="bg.gif">
        <div>
            <%@include  file="customerHeader.jsp" %>
            <div style="color:red;text-align: center" >
                <s:actionmessage></s:actionmessage>
                </div>
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
            <div>
                <div style="box-shadow:0px 0px 4px 0px; width:600px; margin-top:5%; margin-left:30%;">

                    <div  class="well">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Find User</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">
                                <br>
                                <s:form action="find" method="post" id="myform">
                                    <s:textfield name="userIDTo" placeholder="Enter DA-IICT ID of user to Transfer Fund" cssClass="validate[required,custom[integer],minSize[9],maxSize[9]] span4"/>
                                    <br><br>
                                    <s:submit value="Find User" cssClass="btn-primary btn" style="margin-left:35%"/>            
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include  file="customerFooter.jsp" %> 
    </body>
</html>
