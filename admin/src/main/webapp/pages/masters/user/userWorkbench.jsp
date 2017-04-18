<!DOCTYPE HTML>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,com.mobiowin.admin.bean.SystemUser" %>
<html>
<!-- InstanceBegin template="/Templates/template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

<!-- InstanceBeginEditable name="doctitle" -->
<title>User Workbench</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/layout.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/global.css" media="all" />
<script src="<%=request.getContextPath()%>/javascript/sessionFilter.js" language="javascript" type="text/javascript">
</script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script type="text/javascript">
function checkEnter(e)
{
	var bool=false;
	var keyCode = (window.Event) ? e.which : e.keyCode;
	
	
		  if( keyCode == 13 ) 
		  {
			  	bool=true;
				return submit(bool);  	  	
		  }
}
function areYouSure()
{
	alert("Are you sure you want to delete this record ?");
}
function submit(bool)
{
	var form = document.homeForm;
	if(form.searchName.value==null || form.searchName.value=="")
	{
		alert("Please enter the code/name for custom search");
		if(bool)
		{
			return false;	
		}
		else
		{
			return;	
		}
		
	}
		
	if(form.searchName.value.length<=2)
	{
		alert("Please enter minimum 3 characters for searching");
		if(bool)
		{
			return false;	
		}
		else
		{
			return;	
		}
	}
	form.method= "post";
	form.action="<%=request.getContextPath()%>/user.htm?method=getSystemUserSearch";
	form.submit();
}
function post_to_url(path, params, method) 
{
    method = method || "post"; 

    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) 
    {
        if(params.hasOwnProperty(key)) 
        {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
         }
    }
    var r=confirm("Are You Sure? You want to Remove this User");
    if (r==true)
      {
    	document.body.appendChild(form);
        form.submit();
      }
    else
      {
      	return;
      }
}

function onDelete(selectedCode)
{
	var params = new Object();
	params.code = selectedCode;
	
	
	post_to_url("<%=request.getContextPath()%>/user.htm?method=deleteSystemUser", params, "post");
}

function check()
{
	<%	if(request.getAttribute("error")!=null)
		{
	%>
		alert("The given code/name does not exist");
		<%}%>
}

<%-- function chkSync(bool)
{
	alert("----Sync----"+bool);
	
	var form = document.syncForm;
	
	form.method= "post";
	form.action="<%=request.getContextPath()%>/user.htm?method=updateSyncFlag&entity="+bool;
	form.submit();

} --%>

function chkSync(bool)
{	
	var r=confirm("Are you sure !!");
	var form = document.syncForm;
	if(r==true)
	{
		form.method= "post";
		form.action="<%=request.getContextPath()%>/user.htm?method=updateSyncFlag&entity="+bool;
		form.submit();
		return;
	}
	else 
	{
		return;
	}
	return;

}

<%-- function chkSync(bool)
{
	
var r=confirm("Are you sure !!");
if (r==true)
  {
	var form = document.syncForm;
	
	form.method= "post";
	form.action="<%=request.getContextPath()%>/user.htm?method=updateSyncFlag&entity="+bool;
	form.submit();
  }
else
  {
  	return;
  }

} --%>


