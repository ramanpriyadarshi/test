package com.mobiowin.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mobiowin.admin.bean.SystemUser;
import com.mobiowin.admin.dao.IUserAuthDao;

@Service("systemUserService")
@Component
public class SystemUserService implements ISystemUserService{

	private Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private IUserAuthDao userAuthDao;
	
	public List<SystemUser> authenticateUser(SystemUser userBean) {
		log.info("Inside SystemUserService/authenticateUser");
		
		List<SystemUser> userList = new ArrayList<SystemUser>();
		userList = userAuthDao.findMatchingBeans(userBean);
		return userList;
		
		
	}

	public List<SystemUser> activeUserSearch(SystemUser systemUser) {
		List<SystemUser> userList = new ArrayList<SystemUser>();
		userList = userAuthDao.findAllActiveUsers(systemUser);
		return userList;
	}

	public void add(SystemUser systemUser) {
		// TODO Auto-generated method stub
		
	}

	public List<SystemUser> doUserSearch(SystemUser searchSystemuser) {
		// TODO Auto-generated method stub
		return null;
	}

}
