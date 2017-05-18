<%@ Page Language="C#" CodeBehind="GLExport.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.GLExport" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="True" MaintainScrollPositionOnPostback="true" Title="Export general ledger transactions" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
                   
    <asiweb:PanelTemplateControl2 ID="GLExportPanelTemplate" runat="server" Collapsible="False">
                
        <telerik:RadTabStrip AutoPostBack="False" ID="GLExportRadTabStrip" MultiPageID="GLExportPages" OnTabClick="GLExportRadTabStrip_OnTabClick" runat="server" SelectedIndex="0" Visible="true">
            <Tabs>
                <telerik:RadTab Value="newExport" />
                <telerik:RadTab Value="exportLog" Enabled="true" />
            </Tabs>
        </telerik:RadTabStrip>
    
        <telerik:RadMultiPage ID="GLExportPages" runat="server" SelectedIndex="0" CssClass="Section">
            <telerik:RadPageView ID="NewGLExportPage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay AddPadding">
                <asp:Panel ID="NewExportPanel" runat="server" Visible="true">
                    <div runat="server" id="ExportFileDiv"> 
                        <div class="PanelField Left">
                            <asiweb:StyledLabel runat="server" ID="BeginDateLabel" AssociatedControlID="BeginDate" CssClass="Required"/>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessCalendar2 runat="server" ID="BeginDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" ValidateRequestMode="Enabled" />
                                <asiweb:DateTimeValidator runat="server" ControlToValidate="BeginDate" Enabled="True"/>            
                            </div>   
                        </div>
                        <div class="PanelField Left Section">     
                            <asiweb:StyledLabel runat="server" ID="EndDateLabel" AssociatedControlID="EndDate" CssClass="Required"/>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessCalendar2 runat="server" ID="EndDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" ValidateRequestMode="Enabled"/>
                                <asiweb:DateTimeValidator runat="server" ControlToValidate="EndDate" Enabled="True"/>
                                <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
                                <asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>          
                            </div>
                        </div>                             
                        <asiweb:StyledButton CausesValidation="true" OnClientClick="if (!ValidateWithinSameMonth()) return false;" CssClass="PrimaryButton download" id="CreateExportButton" onclick="CreateExportButton_OnClicked" runat="server" />                                                               
                    </div>
                </asp:Panel>
            </telerik:RadPageView>
                
            <telerik:RadPageView ID="GLExportListPage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay AddPadding">
                <asp:Panel ID="ExportListPanel" runat="server">     
                    <asiweb:BusinessDataGrid2 ID="PastExportsGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="20" CssClass="FullWidth ScrollHorizontal"
                        OnNeedDataSource="PastExportsGrid_NeedDataSource" OnItemDataBound="PastExportsGrid_OnItemDataBound">
                        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" NoMasterRecordsText="No records" TableLayout="Fixed">
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="RunNumber" SortOrder="Descending" />
                            </SortExpressions>
                            <Columns>
                                <telerik:GridBoundColumn
                                    DataField="RunNumber"
                                    DataType="System.Int32"
                                    HeaderText="Run"
                                    UniqueName="RunNumber">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle Width="100px" CssClass="AlignCenter VAlignMiddle" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    DataField="BeginDate"
                                    DataType="System.DateTime"
                                    DataFormatString="{0:d}"
                                    HeaderText="Begin Date"
                                    UniqueName="BeginDate"
                                    />
                                    <telerik:GridBoundColumn
                                    DataField="EndDate"
                                    DataType="System.DateTime"
                                    DataFormatString="{0:d}"
                                    HeaderText="End Date"
                                    UniqueName="EndDate"
                                    />
                                    <telerik:GridBoundColumn
                                    DataField="CreatedOn"
                                    DataType="System.DateTime"
                                    DataFormatString="{0:d}"
                                    HeaderText="Created On"
                                    UniqueName="CreatedOn"
                                    />
                                <telerik:GridBoundColumn
                                    DataField="CreatedBy"
                                    DataType="System.String"
                                    HeaderText="Created By"
                                    UniqueName="CreatedBy"
                                    />
                                <telerik:GridTemplateColumn UniqueName="DownloadColumn" HeaderText="Download">
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" CssClass="AlignCenter VAlignMiddle" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DownloadButton" OnClick="DownloadButton_OnClick" runat="server" ToolTip="Download" Visible=<%# Convert.ToBoolean(Eval("ShowDownloadLink"))%> />             
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </asiweb:BusinessDataGrid2>     
                </asp:Panel> 
            </telerik:RadPageView>

        </telerik:RadMultiPage>
                
    </asiweb:PanelTemplateControl2>
    
    <div style="clear:both;"></div>
    <asiweb:PanelTemplateControl2 ID="ProgressAreaPanel" runat="server" Collapsible="False" Width="500" CssClass="DisplayNone" translate="yes">      
        <telerik:RadProgressManager ID="RadProgressManager1" runat="server" />
        <telerik:RadProgressArea ID="RadProgressArea1" DisplayCancelButton="False"  
            ProgressIndicators="TotalProgressBar,CurrentFileName" runat="server" Skin="Bootstrap"   
            Width="100%" OnClientProgressUpdating="clientProgressUpdating" ValidateRequestMode="Disabled">                                      
        </telerik:RadProgressArea>
        <div class="RadUploadProgressArea RadUploadProgressArea_Bootstrap">									
	        <ul class="ruProgress">					
	            <li class="ruCurrentFile"><asp:Label runat="server" id="WarningLabel" /></li>
	        </ul>	
        </div>    
    </asiweb:PanelTemplateControl2>
</asp:Content>