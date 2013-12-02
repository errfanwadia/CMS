<%-- 
    Document   : sideBar
    Created on : Oct 19, 2013, 7:17:42 AM
    Author     : Irfan Wadia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
         
<div class="sidebar-nav">
    <div class="well" style="width: 250px; padding: 8px 0;">
        <ul class="nav nav-list"> 
	<li class="nav-header">Admin Menu</li>        
	<li class="Active"><a href="addCustomer"><i class="icon-plus-sign"></i> Add Customer</a></li>
        <li><a href="addCanteen"><i class="icon-plus-sign"></i> Add Canteen </a></li>
        
        <li class="divider"></li>
        
        <li><a href="viewCustomer"><i class="icon-th-list"></i> View Customer </a></li>
        
        <li class="divider"></li>
        
	<li><a href="credit"><i class="icon-plus-sign"></i> Credit Amount</a></li>
	<li><a href="debit"><i class="icon-minus-sign"></i> Debit Amount</a></li>
        <li><a href="editProfile"><i class="icon-minus-sign"></i> Edit Profile</a></li>
	
        <li class="divider"></li>
        <li><a href="changePass"><i class="icon-lock"></i> Change Password</a></li>
        <li><a href="logout"><i class="icon-share"></i> Logout</a></li>
	</ul>
    </div>
</div>
