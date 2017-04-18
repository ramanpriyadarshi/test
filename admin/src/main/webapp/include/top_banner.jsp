<!--<link rel="stylesheet" type="text/css"  href="../css_new/layout.css" media="all" />
<link rel="stylesheet" type="text/css"  href="../css_new/global.css" media="all" />
--> 
<%@page import="com.mobiowin.admin.bean.Activity"%>
<%@page import="java.util.Map"%>
<%@page import="com.mobiowin.admin.bean.SystemUser"%>
<script src="<%=request.getContextPath() %>/javascript/mouseovertabs.js" type="text/javascript">

/***********************************************
* Mouseover Tabs Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
***********************************************/

</script>

<!-- Index Masthead Start-->
<%SystemUser sysAdmin=(SystemUser) (session.getAttribute("systemUser")); 

%>
<div id="innermasthead">
  <div id="innermasthead1">
    <div id="logo_sitenav">
      <div id="logo">
     
    
      <img src="<%=request.getContextPath() %>/images/shopperslogo.JPG" height="74" alt="mobiOwin" name="png" id="png"  />
     
      
      </div>
      <div id="userinfo" >
        <ul>
          <li>Welcome<%--  <%=sysAdmin.getFirstName()%> <%=sysAdmin.getLastName()%> --%><br />
          <br/>
           <a href="<%=request.getContextPath()%>/login.htm?method=logout"><img src="<%=request.getContextPath() %>/images/btn_logout.gif" alt="logout" /></a>
           </li>         
        </ul>
         <ul>
			<li><img src="<%=request.getContextPath() %>/images/home.JPG"  alt="ShoppersStop" ></li>
		</ul>
      </div>
    </div>
  </div>
  <div id="alert"> </div>
  <!--Primary Navigation Start-->
  <div id="primary_nav" >
    <ul>
     
     <!-- Please Delete this part in project implementation -->
     <li><a href="<%=request.getContextPath() %>" rel="gotsubmenu"><span>Product Category</span></a></li>
     <li><a href="<%=request.getContextPath() %>" rel="gotsubmenu"><span>Concept Category</span></a></li>
     <li><a href="<%=request.getContextPath() %>" rel="gotsubmenu"><span>Product</span></a></li>
     <li><a href="<%=request.getContextPath() %>" rel="gotsubmenu"><span>Concept</span></a></li>
  <%-- <%
				Map<String, Activity> activityMap=(Map<String, Activity>)session.getAttribute("activityMap");
					          		   			
				if(null!=activityMap)
				{
					if(activityMap.containsKey("ACCESS_USER_MODULE"))
					{
			%>	    
      <li><a href="<%=request.getContextPath() %>/user.htm?method=getSystemUserList" rel="gotsubmenu"><span>User</span></a></li>
    <%}} %>  
    
     <%			          		   			
				if(null!=activityMap)
				{
					if(activityMap.containsKey("LIMITED_ACCESS_TO_SYNCAUDIT_MODULE"))
					{
						SystemUser sysUser=(SystemUser) session.getAttribute("systemUser");
						Long id=sysUser.getId();
			%>	 
      <li><a href="<%=request.getContextPath() %>/syncAudit.htm?method=getSyncAuditList&id=<%=id%>" rel="gotsubmenu"><span>SyncAudit</span></a></li>
     <%}
     
				else if(activityMap.containsKey("ACCESS_SYNCAUDIT_MODULE"))
				{
	%>
	 <li><a href="<%=request.getContextPath() %>/syncAudit.htm?method=getSyncAuditList" rel="gotsubmenu"><span>SyncAudit</span></a></li>
	<% 		
				}}
     %> --%>
     
     
     
     
     <%-- <%					          		   			
				if(null!=activityMap)
				{
					if(activityMap.containsKey("LIMITED_ACCESS_TO_CUSTOMER_MODULE"))
			{
						SystemUser sysUser=(SystemUser) session.getAttribute("systemUser");
						Long userId=sysUser.getId();
			%>		
      <li><a href="<%=request.getContextPath() %>/customerShortlist.htm?method=getCustomerList&id=<%=userId%>" rel="gotsubmenu"><span>Customers</span></a></li>
	  <%} 
				else if(activityMap.containsKey("ACCESS_CUSTOMER_MODULE"))
				{
	%>
	
	<li><a href="<%=request.getContextPath() %>/customerShortlist.htm?method=getCustomerList" rel="gotsubmenu"><span>Customers</span></a></li>				
	<%}} %> --%>
  	</ul>
  </div>
  <!--Primary Navigation End-->
</div>
<div id="IB_nav">
  <!--1st link within submenu container should point to the external submenu contents file-->
  <a href="<%=request.getContextPath() %>/include/top_banner_submenu.jsp" style="visibility:hidden">Sub Menu contents</a> </div>

<script type="text/javascript">
//mouseovertabsmenu.init("tabs_container_id", "submenu_container_id", "bool_hidecontentsmouseout")
mouseovertabsmenu.init("primary_nav", "IB_nav", true)

</script>
