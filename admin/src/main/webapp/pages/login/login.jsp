<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="enterUserName" scope="request" value="${ENTER_USER_NAME}"/>
<c:set var="enterPassword" scope="request" value="${ENTER_PASSWORD}"/>
<c:set var="invalidUser" scope="request" value="${INVALID_USER}"/>
<c:set var="loggedout" scope="request" value="${LOGGED_OUT}"/>
<html><!-- InstanceBegin template="/Templates/template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Login </title>
<!-- InstanceEndEditable -->
<!--  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">-->
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/layout.css" media="all" />
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/global.css" media="all" />

<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<script type="text/javascript">
function checkEnter(e)
{
	var keyCode = (window.Event) ? e.which : e.keyCode;
	  if( keyCode == 13 ) 
	  {
		  submit();
	  }
}
function submit()
{
	var form = document.loginForm;
	
	form.action="<%=request.getContextPath()%>/login.htm?method=login";
	form.method= "post";
	form.submit();	
}
</script>
</head>
<body>
<form name="loginForm">
<!-- MainContainer Start-->
<div id="maincontainer">
<!-- InstanceBeginEditable name="top" -->
  <jsp:include page="../../include/top_banner_plain.jsp"/>
  <!-- InstanceEndEditable -->
  <!-- Content Container Start -->
  <div id="innercontent_container" >
      <table width="100%"  border="0" cellspacing="1" cellpadding="0" >
		<tr >
		  <td valign="top" width="81%">
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
			  <tr>
				<td width="100%" class="templateTd">
				  <!-- InstanceBeginEditable name="body" -->
                <table width="100%" height="90px" border="0" align="center" cellpadding="1" cellspacing="1" >
                  <tr>
                    <td ><table cellpadding="0" cellspacing="0" align="center" width="65%" class="bggray">
                        <tr>
                          <td><div class="formfields">
                              <table align="center"   cellpadding="6" cellspacing="0" border="0" height="10%">
                                <tr class="first">
                                  <td colspan="4" align="center" class="first"><label class="heading">Login</label></td>
                                </tr>
                                <tbody class="bggray">
                                  <tr >
                                    <td colspan="2">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="42%" align="right"><span class="redstar">*</span>Username&nbsp;:</td>
                                    <td ><input type="text" name="username">
                                    </td>
                                    <td style="color: red;">
                                    	<c:out value="${enterUserName}"/>
                                    </td>
                                    <td style="color: red;">
                                    	<c:out value="${invalidUser}"/>
                                    </td>
                                    
                                  </tr>
                                  <tr>
                                    <td width="42%" align="right"><span class="redstar">*</span>Password&nbsp;:</td>
                                    <td  ><input type="password" name="password" onkeypress="checkEnter(event)"></td>
                                    <td style="color: red;">
                                    	<c:out value="${enterPassword}"/>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td align="left"><a href="javascript:submit()"> <img src="<%=request.getContextPath() %>/images/login_button.jpg"></img></a>
                                      <!-- <input type="button" name="Submit" value="Login" id="loginBtn" onClick="fnlogin()"> -->
                                    </td>
                                    
                                  </tr>
                                 <tr>
                                 <td></td>
                                 <td style="color: red;">
                                    	<c:out value="${loggedout}"/>
                                    </td>
                                 </tr>
                                  
                                  <tr>                                 
                                    
                                   <!--   <td colspan="2" align="right"><div align="right">
                                      <a href="<%=request.getContextPath() %>/pages/login/forgotPassword.jsp" class="links"> Forgot Password ?</a></div></td> --> 
                                    
                                  </tr>
                                </tbody>
                              </table>
                            </div></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr height="30">
                    <td>&nbsp;</td>
                  </tr>
                </table>
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
</form>
</body>
<!-- InstanceEnd --></html>
