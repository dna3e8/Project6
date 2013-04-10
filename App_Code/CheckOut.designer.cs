﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.296
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="INFO3420_01")]
public partial class CheckOutDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertCS_Order(CS_Order instance);
  partial void UpdateCS_Order(CS_Order instance);
  partial void DeleteCS_Order(CS_Order instance);
  partial void InsertCS_OrderItem(CS_OrderItem instance);
  partial void UpdateCS_OrderItem(CS_OrderItem instance);
  partial void DeleteCS_OrderItem(CS_OrderItem instance);
  #endregion
	
	public CheckOutDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["INFO3420_01Cust"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public CheckOutDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public CheckOutDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public CheckOutDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public CheckOutDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<CS_Order> CS_Orders
	{
		get
		{
			return this.GetTable<CS_Order>();
		}
	}
	
	public System.Data.Linq.Table<CS_OrderItem> CS_OrderItems
	{
		get
		{
			return this.GetTable<CS_OrderItem>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.[CS.Order]")]
public partial class CS_Order : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _OrderID;
	
	private string _CustomerUsername;
	
	private System.Nullable<System.DateTime> _DateTime;
	
	private string _Status;
	
	private System.Nullable<int> _BillingAddressID;
	
	private System.Nullable<int> _ShippingAddressID;
	
	private string _ShippingType;
	
	private EntitySet<CS_OrderItem> _CS_OrderItems;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderIDChanging(int value);
    partial void OnOrderIDChanged();
    partial void OnCustomerUsernameChanging(string value);
    partial void OnCustomerUsernameChanged();
    partial void OnDateTimeChanging(System.Nullable<System.DateTime> value);
    partial void OnDateTimeChanged();
    partial void OnStatusChanging(string value);
    partial void OnStatusChanged();
    partial void OnBillingAddressIDChanging(System.Nullable<int> value);
    partial void OnBillingAddressIDChanged();
    partial void OnShippingAddressIDChanging(System.Nullable<int> value);
    partial void OnShippingAddressIDChanged();
    partial void OnShippingTypeChanging(string value);
    partial void OnShippingTypeChanged();
    #endregion
	
	public CS_Order()
	{
		this._CS_OrderItems = new EntitySet<CS_OrderItem>(new Action<CS_OrderItem>(this.attach_CS_OrderItems), new Action<CS_OrderItem>(this.detach_CS_OrderItems));
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int OrderID
	{
		get
		{
			return this._OrderID;
		}
		set
		{
			if ((this._OrderID != value))
			{
				this.OnOrderIDChanging(value);
				this.SendPropertyChanging();
				this._OrderID = value;
				this.SendPropertyChanged("OrderID");
				this.OnOrderIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CustomerUsername", DbType="NVarChar(50)")]
	public string CustomerUsername
	{
		get
		{
			return this._CustomerUsername;
		}
		set
		{
			if ((this._CustomerUsername != value))
			{
				this.OnCustomerUsernameChanging(value);
				this.SendPropertyChanging();
				this._CustomerUsername = value;
				this.SendPropertyChanged("CustomerUsername");
				this.OnCustomerUsernameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateTime", DbType="SmallDateTime")]
	public System.Nullable<System.DateTime> DateTime
	{
		get
		{
			return this._DateTime;
		}
		set
		{
			if ((this._DateTime != value))
			{
				this.OnDateTimeChanging(value);
				this.SendPropertyChanging();
				this._DateTime = value;
				this.SendPropertyChanged("DateTime");
				this.OnDateTimeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="NChar(10)")]
	public string Status
	{
		get
		{
			return this._Status;
		}
		set
		{
			if ((this._Status != value))
			{
				this.OnStatusChanging(value);
				this.SendPropertyChanging();
				this._Status = value;
				this.SendPropertyChanged("Status");
				this.OnStatusChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BillingAddressID", DbType="Int")]
	public System.Nullable<int> BillingAddressID
	{
		get
		{
			return this._BillingAddressID;
		}
		set
		{
			if ((this._BillingAddressID != value))
			{
				this.OnBillingAddressIDChanging(value);
				this.SendPropertyChanging();
				this._BillingAddressID = value;
				this.SendPropertyChanged("BillingAddressID");
				this.OnBillingAddressIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ShippingAddressID", DbType="Int")]
	public System.Nullable<int> ShippingAddressID
	{
		get
		{
			return this._ShippingAddressID;
		}
		set
		{
			if ((this._ShippingAddressID != value))
			{
				this.OnShippingAddressIDChanging(value);
				this.SendPropertyChanging();
				this._ShippingAddressID = value;
				this.SendPropertyChanged("ShippingAddressID");
				this.OnShippingAddressIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ShippingType", DbType="NVarChar(30)")]
	public string ShippingType
	{
		get
		{
			return this._ShippingType;
		}
		set
		{
			if ((this._ShippingType != value))
			{
				this.OnShippingTypeChanging(value);
				this.SendPropertyChanging();
				this._ShippingType = value;
				this.SendPropertyChanged("ShippingType");
				this.OnShippingTypeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="CS_Order_CS_OrderItem", Storage="_CS_OrderItems", ThisKey="OrderID", OtherKey="OrderID")]
	public EntitySet<CS_OrderItem> CS_OrderItems
	{
		get
		{
			return this._CS_OrderItems;
		}
		set
		{
			this._CS_OrderItems.Assign(value);
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_CS_OrderItems(CS_OrderItem entity)
	{
		this.SendPropertyChanging();
		entity.CS_Order = this;
	}
	
	private void detach_CS_OrderItems(CS_OrderItem entity)
	{
		this.SendPropertyChanging();
		entity.CS_Order = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.[CS.OrderItem]")]
public partial class CS_OrderItem : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _OrderItemsID;
	
	private System.Nullable<int> _OrderID;
	
	private System.Nullable<int> _ProductID;
	
	private System.Nullable<int> _Quantity;
	
	private EntityRef<CS_Order> _CS_Order;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderItemsIDChanging(int value);
    partial void OnOrderItemsIDChanged();
    partial void OnOrderIDChanging(System.Nullable<int> value);
    partial void OnOrderIDChanged();
    partial void OnProductIDChanging(System.Nullable<int> value);
    partial void OnProductIDChanged();
    partial void OnQuantityChanging(System.Nullable<int> value);
    partial void OnQuantityChanged();
    #endregion
	
	public CS_OrderItem()
	{
		this._CS_Order = default(EntityRef<CS_Order>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderItemsID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int OrderItemsID
	{
		get
		{
			return this._OrderItemsID;
		}
		set
		{
			if ((this._OrderItemsID != value))
			{
				this.OnOrderItemsIDChanging(value);
				this.SendPropertyChanging();
				this._OrderItemsID = value;
				this.SendPropertyChanged("OrderItemsID");
				this.OnOrderItemsIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", DbType="Int")]
	public System.Nullable<int> OrderID
	{
		get
		{
			return this._OrderID;
		}
		set
		{
			if ((this._OrderID != value))
			{
				if (this._CS_Order.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnOrderIDChanging(value);
				this.SendPropertyChanging();
				this._OrderID = value;
				this.SendPropertyChanged("OrderID");
				this.OnOrderIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int")]
	public System.Nullable<int> ProductID
	{
		get
		{
			return this._ProductID;
		}
		set
		{
			if ((this._ProductID != value))
			{
				this.OnProductIDChanging(value);
				this.SendPropertyChanging();
				this._ProductID = value;
				this.SendPropertyChanged("ProductID");
				this.OnProductIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Quantity", DbType="Int")]
	public System.Nullable<int> Quantity
	{
		get
		{
			return this._Quantity;
		}
		set
		{
			if ((this._Quantity != value))
			{
				this.OnQuantityChanging(value);
				this.SendPropertyChanging();
				this._Quantity = value;
				this.SendPropertyChanged("Quantity");
				this.OnQuantityChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="CS_Order_CS_OrderItem", Storage="_CS_Order", ThisKey="OrderID", OtherKey="OrderID", IsForeignKey=true)]
	public CS_Order CS_Order
	{
		get
		{
			return this._CS_Order.Entity;
		}
		set
		{
			CS_Order previousValue = this._CS_Order.Entity;
			if (((previousValue != value) 
						|| (this._CS_Order.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._CS_Order.Entity = null;
					previousValue.CS_OrderItems.Remove(this);
				}
				this._CS_Order.Entity = value;
				if ((value != null))
				{
					value.CS_OrderItems.Add(this);
					this._OrderID = value.OrderID;
				}
				else
				{
					this._OrderID = default(Nullable<int>);
				}
				this.SendPropertyChanged("CS_Order");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591