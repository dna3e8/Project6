<%@ Page Title="" Language="C#" MasterPageFile="~/1colSSL.master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="MyAccount_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContent" runat="Server">
    <h1>
        Cart Checkout</h1>

    <asp:Label ID="UsernameLBL" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Wizard ID="CheckOutWZ" runat="server" DisplayCancelButton="True" 
        OnCancelButtonClick="CheckOutWZ_CancelButtonClick" ActiveStepIndex="0">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1: Billing Address">
                <h2>
                    Select Billing Address</h2>
                <asp:ListView ID="AddressLV" runat="server" DataSourceID="AddressSDS" 
                    DataKeyNames="AddressID" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">
                            
                            FName:
                            <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            <br />
                            LName:
                            <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            <br />
                            Address:
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            Zipcode:
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                            
                            FName:
                            <asp:TextBox ID="FNameTextBox" runat="server" Text='<%# Bind("FName") %>' />
                            <br />
                            LName:
                            <asp:TextBox ID="LNameTextBox" runat="server" Text='<%# Bind("LName") %>' />
                            <br />
                            Address:
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            Zipcode:
                            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
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
                            
                            FName:
                            <asp:TextBox ID="FNameTextBox" runat="server" Text='<%# Bind("FName") %>' />
                            <br />
                            LName:
                            <asp:TextBox ID="LNameTextBox" runat="server" Text='<%# Bind("LName") %>' />
                            <br />
                            Address:
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            Zipcode:
                            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
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
                            
                            FName:
                            <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            <br />
                            LName:
                            <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            <br />
                            Address:
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            Zipcode:
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                            AddressID:
                            <asp:Label ID="AddressIDLabel" runat="server" Text='<%# Eval("AddressID") %>' />
                            <br />
                            Username:
                            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                            <br />
                            FName:
                            <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
                            <br />
                            LName:
                            <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
                            <br />
                            Address:
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            <br />
                            City:
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            State:
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            Zipcode:
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            <br />
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" 
                                Checked='<%# Eval("Active") %>' Enabled="false" Text="Active" />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2: Shipping Address">
                <h2>
                    Shipping Billing Address</h2>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Step 3:  Shipping Method">
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete">
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:SqlDataSource ID="AddressSDS" runat="server" ConnectionString="<%$ ConnectionStrings:INFO3420_01AddressSDS %>"
        DeleteCommand="DELETE FROM [Address] WHERE [AddressID] = @AddressID" InsertCommand="INSERT INTO [Address] ([Username], [FName], [LName], [Address], [City], [State], [Zipcode], [Active]) VALUES (@Username, @FName, @LName, @Address, @City, @State, @Zipcode, @Active)"
        SelectCommand="SELECT * FROM [Address] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [Address] SET [Username] = @Username, [FName] = @FName, [LName] = @LName, [Address] = @Address, [City] = @City, [State] = @State, [Zipcode] = @Zipcode, [Active] = @Active WHERE [AddressID] = @AddressID">
        <DeleteParameters>
            <asp:Parameter Name="AddressID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="UsernameLBL" Name="Username" PropertyName="Text"
                Type="String" />
            <asp:Parameter Name="FName" Type="String" />
            <asp:Parameter Name="LName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UsernameLBL" Name="Username" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="FName" Type="String" />
            <asp:Parameter Name="LName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="AddressID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
