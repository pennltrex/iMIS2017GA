<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_CommunityConfigure" Codebehind="CommunityConfigure.ascx.cs" %>
<%@ Register TagName="SmartImageManager" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SmartImageManager.ascx" %>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">
function OnModerationRequiredClick(checkbox)
{
    if (checkbox.checked == true) 
        return;
    // if checkbox is unchecked, but 0 items to publish (PromptString is empty), return
    if (checkbox.checked == false) { 
        if ("<%=PromptString%>".length == 0)
            return;
    }

    var answer = confirm ("<%=PromptString%>");
    if (answer == true)
    {
        var hiddenButton = document.getElementById("<%=hiddenbutton.ClientID%>");
        if (hiddenButton != null)
            hiddenButton.click();
    }
    else
        checkbox.checked = true;
}
</script>
</telerik:RadScriptBlock>

<asiweb:PanelTemplateControl2 ID="mainPanel" runat="server" Collapsible="false" Collapsed="false" FieldSet="true" BorderStyle="None">

    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Title" ID="NameControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper" />
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityTemplatePath" ID="Template" DisplayCaption="true" PositionCaption="Left" DocumentTypesAllowed="CON" InputFieldCssClass="InputXLargeWrapper"/>
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityDefaultWebsiteKey" ID="DefaultWebsite" DisplayCaption="true" PositionCaption="Left"/>
    <Communities:SmartImageManager runat="server" ID="CommunityImageUrlManager" UseParentAtomObject="true" CssClass="FloatLeft InputLargeWrapper" /> 
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Description" ID="DescriptionControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="Body" ID="BodyControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Left" />
    
    <div class="AutoWidth">
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityAllowMemberWikiCreation" ID="CommunityAllowMemberWikiCreationControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
    </div>   
    <div class="AutoWidth">
        <asiweb:SmartControl OnClientClick="return OnModerationRequiredClick(this)" runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityAreaModerationRequired" ID="CommunityAreaModerationRequiredControl" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right"  />
    </div> 
          
    <asp:Button ID="hiddenbutton" runat="server" style="display:none" OnClick="HiddenButtonOnClickHandler" Text="Hidden Button" />
       
</asiweb:PanelTemplateControl2>
