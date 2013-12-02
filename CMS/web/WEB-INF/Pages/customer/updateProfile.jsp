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
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>View/Update Profile Page</title>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
    </head>
    <body background="bg.gif">
        <%@include  file="customerHeader.jsp" %>
        <div style="color:red; text-align: center">            
        <s:actionmessage></s:actionmessage>
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
        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            
            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
                    
                </ul>
            <div id="myTabContent" class="tab-content">
        <div class="tab-pane active in" id="home">
            
    <s:form action="updateUserProfile" method="post" id="myform">   
    <s:label value="ID:" />   
    <s:property value="userID"/><br/><br/>    
     <s:label value="First name:" />    
    <s:property value="fname"  /><br/><br/>        
     <s:label value="Last name:" />   
    <s:property value="lname"/><br/><br/>    
    <s:label value="Contact no:" />    
    <s:textfield name="cont_no" cssClass="validate[required,custom[integer],minSize[10],maxSize[10]] input-xlarge" /><br/><br/>    
     <s:label value="Email:" />    
    <s:textfield name="email"  cssClass="validate[groupRequired[payments],custom[email]] input-xlarge" /><br/><br/>  
     <s:label value="Profile Photo:" />
     <iframe  src="<s:url value="findUser"><s:param name="id" value="%{userID}"  /></s:url>" scrolling="yes" height="200" width="200" frameborder="0" name="imgbox" id="imgbox" >         
    </iframe>
    <div>
   
     <s:submit value="Update" cssClass="btn btn-primary"/>
    </div>
    </s:form>
        </div>
    </div>
            </div></div>
   <%@include  file="customerFooter.jsp" %> 
</body>
</html>
