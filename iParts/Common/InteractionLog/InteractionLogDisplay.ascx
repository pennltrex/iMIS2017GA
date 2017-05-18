<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InteractionLogDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.InteractionLog.InteractionLogDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <asiweb:BusinessDataGrid2 ID="CommunicationGrid" runat="server" 
        AllowSorting="true" AllowPaging="true" PageSize="10"
        OnNeedDataSource="CommunicationGridNeedDataSource" OnItemDataBound="CommunicationGridItemDataBound">
        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="CommunicationLogRecipientId"
            NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoRecords", "There are no records.") %>' >          
            <Columns>
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="UpdateInformation.CreatedOn"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"
                    HeaderText="Date"
                    UniqueName="CreatedOn" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="MessageType"
                    DataType="System.String"
                    HeaderText="Type"
                    UniqueName="MessageType" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="CommunicationLog.Subject"
                    DataType="System.String"
                    HeaderText="Subject"
                    UniqueName="Subject" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="Party.Name"
                    DataType="System.String"
                    HeaderText="Owner"
                    UniqueName="CreatedByUser" />
            </Columns>
            <NestedViewTemplate>
                <asp:Panel ID="Panel1" runat="server" CssClass="ChildGridWrapper">
                    <asiweb:BusinessDataGrid2 ID="CommunicationLogEventLinesGrid" runat="server" AllowSorting="false" 
                        AllowPaging="true" PageSize="10" 
                        OnItemDataBound="NestedGridItemDataBound" >
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="CommunicationLogEventId" ShowHeader="true" ShowFooter="false">
                            <Columns>
                                <telerik:GridBoundColumn
                                    AllowSorting="false"
                                    DataField="EventDateTime"
                                    DataType="System.DateTime"
                                    DataFormatString="{0:d}"
                                    HeaderText="Date"
                                    UniqueName="EventDateTime" />
                                <telerik:GridBoundColumn
                                    AllowSorting="false"
                                    DataField="CommunicationLogEventTypeCode"
                                    DataType="System.String"
                                    HeaderText="Type"
                                    UniqueName="CommunicationLogEventTypeCode" />                              
                                <telerik:GridBoundColumn
                                    AllowSorting="false"
                                    DataField="EventReason"
                                    DataType="System.String"
                                    HeaderText="Details"
                                    UniqueName="EventReason" />
                            </Columns>
                        </MasterTableView>
                    </asiweb:BusinessDataGrid2>
                </asp:Panel>
            </NestedViewTemplate>
        </MasterTableView>
        <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
            <Selecting AllowRowSelect="false" />                                 
        </ClientSettings>
    </asiweb:BusinessDataGrid2>
</telerik:RadAjaxPanel>        


