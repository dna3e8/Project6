<%@ Page Title="" Language="C#" MasterPageFile="~/1colSSL.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="MyAccount_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContent" runat="Server">
    <h1>
        Cart Checkout</h1>

    <asp:Label ID="UsernameLBL" runat="server" Text="" Visible="true"></asp:Label>
    <asp:Wizard ID="CheckOutWZ" runat="server" DisplayCancelButton="True" 
        OnCancelButtonClick="CheckOutWZ_CancelButtonClick" ActiveStepIndex="0"
         onfinishbuttonclick="FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1: Billing Address">
                <h2>
                    Select or add the Billing Address</h2>
                    <br />
                <asp:ListView ID="BillingLV" runat="server" DataKeyNames="A_id" 
                    DataSourceID="AddressSDS" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">
                            <asp:Button ID="SelectBTN" runat="server" Text="Select" CommandName="Select" />
                            <br />
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" />
                            <br />
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                           
                            <br />
                            Lname:
                            <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                            <br />
                            Fname:
                            <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:TextBox ID="StreetAddrTextBox" runat="server" 
                                Text='<%# Bind("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Bind("Active") %>' Text="Active" />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr>
                                <td>
                                    No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">
                            
                            Lname:
                            <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                            <br />
                            Fname:
                            <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:TextBox ID="StreetAddrTextBox" runat="server" 
                                Text='<%# Bind("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Bind("Active") %>' Text="Active" />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                           <asp:Button ID="SelectBTN" runat="server" Text="Select" CommandName="Select" />
                           <br />
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="itemPlaceholderContainer" runat="server">
                                <td ID="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" 
                            style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                           
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2: Shipping Address">
                <h2>
                    Select or add the Shipping Billing Address</h2>

                    
                <asp:ListView ID="ShippingLV" runat="server" DataKeyNames="A_id" 
                    DataSourceID="AddressSDS" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <td id="Td1" runat="server" style="background-color:#FFF8DC;">
                            <asp:Button ID="SelectBTN" runat="server" Text="Select" CommandName="Select" />
                            <br />
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" />
                            <br />
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td id="Td2" runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                           
                            <br />
                            Lname:
                            <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                            <br />
                            Fname:
                            <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:TextBox ID="StreetAddrTextBox" runat="server" 
                                Text='<%# Bind("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Bind("Active") %>' Text="Active" />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr>
                                <td>
                                    No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <td id="Td3" runat="server" style="">
                            
                            Lname:
                            <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                            <br />
                            Fname:
                            <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:TextBox ID="StreetAddrTextBox" runat="server" 
                                Text='<%# Bind("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Bind("Active") %>' Text="Active" />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td id="Td4" runat="server" style="background-color:#DCDCDC;color: #000000;">
                           <asp:Button ID="SelectBTN" runat="server" Text="Select" CommandName="Select" />
                           <br />
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="itemPlaceholderContainer" runat="server">
                                <td ID="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td5" runat="server" 
                            style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                           
                            Lname:
                            <asp:Label ID="LnameLabel" runat="server" Text='<%# Eval("Lname") %>' />
                            <br />
                            Fname:
                            <asp:Label ID="FnameLabel" runat="server" Text='<%# Eval("Fname") %>' />
                            <br />
                            StreetAddr:
                            <asp:Label ID="StreetAddrLabel" runat="server" 
                                Text='<%# Eval("StreetAddr") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                    


            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Step 3:  Shipping Method">
            <h2>Select a Shipping Method</h2>

                <asp:DropDownList ID="ShipMethodDDL" runat="server">
                    <asp:ListItem>USPS</asp:ListItem>
                    <asp:ListItem>FedEx</asp:ListItem>
                    <asp:ListItem>UPS</asp:ListItem>
                </asp:DropDownList>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete">
            <h2>Thanks for shopping: </h2>
                <asp:Label ID="ErrorMessageLBL" runat="server" Text=""></asp:Label>
                <asp:Label ID="FinalMessageLBL" runat="server" Text=""></asp:Label>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:SqlDataSource ID="AddressSDS" runat="server" ConnectionString="<%$ ConnectionStrings:INFO3420_01AddressSDS %>"
        DeleteCommand="DELETE FROM [CS.Address] WHERE [A_id] = @A_id" InsertCommand="INSERT INTO [CS.Address] ([CustomerUsername], [Lname], [Fname], [StreetAddr], [State], [City], [Active]) VALUES (@CustomerUsername, @Lname, @Fname, @StreetAddr, @State, @City, @Active)"
        
        SelectCommand="SELECT * FROM [CS.Address] WHERE ([CustomerUsername] = @CustomerUsername)" 
        UpdateCommand="UPDATE [CS.Address] SET [CustomerUsername] = @CustomerUsername, [Lname] = @Lname, [Fname] = @Fname, [StreetAddr] = @StreetAddr, [State] = @State, [City] = @City, [Active] = @Active WHERE [A_id] = @A_id">
        <DeleteParameters>
            <asp:Parameter Name="A_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="UsernameLBL" Name="CustomerUsername" 
                PropertyName="Text" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="StreetAddr" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UsernameLBL" Name="CustomerUsername" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerUsername" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="StreetAddr" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="A_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
