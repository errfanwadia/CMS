<%-- 
    Document   : updateProfile
    Created on : Nov 10, 2013, 11:56:46 AM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>View/Update Canteen Details Page</title>  
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
    </head>
    <body>
        <%@include  file="AdminHeader.jsp" %>
        <br><br>
        <div style="color:red; margin-left: 40%">            
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
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:1%; margin-left:35%;">
            <div  class="well">
                <ul class="nav nav-tabs" style="height:50px;">                       
                    <li class="active">Reset Password</li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <s:form action="resetCafePass" method="post" id="myform">
                            <!--<label>Username</label>-->
                            <s:hidden name="id" />
                            <s:label value="New Password:" />
                            <!--<input type="text" value="jsmith" class="input-xlarge">-->
                            <s:password name="pass" cssClass="input-xlarge validate[required,minSize[6]]"/><br/><br/>

                            <s:label value="Re-type New Password:" />
                            <!--<input type="text" value="jsmith" class="input-xlarge">-->
                            <s:password name="rePass" cssClass="input-xlarge validate[required,minSize[6]]"/><br/><br/>
                            <!--<label>First Name</label>-->
                            <s:submit value="Change Password" cssClass="btn btn-primary"/>

                        </s:form>

                            
                            
                            
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
