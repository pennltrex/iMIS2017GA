<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PotentialDuplicateListDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.PotentialDuplicateListDisplay.PotentialDuplicateListDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asiTask" TagName="SystemTaskScheduler" Src="~/iParts/Common/Tasks/SystemTaskScheduler.ascx" %>

<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="DuplicateManagerPages" OnTabClick="RadTabStrip1_OnTabClick"
    SelectedIndex="0" Visible="true" AutoPostBack="False" Translate="yes">
    <Tabs>
        <telerik:RadTab Text='<%# ResourceManager.GetPhrase("ManageDuplicates", "Manage duplicates") %>' Value="manageDuplicates" />
        <telerik:RadTab Text='<%# ResourceManager.GetWord("Settings") %>' Value="settings" Enabled="true" />
    </Tabs>
</telerik:RadTabStrip>

<telerik:RadMultiPage ID="DuplicateManagerPages" runat="server" SelectedIndex="0">
    <telerik:RadPageView ID="RadPageViewDuplicateManager" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
        <asp:Panel ID="ContentPanel" runat="server" Visible="true" Translate="Yes">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Panel runat="server" CssClass="PanelBody" DefaultButton="FilterButton">
                        <div class="PanelField">
                           <asp:Label runat="server" Text="Name contains"  AssociatedControlID="NameContainsTextbox"  />
                           <asiweb:BusinessTextBox ID="NameContainsTextbox" runat="server" Caption="Name contains" DisplayCaption="True" ToolTip="contact name contains"/>
                        </div>
                        <div class="PanelField">
                           <asp:Label runat="server" Text="ID equals"  AssociatedControlID="IDEqualsTextbox"  />
                           <asiweb:BusinessTextBox runat="server" ID="IDEqualsTextbox" ToolTip="Id"/>
                        </div>
                      <div class="PanelField">
                           <asp:Label runat="server" Text="Date found between" CssClass="Label"  />
                           <asiweb:BusinessCalendar2 ID="CalendarFromDate" runat="server" ToolTip="from date"/>
                           <asiweb:DateTimeValidator runat="server" ControlToValidate="CalendarFromDate"/>
                          and
                           <asiweb:BusinessCalendar2 ID="CalendarToDate" runat="server" ToolTip="to date" Caption="and" DisplayCaption="True" PositionCaption="Left"/>
                           <asiweb:DateTimeValidator runat="server" ControlToValidate="CalendarToDate"/><asp:CustomValidator ID="CalendarValidator" runat="server" Enabled="False" EnableClientScript="False" ErrorMessage="please provide a valid date range"></asp:CustomValidator>
                      </div>
                      <div class="PanelField">
                            <asiweb:StyledButton runat="server" ID="FilterButton" Text="Filter" OnClick="FilterButtonOnClick" CssClass="PrimaryButton"/>
                      </div>
                   </asp:Panel>
                   <asiweb:PanelTemplateControl2 ID="PanelTemplateControlControl" Collapsible="False" runat="server">
                       <asp:Panel runat="server" ID="ButtonPanel">
                            <asp:LinkButton runat="server" ID="ExpandAllButton" Text="Expand All" OnClick="ExpandAllButton_OnClick" />
                            <asp:LinkButton runat="server" ID="CollapseAllButton" Text="Collapse All" OnClick="CollapseAllButton_OnClick" CssClass="AddPadding"/>
                            <span class="FloatRight">
                                <asp:ImageButton runat="server" ImageUrl="~/AsiCommon/Images/icon_word_shortcut.gif" ToolTip="Export to Word" ID="ExportWordButton" OnClick="ExportWordButton_OnClick" AlternateText="Export to Word" />    
                                <asp:ImageButton runat="server" ImageUrl="~/AsiCommon/Images/icon_excel_shortcut.gif" ToolTip="Export to Excel" ID="ExportExcelButton" OnClick="ExportButton_OnClick" AlternateText="Export to Word"/>   
                                <asp:ImageButton runat="server" ImageUrl="~/AsiCommon/Images/icon_pdf_shortcut.gif" ToolTip="Export to Pdf" ID="ExportPdfButton" OnClick="ExportPdfButton_OnClick" AlternateText="Export to Pdf"/>    
                                <asp:ImageButton runat="server" ImageUrl="~/AsiCommon/Images/icon_csv_shortcut.gif" ToolTip="Export to Csv" ID="ExportCSVButton" OnClick="ExportCsvButton_OnClick" AlternateText="Export to Csv"/>    
                           </span>
                       </asp:Panel>
                        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" SkinID="AjaxLoadingPanel" /> 
                        <telerik:RadAjaxPanel runat="server" ID="GridContentPanel" LoadingPanelID="LoadingPanel">
                        <asiweb:BusinessDataGrid2 ID="DuplicatesGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="25" OnItemCreated="DuplicatesGrid_OnItemCreated"
                            OnNeedDataSource="DuplicatesGrid_NeedDataSource" OnItemDataBound="DuplicatesGrid_ItemDataBound" OnPageIndexChanged="DuplicatesGrid_OnPageIndexChanged"
                            OnItemCommand="DuplicatesGrid_OnItemCommand"
                            OnPageSizeChanged="DuplicatesGrid_OnPageSizeChanged" OnSortCommand="DuplicatesGrid_OnSortCommand" CssClass="FullWidth ScrollHorizontal">
                            <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="LeftPartyId,RightPartyId"
                                NoMasterRecordsText='<%# ResourceManager.GetPhrase("ThereAreNoDuplicateContacts", "There are no possible duplicate contacts at this time.") %>'>
                                <Columns>
                                    <telerik:GridHyperLinkColumn
                                        DataTextField="LeftPartyDisplayedNameAndId"
                                        DataType="System.String"
                                        HeaderText="Contact 1"
                                        UniqueName="Contact1"
                                        AllowSorting="False"
                                        DataNavigateUrlFields="PartyUrlParameterName,LeftPartyId"
                                        DataNavigateUrlFormatString="javascript:ShowDialog_NoReturnValue('~/Party.aspx?{0}={1}',null,'90%','90%','Account detail',null,'E',null,null,null,true,null,null);"  
                                            />
                                    <telerik:GridHyperLinkColumn
                                        DataTextField="RightPartyDisplayedNameAndId"
                                        DataType="System.String"
                                        HeaderText="Contact 2"
                                        UniqueName="Contact2"
                                        AllowSorting="False"
                                        DataNavigateUrlFields="PartyUrlParameterName,RightPartyId"
                                        DataNavigateUrlFormatString="javascript:ShowDialog_NoReturnValue('~/Party.aspx?{0}={1}',null,'90%','90%','Account detail',null,'E',null,null,null,true,null,null);"  
                                        />
                                    <telerik:GridBoundColumn
                                        DataField="MatchDate"
                                        DataType="System.DateTime"
                                        DataFormatString="{0:d}"
                                        HeaderText="Date Found"
                                        UniqueName="DateFound"
                                        />
                                    <telerik:GridBoundColumn
                                        DataField="RuleCode"
                                        DataType="System.String"
                                        HeaderText="Formula"
                                        UniqueName="Formula"
                                        />
                                    <telerik:GridTemplateColumn UniqueName="ResolveButtonColumn" HeaderText="Resolve" ItemStyle-Width="75px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ResolveButton" Text="Resolve" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="NotDuplicatesButtonColumn" HeaderText="Not Duplicates" ItemStyle-Width="130px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="NotDuplicatesButton" Text="Not Duplicates" CommandName="NotDuplicates" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <NestedViewTemplate>
                                    <asp:Panel runat="server" CssClass="ChildGridWrapper">
                                        <asiweb:BusinessDataGrid2 ID="PartiesNestGrid" runat="server" AllowSorting="False" AllowPaging="true" PageSize="10">
                                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="PartyId" ShowHeader="true">
                                                <Columns>
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="Name"
                                                        DataType="System.String"
                                                        HeaderText="Name"
                                                        UniqueName="Name" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="PrimaryEmail"
                                                        DataType="System.String"
                                                        HeaderText="Primary Email"
                                                        UniqueName="PrimaryEmail" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="PrimaryOrganization"
                                                        DataType="System.String"
                                                        HeaderText="Primary Organization"
                                                        UniqueName="PrimaryOrganization" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="Status"
                                                        DataType="System.String"
                                                        HeaderText="Status"
                                                        UniqueName="Status" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="DateCreated"
                                                        DataType="System.String"
                                                        HeaderText="Date Created"
                                                        UniqueName="DateCreated"
                                                        DataFormatString="{0:d}" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="LastUpdated"
                                                        DataType="System.String"
                                                        HeaderText="Last Updated"
                                                        UniqueName="LastUpdated"
                                                        DataFormatString="{0:d}" />
                                                    <telerik:GridBoundColumn
                                                        AllowSorting="false"
                                                        DataField="UserName"
                                                        DataType="System.String"
                                                        HeaderText="Username"
                                                        UniqueName="Username" />
                                                </Columns>
                                            </MasterTableView>
                                        </asiweb:BusinessDataGrid2>
                                    </asp:Panel>
                                </NestedViewTemplate>
                            </MasterTableView>
                        </asiweb:BusinessDataGrid2>
                    </telerik:RadAjaxPanel>
                </asiweb:PanelTemplateControl2>
            </ContentTemplate>  
            <Triggers>
                    <asp:PostBackTrigger ControlID="ExportWordButton" />
                    <asp:PostBackTrigger ControlID="ExportPdfButton" />
                    <asp:PostBackTrigger ControlID="ExportExcelButton" />
                    <asp:PostBackTrigger ControlID="ExportCsvButton" />
            </Triggers>  
            </asp:UpdatePanel>
    </asp:Panel>
    </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageViewSettings" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
        <asiTask:SystemTaskScheduler runat="server" ID="SystemTaskScheduler" RunTaskButtonText="Find Duplicates Now" />
    </telerik:RadPageView>
</telerik:RadMultiPage>

<script type="text/javascript">

    // Create the event handlers for PageRequestManager
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_initializeRequest(PageRequestManager_initializeRequest);
    prm.add_beginRequest(PageRequestManager_beginRequest);
    prm.add_endRequest(PageRequestManager_endRequest);

    var uiId = '';
    function PageRequestManager_initializeRequest(sender, args) {
        if (sender.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function PageRequestManager_beginRequest(sender, args) {
        var postbackElem = args.get_postBackElement();
        uiId = postbackElem.id;
        postbackElem.disabled = true;
    }
    function PageRequestManager_endRequest(sender, args) {
        var postbackElementId = $get(uiId);
        if (postbackElementId != null)
            postbackElementId.disabled = false;
        if (args.get_error() != undefined) {
            var error = args.get_error().name;
            if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                args.set_errorHandled(true);

            var postbackElementById = document.getElementById(uiId);
            if (postbackElementById != null)
                postbackElementById.focus();
        }
    }
    function Confirmation() {
        if (confirm('Are you sure these contacts are not duplicates? This operation cannot be undone.'))
            return true;
        else 
        return false;
    }
</script>