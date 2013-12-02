<%-- 
    Document   : account
    Created on : Nov 9, 2013, 4:01:09 PM
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
                    <li class="active"><a href="#home" data-toggle="tab">Account Information</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
            
   
    <!--<label>Username</label>-->
    <s:label value="Balance Amount(Rs):" />
    <!--<input type="text" value="jsmith" class="input-xlarge">-->
    <s:property value="bal"/><br/><br/>
    <!--<label>First Name</label>-->
    
     <s:form action="toggleRFID" method="post" id="tab">
   <s:if test="Is_disabled == \"0\" ">
       
            <s:submit value="Disable RFID" cssClass="btn btn-primary"/>
        
   </s:if> 
    <s:else>
  
             <s:submit value="Enable RFID" cssClass="btn btn-primary"/>
</s:else>

    </s:form>
    
        </div>
    </div>
            </div></div>
   <%@include  file="customerFooter.jsp" %> 
</body>
</html>
