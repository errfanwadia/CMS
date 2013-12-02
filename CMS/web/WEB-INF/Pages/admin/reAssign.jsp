<%-- 
    Document   : reAssign
    Created on : 12 Nov, 2013, 6:31:30 PM
    Author     : ABS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Re-Assign RFID Page</title>
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
    </head>
    <body>
        <script>
            function printNumber(number) {
                //alert(number);
                var x = document.getElementById("rfid");
                x.value = number;
                x.readOnly = true;
            }
        </script>    
        <div>
            <div>
                <jsp:include page="AdminHeader.jsp"></jsp:include>  
            </div>
                <br><br>
                <div  class="well" style="margin-left:28%;margin-top: -22%; float: left; width:59%; box-shadow: 0px 0px 0px 0px;float: left;">
                    <div style="color: red;margin-left: 50%">
                    <s:actionmessage />
                    <s:actionerror />
                </div>
                <div style="box-shadow:0px 0px 4px 0px; width:600px; margin-left:15%;margin-top:5%;">

                    <div  class="well">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab">Re-Assign RFID card</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="home">
                                <s:form action="reAssignRFID">
                                    <s:hidden name="id" />
                                    <s:textfield id="rfid" name="rfid" /><br/><br/>
                                    <s:submit value="Assign Card" cssClass="btn-info btn" />
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
    </APPLET>
</body>
</html>
