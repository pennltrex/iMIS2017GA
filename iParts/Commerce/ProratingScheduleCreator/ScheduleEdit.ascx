<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ScheduleEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ProratingScheduleCreator.ScheduleEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asiweb:PanelTemplateControl ID="SchedulePanel" runat="server" FieldSet="true"
    ShowHeader="true" BorderStyle="None" Text="New schedule" Collapsed="false" Collapsible="false">
    
    <asp:UpdatePanel runat="server" ID="RefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
    <ContentTemplate>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="SaveAndExitButton" >
        <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
        <telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="True" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">
            <div runat="server" visible="false" id="DivLabelErrorMessage">
            <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
            </div> 
            <div class="PanelField Left">      
                <asiweb:BusinessLabel id="ScheduleNameLabel" runat="server" Text="Name" AssociatedControlID="ScheduleNameTextBox" CssClass="Required"/>       
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="ScheduleNameTextBox" runat="server" CssClass="InputXLarge" />
                    <asiweb:AsiRequiredFieldValidator ID="ScheduleNameTextBoxValidator" runat="server"
                        ControlToValidate="ScheduleNameTextBox" EnableClientScript="true" ErrorMessage="Required"
                        Display="Static" SetFocusOnError="false" CssClass="Important" />   
                </div>
            </div>
            <div class="PanelField Left">        
                <asiweb:BusinessLabel id="ScheduleDescLabel" runat="server" Text="Description" AssociatedControlID="ScheduleDescTextBox" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="ScheduleDescTextBox" runat="server" Rows="4" TextMode="MultiLine" CssClass="InputXXLarge" />
                </div>
            </div> 
            <asiweb:PanelTemplateControl runat="server" Collapsible="False">
                <asiweb:BusinessLabel runat="server" ID="RateScheduleLabel" Text="Schedule" AssociatedControlID="ScheduleRadGrid" />
            <telerik:RadGrid ID="ScheduleRadGrid" runat="server" AllowSorting="False" AutoGenerateColumns="False" AllowPaging="False" ShowStatusBar="True"
                    AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                    AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter"  Width="100px" >
                    <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="None" DataKeyNames="FiscalMonth" ClientDataKeyNames="FiscalMonth" 
                        EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="FiscalMonth" HeaderText="Fiscal month" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="FiscalMonth" >
                                <ItemTemplate>
                                    <div style="min-width:50px;">
                                        <asiweb:BusinessLabel ID="MonthLabel" runat="server"/>                                    
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Rate" HeaderText="Rate" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="Rate" >
                                <ItemTemplate>
                                    <div style="min-width:50px;">
                                        <asiweb:BusinessTextBox ID="RateLabel" runat="server" CssClass="InputSmall"/>    
                                        <asp:RangeValidator runat="server" ControlToValidate="RateLabel" MinimumValue="0" MaximumValue="10000000" Type="Double"
                                            CssClass="Important" ID="RateValidator" Enabled="False" Display="Dynamic" ></asp:RangeValidator> 
                                        <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="RateLabel" ID="RateEmptyValidator"></asiweb:AsiRequiredFieldValidator>                               
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
            </telerik:RadGrid>
            </asiweb:PanelTemplateControl>
            </telerik:RadAjaxPanel>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    <div id="commandButtons" class="ButtonPanel NotPrinted" runat="server" style="padding-top:1em;padding-bottom:0.5em;bottom:0;">
        <div class="CommandBar">     
            <asp:Button ID="SaveAndExitButton" runat="server" OnClick="SubmitClickSaveAndExit" causesvalidation="false" CssClass="TextButton PrimaryButton" />      
            <asp:Button ID="SaveButton" runat="server" OnClick="SubmitClickSave" causesvalidation="false" CssClass="TextButton" />
            <asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" /> 
        </div>           
    </div>
    </asiweb:PanelTemplateControl>