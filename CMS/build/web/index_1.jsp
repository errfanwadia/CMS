<%-- 
    Document   : index
    Created on : 24 Oct, 2013, 5:41:27 PM
    Author     : Utkarsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Hello World!</h1>
        <APPLET code="simpleread.myApplet.class" 
        	archive="myApplet.jar"
        	width=350 height=200>
		</APPLET>
		
		<script type="text/javascript">
		
		
		function printNumber(number){
                        var param1 = encodeURIComponent(number);
                        var uri = "http://localhost:8080/CMS/getRFID.action?rfid="+param1;
                        window.location = uri;
			
                        //location.reload(true);
                        var element = document.createElement("input");
 
    //Assign different attributes to the element.
    element.setAttribute("type", "text");
    element.setAttribute("value", number);
    element.setAttribute("id","rfid" );
    document.body.appendChild(element);
 
                       /*Create an input type dynamically.
                       var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
  
xmlhttp.open("GET","ajax_info.txt",true);
xmlhttp.send();
		}
		*/
               
                }
                
		</script>
		
		 
		
    </body>
    <input type="text" id="rfid">
    
   <!--  <jsp:plugin type="applet" code="build\classes\simpleread\myApplet.class" codebase="." width="600" height="500" jreversion="1.6"></jsp:plugin> -->   

</html>
