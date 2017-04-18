package com.mobiowin.admin.component;

import java.io.Serializable;
import java.sql.Timestamp;


public class SimpleDataBean implements Serializable
{

	private static final long serialVersionUID = 1L;

	private Long id;

	private Long createdBy;

	private Long modifiedBy;

	private Timestamp createdOn;

	private Timestamp modifiedOn;

	private String deleteFlag;

	//private String syncFlag;

	public SimpleDataBean(Long id, Long createdBy, Long modifiedBy, Timestamp createdOn, Timestamp modifiedOn,
			String deleteFlag)
	{
		super();
		this.id = id;
		this.createdBy = createdBy;
		this.modifiedBy = modifiedBy;
		this.createdOn = createdOn;
		this.modifiedOn = modifiedOn;
		this.deleteFlag = deleteFlag;
	}

	public SimpleDataBean()
	{
		super();

	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	
	public Long getCreatedBy()
	{
		return createdBy;
	}

	
	public void setCreatedBy(Long createdBy)
	{
		this.createdBy = createdBy;
	}

	
	public Long getModifiedBy()
	{
		return modifiedBy;
	}

	
	public void setModifiedBy(Long modifiedBy)
	{
		this.modifiedBy = modifiedBy;
	}

	
	public Timestamp getCreatedOn()
	{
		return createdOn;
	}

	
	public void setCreatedOn(Timestamp createdOn)
	{
		this.createdOn = createdOn;
	}

	
	public Timestamp getModifiedOn()
	{
		return modifiedOn;
	}

	
	public void setModifiedOn(Timestamp modifiedOn)
	{
		this.modifiedOn = modifiedOn;
	}

	
	public String getDeleteFlag()
	{
		return deleteFlag;
	}

	
	public void setDeleteFlag(String deleteFlag)
	{
		this.deleteFlag = deleteFlag;
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("SimpleDataBean [id=");
		builder.append(id);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", modifiedBy=");
		builder.append(modifiedBy);
		builder.append(", createdOn=");
		builder.append(createdOn);
		builder.append(", modifiedOn=");
		builder.append(modifiedOn);
		builder.append(", deleteFlag=");
		builder.append(deleteFlag);
		builder.append("]");
		return builder.toString();
	}

	/*public String getSyncFlag()
	{
		return syncFlag;
	}

	public void setSyncFlag(String syncFlag)
	{
		this.syncFlag = syncFlag;
	}*/
}
