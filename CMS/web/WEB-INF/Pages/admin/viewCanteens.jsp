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
        <title>View Canteens Page</title>     
          <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
       <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.css" type="text/css" />
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables_themeroller.css" type="text/css" />
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.min.js"></script>
        <script >
            $(document).ready(function() {
                var oTable = $('#example').dataTable({"sPaginationType": "full_numbers"});              
            });  
    </script>
        <s:head/>
    </head>
    <body>        
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>  
                <br><br>
                <div class="well" style="margin-left:30%; margin-top: -18%; float: left; width:55%; box-shadow: 0px 0px 2px 0px;  float: left;">
                    <div style="color: red;margin-left: 40%">
                    <s:actionmessage />
                    <s:actionerror />
                </div>
                <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example" style="width: 100%">
                    <thead>
                        <tr style="width: 100%;">
                            <th>Cafe ID</th>
                            <th>Cafe Name</th>
                            <th>Balance</th>  
                            <th>Owner Name</th>                                                                                    
                            <th>View/Edit</th>  
                            <th>View Transactions</th>
                            <th>Reset Password</th>  
                        </tr>
                    </thead>
                    <tbody style="width:100%;">
                        <s:iterator value="cafes">
                            <tr style="text-align: center;width: 100%;">
                                <td><s:property value="cafe_id"/></td>
                                <td><s:property value="cafe_name"/></td>
                                <td><s:property value="balance"/></td>                                                                                           
                                <td><s:property value="owner_name"/></td> 
                                <td><a href="<s:url action="editCafe" value="editCafe"><s:param name="id" value="%{cafe_id}"  /> </s:url>" >View/Edit</a></td>
                                <td><a href="<s:url action="viewUserHistory" value="viewUserHistory"> <s:param name="id" value="%{cafe_id}"  /> </s:url>" >View</a> </td>
                                <td><a href="<s:url action="resetPass" value="resetPass"><s:param name="id" value="%{cafe_id}"  /> </s:url>" >Reset Password</a></td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>    
            </div>
        </div>
    </body>
</html>
