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
        <link media="screen" rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
        <link media="screen" rel="stylesheet" href="<%=application.getContextPath()%>/bootstrap/css/bootstrap-responsive.min.css" />  
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
			<div class="nav-collapse collapse">
				<ul class="nav">                                    
                                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="home"><i class="icon-home"></i> Home</a></li>
					<li class="divider-vertical"></li>
					<li class="actived  "><a href="history"><i class="icon-calendar"></i> History</a></li>
					<li class="divider-vertical"></li>
					<li><a href="transfer"><i class="icon-share"></i> Fund Transfer</a></li>					                                        
					<li class="divider-vertical"></li>								                                    
                                        <li><a href="account"><i class="icon-user"></i> Account</a></li>					                                        
                                </ul>
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#" >
                                        <s:property value="UserID" />&nbsp;&nbsp;<i class="icon-chevron-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="icon-eye-open"></i> View Profile</a></li>
                                                <li><a href="#"><i class="icon-pencil"></i> Edit Profile</a></li>
                                                <li><a href="#"><i class="icon-wrench"></i> Change Password</a></li>
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
   </div>          
    <div style="box-shadow: 0px 3px 3px 0px;">
       <img style="border: #ddd" src="img/logo.jpg" />
    </div>
    </body>
</html>
