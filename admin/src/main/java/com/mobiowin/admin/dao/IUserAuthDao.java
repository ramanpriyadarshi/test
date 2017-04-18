package com.mobiowin.admin.dao;

import java.util.List;

import com.mobiowin.admin.bean.SystemUser;

public interface IUserAuthDao {

	List<SystemUser> findMatchingBeans(SystemUser userBean);

	List<SystemUser> findAllActiveUsers(SystemUser systemUser);

}
