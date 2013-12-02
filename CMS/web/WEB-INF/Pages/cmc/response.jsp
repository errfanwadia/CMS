<%-- 
    Document   : feedback
    Created on : Oct 20, 2013, 6:13:40 PM
    Author     : R
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
        <title>feedback</title>                           
        <script>
            function empty()
            {
                document.getElementById("desc").value = "";
            }
        </script> 
    </head>
    <body background="bg.gif" onload="empty();">
        <div>
            <%@include file="CMCHeader.jsp"%>
            <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
            <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
            </script>            
            <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
            <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
            </script>

            <script>
                $(document).ready(function() {
                    // binds form submission and fields to the validation engine
                    $("#myform").validationEngine();
                });

            </script>
            <div align="center" style="background-color:#ffffff;  box-shadow:0px 0px 4px 0px; width:80%; margin-top:2%; margin-left:10%;">
             
                <br>
                <div style=" width: 50%; box-shadow:0px 0px 1px 0px;  background-color: #f8f5f5;">
                <table  class="fixed" style="word-wrap: break-word; margin-left:9%;" align="left" >
                    <s:form id="myform" accept-charset="UTF-8" action="sendFeedback" method="POST">
                        <col width=100 />
                        <col width=450 />
                        <tr>
                            <td style="vertical-align: top;"><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>User ID:</strong>
                            </td>
                            <td style="max-width:450px"><br>
                                <s:property value="c_id" />
                            </td>
                        </tr>
                        <tr><td height="10"></td><td height="10"></td></tr>
                        <tr>
                            <td style="vertical-align: top;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Subject:</strong>
                            </td>
                            <td  style="max-width:450px">
                                <s:property value="sub" /> 
                            </td>
                        </tr>
                        <tr><td height="10"></td><td height="10"></td></tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <strong>Description:</strong>
                            </td>
                            <td  style="max-width:450px">
                                <s:property value="desc" />
                            </td>
                        </tr>

                    </table>


                    <s:textarea   style="margin-left:1.6%; margin-right:2%; margin-top:4%; width:80%;" cssClass="validate[required] span4" id="desc" name="desc" placeholder="Give your Response" rows="6"/>
                    <s:hidden id="c_id" name="c_id" value="%{c_id}"/>
                    <s:hidden id="sub" name="sub" value="%{sub}"/>
                    
                    <s:submit style="margin-left:-3%; margin-bottom:7%;" cssClass="btn btn-primary" value="Send Reply" name="Post new message" key="submit"/>
                </div>
                <br>
                    </s:form>
            </div>
        </div>
    </body>
</html>
