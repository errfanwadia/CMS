<%-- 
    Document   : updateProfile
    Created on : Nov 9, 2013, 11:56:46 AM
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
        <title>Update</title>
    </head>
    <body>
        <%@include  file="customerHeader.jsp" %>
        <s:actionmessage></s:actionmessage>
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
            
    <s:form action="updateProfile" method="post" id="tab">
    <!--<label>Username</label>-->
    <s:label value="ID:" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:property value="userID"/><br/><br/>
    <!--<label>First Name</label>-->
     <s:label value="First name:" />
    <!--<input type="text" value="John" class="input-xlarge">-->
    <s:property value="fname"  /><br/><br/>
    
    <!--<label>Last Name</label>-->
     <s:label value="Last name:" />
   <!-- <input type="text" value="Smith" class="input-xlarge">-->
    <s:property value="lname"/><br/><br/>
    
    <s:label value="Contact no:" />
    <!--<input type="text" value="John" class="input-xlarge">-->
    <s:textfield name="cont_no" cssClass="input-xlarge" /><br/><br/>
    <!--<label>Email</label>-->
     <s:label value="Email:" />
    <!--<input type="text" value="jsmith@yourcompany.com" class="input-xlarge">-->
    <s:textfield name="email"  cssClass="input-xlarge" /><br/><br/>
   <!-- <label>Address</label>-->
     <s:label value="Profile Photo:" />
     <iframe  src="<s:url value="proPic"/>" scrolling="yes" height="200" width="200" frameborder="0" name="imgbox" id="imgbox" >         
    </iframe>
   <!-- <textarea value="Smith" rows="3" class="input-xlarge">2817 S 49th
    Apt 314
    San Jose, CA 95101
    </textarea>-->
   

   <!-- <label>Time Zone</label>-->
    
    
    <div>
    <!--<button class="btn btn-primary">Update</button>-->
     <s:submit value="Update" cssClass="btn btn-primary"/>
    </div>
    </s:form>
        </div>
    </div>
            </div></div>
   <%@include  file="customerFooter.jsp" %> 
</body>
</html>
