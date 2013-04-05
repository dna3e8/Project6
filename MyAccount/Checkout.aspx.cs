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
}