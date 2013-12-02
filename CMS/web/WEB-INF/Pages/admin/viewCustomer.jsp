<%-- 
    Document   : viewCustomer
    Created on : Oct 19, 2013, 9:08:17 AM
    Author     : errfanwadia
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
        <title>View Customer Page</title>
    </head>
    <body>
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
                <div style="float: left">
                    <legend>View Customer</legend>
                <s:form cssClass="" action="" method="POST">
                    <s:textfield name="daID" id="daID" cssClass="span3" placeholder="DA-IICT ID"/>
                    <br/>
                    <s:submit value="Submit" cssClass="btn-info btn"/>
                </s:form> 
                <!-- Display the customer information using ajax -->
                <div>
                    Name: <div id="name"></div></br> 
                    Photo: </br></br><div class="">
                        <img height="200" width="200" src="http://thetransformedmale.files.wordpress.com/2011/06/bruce-wayne-armani.jpg"  alt="" class="img-rounded">
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>
