
<%-- 
    Document   : registration
    Created on : 26 Oct, 2013, 10:40:27 PM
    Author     : Errfan Wadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">                
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
        <script src="bootstrap/js/bootstrap.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/carousel.js"></script>
        <script src="bootstrap/js/dropdown.js"></script>
        <title>Registration Page</title>
        <s:head />
    </head>
    <body>
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Registration</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
    <s:actionmessage></s:actionmessage>           
        <s:form action="register" method="post" enctype="multipart/form-data">
            <s:textfield name="userID" placeholder="Enter Daiict ID" /><br/>
            <s:password name="pass" placeholder="Enter Password" /><br/>
            <s:password name="pass1" placeholder="Confirm Password" /><br/>
            <s:textfield name="fname" placeholder="First Name" /><br/>
            <s:textfield name="lname" placeholder="Last Name" /><br/>
            <s:textfield name="cont_no" placeholder="Contact Number" /><br/>
            <s:textfield name="email" placeholder="Email Address" /><br/> 
            Upload Picture :
            <s:file name="pro_pic" label="Profile Image" /><br/><br/>
            <s:submit value="Register" align="center" cssClass="btn btn-primary"/>  
        </s:form>
            </div>
    </div>
            </div></div>
    </body>
</html>
