<%-- 
    Document   : forgot
    Created on : Nov 10, 2013, 11:56:44 AM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css" />         
        <script src="<%=application.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>  
        <script src="<%=application.getContextPath()%>/validation/jquery-1.7.2.min.js"></script>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>	
        <script>
            jQuery(document).ready(function() {
                // binds form submission and fields to the validation engine
                //alert("page loaded");
                jQuery("#myform").validationEngine();
                //alert("success");
            });

        </script>
        <title>Forgot Password Page</title>
    </head>
    <body background="bg.gif">
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">

            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Forgot Password</a></li>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <div style="color: red;margin-left: 40%">
                            <s:actionmessage></s:actionmessage>        
                            </div>
                        <s:form action="forgotPass" method="post" id="myform">
                            <!--<label>Username</label>-->
                            <s:label value="Enter your DA-IICT ID to recover the password:" />
                            <!--<input type="text" value="jsmith" class="input-xlarge">-->
                            <s:textfield name="userID" cssClass="validate[required],custom[integer],minSize[9],maxSize[9]]"/><br/><br/>
                            <!--<label>First Name</label>-->

                            <div>
                                <!--<button class="btn btn-primary">Update</button>-->
                                <s:submit value="Recover" cssClass="btn btn-primary" style="margin-left:20%;" />  <a href="loginPage"><i class="icon-arrow-left" style="margin-left: 30px"></i>Back To Login Page</a>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div></div>
    </body>
</html>
