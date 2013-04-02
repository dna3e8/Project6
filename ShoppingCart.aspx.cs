using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Default2 : System.Web.UI.Page
{

    private SortedList cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.GetCart();
        if (!IsPostBack)
            this.DisplayCart();

    }

    private void GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new SortedList());
        cart = (SortedList)Session["Cart"];
    }

    private void DisplayCart()
    {
        lstCart.Items.Clear();
        CartItem item;
        foreach (DictionaryEntry entry in cart)
        {
            item = (CartItem)entry.Value;
            lstCart.Items.Add(item.Display());
        }
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\MyAccount\\CheckOut.aspx");
    }



    protected void RemoveBTN_Click(object sender, EventArgs e)
    {

        if (lstCart.SelectedIndex > -1)
        {
            cart.RemoveAt(lstCart.SelectedIndex);
            this.DisplayCart();
        }
    }

//Empty the Shopping Cart

    protected void btn_Empty_Click(object sender, EventArgs e)
    {
        cart.Clear();
        lstCart.Items.Clear();
  
    }
}