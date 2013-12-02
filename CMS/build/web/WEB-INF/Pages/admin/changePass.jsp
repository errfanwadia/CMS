<%-- 
    Document   : changePass
    Created on : Oct 21, 2013, 10:07:11 PM
    Author     : errfanwadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Change Password</title>
    </head>
    <body>

        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
            <br>
                <div style="float:left;margin-left:20px;">
                    <legend>Change Password</legend>
                <s:form cssClass="" action="" method="POST">  
                    <s:textfield name="da_id" id="da_id" cssClass="span3" placeholder="Current Password"/></br>
                    <s:textfield name="da_id" id="da_id" cssClass="span3" placeholder="New Password"/>
                    <s:textfield name="rfid" id="rfid" cssClass="span3" placeholder="Confirm New Passord"/>
                    <br/><br/>
                    <s:submit value="Submit" cssClass="btn-info btn"/>     
                </s:form>    
            </div>
        </div>
    </body>
</html>
