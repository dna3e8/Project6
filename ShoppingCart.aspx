<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/2colMaster.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContent" Runat="Server">

   Your shopping cart:<br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 300px">
            <tr>
                <td style="width: 158px; height: 153px">
                    <asp:ListBox ID="lstCart" runat="server" Height="135px" Width="267px"></asp:ListBox>
                </td>
                <td>
                    <asp:Button ID="RemoveBTN" runat="server" Text="Remove Item" 
                        onclick="RemoveBTN_Click" />

                <br />
                <asp:Button ID="ClearBTN" runat="server" Text="Clear Cart" onclick="btn_Empty_Click"/>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" runat="server" 
        PostBackUrl="~/ProductStore.aspx" Text="Continue Shopping" />&nbsp;
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" /><br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" Runat="Server">
</asp:Content>

