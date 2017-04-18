
package com.mobiowin.admin.bean;

import com.mobiowin.admin.component.SimpleDataBean;


public class ProfileActivityMapping extends SimpleDataBean
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String profileCode;
	
	private String activityCode;

	public String getProfileCode()
	{
		return profileCode;
	}

	public void setProfileCode(String profileCode)
	{
		this.profileCode = profileCode;
	}

	public String getActivityCode()
	{
		return activityCode;
	}

	public void setActivityCode(String activityCode)
	{
		this.activityCode = activityCode;
	}
	
	

}
