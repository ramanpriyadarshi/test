<!doctype html>
<html><!-- InstanceBegin template="/Templates/template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Forgot Password </title>
<!-- InstanceEndEditable -->
<!--  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">-->
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/layout.css" media="all" />
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/global.css" media="all" />

<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
<!-- MainContainer Start-->
<div id="maincontainer">
<!-- InstanceBeginEditable name="top" --> <jsp:include page="../../include/top_banner_plain.jsp"/><!-- InstanceEndEditable -->
  <!-- Content Container Start -->
  <div id="innercontent_container" >
      <table width="100%"  border="0" cellspacing="1" cellpadding="0" >
		<tr >
		  <td valign="top" width="81%">
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
			  <tr>
				<td width="100%" class="templateTd">
				  <!-- InstanceBeginEditable name="body" -->
				  <div class="formfields">
				  <table width="100%" border="0" cellspacing="1" cellpadding="0">
				  <tr><td>
				  <table width="100%" border="0" cellspacing="1" cellpadding="0">
				 		<tr class="first">
								<td class="first">
								<span class="left">Forgot Password?</span>
								</td>
							</tr> 
				  </table>
				  </td></tr>
				  
				   <tr><td width="50%">
				  <table  border="0" cellspacing="1" cellpadding="0"   class="dataList" align="center">
				  <tr><td colspan="2">
				  Forgot Password? No problem, we are here to help you. Please provide Username and either Email or mobile number or both to recieve your password.
				  </td>
				  <tr>
				  <td><span class="redstar">*</span>Username</td>
				  <td><input type="text" name="username" title="Username" />
				  </tr>
				  <tr><td colspan="2"><span class="redstar">*</span>Please provide minimum one information of the following.</td></tr>
				  <tr>
				  <td>Email Id </td>
				  <td ><input type="text" name="email" title="Password will be emailed to this Id" />
				  </tr>
				  
				   <tr>
				  <td>Mobile Number</td>
				  <td><input type="text" name="mobileno" title="Mobile Number preceeded by Country Code. Password will be SMSed to thsi number." />
				  &nbsp;
				  Mobile Number should be preceded by Country Code
				   </tr>
				  
				  <tr>
				  <td colspan="2">  
				  <a href="<%=request.getContextPath() %>/pages/login/login.jsp"> <img src="<%=request.getContextPath() %>/images/btn_submit.gif"></img></a>
				  </td>
				  </tr>
				  </table>
				  
				    </td></tr>
				  </table>
				  </div>
				  <!-- InstanceEndEditable -->
				</td>
			  </tr>
			</table>
  		  </td>
 		</tr>
	  </table>
  </div>
  <!-- Content Container End -->
    <!-- Footer Start -->
  <!-- InstanceBeginEditable name="bottom" -->
 <jsp:include page="../../include/bottom.html" />
  <!-- InstanceEndEditable -->
  <!-- Footer End -->
</div>
<!-- Container End-->
</body>
<!-- InstanceEnd --></html>
