
<%-- 
    Document   : registration
    Created on : 26 Oct, 2013, 10:40:27 PM
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
        <title>Registration Page</title>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css" /> 
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>                
        <link rel="stylesheet" href="<%=application.getContextPath()%>/validation/validationEngine.jquery.css" type="text/css"/>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="<%=application.getContextPath()%>/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>       
        <script>
            var flag = new Boolean();
            var temp;
            $(document).ready(function() {
                jQuery("#myform").validationEngine();
                var _URL = window.URL || window.webkitURL;

                flag = false;
                temp = 1;
                $("#pro_pic").change(function(e) {
                   // alert("File changed");
                    var file, img;
                    if ((file = this.files[0])) {
                        img = new Image();
                        img.onload = function() {
                            //alert(this.width + " " + this.height);
                            if (this.width < 200 && this.height < 200)
                            {
                                flag = true;
                                temp = 0;
                            }
                            //alert("Flag is : " + flag);
                        };
                        img.src = _URL.createObjectURL(file);

                    }
                });


            });

            function check()
            {
                //alert("check called");
                //alert(temp);
                if (temp == 0)
                {
                  //  alert("in if");
                }
                else
                {
                    //alert("not sumbited");
                }
            }
        </script>
        <s:head />
    </head>
    <body background="bg.gif">
        <div  style="color: red;text-align: center">
            <s:actionerror /> 
            <s:actionmessage />
        </div>
        <%--
        <s:form id="myform" action="register" method="post" enctype="multipart/form-data" name="myform">
            <s:textfield name="userID" cssClass="validate[required,onlyNumber]" placeholder="Enter Daiict ID" /><br/>
            <s:password name="pass" cssClass="validate[required,minSize[6]]" id="pass" placeholder="Enter Password" /><br/>
            <s:password name="pass1" cssClass="validate[required,equals[pass]]" placeholder="Confirm Password" /><br/>
            <s:textfield name="fname" cssClass="validate[required]" placeholder="First Name" /><br/>
            <s:textfield name="lname" cssClass="validate[required]" placeholder="Last Name" /><br/>
            <s:textfield name="cont_no" cssClass="validate[required,custom[integer],minSize[10],maxSize[10]]" placeholder="Contact Number" /><br/>
            <s:textfield name="email" cssClass="validate[groupRequired[payments],custom[email]]" placeholder="Email Address" /><br/> 
            <s:file name="pro_pic" cssClass="validate[required]" id="pro_pic" label="Profile Image" /><br/> 
            <button id="check" align="center" >Register</button>  
        </s:form>
        
        
               <s:form cssClass="form-horizontal" id="myform" action="register" method="POST" enctype="multipart/form-data" name="myform">
                   <fieldset>
                       <div id="legend">
                           <legend class="">Register</legend>
                       </div>
                       <div class="control-group">
                           <!-- Username -->
                           <label class="control-label"  for="userID">UserID</label>
                           <div class="controls">
                               <s:textfield name="userID" id="userID" cssClass="input-xlarge validate[required,onlyNumber]" placeholder="eg. 20XXXXXXXX" />

                        <!--<p class="help-block">Username can contain any letters or numbers, without spaces</p>-->
                    </div>
                </div>



                <div class="control-group">
                    <!-- Password-->
                    <label class="control-label" for="password">Password</label>
                    <div class="controls">
                        <s:password name="pass" id="pass" cssClass="input-xlarge validate[required,minSize[6]]" placeholder="" />
                        <!--<p class="help-block">Password should be at least 4 characters</p>-->
                    </div>
                </div>

                <div class="control-group">
                    <!-- Password -->
                    <label class="control-label"  for="password_confirm">Password (Confirm)</label>
                    <div class="controls">
                        <s:password name="pass1" id="password_confirm" cssClass="input-xlarge validate[required,equals[pass]" placeholder="" />

                        <!--<p class="help-block">Please confirm password</p>-->
                    </div>
                </div>

                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="phone">Phone no.</label>
                    <div class="controls">
                        <s:textfield name="cont_no" id="phone" cssClass="input-xlarge validate[required,custom[integer],minSize[10],maxSize[10]]" placeholder="Enter 10 digit phone no" />

                        <!--<p class="help-block">Please provide your E-mail</p>-->
                    </div>
                </div>  

                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="email">Email Address</label>
                    <div class="controls">
                        <s:textfield name="email" id="email" cssClass="input-xlarge validate[groupRequired[payments],custom[email]]" placeholder="Email" />

                        <!--<p class="help-block">Please provide your E-mail</p>-->
                    </div>
                </div>  

                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="image">Image</label>
                    <div class="controls">
                      <s:file name="pro_pic" cssClass="validate[required]" id="pro_pic" label="Profile Image" />

                        <!--<p class="help-block">Please provide your E-mail</p>-->
                    </div>
                </div>         


                <div class="control-group">
                    <!-- Button -->
                    <div class="controls">
                        <s:submit value="Register" cssClass="btn btn-primary"/>
                    </div>
                </div>
            </fieldset>
        </s:form>--%>


        <div style="box-shadow:0px 0px 4px 0px; width:50%; margin-top:5%; margin-left:25%;">

            <div  class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Registration</a></li>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">

                        <s:form id="myform" action="register" method="post" enctype="multipart/form-data" name="myform">                               
                            <s:textfield name="userID" cssClass="validate[required,onlyNumber]" placeholder="Enter Daiict ID" /><br/>
                            <s:password name="pass" cssClass="validate[required,minSize[6]]" id="pass" placeholder="Enter Password" /><br/>
                            <s:password name="pass1" cssClass="validate[required,equals[pass]]" placeholder="Confirm Password" /><br/>
                            <s:textfield name="fname" cssClass="validate[required]" placeholder="First Name" /><br/>
                            <s:textfield name="lname" cssClass="validate[required]" placeholder="Last Name" /><br/>
                            <s:textfield name="cont_no" cssClass="validate[required,custom[integer],minSize[10],maxSize[10]]" placeholder="Contact Number" /><br/>
                            <s:textfield name="email" cssClass="validate[groupRequired[payments],custom[email]]" placeholder="Email Address" /><br/> 
                            <s:file name="pro_pic" cssClass="validate[required]" id="pro_pic" label="Profile Image" /><br/> <br/>
                            <button id="check" class="btn btn-primary" align="center" style="margin-left: 10%" >Register</button>  <br/>
                        </s:form>
                    </div>
                </div>
            </div></div>

    <center><a href="loginPage"><i class="icon-arrow-left"></i>Back To Login Page</a></center>
</body>
</html>
