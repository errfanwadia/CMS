<%-- 
    Document   : feedback
    Created on : Oct 20, 2013, 6:13:40 PM
    Author     : R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback</title>
        <!-- <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.css"> -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">                
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
        <style>
            .head{
                text-align: left;
                color:#999;
                margin-left: 4px;
            }
        </style>
    </head>
    <body>
           <%@include  file="customerHeader.jsp" %> 
        
     <div align="center" style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
         <legend class="head">Feedback</legend>
         User ID : <s:property value="userID" />
     <s:form accept-charset="UTF-8" action="giveFeedback" method="POST">
         <s:hidden name="secret" value="%{#session.ID}" />
    <!--<textarea class="span4" id="new_message" name="new_message"
    placeholder="Type in your message" rows="5"></textarea>-->
    <s:textarea  style="margin-top:7%; width:80%;" cssClass="span3" id="new_message1" name="sub" placeholder="Subject" rows="1"/>
    <s:textarea  style="margin-top:7%; width:80%;" cssClass="span4" id="new_message" name="desc" placeholder="Description" rows="9"/>
    <h6 style="margin-left:25%; margin-right:10%;" class="pull-right">320 characters remaining</h6>
    <!--<button class="btn btn-info" type="submit">Post New Message</button>-->
   
    <s:submit style="margin-left:-3%; margin-bottom:7%;" cssClass="btn btn-info" value="Post new message" name="Post new message" key="submit"/>
    </s:form>
    </div>
     <%@include  file="customerFooter.jsp" %> 
    </body>
</html>
