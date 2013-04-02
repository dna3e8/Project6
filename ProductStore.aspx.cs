using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class Default2 : System.Web.UI.Page
{
    private Product selectedProduct;
    // Add boolean variable for Query String here
    Boolean yesQueryString = false;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ddlProducts.DataBind();



        selectedProduct = this.GetSelectedProduct();

        // Add if statement to test for a Query String
        if (yesQueryString)
        {
            ddlProducts.DataBind();

            //make the dropdownlist show the featured product
            if (ddlProducts.Items.FindByValue(selectedProduct.ProductID.ToString()) != null)
                ddlProducts.Items.FindByValue(selectedProduct.ProductID.ToString()).Selected = true;
            //reload the form to get rid of the query string in the URL
            Form.Action = "Order.aspx";
        }




        lblName.Text = selectedProduct.PName;
        lblShortDescription.Text = selectedProduct.description;

        lblUnitPrice.Text = selectedProduct.Price.ToString("c");
        imgProduct.ImageUrl = selectedProduct.imageURL;
    }
    private Product GetSelectedProduct()
    {

        string productID = "";

        DataView productsTable = new DataView();


        // Add an if/else test for a Query string here   

        if (Request.QueryString["prod"] != null)
        {
            productID = Request.QueryString["prod"];
            productsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                 "ProductID = '" + productID + "'";
            yesQueryString = true;

        }
        else
        {

            //Move existing code into this else part
            //Place this code inside the else part of the if/else test
            productsTable = (DataView)
                    SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter =
                    "ProductID = '" + ddlProducts.SelectedValue + "'";

            // Then set the yesQueryString  to false
            yesQueryString = false;
        }



        // Set the YesQuerySting variable to  be false

        // end of if/else test


        DataRowView row = (DataRowView)productsTable[0];

        Product p = new Product();
        p.ProductID = (int)row["ProductID"]; 
        p.PName = row["PName"].ToString();
        p.description = row["description"].ToString();

        p.Price = (decimal)row["Price"];
        p.imageURL = row["imageURL"].ToString();
        return p;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            CartItem item = new CartItem();
            item.Product = selectedProduct;
            item.Quantity = Convert.ToInt32(txtQuantity.Text);
            this.AddToCart(item);
            Response.Redirect("ShoppingCart.aspx");
        }
    }

    private void AddToCart(CartItem item)
    {
        SortedList cart = this.GetCart();
        int productID = selectedProduct.ProductID;
        if (cart.ContainsKey(productID))
        {
            CartItem existingItem = (CartItem)cart[productID];
            existingItem.Quantity += item.Quantity;
        }
        else
            cart.Add(productID, item);
    }

    private SortedList GetCart()
    {
        if (Session["Cart"] == null)
            Session.Add("Cart", new SortedList());
        return (SortedList)Session["Cart"];
    }

}