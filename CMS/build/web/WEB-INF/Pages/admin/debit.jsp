<%-- 
    Document   : addCanteen
    Created on : Oct 19, 2013, 9:04:11 AM
    Author     : errfanwadia
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
        <title>Debit</title>
    </head>
    <body>
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
                <div style="float: left">
                    <legend>Debit User</legend>
                <s:form cssClass="" action="" method="POST">  
                    <s:textfield name="userid" id="userid" cssClass="span3" placeholder="Enter the user ID"/>
                    <s:textfield name="amount" id="amount" cssClass="span3" placeholder="Enter the amount"/> 
                    <br/><br/>
                    <s:submit value="Debit" cssClass="btn-info btn"/>     
                </s:form>    
            </div>
        </div> 
    </body>
</html>
