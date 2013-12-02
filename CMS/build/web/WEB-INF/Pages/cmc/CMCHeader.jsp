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





        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.css" type="text/css" />
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables_themeroller.css" type="text/css" />
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<%=application.getContextPath()%>/bootstrap/DataTable/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css"> 


        <style>                      
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
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#" name="top">Cafeteria Management System</a>
                    <div class="nav-collapse collapse" style="margin-left: 80%;">
                        <ul class="nav">                      
                            <li class="divider-vertical"></li>
                            <li ><a href="home"><i class="icon-home"></i> Home</a></li>                            
                            <li class="divider-vertical"></li>
                            <li ><a href="logout"><i class="icon-share"></i> Logout</a></li>
                            <li class="divider-vertical"></li>
                        </ul>

                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!--/.container-fluid -->
            </div>
            <!--/.navbar-inner -->
        </div>
        <!--/.navbar -->
    </div>          
    <div style="box-shadow: 0px 3px 3px 0px;">
        <img style="border: #ddd" src="img/logo.jpg" />
    </div>
</body>
</html>
