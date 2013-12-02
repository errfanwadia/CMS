<%-- 
    Document   : adminHome
    Created on : 27 Oct, 2013, 7:32:20 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <title>Admin Home Page</title>
        <SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </SCRIPT>
        <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.css" type="text/css" />
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables_themeroller.css" type="text/css" />
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function() {
                var oTable = $('#example').dataTable({"sPaginationType": "full_numbers"});
                oTable.fnSort([[3, 'desc']]);
            });
        </script> 
        <s:head/>
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">        
        <div>
            
            <jsp:include page="AdminHeader.jsp"></jsp:include> 
                <br><br>
                
                
                <div class="well" style=" box-shadow: 0px 0px 1px 0px; margin-top: -2%; margin-left: 1%; float: left;width:57%;">
                    <div style="color: red;margin-left: 50%">
                    <s:actionmessage />
                    <s:actionerror />
                </div>
                <legend>Users waiting for Activation</legend>
                <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example" style="width: 100%">
                    <thead>
                        <tr style="width: 100%;">
                            <th>User ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email Verified Date</th>
                            <th>Activation Link</th>
                            <th>Deletion Link</th>
                        </tr>
                    </thead>
                    <tbody style="width:100%;">
                        <s:iterator value="users">
                            <tr style="text-align: center;width: 100%;">
                                <td><s:property value="userID"/></td>
                                <td><s:property value="fname"/></td>
                                <td><s:property value="lname"/></td>
                                <td><s:property value="verified_date"/></td>                                
                                <td><a href="<s:url action="activateUser" value="activateUser"><s:param name="id" value="%{userID}"  /> </s:url>" >Activate</a></td>
                                <td><a href="<s:url action="deleteUser" value="deleteUser"> <s:param name="id" value="%{userID}"  /> </s:url>" >Delete</a> </td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>    
            </div>
        </div>
        </div>
    </body>
</html>
