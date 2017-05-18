<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupListEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.GroupListEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

    <script type="text/javascript">
        //<![CDATA[
        function OnClientMouseOver(sender, args) {
            //Not adding tooltip to mobile/tablet environments
            var agent = navigator.userAgent.toLowerCase();
            var isSmartPhone = (/series60/.test(agent) || /symbian/.test(agent) || /windows ce/.test(agent) || /blackberry/.test(agent));
            var hasSmartProperties = typeof orientation != 'undefined' && ('ontouchstart' in document.documentElement) ? true : false;
            var iOperatingSys = (navigator.platform.indexOf("iPhone") != -1) || (navigator.platform.indexOf("iPad") != -1) ? true : false;
            var isAndroid = /android/.test(agent) || (!iOperatingSys && !isSmartPhone && hasSmartProperties) ? true : false;

            if (!isSmartPhone && !iOperatingSys && !isAndroid) {
                var nodeElem = args.get_node();
                if (nodeElem.get_level() != 0) {
                    var node = nodeElem.get_textElement();

                    var tooltipManager = $find("<%= RadToolTipManager1.ClientID%>");

                    //If the user hovers the image before the page has loaded, there is no manager created
                    if (tooltipManager == null) return;

                    //If this node does not represent a group member, there is no tooltip
                    if (nodeElem.get_value() == null || (nodeElem.get_value().indexOf("|GM|") == -1 && nodeElem.get_value().indexOf("R|") == -1)) return;

                    //Find the tooltip for this element if it has been created 
                    var tooltip = tooltipManager.getToolTipByElement(node);

                    //Create a tooltip if no tooltip exists for such element
                    if (tooltip == null) {
                        tooltip = tooltipManager.createToolTip(node);
                        tooltip.set_value(nodeElem.get_value());
                        tooltip.show();
                    }                                        
                }
            }
        }

        function OnClientShow(sender, args) {          
            var radToolTip = $telerik.getElementByClassName($get("RadToolTipWrapper_" + sender.get_id()), "rtLoading", "td");
            if (radToolTip != null)
                 radToolTip.className = 'AdvancedToolTip BreakWord';
            
            radToolTip.setAttribute("style", "padding:0px !important;");
        }

        function OnClientResponseError(sender, args) {
            args.set_cancelErrorAlert(true);
        }

        function ClientNodePopulating(sender, eventArgs) {
            var node = eventArgs.get_node();
            var domElement = node.get_element();
            jQuery(".rtPlus", domElement).css({ cursor: "progress" });
        }

        function ClientNodePopulated(sender, eventArgs) {
            var node = eventArgs.get_node();
            var domElement = node.get_element();                
            jQuery(".rtMinus", domElement).css({ cursor: "pointer" });
            jQuery(".rtPlus", domElement).css({ cursor: "pointer" });            
        }

        jQuery(document).ready(function () {
            jQuery(".rtPlus").css({ cursor: "pointer" });
        });      
    //]]>
    </script>

</telerik:RadCodeBlock>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" translate="yes"/>
    
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="CloseActiveToolTip" Visible="false" Enabled="false">
    
        <asp:Panel ID="PreviewPanel" runat="server" Visible="false" CssClass="MediumThumbnail" />

        <telerik:RadToolTipManager runat="server" Width="240px" RelativeTo="Element" ID="RadToolTipManager1" 
            RenderInPageRoot="false" Sticky="true" HideEvent="LeaveTargetAndToolTip" AutoCloseDelay="10000" HideDelay="1000" 
            OffsetX="0" IgnoreAltAttribute="true" Position="MiddleRight" OnAjaxUpdate="RadToolTipManager1_AjaxUpdate" 
            AnimationDuration="0" Modal="false" ShowDelay="1000" style="z-index:2999"  
            OnClientShow="OnClientShow" EnableViewState="false" OnClientResponseError="OnClientResponseError"
            Animation="None" Overlay="true">
        </telerik:RadToolTipManager> 
    
        <div id="GroupNameDiv" runat="server">
            <asiweb:StyledLabel ID="GroupName" runat="server" Font-Bold="true" />
        </div>

        <telerik:RadTreeView translate="no" ID="GroupTree" runat="server" AllowNodeEditing="False" OnNodeExpand="GroupTreeOnNodeExpand"
            ShowLineImages="false" OnClientMouseOver="OnClientMouseOver" CausesValidation="False" EnableAjaxSkinRendering="False" CssClass="MediumThumbnail GLE" EnableViewState="True"
            IsVirtualizing="true" OnClientNodePopulating="ClientNodePopulating" OnClientNodePopulated="ClientNodePopulated"> 
        </telerik:RadTreeView >

        <telerik:RadScriptBlock ID="_RadScriptBlock1" runat="server">
            <script type="text/javascript">
                //Hide a tooltip if it is visible when an RadAjaxPanel request starts 
                function CloseActiveToolTip() {
                    var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
                    if (tooltip != null) tooltip.hide();
                }               
            </script>
        </telerik:RadScriptBlock>

    </telerik:RadAjaxPanel>
</asp:Panel>       