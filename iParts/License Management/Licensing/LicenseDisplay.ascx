<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LicenseDisplay.ascx.cs" Inherits="Asi.Web.iParts.LicenseManagement.Licensing.LicenseDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:StyledLabel runat="server" ID="CustomerName" RenderPanelField="True" DisplayCaption="true" Caption="Customer Name" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="EffectiveDate" RenderPanelField="True" DisplayCaption="true" Caption="Effective Date" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="ExpirationDate" RenderPanelField="True" DisplayCaption="true" Caption="Expiration Date" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="SerialNumber" RenderPanelField="True" DisplayCaption="true" Caption="Serial Number" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="LicensedUsers" RenderPanelField="True" DisplayCaption="true" Caption="Licensed Users" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="MaximumRecords" RenderPanelField="True" DisplayCaption="true" Caption="Maximum Records" ></asiweb:StyledLabel>
<asiweb:StyledLabel runat="server" ID="TemporaryLicenseDescription" RenderPanelField="True" DisplayCaption="true" Caption="Temporary License Description" ></asiweb:StyledLabel>

<!-- TODO: Add a Lister2 pointing to a query to return a list of LicenseMaster values -->

<asiweb:Lister2 runat="server" ID="ReadOnlyLicensesGrid" DisableQueryEdit="True" OnNeedDataSource="ReadOnlyLicensesGrid_OnNeedDataSource"/>

<!-- Temporary Licenses data grid -->

        <asiweb:PanelTemplateControl ID ="GridPanel" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle='<%# ResourceManager.GetPhrase("TemporaryLicenses", "Temporary Licenses")%>' BorderWidth="0" Visible="True">
            <asiweb:BusinessDataGrid2 ID="TemporaryLicensesGrid" runat="server" Visible="true" EnableViewstate="true" AutoPostBack="true" AllowPaging="true" PageSize="9999"
                OnItemDeleted="TemporaryLicensesGrid_OnItemDeleted"
                OnItemDataBound="TemporaryLicensesGrid_OnItemDataBound"
                OnNeedDataSource="TemporaryLicensesGrid_NeedDataSource">
                <ClientSettings AllowKeyboardNavigation="True"/>
                <MasterTableView DataKeyNames="LicenseOrganizationVersionKey" AutoGenerateColumns="false" CommandItemDisplay="Top" NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoSetLicneses", "There are no temporary licenses.") %>'>
                    <CommandItemStyle HorizontalAlign="right" />
                    <CommandItemTemplate>
                        <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="AddComponent" CausesValidation="false" Text='<%# ResourceManager.GetPhrase("AddTemporaryLicense", "Add temporary license")%>'/>
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridTemplateColumn 
                            HeaderText="Effective Date"
                            UniqueName="EffectiveDate">
                            <ItemTemplate>
                                    <asp:LinkButton ID="TemplateLink" runat="server" Text="" OnClick="TemplateLink_OnClick" CausesValidation="false"/>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn 
                            HeaderText="Description"
                            UniqueName="Description"
                            />
                        <telerik:GridBoundColumn 
                            HeaderText="Created"
                            UniqueName="Created"
                            />
                        <telerik:GridBoundColumn 
                            HeaderText="Updated"
                            UniqueName="Updated"
                            />  
                        <!-- TODO: Change to GridButtonColumn and define confirmText using GetTranslatedPhrase in the ItemDataBound Method.
                             <telerik:GridButtonColumn ConfirmDialogType="RadWindow" UniqueName="Remove" ButtonType="LinkButton">-->                                        
                        <telerik:GridTemplateColumn UniqueName="Remove">
                            <ItemTemplate>
                                <asp:LinkButton ID="RemoveLink" runat="server" Text="remove" OnClick="RemoveLink_OnClick" CausesValidation="false"/>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </asiweb:BusinessDataGrid2>
        </asiweb:PanelTemplateControl>
        <asiweb:StyledLabel runat="server" ID="GridErrorMessage0" Visible="false" CssClass="Error"></asiweb:StyledLabel>
