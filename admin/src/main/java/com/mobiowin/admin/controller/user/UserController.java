package com.mobiowin.admin.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.mobiowin.admin.bean.SystemUser;
import com.mobiowin.admin.service.SystemUserService;

public class UserController extends MultiActionController {

	private Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private SystemUserService systemUserService;

	public ModelAndView addSystemUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("---------In UserController / addUser()----------");

		SystemUser systemUser = getSystemUserBean(request, null);
		try {
			HttpSession session = request.getSession();
			SystemUser sysAdmin = (SystemUser) session.getAttribute("systemUser");
			systemUser.setCreatedBy(sysAdmin.getId());
			systemUser.setModifiedBy(sysAdmin.getId());
			systemUserService.add(systemUser);
		} catch (Exception e) {
			throw new RuntimeErrorException(null);
		}

		systemUser = fetchExistingSystemUser(request.getParameter("login"));

		return getSystemUserList(request, response);
	}

	public ModelAndView getSystemUserList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("--- In getSystemUserList  ---");
		SystemUser systemUser = new SystemUser();
		systemUser.setDeleteFlag("F");
		List<SystemUser> systemUserList = systemUserService.activeUserSearch(systemUser);
		
		log.info("--- In getSystemUserList  ---" + systemUserList);
		log.info("UserController/getSystemUserList SystemUserList:"
				+ ((systemUserList == null) ? "Null " : systemUserList.size()));

		log.info("-------------------------------Final List--------------------------" + systemUserList);

		HttpSession session = request.getSession();

		request.setAttribute("systemUserList", systemUserList);

		return new ModelAndView("/masters/user/userWorkbench");
	}

	private SystemUser fetchExistingSystemUser(String code) {
		SystemUser searchSystemuser = new SystemUser();
		searchSystemuser.setCode(code);

		List<SystemUser> searchResult = systemUserService.doUserSearch(searchSystemuser);
		log.info("-------------------------------searchResult --------------------------" + searchResult);
		if (CollectionUtils.isEmpty(searchResult)) {
			return null;
		}

		if (searchResult.size() > 1) {
			throw new RuntimeException("Duplicate Records Found...");
		}

		return searchResult.get(0);
	}

	private SystemUser getSystemUserBean(HttpServletRequest request, SystemUser existingSystemUser) {
		log.info("-------------- in getUserBean Method  -------------");

		if (existingSystemUser == null) {
			existingSystemUser = new SystemUser();
		}

		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String mobileNo = request.getParameter("mobileNo");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contactPerson = request.getParameter("contactPerson");
		String role = "1";
		String profile = request.getParameter("profile");
		String id = request.getParameter("id");

		log.info("--- Login  ---" + login);
		log.info("---------firstName----------" + firstName);
		log.info("---------middleName----------" + middleName);
		log.info("---------lastName----------" + lastName);
		log.info("---------mobileNo----------" + mobileNo);
		log.info("---------email----------" + email);
		log.info("---------address----------" + address);
		log.info("---------contactPerson----------" + contactPerson);
		log.info("---------role----------" + role);
		log.info("---------profile----------" + profile);
		log.info("---------id od systemUser----------" + id);
		if ((login != null) && !login.equalsIgnoreCase("")) {
			existingSystemUser.setLogin(login);
		}

		if ((password != null) && !password.equalsIgnoreCase("")) {
			existingSystemUser.setPassword(password);
		}

		if ((firstName != null) && !firstName.equalsIgnoreCase("")) {
			existingSystemUser.setFirstName(firstName);
		}

		existingSystemUser.setMiddleName(middleName);

		if ((lastName != null) && !lastName.equalsIgnoreCase("")) {
			existingSystemUser.setLastName(lastName);
		}

		if ((mobileNo != null) && !mobileNo.equalsIgnoreCase("")) {
			existingSystemUser.setPhoneNumber(mobileNo);
		}

		if ((email != null) && !email.equalsIgnoreCase("")) {
			existingSystemUser.setEmail(email);
		}

		existingSystemUser.setAddress(address);

		existingSystemUser.setContactPerson(contactPerson);


		existingSystemUser.setCode(login);

		log.info("---------PRIMARY KEY OF THE SYSTEM USER TABLE----------" + existingSystemUser.getId());
		return existingSystemUser;
	}
}
