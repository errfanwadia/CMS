<%-- 
    Document   : placeOrder
    Created on : 10 Nov, 2013, 3:37:35 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
        <title>Place Order Page</title>   
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script>



            function FilterInput(event) {
                var chCode = ('charCode' in event) ? event.charCode : event.keyCode;

                // returns false if a numeric character has been entered
                //	return (chCode < 48 /* '0' */ || chCode > 57 /* '9' */);

                if (chCode == 43)
                {
                    addFunction();
                    return false;
                }
                else if (chCode == 45)
                {
                    subFunction();
                    return false;
                }
                else {
                    return true;
                }
            }


            function subFunction()
            {
                var number = parseInt(document.getElementById("Amount").value);
                var result = document.getElementById("Result").value;

                if (isNaN(result))
                {
                    result = parseInt(0);
                }
                else
                {
                    result = parseInt(result);
                }

                if (number > 0)
                {
                    result = result - number;
                    if (result < 0)
                    {
                        result = 0;
                    }
                }
                document.getElementById("Result").value = result;
                document.getElementById("Amount").value = "";
                document.getElementById("Amount").focus();
            }

            function addFunction()
            {
                var number = parseInt(document.getElementById("Amount").value);
                var result = document.getElementById("Result").value;

                if (isNaN(result))
                {
                    result = parseInt(0);

                }
                else
                {
                    result = parseInt(result);

                }

                if (number > 0)
                {
                    result = result + number;
                }
                document.getElementById("Result").value = result;
                document.getElementById("Amount").value = "";
                document.getElementById("Amount").focus();
            }
        </script>        
        <s:head/>
    </head>
    <body background="bg.gif">
        <%@include file="cafeHeader.jsp" %>
        <div class="well" style="background-color: #ffffff; width: 77%; margin-left: 10%;">
            <div style="color: red;text-align: center;">
                <s:actionmessage/>
                <s:actionerror />
            </div> 

            <div style="margin-left: 23%; background-color: #ffffff; margin-top: 1%; box-shadow: 0px 0px 4px 0px; width: 60%;"><br>
                <iframe style="margin-left: -40%; margin-top: 1%;"  height="200px" width="200px"  src="<s:url value="findUser"><s:param name="id" value="%{userID}"  /></s:url>" frameborder="0" name="imgbox" id="imgbox" >         
                    </iframe>
                 <div style="margin-left:-30%;display:inline;">
                    <s:property value="userID" />
                    <s:property value="fname" />
                </div>
                <div style="float: left;">     
                    <s:form action="placeOrder" method="post">
                        <s:hidden name="cust_id" value="%{userID}" />                        
                        <s:hidden name="rfid" />            

                        <div  style="margin-top: 2%;width: 100% ;margin-left:105%;">
                            <button class="btn-primary" type="button" onclick="subFunction();">-</button> 
                            <input type="text" id="Amount" onkeypress="return FilterInput(event);" autofocus>
                            <button class="btn-primary" type="button" onclick="addFunction();">+</button> 
                            <br/><br>
                            <label><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total:</strong> </label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="total" id="Result" type="text" value="0"   readonly/>
                            <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:submit class="btn-primary" value="Place Order" />
                        </div>
                    </s:form>
                </div></div>
        </div>

    </body>
</html>
