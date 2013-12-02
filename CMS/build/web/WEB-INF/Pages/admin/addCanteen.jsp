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
        <title>Add Canteen Page</title>
    </head>
    <body>

        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
                <div style="float: left">
                    <legend>Add Canteen</legend>
                <s:form cssClass="" action="" method="POST">  
                    <s:textfield name="cafe_ID" id="canID" cssClass="span3" placeholder="Canteen ID"/>
                    <s:textfield name="cafe_name" id="name" cssClass="span3" placeholder="Name"/> 
                    <br/><br/>
                    <s:submit value="Submit" cssClass="btn-info btn"/>     
                </s:form>    
            </div>

        </div>
    </body>
</html>
