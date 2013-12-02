<%-- 
    Document   : addCustomer
    Created on : Oct 19, 2013, 8:31:34 AM
    Author     : errfanwadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <title>Add Customer</title>
    </head>
    <body>
        <div >
            <jsp:include page="AdminHeader.jsp"></jsp:include>
                <div style="width:100;float: left">
                    <legend>Add Customer</legend>
                <s:form cssClass="" action="" method="POST">  
                    <s:textfield name="da_id" id="da_id" cssClass="span3" placeholder="DA-IICT ID"/>
                    <s:textfield name="rfid" id="rfid" cssClass="span3" placeholder="RFID"/>
                    <br/><br/>
                    <s:submit value="Submit" cssClass="btn-info btn"/>     
                </s:form>    
            </div>
        </div>
    </body>
</html>
