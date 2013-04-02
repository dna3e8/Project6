<%@ Page Title="Product Store" Language="C#" MasterPageFile="~/2colMaster.master"
    AutoEventWireup="true" CodeFile="ProductStore.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContent" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Please select a product:"></asp:Label>
    <asp:DropDownList ID="ddlProducts" runat="server" Width="150px" DataSourceID="SqlDataSource1"
        DataTextField="PName" DataValueField="ProductID" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INFO3420_01Order %>"
        
        SelectCommand="SELECT [ProductID], [PName], [Price], [imageURL], [description] FROM [CS.Product] ORDER BY [PName]">
    </asp:SqlDataSource>
    <br />
    <br />
    <table>
        <tr>
            <td style="width: 250px; height: 22px">
                <asp:Label ID="lblName" runat="server" Font-Bold="False" Font-Size="Larger">
                </asp:Label>
            </td>
            <td rowspan="4" style="width: 20px">
            </td>
            <td rowspan="4" valign="top">
                <asp:Image ID="imgProduct" runat="server" Height="200" />
            </td>
        </tr>
        <tr>
            <td style="width: 250px">
                <asp:Label ID="lblShortDescription" runat="server">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 250px">
                <asp:Label ID="lblLongDescription" runat="server">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 250px; height: 53px;">
                <asp:Label ID="lblUnitPrice" runat="server" Font-Bold="True" Font-Size="Larger">
                </asp:Label>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="each">
                </asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Quantity:" Width="80px" BorderWidth="0px"></asp:Label>
    <asp:TextBox ID="txtQuantity" runat="server" Width="80px">
    </asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity"
        Display="Dynamic" ErrorMessage="Quantity is a required field.">
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity"
        Display="Dynamic" ErrorMessage="Quantity must range from 1 to 500." MaximumValue="500"
        MinimumValue="1" Type="Integer"></asp:RangeValidator><br />
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />&nbsp;
    <asp:Button ID="btnCart" runat="server" CausesValidation="False" PostBackUrl="~/ShoppingCart.aspx"
        Text="Go to Cart" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" runat="Server">
</asp:Content>
