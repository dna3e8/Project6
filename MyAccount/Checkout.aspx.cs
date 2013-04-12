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

        //set up the Paypal URL Encoded strings for use in query string
        // this is the email of the class Paypal business, 
        // do not create a new business account, use this one
        string strBusiness = Server.UrlEncode("UVU3420@hotmail.com");

        // the strAppPath uses your VM number and the name of the application folder
        //  in Project 6 this will be the Project6 folder, not PayPal
        string strAppPath = "http://info3420-01.ad.uvu.edu/Project6/";

        // Provide the name of your Confirmation form
        string strCompleteURL = Server.UrlEncode(strAppPath + "Confirmation.aspx?");

        //  Provide the name of your Cancel form
        string strCancelURL = Server.UrlEncode(strAppPath + "Cancel.aspx?order=" + myorder.OrderID + "&status=cancelled");


        //set up item variables for query string to PayPal and intialize to 0
        int intCount = 0;

        //set up static part of PayPal query string variable
        string strPayPal = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&upload=1&business=" +
            strBusiness + "&return=" + strCompleteURL + "&cancel_return=" + strCancelURL;

        try
        {
            foreach (DictionaryEntry entry in cart)
            {

                intCount++;
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

                /**************************************************************************/
                // Place this code snippet inside but at the bottom of your foreach loop
                // that creates OrderItems and sends them to the database
                //this code adds the foreach loop item to query string for PayPal
                strPayPal += "&item_number_" + intCount + "=" + intCount;
                strPayPal += "&item_name_" + intCount + "=" + cartitem.Product.PName;
                strPayPal += "&quantity_" + intCount + "=" + cartitem.Quantity;
                strPayPal += "&amount_" + intCount + "=" + Decimal.Round(cartitem.Product.Price, 2);

                /*************************************************************/


            } // end foreach
        }// end try
        catch (Exception ex)
        {
            ErrorMessageLBL.Text = "An exception occured adding an orderitem." + ex.Message;
            return;
        }

        // reset the wizard to begin in Step 1.
        e.Cancel = true;
        CheckOutWZ.ActiveStepIndex = 0;
        BillingLV.SelectedIndex = -1;
        ShippingLV.SelectedIndex = -1;
        ShipMethodDDL.SelectedIndex = 0;

        cart.Clear();
        FinalMessageLBL.Text = "Thank you: " + UsernameLBL.Text + " for your order of " + ordertotal.ToString("c");
        Session.Add("Cart", new SortedList());
        //send this query string to PayPal
        Response.Redirect(strPayPal);
    }
}