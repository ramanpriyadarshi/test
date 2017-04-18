package com.mobiowin.admin.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mobiowin.admin.bean.SystemUser;

@Repository("userAuthDao")
@Component
public class UserAuthDao implements IUserAuthDao{

	private Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private SessionFactory sessionFactory;

	Session session = null;
	Transaction transaction = null;
	
	public List<SystemUser> findMatchingBeans(SystemUser userBean) {
		log.info("Inside UserAuthDao/findMatchingBeans()");

		log.info("userBean : " + userBean);

		StringBuilder loginQueryBuilder = null;
		List<SystemUser> loginList = null;
		try {
			loginQueryBuilder = new StringBuilder();
			loginQueryBuilder.append("from SystemUser ");
			loginQueryBuilder.append("where password =:password ");
			loginQueryBuilder.append("and login = :login ");

			Query query = sessionFactory.openSession().createQuery(loginQueryBuilder.toString());
			query.setParameter("password", userBean.getPassword());
			query.setParameter("login", userBean.getLogin());

			loginList = query.list();

			log.info("orgLoginList : " + loginList.size());

			return loginList;
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Hibernate Exception in org login validation : " + e.getMessage());
			return loginList;
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception in org login validation : " + e.getMessage());
			return loginList;
		}
	}

	public List<SystemUser> findAllActiveUsers(SystemUser systemUser) {

		log.info("Inside UserAuthDao/findMatchingBeans()");

		log.info("userBean : " + systemUser);

		StringBuilder loginQueryBuilder = null;
		List<SystemUser> loginList = null;
		try {
			loginQueryBuilder = new StringBuilder();
			loginQueryBuilder.append("from SystemUser ");
			loginQueryBuilder.append("where deleteFlag =:deleteFlag ");
			

			Query query = sessionFactory.openSession().createQuery(loginQueryBuilder.toString());
			query.setParameter("deleteFlag", systemUser.getDeleteFlag());
			

			loginList = query.list();

			log.info("Active user list : " + loginList.size());

			return loginList;
		} catch (HibernateException e) {
			e.printStackTrace();
			log.error("Hibernate Exception in org login validation : " + e.getMessage());
			return loginList;
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception in org login validation : " + e.getMessage());
			return loginList;
		}
	
	}

}
