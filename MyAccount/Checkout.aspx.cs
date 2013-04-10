using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;

public partial class MyAccount_Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SortedList cart;
        cart = (SortedList) Session["Cart"];
        if (Session["Cart"] == null)
        { 
            Response.Redirect("~\\ProductStore.aspx"); 
        }
        else
        {
            if (cart.Count < 1)
                Response.Redirect("~\\ProductStore.aspx");
        }
        MembershipUser user = Membership.GetUser();
        string myUser = user.UserName;

        UsernameLBL.Text = myUser;
    }
    protected void CheckOutWZ_CancelButtonClick(object sender, EventArgs e)
    {
        CheckOutWZ.ActiveStepIndex = 0;
    }
    protected void FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        int BillingAddressID = -1;
        int ShippingAddressID = -1;
        string ShipMethod = "";
        SortedList cart;
        CartItem cartitem;
        decimal ordertotal = 0;
        DateTime timestamp = DateTime.Now;

        if (Session["Cart"] == null)
        {
            Response.Redirect("~\\ProductStore.aspx");
        }
        cart = (SortedList)Session["Cart"];

        if (BillingLV.SelectedIndex > -1)
        {
            BillingAddressID = Convert.ToInt32(BillingLV.SelectedDataKey.Value);
        }
        if (ShippingLV.SelectedIndex > -1)
        {
            ShippingAddressID = Convert.ToInt32(ShippingLV.SelectedDataKey.Value);
        }

        if (ShipMethodDDL.SelectedIndex > 0)
        {
            ShipMethod = ShipMethodDDL.SelectedValue;
        }

        CheckOutDataContext checkout = new CheckOutDataContext();
        CS_Order myorder = new CS_Order();

        myorder.CustomerUsername = UsernameLBL.Text;
        myorder.DateTime = timestamp;
        myorder.BillingAddressID = BillingAddressID;
        myorder.ShippingAddressID = ShippingAddressID;
        myorder.ShippingType = ShipMethod;
        myorder.Status = "Verified";

        try
        {
            checkout.CS_Orders.InsertOnSubmit(myorder); // inserts into LINQ object
            checkout.SubmitChanges(); // pushed insert to database 

        }
        catch (Exception ex)
        {
           
            ErrorMessageLBL.Text = "An exception occured adding the order." + ex.Message;
            return;
        }

        try
        {
            foreach (DictionaryEntry entry in cart)
            {
                //Create a new OrderItem LINQ entity object.
                CS_OrderItem orderitem = new CS_OrderItem();
                // Get out the next cartitem.
                cartitem = (CartItem)entry.Value;
                //Using the orderitem and dot notation assign values to each data item from the cart item.
                orderitem.OrderID = myorder.OrderID; //(autoincremented OrderID foreign key)
                orderitem.ProductID = cartitem.Product.ProductID;
                orderitem.Quantity = cartitem.Quantity;
                // Calculate the ordertotal inside the loop as you go.
                ordertotal += cartitem.Quantity * cartitem.Product.Price;
                checkout.CS_OrderItems.InsertOnSubmit(orderitem); // inserts into LINQ obj
                checkout.SubmitChanges(); // pushes insert into database
            } // end foreach
        }// end try
        catch (Exception ex)
        {
            ErrorMessageLBL.Text = "An exception occured adding an orderitem." + ex.Message;
            return;
        }

        cart.Clear();
        FinalMessageLBL.Text = "Thank you: " + UsernameLBL.Text + " for your order of " + ordertotal.ToString("c");
        Session.Add("Cart", new SortedList());
        //Response.Redirect("~/Default.aspx");
    }
}