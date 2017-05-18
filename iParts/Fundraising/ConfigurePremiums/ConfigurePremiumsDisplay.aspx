<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigurePremiumsDisplay.aspx.cs" 
    Inherits="Asi.Web.iParts.Fundraising.ConfigurePremiums.ConfigurePremiumsDisplay" Title="Configure premiums"%>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<%@Register tagPrefix="PremiumDefinitionDisplay" 
    tagName="PremiumDefinitionDisplay"
    Src="../PremiumDefinitionDisplay/PremiumDefinitionDisplayDisplay.ascx"
 %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:content id="ContentBody" runat="server" contentplaceholderid="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" Text="Premium Sets" ShowHeader="True" Collapsible="false" ScrollBars="None" BorderStyle="None" translate="yes">
   
       <telerik:RadAjaxPanel ID="PremiumRulesRadAjaxPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">        
            <asiweb:BusinessDataGrid2 ID="PremiumRulesGrid" runat="server" 
                AllowSorting="false" AllowPaging="True" PageSize="100" 
                AllowMultiRowEdit="False"
                AutoGenerateColumns="False" 
                OnNeedDataSource="ConfigurePremiumsNeedDataSource" 
                OnDeleteCommand="ConfigurePremiumsDeleteCommand"  
                OnUpdateCommand="ConfigurePremiumsItemUpdated"
                OnItemDataBound="ConfigurePremiumsItemDataBound"
                OnPreRender="ConfigurePremiumPreRender" 
                OnItemCommand="ConfigurePremiumsItemCommand">
            
                <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="GiftPremiumRuleId" EditMode="EditForms">
                   <CommandItemTemplate>
                       <div class="FloatRight">
                            <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" Visible='<%# !PremiumRulesGrid.MasterTableView.IsItemInserted %>' >
                                <asp:Image ID="AddButtonImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Add"/>
                                <asp:Label CssClass="RadGridCommandText" runat="server" Text="Add new" />
                                &nbsp;&nbsp;
                            </asp:LinkButton>   
                        </div>                       
                    </CommandItemTemplate>
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="GiftPremiumRuleName" HeaderText="Name" DataField="GiftPremiumRuleName"/>
                        <telerik:GridBoundColumn UniqueName="GiftItems" HeaderText="Gift Items" DataField="EligibleItems" />
                        <telerik:GridBoundColumn UniqueName="SourceCodes" HeaderText="Source Codes" DataField="EligibleSourceCodes" />
                        <telerik:GridBoundColumn UniqueName="AvailableStarting" HeaderText="Available Starting" DataField="PremiumOfferBeginDate" />
                        <telerik:GridBoundColumn UniqueName="AvailableUntil" HeaderText="Available Until" DataField="PremiumOfferEndDate" />
                        <telerik:GridEditCommandColumn HeaderText="Edit" UniqueName="EditCommandColumn" EditImageUrl="~/AsiCommon/Images/icon_edit.png" ButtonType="ImageButton" >
                            <HeaderStyle CssClass="text-hide"></HeaderStyle>
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn UniqueName="DeleteColumn" ButtonType="ImageButton" ConfirmDialogType="RadWindow"  
                            ImageUrl="~/AsiCommon/Images/icon_delete.png" HeaderText="Delete" CommandName="Delete">
                             <HeaderStyle CssClass="text-hide"></HeaderStyle>
                        </telerik:GridButtonColumn>
                    </Columns>
                
                    <EditFormSettings UserControlName="../PremiumDefinitionDisplay/PremiumDefinitionDisplayDisplay.ascx" EditFormType="WebUserControl">
                        <EditColumn UniqueName="EditCommandColumn1">
                        </EditColumn>
                    </EditFormSettings>

                </MasterTableView>

            </asiweb:BusinessDataGrid2>       
        </telerik:RadAjaxPanel>
    </asiweb:PanelTemplateControl2>
</asp:content>