<%-- 
    Document   : login
    Created on : 8 Oct, 2013, 9:26:01 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!-- <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.css"> -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">                
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
         <SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
        </SCRIPT>
        
    </head>
    <s:head />
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        
    <s:actionmessage />

    <s:actionerror />
    
    <s:form cssClass="form-horizontal" action="loginCheck" method="POST">
    <fieldset>
    <div id="legend">
      <legend class="">Login</legend>
    </div>
        <div class="control-group">
          <!-- Username -->          
          <s:label cssClass="control-label" for="userID" value="Username" />
          <div class="controls">
              <!-- <input type="text" id="userID" name="userID" placeholder="" class="input-xlarge" required oninvalid="this.setCustomValidity('User ID is required')"/> -->
              <s:textfield name="userID" id="userID" cssClass="input-xlarge" />
          </div>
        </div>
 
        <div class="control-group">
          <!-- Password-->          
          <s:label cssClass="control-label" value="password" for="pass" />
          <div class="controls">
            <!-- <input type="password" id="password" name="pass" placeholder="" class="input-xlarge" required oninvalid="this.setCustomValidity('Password is required')"> -->
            <s:password name="pass" id="pass" cssClass="input-xlarge" />
          </div>
        </div>
 
 
        <div class="control-group">
          <!-- Button -->
          <div class="controls">
            <!-- <button class="btn btn-success">Login</button> -->
            <s:submit value="Login" cssClass="btn btn-success"/>
          </div>
        </div>
    </fieldset>
    </s:form>
 <%--   <s:form id="idLoginForm" action="loginCheck" >
		<s:textfield name="userID" placeholder="Username" label="Username" />
		<s:password name="pass" placeholder="Password" label="Password" />
		<s:submit value="Submit" />
    </s:form>    
 --%>
    </body>
</html>
