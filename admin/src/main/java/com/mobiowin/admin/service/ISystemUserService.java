package com.mobiowin.admin.service;

import java.util.List;

import com.mobiowin.admin.bean.SystemUser;

public interface ISystemUserService {

	List<SystemUser> authenticateUser(SystemUser userBean);

}
