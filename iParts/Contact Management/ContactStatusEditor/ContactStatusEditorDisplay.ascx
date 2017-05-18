<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactStatusEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactStatusEditor.ContactStatusEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<script type="text/javascript">
    //<![CDATA[        
      
    function HideTooltip()
    {
       var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
       if (tooltip) tooltip.hide();
    }
    
    // This Function is used with Caption control for the menuclick event - We need to make sure that name is UNIQUE within a page.
    function <%#ClientID%>_OnClientMenuClick(MenuText, MenuValue) {
        // Hide show the correct part of the panel
        if(MenuValue != null && MenuValue == 1)
            var tooltip = $find("<%#toolTip1.ClientID%>");
              
        if (tooltip!=null) tooltip.show();
        return false;
    }
    //]]>        
</script>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>
    
    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server"> 
        <AjaxSettings> 
            <telerik:AjaxSetting AjaxControlID="save"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" />            
                </UpdatedControls> 
            </telerik:AjaxSetting> 
        </AjaxSettings> 
    </telerik:RadAjaxManagerProxy>  


    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" TitleBarClickBehavior="SelectOnlyMenuItem" />

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="loadingPanel" runat="server" >
    
        <asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text="text"></asp:Button>

        <asiweb:BusinessLabel ID="LabelStatus" runat="server" />

    </telerik:RadAjaxPanel>  
        
    <telerik:RadToolTip runat="server" ID="toolTip1" 
            TargetControlID="TitleBar" Animation="None" ShowEvent="FromCode" 
            ShowDelay="0" ShowCallout="false" Position="BottomCenter" OffsetX="-13" Modal="true"   
            HideEvent="ManualClose" RelativeTo="Mouse" RenderInPageRoot="true" >
                 
            <asp:UpdatePanel runat="server" ID="updatePanel1">

            <ContentTemplate>
                                
                <table class="Form">
                <tbody>
                
                    <tr>
                        <td colspan="2" class="AlignLeft">        
                            <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />
                        </td>
                    </tr>
                               
                    <tr>
                        <td><asiweb:BusinessLabel id="LabelStatusPrompt" runat="server" /></td>
                        <td><asiweb:BusinessDropDownList runat="server" ID="SelectStatus" Style="float: none;" TabIndex="1" ShowNullItem="false" /></td>                                                                
                    </tr>                       
                    <tr>
                        <td colspan="2" class="AlignRight">   
                            <asp:Button id="save" Text="Save & Close" runat="server" OnClick="ChangePartyStatusClick" CssClass="PrimaryButton" TabIndex="2" />
                            &nbsp;<asp:Button id="cancel" runat="server" CssClass="Cancel" Text="Cancel" CausesValidation="false" OnClientClick="HideTooltip(); return true;" TabIndex="3" />                  
                        </td>
                    </tr>                   
                   
                </tbody>
                </table>
                 
            </ContentTemplate>
            
        </asp:UpdatePanel>
              
    </telerik:RadToolTip>    
       
</asp:Panel>
