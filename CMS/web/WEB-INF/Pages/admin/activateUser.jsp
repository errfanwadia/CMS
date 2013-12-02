<%-- 
    Document   : index
    Created on : 24 Oct, 2013, 5:41:27 PM
    Author     : Ashish Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Activation Page</title>
         <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>
        <script>
            function disab()
            {
                var x = document.getElementById("");
                x.readOnly=true;
            }
        </script>
    </head>
    <body>        

        <script>

            function printNumber(number) {
               // alert("hello");
                //document.append(number);
                //location.reload(true);
               // alert(number);
                var element = document.createElement("input");
                //Assign different attributes to the element.
                element.setAttribute("type", "text");
                element.setAttribute("value", number);
                element.setAttribute("id", "rfid");
                //  document.body.appendChild(element);
                var rfid = document.getElementById("rfid");
                rfid.value = number;
                rfid.readOnly = true;
                var id = document.getElementById("id");
                //rfid.innerHTML = number;
                rfid.readOnly = true;
            }
        </script>
        <div>
            <jsp:include page="AdminHeader.jsp"></jsp:include>  
                <br><br>
                <div class="well" style="margin-left:30%; margin-top: -18%; float: left; width:57%; box-shadow: 0px 0px 2px 0px;">

                    <iframe style="float: left; overflow: hidden;"  height="250px" width="250px"  src="<s:url value="findUser"><s:param name="id" value="%{id}"  /></s:url>" frameborder="0" name="imgbox" id="imgbox" >         
                    </iframe>

                <s:form action="finalActivate" method="post"><br>
                    <label >&nbsp;&nbsp;&nbsp; User ID : </label>&nbsp;&nbsp;&nbsp;<s:textfield name="id"  id="userID" />
                    <label>&nbsp;&nbsp;&nbsp;Name :</label>&nbsp;&nbsp;&nbsp;<s:property value="fname" />&nbsp;&nbsp;&nbsp;<s:property value="lname" /> 
                    <label >&nbsp;&nbsp;&nbsp;RFID Card No.: </label>&nbsp;&nbsp;&nbsp;<s:textfield name="rfid"  id="rfid"  />
                    <br>&nbsp;&nbsp; <s:submit cssClass="btn btn-primary" value="Activate" />
                </s:form>        

            </div>     
        </div>
    <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
    </APPLET>
</body>


</html>
