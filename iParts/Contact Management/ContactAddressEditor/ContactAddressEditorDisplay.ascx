<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAddressEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddressEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true" Enabled="true" CssClass="AddressEditor">

    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RefreshTrigger">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel2" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />     
    
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" LoadingPanelID="loadingPanel" runat="server" ></telerik:RadAjaxPanel> 
    <asp:HiddenField ID="previousTabHidden" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="loadingPanel" runat="server">
    
        <asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" Text=""></asp:Button>
    
        <telerik:RadTabStrip ID="RadTabStrip" SelectedIndex="0" ScrollChildren="false"   
            runat="server" MultiPageID="RadMultipage" Orientation="HorizontalTop" ScrollPosition="0" ScrollButtonsPosition="Middle" 
            PerTabScrolling="true" CausesValidation="false" ShowBaseLine="true" translate="yes">      
        </telerik:RadTabStrip>   
        
        <telerik:RadMultiPage ID="RadMultipage" runat="server" SelectedIndex="0" translate="yes" />
    
    </telerik:RadAjaxPanel>    

    <script type="text/javascript">
        //<![CDATA[
        var contactAddressEditorInstance_<%#ClientID%> = new ContactAddressEditorClass();
        contactAddressEditorInstance_<%#ClientID%>.EditDialogUrl = '<%#EditUrl%>';
        contactAddressEditorInstance_<%#ClientID%>.NewAddress = '<%#ResourceManager.GetPhrase("NewAddress", "New Address")%>';
        contactAddressEditorInstance_<%#ClientID%>.PreviousTabHidden = "<%#previousTabHidden.ClientID%>";
        contactAddressEditorInstance_<%#ClientID%>.RadAjaxPanel = "<%#RadAjaxPanel1.ClientID%>";
        contactAddressEditorInstance_<%#ClientID%>.SingleTextAddress = "<%#SingleTextAddress%>";
        //]]>
    </script>
    
</asp:Panel>