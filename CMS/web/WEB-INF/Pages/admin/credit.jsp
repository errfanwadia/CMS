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
        <title>Credit Balance</title>
      
    </head>
    <body>
        <script>
            function printNumber(number) {
                var rfid = document.getElementById("rfid");
                rfid.value = number;
                rfid.readOnly = true;
            }
        </script>
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>
            <br><br>
                <div style="margin-left:-4%; margin-top:0%; float: left; width:40%;">
                    <div style="color: red;margin-left: 50%;">
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
                <div  style="box-shadow:0px 0px 4px 0px; width:110%;
                      margin-top:-2%; margin-left:35%;">

                    <div  class="well">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab">Recharge Balance</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">

                                <s:form id="myform" cssClass="" action="creditBalance" method="POST">  
                                    <s:textfield name="rfid" id="rfid" cssClass="span3" placeholder="RFID number"/><br/>
                                    <s:textfield  name="amt" cssClass="validate[required,custom[integer],min[200]] span3" id="amt" placeholder="Amount"/> 
                                    <br/><br/>
                                    <s:submit value="Submit" cssStyle="margin-bottom:-5%;" cssClass="btn-info btn"/>     
                                </s:form>   
                            </div>
                        </div>
                    </div></div>
            </div>
        </div>    
    <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
    </APPLET>
</body>
</html>
