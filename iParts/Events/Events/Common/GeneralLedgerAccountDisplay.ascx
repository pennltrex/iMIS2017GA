<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralLedgerAccountDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.Common.GeneralLedgerAccountDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<script type="text/javascript">
    function OnClientDropDownOpening(sender, arg) {
        if (sender.get_items().get_count() == 0) {
            return;
        }
        else {
            sender.requestItems("parameter", true);
            sender.clearItems();
        }
    }
</script>

<asp:Panel ID="contentPanel" runat="server" Visible="true">
     <asp:UpdatePanel ID="AccountPanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
            <%--<div class="PanelField Left">
                <div>
                    <asiweb:StyledLabel runat="server" ID="AccountLabel" AssociatedControlID="AccountList">
                    </asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">--%>
                    <asiweb:BusinessComboBox runat="server" 
                                     AppendDataBoundItems="False"
                                     ID="AccountList" 
                                     EnableLoadOnDemand="True"                                
                                     ShowMoreResultsBox="True"
                                     EnableVirtualScrolling="True"                                      
                                     OnItemsRequested="AccountListItemsRequested"                                           
                                     ItemsPerRequest="10" 
                                     OnSelectedIndexChanged="AccountSelected"  
                                     AutoPostBack="False" 
                                     CausesValidation="false"
                                     ShowNullItem="false"                                                                        
                                     EmptyMessage="Select a GL Account"                                    
                                     CssClass="WideTextBox"
                                     DisplayCaption="True"
                                     PositionCaption="Left"
                                     RenderPanelField="True"
                                     Height="185px"
                                     >
                        
                    </asiweb:BusinessComboBox>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="AccountRequired" ControlToValidate="AccountList" CssClass="Important" Display="Dynamic">
                    </asiweb:AsiRequiredFieldValidator>
                    <asp:CustomValidator ID="AccountCustomValidator" runat="server" CssClass="Important" Display="Dynamic" ControlToValidate="AccountList"
                        OnServerValidate="AccountSelectedCustomValidator_OnServerValidate" />
                <%--</div>--%>
            <%--</div>--%>
            <br />
            <div style="clear: both;"></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
