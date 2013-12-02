<%-- 
    Document   : updateProfile
    Created on : Nov 10, 2013, 11:56:46 AM
    Author     : ABS
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
        <title>View/Update Canteen Details Page</title>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
       
    </head>
    <body>
        <%@include  file="AdminHeader.jsp" %>
         <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
	</script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
        
	<script>
		$(document).ready(function(){
			// binds form submission and fields to the validation engine
			$("#myform").validationEngine();
		});

        </script>
        <br><br>
        <div style="color:red; margin-left: 40%">            
            <s:actionmessage></s:actionmessage>
        </div>

        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:-1%; margin-left:35%;">
            <div  class="well">
                <ul class="nav nav-tabs" style="height:50px;">
                    <li class="active">Canteen Profile</li>
                    
                </ul>                
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <s:form action="updateCafe" method="post" id="myform">   
                            <s:label value="canteen ID:" />   
                            <s:property value="id"/><br/><br/>  
                            <s:hidden name="cafe_id" value="%{id}" />
                            <s:label value="Canteen name:" />    
                            <s:textfield name="cafe_name" cssClass="input-xlarge validate[required]" /><br/><br/>    
                            <s:label value="Owner name:" />   
                            <s:textfield name="owner_name" cssClass="input-xlarge validate[required]" /><br/><br/>        
                            <div>   
                                <s:submit value="Update" cssClass="btn btn-primary"/>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
