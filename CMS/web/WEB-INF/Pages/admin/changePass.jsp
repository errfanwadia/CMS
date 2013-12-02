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
        <title>Change Password Page</title>
        
    </head>
    <body>
        <div>
        <%@include  file="AdminHeader.jsp" %><br/><br/>
        <div style="margin-left: 20%; margin-top: -20%; float: left;width:80%;">
                    <div style="color: red;margin-left: 50%">
                    <s:actionmessage />
                    <s:actionerror />
                </div>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
	</script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
        
	<script>
		$(document).ready(function(){
			// binds form submission and fields to the validation engine
			$("#myform").validationEngine();
		});

        </script>
        <div style="float: left">
        <div style="box-shadow:0px 0px 4px 0px; width:150%; margin-top:10%; margin-left:120%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Change Password</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
            
    <s:form id="myform" action="changeAdminPass" method="post">
    <s:label value="Old Password:" />
    <s:password cssClass="validate[required,minSize[6]]" name="oldpass" class="input-xlarge"/><br/><br/>    
    <s:label value="New Password:" />    
    <s:password cssClass="validate[required,minSize[6]]" name="newpass" class="input-xlarge"/><br/><br/>    
     <s:label value="Re-type New Password:" />    
    <s:password cssClass="validate[required,equals[newpass]]" name="newpass2" class="input-xlarge"/><br/><br/>    
    <s:submit value="Change Password" cssClass="btn btn-primary"/>

    </s:form>
    
        </div>
    </div>
            </div></div>  
        </div>
        </div>
</body>
</html>
