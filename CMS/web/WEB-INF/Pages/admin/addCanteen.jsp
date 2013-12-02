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
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>
      
       
    </head>
    <body>

        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
         <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
	</script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
        
        <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
	</script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
        
	<script>
		$(document).ready(function(){
			// binds form submission and fields to the validation engine
			$("#myform12").validationEngine();
		});

        </script>
                <div style="margin-left: -1%; ; float: left">
                    <div style="box-shadow:0px 0px 4px 0px; width:130%; margin-top:5%; margin-left:70%;">

                        <div  class="well">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Add Centeen</a></li>

                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane active in" id="home">
                                <s:form id="myform12" action="insertCanteen" method="POST">  
                                    <s:textfield cssClass="validate[required] span3" name="cafe_id" id="canID" placeholder="Canteen ID"/><br/>
                                    <s:textfield cssClass="validate[required] span3" name="cafe_name" id="cafe_name" placeholder="Canteen Name"/> <br/>
                                    <s:textfield cssClass="validate[required] span3" name="owner_name" id="owner_name" placeholder="Owner Name"/> <br/>
                                    <s:password cssClass="validate[required,minSize[6]] span3" name="password" id="password" placeholder="Password"/> <br/>
                                    <s:password cssClass="validate[required,equals[password]] span3" name="Conform_Password" id="Confirm_Password" placeholder="Confirm Password"/> <br/>
                                    <br/><br/>
                                    <s:submit value="Submit" cssClass="btn-info btn"/>     
                                </s:form>   
                            </div>
                        </div>
                    </div></div>




               

            </div>

        </div>
    </body>
</html>
