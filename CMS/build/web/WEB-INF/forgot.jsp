<%-- 
    Document   : forgot
    Created on : Nov 10, 2013, 11:56:44 AM
    Author     : Al-Hujjat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
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
        <title>Forgot Password</title>
    </head>
    <body>
      <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Forgot Password</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
    <s:actionmessage></s:actionmessage>        
    <s:form action="forgotPass" method="post" id="tab">
    <!--<label>Username</label>-->
    <s:label value="Enter your ID to recover the password:" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:textfield name="userID"/><br/><br/>
    <!--<label>First Name</label>-->
     
    <div>
    <!--<button class="btn btn-primary">Update</button>-->
     <s:submit value="Recover" cssClass="btn btn-primary"/>
    </div>
    </s:form>
        </div>
    </div>
            </div></div>
    </body>
</html>
