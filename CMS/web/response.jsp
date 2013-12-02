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
    </head>
    <body>

        <div align="center" style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">
            <br>

            <s:label style="" cssClass="control-label" for="UserName" value="User ID : " style="float:left;" />    
            <s:property value="c_id" />          

            <br>

            <s:label cssClass="control-label" for="Subject" value="Subject : " style="float:left;" />          
            <s:property value="sub" />          
            <br>


            <s:label cssClass="control-label" for="Description" value="Description : " style="float:left;"/>

            <s:property value="desc" />

            <br>

            <s:form accept-charset="UTF-8" action="" method="POST">

                <s:textarea  style="margin-top:4%; width:80%;" cssClass="span4" id="new_message" name="new_message" placeholder="Give your Response" rows="6"/>

                <s:submit style="margin-left:-3%; margin-bottom:7%;" cssClass="btn btn-info" value="Post new message" name="Post new message" key="submit"/>
            </s:form>
        </div>
    </body>
</html>
