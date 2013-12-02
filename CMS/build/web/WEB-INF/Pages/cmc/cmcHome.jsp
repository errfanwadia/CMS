<%-- 
    Document   : cmcHome
    Created on : 28 Oct, 2013, 10:58:27 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CMC Home Page</title>
        <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>
       
            <script >
                    $(document).ready(function() {
                var oTable = $('#example').dataTable({"sPaginationType": "full_numbers"});
                oTable.fnSort([[3, 'desc']]);
            });
        </script> 
        <s:head/>
    </head>
    <body>        
        <div>
            <%@include file="CMCHeader.jsp" %>
            <br>
            <br>
            <br>
            <div style="float: left;width: 100%">
                <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Feedback Title</th>                
                            <th>View Link</th>                
                            <th>Deletion Link</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="feedbacks">
                            <tr style="text-align: center">
                                <td> <s:property value="c_id" /></td>
                                <td><s:property value="sub" /></td>
                                <td><a href="<s:url action="viewFeedback" value="viewFeedback" ><s:param name="f_id" value="%{f_id}"  /> </s:url>" >View</a></td>
                                <td><a href="<s:url action="deleteFeedback" value="deleteFeedback" ><s:param name="f_id" value="%{f_id}"  /> </s:url>" >Delete</a></td>               
                                </tr>
                        </s:iterator>             
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
