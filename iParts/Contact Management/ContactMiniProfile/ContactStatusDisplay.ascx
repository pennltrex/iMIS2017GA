<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactStatusDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactStatusDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent" translate="yes">
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="loadingPanel">
    <div id="divStatus" runat="server">  
    <asp:Button runat="server" id="refreshTrigger2" style="display:none" Text="text"></asp:Button>  
    <div id="divIdHeader" runat="server">            
            <asiweb:StyledLabel ID="memberId" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>                  
     </div>                    
     <div id="divJoinHeader" runat="server">           
            <asiweb:StyledLabel ID="memberJoinDate" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>            
     </div>
     <div id="divTypeHeader" runat="server">
            <asiweb:StyledLabel ID="memberType" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>
     </div>                                   
     <div id="divBillingHeader" runat="server">
            <asiweb:StyledLabel ID="billingCat" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>            
     </div>
     <div id="divStatusHeader" runat="server">
            <asiweb:StyledLabel ID="memberStatus" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>            
     </div>
     <div id="divPaidThruHeader" runat="server">           
            <asiweb:StyledLabel ID="paidThruDate" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left"/>           
     </div> 
    <div style="clear: both;"></div>     
    </div> 
    </telerik:RadAjaxPanel>               
</asp:Panel>
<asp:Panel ID="contentPanelContactEdit" runat="server" Visible="false" translate="yes">
    <asiweb:BusinessLabel ID="errorText" runat="server" CssClass="Error" Visible="false" />
    <table class="Form">
    <tbody>
        <tr>
            <td id="divStatusEdit" runat="server" Visible="false">
                <asiweb:BusinessDropDownList TranslateOnlyCaptionAndToolTip="True" runat="server" ID="SelectStatus" RenderPanelField="true"
                ShowNullItem="false" DisplayCaption="true" PositionCaption="Top"/>            
            </td>
            <td id="divBillingEdit" runat="server" Visible="false">
                 <asiweb:BusinessDropDownList TranslateOnlyCaptionAndToolTip="True" runat="server" ID="BillingCategories" RenderPanelField="true" 
                 ShowNullItem="true" DisplayCaption="true" PositionCaption="Top"/> 
            </td>
            <asp:Button id="SaveButton" Visible="false" Text="Save & Close" runat="server" OnClick="ChangePartyStatusClick" CssClass="PrimaryButton" TabIndex="99" /> 
        </tr>                  
    </tbody>
    </table>
</asp:Panel>                         