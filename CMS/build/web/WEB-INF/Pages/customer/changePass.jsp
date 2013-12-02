<%-- 
    Document   : changePass
    Created on : Nov 9, 2013, 5:18:54 PM
    Author     : Al-Hujjat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
        <title>Update</title>
    </head>
    <body>
        <%@include  file="customerHeader.jsp" %>
        <s:actionmessage></s:actionmessage>
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Change Password</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
            
    <s:form action="changePass" method="post" id="tab">
    <!--<label>Username</label>-->
    <s:label value="Old Password:" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:password name="oldpass" class="input-xlarge"/><br/><br/>
    
    <s:label value="New Password:" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:password name="newpass" class="input-xlarge"/><br/><br/>
    
     <s:label value="Re-type Password:" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:password name="newpass2" class="input-xlarge"/><br/><br/>
    <!--<label>First Name</label>-->
    <s:submit value="Change Password" cssClass="btn btn-primary"/>

    </s:form>
    
        </div>
    </div>
            </div></div>
   <%@include  file="customerFooter.jsp" %> 
</body>
</html>
