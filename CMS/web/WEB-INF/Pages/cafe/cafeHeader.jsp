<%-- 
    Document   : header
    Created on : 18 Oct, 2013, 9:27:50 PM
    Author     : ABS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0); //prevents caching at the proxy server
        %>
        <link media="screen" rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
        <link media="screen" rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css" />                
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/js/bootstrap.js"></script>                 <style>                      
            .custom{

                top:2%;
                left:80%
            }
            .cust{                
                text-indent: 15px;
            }
        </style>

    </head>
    <body>

        <div style=" width: 80%; margin-left: 10%;" class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#" style="margin-right: -15%;" name="top">Cafeteria Management System</a>
                    <div class="nav-collapse collapse" style="margin-left: 50%;">                              
                        <ul class="nav" style="width:100%">                                                                              
                            <li><a href="#"><strong>Balance : &nbsp;<s:property value="%{#session.balance}" /></strong></a></li>  
                            <li ><a href="home"><i class="icon-home"></i>Home</a></li>                                                        
                            <li ><a href="tap"><i class="icon-home"></i>Place Order</a></li>                            
                            <li class="divider-vertical"></li>                                                                               
                        </ul>
                        <div class="btn-group pull-right" style="margin-top:-5%;" >
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" >
                                <s:property value="%{#session.ID}" />&nbsp;&nbsp;<i class="icon-chevron-down"></i>
                            </a>
                            <ul class="dropdown-menu">						                                
                                <li><a href="changecafePass"><i class="icon-wrench"></i> Change Password</a></li>
                                <li class="divider"></li>
                                <li><a href="logout"><i class="icon-share"></i> Logout</a></li>
                            </ul>                        
                        </div>
                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!--/.container-fluid -->
            </div>
            <!--/.navbar-inner -->
        </div>
        <!--/.navbar -->      
        <div style="margin-left: 10%;  border-radius: 10px;  width: 80%; margin-top: -1.5%; border-bottom-color:#e5e5e5; box-shadow:0px 2px 2px 0px; ">
            <img style="border: #ddd" src="img/logo.jpg" />
        </div>

    </body>
</html>