</script>
</head>
<body onload="sessionFilter();">

	<!-- MainContainer Start-->
	<div id="maincontainer">
		<!-- InstanceBeginEditable name="top" --><jsp:include
			page="../../../include/top_banner.jsp" /><!-- InstanceEndEditable -->
		<!-- Content Container Start -->
		<div id="innercontent_container">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td valign="top" width="81%">
						<table cellspacing="0" cellpadding="0" border="0" width="100%">
							<tr>
								<td width="100%" class="templateTd">
									<!-- InstanceBeginEditable name="body" -->

									<table width="100%" border="0" cellspacing="1" cellpadding="0">
										<tr>
											<td>
												<div class="formfields">
													<table width="100%" border="0" cellspacing="1"
														cellpadding="0">
														<tr class="first">
															<td class="first"><span class="left">User
																	Workbench</span></td>
														</tr>
													</table>
												</div></td>
										</tr>

										<tr>
											<td>
												<!-- -----------Search Form----------- -->
												
												<form name="homeForm">
												<div class="formfields">
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="searchbox">
														<tbody>
															<tr>
																<td class="curve_lt" />
																<td class="bdr_top" />
																<td class="curve_rt" />
															</tr>


															<tr>
																
																<td class="bdr_left" />
																<td height="25" class="bggray" align="right"><a
																	href="<%=request.getContextPath()%>/user.htm?method=onAddClick&status=add" class="txtMaron"
																	style="text-decoration: none; font-size: medium;">Add New User</a></td>

																<td class="bdr_right" />
															</tr>

															<tr>
																<td class="bdr_left" />
																<td class="bggray"><h3>Search By:</h3>
																	<table cellspacing="0" cellpadding="0" border="0"
																		style="">
																		<tbody>
																			<tr>
																				<td align="left" width="33%" style="font-size: small;">Name / Login :
																					<input type="text" name="searchName" size="18"
																					class="textbox_big"
																					onkeypress="return checkEnter(event);">

																					&nbsp;</td>

																				<td align="left"><a
																					href="javascript:submit()"><img
																						src="<%=request.getContextPath()%>/images/btn_search.gif"
																						alt="search" width="75" height="29" />
																				</a></td>


																			</tr>
																			<tr>
																				<td></td>
																			</tr>
																		</tbody>

																	</table></td>
																<td class="bdr_right" />
															</tr>
															
															
															
															<tr>
																<td class="curve_lb" />
																<td class="bdr_bot" />
																<td class="curve_rb" />
															</tr>
														</tbody>
													</table>

												</div>
												</form>
												<!-- -------------Search Form End------------- -->
												
											</td>
										</tr>
										<tr>
											<td>
												<div class="formfields">
													
													
												</div>
											</td>
										</tr>

										<tr>
											<td>
												<c:set var="count" value="0" scope="page" />
												<table width="100%" border="0" cellspacing="1"
													cellpadding="0" class="dataList">
													<display:table name="systemUserList"
														id="systemUser" class="dataList" pagesize="10"
														sort="list" style="width: 100%;" align="center">
														<tr>
															
															<td>
															<display:column title="Sr. No." class="disp_th" align="center">
                                                                       <%=systemUser_rowNum%>
                                                               </display:column>
															</td>
																	
															<td><display:column property="login" title="Login"
																	align="center" /></td>
																	
															<td><display:column property="firstName"
																	title="First Name" align="center" /></td>
																	
															<td><display:column property="lastName"
																	title="Last Name" align="center" /></td>
																	
																	
															 <td><display:column title="Details" align="center">
															<a href="<%=request.getContextPath()%>/user.htm?method=detailsSystemUser&code=${systemUser.code}&details=details"><img
																src="<%=request.getContextPath()%>/images/details.gif"
																alt="Details" title="View User Details">
															</a>
															</display:column></td>
															<td><display:column title="Edit" align="center">
															<a href="<%=request.getContextPath()%>/user.htm?method=detailsSystemUser&code=${systemUser.code}&edit=edit"><img
																src="<%=request.getContextPath()%>/images/edit.gif"
																alt="Edit" title="Edit User Details">
															</a>
															</display:column></td>
															<td><display:column title="Remove" align="center">
															<a href="javascript: onDelete('${systemUser.code}');"	><img
																src="<%=request.getContextPath()%>/ima	ges/delete.gif"
																alt="Delete" title="Delete User Details">
															</a>
															</display:column></td> 
														</tr>
													</display:table>
													
												</table></td>
										</tr>
									</table> <!-- InstanceEndEditable --></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</div>
		<!-- Content Container End -->
		<!-- Footer Start -->
		<!-- InstanceBeginEditable name="bottom" -->
		<jsp:include page="../../../include/bottom.html" />
		<!-- InstanceEndEditable -->
		<!-- Footer End -->
	</div>
	<!-- Container End-->

</body>
<!-- InstanceEnd -->
</html>
