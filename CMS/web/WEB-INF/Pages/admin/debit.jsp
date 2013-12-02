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
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>
        <title>Debit</title>
      
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css">                
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css">
    </head>
    <body>
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
            <br /><br/>
            <div style="margin-left:-2%; margin-top:0%; float: left; width:70%;">
            <div style="color:red;margin-left: 50%">
                <s:actionmessage />
                <s:actionerror />
            </div>
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
                <div style="float: left;">
                    <div align="center" style="box-shadow:0px 0px 4px 0px; width:120%;
                      margin-top:-2%; margin-left:70%;">

                        <div  class="well">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Debit Amount</a></li>

                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane active in" id="home">
                                <s:form id="myform" cssClass="" action="debitBalance" method="POST">  
                                    <s:textfield name="id" id="id" cssClass="validate[required] span3" placeholder="Enter the user ID"/>
                                    <br/>
                                    <s:textfield name="amt" id="amount" cssClass="validate[required,custom[integer]] span3" placeholder="Enter the amount"/>
                                    <br/>
                                    <s:password name="password" id="password" cssClass="validate[required,minSize[6]] span3" placeholder="Enter the user Password"/>
                                    <br/><br/>
                                    <s:submit value="Debit" cssClass="btn-info btn"/>     
                                </s:form>    
                            </div>
                        </div>
                    </div></div>
         </div>
        </div> 
        </div>
    </body>
</html>
