<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralLedgerAccountDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.GeneralLedgerAccountDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true">
     <asp:UpdatePanel ID="AccountPanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="PanelField Left Section">                
                <asiweb:StyledLabel runat="server" ID="AccountLabel" AssociatedControlID="AccountList" /> 
                <div class="PanelFieldValue">
                    <asiweb:BusinessComboBox TranslateOnlyCaptionAndToolTip="True" runat="server" CssClass="WideTextBox"
                        ID="AccountList" 
                        EnableLoadOnDemand="True" 
                        ShowMoreResultsBox="True"
                        EnableVirtualScrolling="True" 
                        OnItemsRequested="AccountListItemsRequested"  
                        ItemsPerRequest="10" 
                        OnSelectedIndexChanged="AccountSelected"  
                        AutoPostBack="true" 
                        CausesValidation="false"
                        ShowNullItem="false"
                        Height="185px">
                    </asiweb:BusinessComboBox>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="AccountRequired" ControlToValidate="AccountList" CssClass="Important" Display="Dynamic"/>                  
                    <asp:CustomValidator ControlToValidate="AccountList" CssClass="Important" Display="Dynamic" ID="AccountCustomValidator" OnServerValidate="AccountSelectedCustomValidator_OnServerValidate" runat="server" />
                </div>
            </div>
            <div style="clear: both;"></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>