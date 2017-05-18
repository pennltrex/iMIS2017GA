<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LicenseEdit.ascx.cs" Inherits="Asi.Web.iParts.LicenseManagement.Licensing.LicenseEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:BusinessTextBox runat="server" ID="CustomerName" RenderPanelField="True" DisplayCaption="true" Caption="Customer Name"/>
    <asiweb:AsiRequiredFieldValidator runat="server" ID="CustomerNameRequired" ControlToValidate="CustomerName"
                                    CssClass="Important" SetFocusOnError="true" Display="Dynamic"  />
<asiweb:BusinessCalendar2 runat="server" ID="EffectiveDate" RenderPanelField="True" DisplayCaption="true" Caption="Effective Date" />
    <asiweb:DateTimeValidator runat="server" ControlToValidate="EffectiveDate"  />   
    <asiweb:AsiRequiredFieldValidator runat="server" ID="DateValidator" ControlToValidate="EffectiveDaterad_Dp" Text="Required"></asiweb:AsiRequiredFieldValidator>
<asiweb:BusinessCalendar2 runat="server" ID="ExpirationDate" RenderPanelField="True" DisplayCaption="true" Caption="Expiration Date" />
<asiweb:DateTimeValidator runat="server" ControlToValidate="ExpirationDate"  /> 
<asiweb:BusinessTextBox runat="server" ID="SerialNumber" RenderPanelField="True" DisplayCaption="true" Caption="Serial Number" />
<asiweb:BusinessTextBox runat="server" ID="LicensedUsers" RenderPanelField="True" DisplayCaption="true" Caption="Licensed Users" />
<asiweb:BusinessTextBox runat="server" ID="MaximumRecords" RenderPanelField="True" DisplayCaption="true" Caption="Maximum Records" />
<asiweb:BusinessTextBox runat="server" ID="TemporaryLicenseDescription" RenderPanelField="True" DisplayCaption="true" Caption="Temporary License Description" />
    <asiweb:AsiRequiredFieldValidator runat="server" ID="TemporaryLicenseDescriptionRequired" ControlToValidate="TemporaryLicenseDescription"
                                    CssClass="Important" SetFocusOnError="true" Display="Dynamic"  />

<asiweb:BusinessDataGrid2 ID="EditLicensesGrid2" runat="server" 
        AllowSorting="true" AllowPaging="true" PageSize="20"
        OnNeedDataSource="LicenseGridNeedDataSource" OnItemDataBound="EditLicensesGrid2_OnItemDataBound">
        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true"
            DataKeyNames="LicenseKey" 
            NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoRecords", "There are no records.") %>' >
            <SortExpressions>
                <telerik:GridSortExpression FieldName="Name" SortOrder="Ascending" />
            </SortExpressions>          
            <Columns>
                <telerik:GridTemplateColumn HeaderText="Enabled" UniqueName="Active">
                    <ItemTemplate>      
                        <asp:CheckBox id="activeChkBox" runat="server"      
                         Enabled="True">    
                        </asp:CheckBox>   
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="LicenseName"
                    DataType="System.String"
                    HeaderText="License Name"
                    UniqueName="LicenseName" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="LicenseDescription"
                    DataType="System.String"
                    HeaderText="License Description"
                    UniqueName="LicenseDescription" />
            </Columns>        
        </MasterTableView>
        <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
            <Selecting AllowRowSelect="False" />                                 
        </ClientSettings>
    </asiweb:BusinessDataGrid2>