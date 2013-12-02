<%-- 
    Document   : check
    Created on : 24 Oct, 2013, 11:16:46 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking Page</title>       
        <script src="bootstrap/jquery.js" > </script>        
        <script type="text/javascript">
            $(document).ready(function(){
                          $("#addBTN").click(function(event){
                              alert("clicked");
                              var x = $(this).
                              alert(x);
                              document.location='<s:url action="check" />';
                          });
            });
        </script>
    </head>
    <body>
        Just for checking : <button id="addBTN" data-id="10">Check Action</button>
        <br>
        <a href="checkUtil">Check Util</a> <br/>
        <a href="insertRecord">Insert Record</a>
        <br><br>
        <a href="getJSON">Get Json Data</a> <br/>
        Customer ID : <s:property value="cust_id" />
        <br>
        <br><br><br><br>
        <a href="checking">Check MD5</a> <br/>
        <br><br><br><br>
        <br>
        <a href="sendMail">Send Testing mail</a> 
    </body>
</html>
