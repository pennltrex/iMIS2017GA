<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SocialNetworkProfileEdit.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.SocialProfileListCreator.SocialNetworkProfileEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="uc1" TagName="SocialNetworkConnections" Src="SocialNetworkConnectionsDisplay.ascx" %>
<%@ Import Namespace="Asi" %>

<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">   
    <asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="true" Collapsible="false" ScrollBars="None" BorderStyle="None"
        TemplateTitle='<%# ResourceManager.GetPhrase("SocialProfileListCreator.SocialNetworkProfileEdit.TemplateTitle", 
            "Social Profiles") %>'>       
        <uc1:SocialNetworkConnections ID="socialNetworkConnections" runat="server" EditMode="true" />        
        <asp:Repeater ID="SocialNetworkRepeater" OnItemDataBound="SocialNetworkRepeater_ItemDataBound" runat="server">
            <ItemTemplate> 
                <div class="PanelField Left">
                    <div style="display:inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelSocialNetworkName" Text='' EnableViewState="true" AssociatedControlID="SocialNetworkTextBox"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="SocialNetworkTextBox" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" OnTextChanged="SocialNetworkChanged" CssClass="WideTextBox" />
                        <br />
                        <asiweb:StyledLabel runat="server" ID="SocialNetworkInstructiveText" Text="" Visible="false" CssClass="Info"/>
                    </div>
                </div>
                <div style="clear:both;"></div>                            
            </ItemTemplate>
        </asp:Repeater>
    </asiweb:PanelTemplateControl2>
</asp:Content>