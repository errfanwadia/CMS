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


    </head>
    <body>        
    <APPLET code="simpleread.myApplet.class" 
            archive="myApplet.jar"
            width=0 height=0>
    </APPLET>

    <script>

        function printNumber(number) {
            //document.append(number);
            //location.reload(true);
            var element = document.createElement("input");
            //Assign different attributes to the element.
            element.setAttribute("type", "text");
            element.setAttribute("value", number);
            element.setAttribute("id", "rfid");
            //  document.body.appendChild(element);
            var rfid = document.getElementById("userID");
            rfid.innerHTML = number;
            rfid.readOnly = true;
        }
    </script>
    <iframe  src="<s:url value="findUser"/>" scrolling="no" frameborder="0" name="imgbox" id="imgbox" >         
    </iframe>
    <s:form action="finalActivate" method="post">
        <s:label name="userID"  id="userID"  />
        <s:submit value="Activate" />
    </s:form>   
</body>

<!--  <jsp:plugin type="applet" code="build\classes\simpleread\myApplet.class" codebase="." width="600" height="500" jreversion="1.6"></jsp:plugin> -->   

</html>
