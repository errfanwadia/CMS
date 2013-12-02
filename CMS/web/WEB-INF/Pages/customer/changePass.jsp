<%-- 
    Document   : changePass
    Created on : Nov 9, 2013, 5:18:54 PM
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
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <title>Update</title>
    </head>
    <body background="bg.gif">
        <div>
            <%@include  file="customerHeader.jsp" %><br/><br/>            
            <div style="color: red;text-align: center">
                <s:actionmessage />
                <s:actionerror />
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
            <div style="float: left;width: 100%">
                <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">

                    <div  class="well">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Change Password</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">

                                <s:form action="changeUserPass" method="post" id="myform">
                                    <!--<label>Username</label>-->
                                    <s:label value="Old Password:" />
                                    <!--<input type="text" value="jsmith" class="input-xlarge">-->
                                    <s:password name="oldpass" cssClass="validate[required,minSize[6]] input-xlarge"/><br/><br/>

                                    <s:label value="New Password:" />
                                    <!--<input type="text" value="jsmith" class="input-xlarge">-->
                                    <s:password name="newpass" id="newpass" cssClass="validate[required,minSize[6]] input-xlarge"/><br/><br/>

                                    <s:label value="Re-type Password:" />
                                    <!--<input type="text" value="jsmith" class="input-xlarge">-->
                                    <s:password name="newpass2" cssClass="validate[required,equals[newpass]] input-xlarge"/><br/><br/>
                                    <!--<label>First Name</label>-->
                                    <s:submit value="Change Password" cssClass="btn btn-primary"/>

                                </s:form>

                            </div>
                        </div>
                    </div>

                </div>
                <%@include  file="customerFooter.jsp" %> 
            </div>

        </div>

    </body>

</html>
