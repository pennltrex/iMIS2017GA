<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimaryNavigationConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Website.PrimaryNavigation.PrimaryNavigationConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

    <asiweb:SmartControl 
            ID="NavigationLevels" runat="server" 
            BoundPropertyName="NavigationLevels" DisplayCaption="true" OnClientClick="EnableDisableNavLevels();"
            PositionCaption="Right" DataSaveUponStateChange="false"/>
    <asiweb:SmartControl 
            ID="MaxDataBindDepth" runat="server" 
            BoundPropertyName="MaxDataBindDepth" DisplayCaption="true" CssClass="SubItems InputSmallWrapper"
            PositionCaption="Left" DataSaveUponStateChange="false" MaxValue="10" MinValue="1"/>
    <asiweb:SmartControl 
            ID="EnableMegaDropDownMenu" runat="server" 
            BoundPropertyName="EnableMegaDropDownMenu" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
    <asiweb:SmartControl 
            ID="ExpandDelay" runat="server" 
            BoundPropertyName="ExpandDelay" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
    <asiweb:SmartControl 
            ID="CollapseDelay" runat="server" 
            BoundPropertyName="CollapseDelay" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
<%--    <asiweb:SmartControl --%>
<%--            ID="EnableEmbeddedSkins" runat="server" --%>
<%--            BoundPropertyName="EnableEmbeddedSkins" DisplayCaption="true" OnClientClick="EnableDisableCustomSkins();"--%>
<%--            PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="True"/>--%>
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel id="LabelSelectSkinName" AssociatedControlID="CustomSkinName" runat="server" CssClass="Required">Skin</asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
<%--            <asiweb:BusinessDropDownList ID="SelectSkinName" runat="server" />--%>
            <asiweb:BusinessTextBox ID="CustomSkinName" runat="server" />
            <asiweb:AsiRequiredFieldValidator ID="CustomSkinValidator" runat="server" ControlToValidate="CustomSkinName" Display="Dynamic" />
<%--            <telerik:RadSkinManager ID="SkinList" runat="server" ShowChooser="False" Skin="Default"></telerik:RadSkinManager>--%>
        </div>
        
    </div>

 <script type="text/javascript">
    //<![CDATA[
     EnableDisableNavLevels();
     function EnableDisableNavLevels() {
         var editableCheckBox = $get("<%#NavigationLevels.ClientID%>_CheckBoxSet");
         var navLevels = $get("<%#MaxDataBindDepth.ClientID%>");
         if (editableCheckBox != null && editableCheckBox.checked) {
             navLevels.style.display = 'block';
         }
         else {
             if (navLevels != null) {
                 var navLevelsNumber = $get("<%#MaxDataBindDepth.ClientID%>_Number");
                 navLevelsNumber.value = "1";
                 navLevels.style.display = 'none';
             }
         }
     }

     //EnableDisableCustomSkins();
     function EnableDisableCustomSkins() {
         var custom = $get("<%#CustomSkinName.ClientID%>");
         if (custom != null) {
             custom.value = "";
         }
//         if(select != null)
//         {
//            select.value = "";
//         }
     }
 //]]>
</script>