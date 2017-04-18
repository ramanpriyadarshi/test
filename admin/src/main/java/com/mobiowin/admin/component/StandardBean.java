package com.mobiowin.admin.component;

import java.io.Serializable;
import java.sql.Timestamp;

public class StandardBean extends SimpleDataBean implements Serializable
{

	private static final long serialVersionUID = 1L;

	private String code;

	private String name;

	private String description;
	
	public StandardBean()
	{
		super();
		
	}

	public StandardBean(Long id, Long createdBy, Long modifiedBy, Timestamp createdOn, Timestamp modifiedOn,
			String deleteFlag, String code, String name, String description)
	{
		super(id, createdBy, modifiedBy, createdOn, modifiedOn, deleteFlag);
		this.code = code;
		this.name = name;
		this.description = description;
	}

	public String getCode()
	{
		return code;
	}

	

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;

		if (this.code == null)
		{
			this.code = name;
		}

		/*if (this.displayName == null)
		{
			this.displayName = name;
		}*/
	}

	/*public String getDisplayName()
	{
		return displayName;
	}

	public void setDisplayName(String displayName)
	{
		this.displayName = displayName;
	}*/

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
		{
			return true;
		}
		if (obj == null)
		{
			return false;
		}
		if (!(obj instanceof StandardBean))
		{
			return false;
		}
		StandardBean other = (StandardBean) obj;
		if (code.trim() == null)
		{
			if (other.code.trim() != null)
			{
				return false;
			}
		}
		else if (!code.trim().equals(other.code.trim()))
		{
			return false;
		}
		return true;
	}

	@Override
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
		builder.append("StandardBean [code=");
		builder.append(code);
		builder.append(", name=");
		builder.append(name);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

}
