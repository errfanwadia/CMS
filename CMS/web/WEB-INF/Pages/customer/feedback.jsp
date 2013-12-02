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
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <!-- <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.css"> -->
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <style>
            .head{
                text-align: left;
                color:#999;
                margin-left: 4px;
            }
        </style>
    </head>
    <body background="bg.gif">
        <%@include  file="customerHeader.jsp" %> 
        <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>

        <script>
            $(document).ready(function() {
                // binds form submission and fields to the validation engine
                $("#myform").validationEngine();
            });

        </script>
        <div style="box-shadow: 0px 0px 2px 0px; background-color: #ffffff;  margin-left: 10%; width: 80%;">
        <div align="center" style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:1%; margin-left:25%;">
            <legend class="head"><strong>Feedback</strong></legend>
            <div style="margin-left: -62%;"><strong>User ID:</strong> <s:property value="userID" /></div>
            <s:form accept-charset="UTF-8" id="myform" action="giveFeedback" method="POST">
                <s:hidden name="secret" value="%{#session.ID}" />
                <!--<textarea class="span4" id="new_message" name="new_message"
                placeholder="Type in your message" rows="5"></textarea>-->
                <s:textarea  style="margin-top:7%; width:80%;" cssClass="validate[required] span3" id="new_message1" name="sub" placeholder="Subject" rows="1"/>
                <s:textarea  style="margin-top:7%; margin-left:2.6%; margin-right:3%; width:80%;" cssClass="validate[required] span4" id="new_message" name="desc" placeholder="Description" rows="9"/>
                <h6 style="margin-left:25%; margin-right:10%;" class="pull-right">320 characters remaining</h6>
                <!--<button class="btn btn-info" type="submit">Post New Message</button>-->

                <s:submit style="margin-left:-2%; margin-bottom:7%;" cssClass="btn btn-info" value="Give Feedback" name="Post new message" key="submit"/>
            </s:form>
        </div>
            <%@include  file="customerFooter.jsp" %> 
        </div>
        
    </body>
</html>
