<%@ Page Title="" Language="C#" MasterPageFile="~/2colSSL.master" AutoEventWireup="true" CodeFile="Cancel.aspx.cs" Inherits="Cancel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContent" Runat="Server">
<h1>Order Canceled</h1>
<h3>Ther order was canceled. You will not be charged anything.</h3>

<asp:Button ID="homeBTN" runat="server" Text="Home" 
        PostBackUrl="~/Default.aspx" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContent" Runat="Server">
</asp:Content>

