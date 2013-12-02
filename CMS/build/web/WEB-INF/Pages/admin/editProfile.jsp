<%-- 
    Document   : EditProfile
    Created on : Oct 24, 2013, 11:16:38 PM
    Author     : Purav Chitaliya
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
        <title>Profile</title>
    </head>
    <body>
        <table style="margin-left: 5%">
            <tr>
                <td valign="top"><jsp:include page="sideBar.jsp"></jsp:include></td>
                <td><div style="margin-left: 20%;">
                        <div style="margin-top: 10%;">
       
        <s:form cssClass="form-horizontal" action="" method="POST">  
            
  <fieldset>
    <div id="legend">
      <legend class="">Profile</legend>
    </div>
    <div class="control-group">
      <!-- Username -->
      <label class="control-label"  for="username">Username</label>
      <div class="controls">
        <s:textfield name="userID" id="userID" cssClass="input-xlarge" />
        
      </div>
    </div>
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="email">E-mail</label>
      <div class="controls">
        
        <s:textfield name="email" id="email" cssClass="input-xlarge" />
        
      </div>
    </div>
 
    <div class="control-group">
      <!-- E-mail -->
      <label class="control-label" for="phone">Phone</label>
      <div class="controls">
        
        <s:textfield name="phone" id="phone" cssClass="input-xlarge" />
        
      </div>
    </div>
 
    
 
    <div class="control-group">
      <!-- Button -->
      <div class="controls">
        <button style="margin-left: 28%;" class="btn btn-success">Save Changes</button>
      </div>
    </div>
  </fieldset>
</s:form>    
      </div></td>
            </tr>
        </table>
    </body>
</html>
