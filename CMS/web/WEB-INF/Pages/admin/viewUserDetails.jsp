<%-- 
    Document   : viewUserDetails
    Created on : 8 Nov, 2013, 10:35:15 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
    </head>
    <body>
       <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>  
                <br><br>
                <div class="well" style="margin-left:30%; margin-top: -18%; float: left; width:57%; box-shadow: 0px 0px 2px 0px;">
                    <iframe style="float: left;"  height="250px" width="250px"  src="<s:url value="findUser"><s:param name="id" value="%{id}"  /></s:url>" frameborder="0" name="imgbox" id="imgbox" >         
                         </iframe>
                         <div class="" style="box-shadow: 0px 0px 0px 0px;"margin-left: 20px; float:left;width:75%">
                              <br>  &nbsp;&nbsp;&nbsp;<strong>User ID:</strong> <s:property value="id" /><br/><br>
                &nbsp;&nbsp;&nbsp;<strong>Name :</strong> <s:property value="fname" /> &nbsp;<s:property value="lname" /><br><br>
                &nbsp;&nbsp;&nbsp;<strong>Contact No.:</strong><s:property value="cont_no" /><br/><br>
                &nbsp;&nbsp;&nbsp;<strong>Email Address :</strong> <s:property value="email" /><br/>
                   &nbsp;&nbsp;&nbsp;<a href="showRegisteredUsers">Go Back </a>
                </div>
                </div>
       </div>
    </body>
</html>
