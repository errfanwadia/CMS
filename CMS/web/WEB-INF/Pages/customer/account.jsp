<%-- 
    Document   : account
    Created on : Nov 9, 2013, 4:01:09 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>My Account Page</title>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
    </head>
    <body background="bg.gif">
        <div>
            <%@include  file="customerHeader.jsp" %>
            <div style="float: left">
            <s:actionmessage></s:actionmessage>
            </div>
                <div>
                    <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">

                        <div  class="well">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="" data-toggle="tab">Account Information</a></li>

                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane active in" id="home">


                                    <!--<label>Username</label>-->
                                <s:label value="Balance Amount(Rs):" />
                                <!--<input type="text" value="jsmith" class="input-xlarge">-->
                                <s:property value="balance"/><br/><br/>
                                <!--<label>First Name</label>-->

                                <s:form action="toggleRFID" method="post" id="tab">
                                    <s:if test="Is_disabled == \"0\" ">

                                        <s:submit value="Disable RFID" cssClass="btn btn-primary"/>

                                    </s:if> 
                                    <s:else>

                                        <s:submit value="Enable RFID" cssClass="btn btn-primary"/>
                                    </s:else>

                                </s:form>
                            </div>
                        </div>
                    </div>
                </div></div>
        </div>
        <%@include  file="customerFooter.jsp" %> 
    </body>
</html>
