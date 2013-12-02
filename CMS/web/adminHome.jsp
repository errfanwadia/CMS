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
        <title>Admin Home Page</title>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.css" type="text/css" />
        <link rel="stylesheet" href="bootstrap/DataTable/jquery.dataTables_themeroller.css" type="text/css" />
        <script type="text/javascript" src="bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/DataTable/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function() {
                var oTable = $('#example').dataTable({"sPaginationType": "full_numbers"});
                oTable.fnSort([[3, 'desc']]);
            });
        </script> 
        <s:head/>
    </head>
    <body>
        <%@include  file="admin_Header.jsp"%>
        <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Verified Date</th>
                    <th>Activation Link</th>
                    <th>Deletion Link</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="users">
                    <tr style="text-align: center">
                        <td><s:property value="userID"/></td>
                        <td><s:property value="fname"/></td>
                        <td><s:property value="lname"/></td>
                        <td><s:property value="verified_date"/></td>                                
                        <td><a href="<s:url action="activate" value="activate"><s:param name="id" value="%{userID}"  /> </s:url>" >Activate</a></td>
                        <td><a href="<s:url action="delete" value="delete"> <s:param name="id" value="%{userID}"  /> </s:url>" >Delete</a> </td>
                        </tr>
                </s:iterator>
            </tbody>
        </table>
    </body>
</html>
