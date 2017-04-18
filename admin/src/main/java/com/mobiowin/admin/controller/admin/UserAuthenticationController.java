package com.mobiowin.admin.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.mobiowin.admin.bean.SystemUser;
import com.mobiowin.admin.service.ISystemUserService;


public class UserAuthenticationController extends MultiActionController {

	Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private ISystemUserService systemUserService;

	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("--------- In UserAuthenticationController /  login()");

		// HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		log.info(" ----------- userName  ----------" + username);

		if ((username == null) || username.equalsIgnoreCase("")) {
			request.setAttribute("ENTER_USER_NAME", "ENTER USER NAME");
			return new ModelAndView("login/login");
		}

		if ((password == null) || password.equalsIgnoreCase("")) {
			request.setAttribute("ENTER_PASSWORD", "ENTER PASSWORD");
			return new ModelAndView("login/login");
		}

		SystemUser userBean = new SystemUser();

		userBean.setDeleteFlag("F");

		if ((username != null) && !username.equalsIgnoreCase("")) {
			userBean.setLogin(username);

		}

		if ((password != null) && !password.equalsIgnoreCase("")) {
			userBean.setPassword(password);

		}
		
		log.info("Systemuserservice : " + systemUserService);

		List<SystemUser> userBeans = systemUserService.authenticateUser(userBean);
		log.info(" ----------- size of userBeans  ----------" + userBeans.toString());

		if ((userBeans == null) || (userBeans.size() == 0)) {
			request.setAttribute("INVALID_USER", "LOGIN CREDENTIALS ARE NOT VALID. PLEASE TRY AGAIN");
			log.info("------------  User Not Found ------------");

			return new ModelAndView("login/login");
		} else if (userBeans.size() > 1) {
			request.setAttribute("INVALID_USER", "INVALID USER");
			log.info("------------ Invalid User ------------");

			return new ModelAndView("login/login");
		} else if (userBeans.size() == 1) {
			log.info("------------ valid User ------------");
			SystemUser systemUser = userBeans.get(0);

			HttpSession session = request.getSession();
			session.setAttribute("systemUser", systemUser);
			

			request.getRequestDispatcher("/user.htm?method=getSystemUserList").forward(request, response);

		}

		return new ModelAndView("login/login");
	}

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("----in logout method----");
		HttpSession session = request.getSession();
		session.removeAttribute("systemUser");
		request.setAttribute("LOGGED_OUT", "You have successfully logged out");

		return new ModelAndView("login/login");
	}
}
