<%-- 
    Document   : ordHistory
    Created on : Nov 10, 2013, 6:19:33 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Withdraw History Page</title>
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
            oTable.fnSort([[4, 'desc']]);
        });
    </script> 
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">    

        <%@include file="cafeHeader.jsp" %>
        <br>
        <ul class="nav nav-tabs" style="width: 50%; margin-left:10%;">
            <li class=""><a href="home" >Orders History</a></li>
            <li class=""><a href="rollbackedHistory" >Rollbacked Orders</a></li>
            <li class="active"><a href="withdrawHistory" >Withdraw History</a></li>
        </ul>
        <div style="color: red;margin-left: 40%">
            <s:actionmessage />
            <s:actionerror />
        </div> 
        <br><br>
        <div style="width: 70%;margin-left: 12%">
            <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example" style="width: 100%">
                <thead>
                    <tr style="width: 100%;">                                
                        <th>Payer ID</th>
                        <th>Amount</th>                     
                        <th>Date/Time</th>                             
                    </tr>
                </thead>
                <tbody style="width:100%;">
                    <s:iterator value="tran">
                        <tr style="text-align: center;width: 100%;">                               
                            <td><s:property value="payer_id"/></td>
                            <td><s:property value="tot_amt"/></td>                            
                            <td><s:property value="time"/></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>            

        </div>
    </body>
</html>