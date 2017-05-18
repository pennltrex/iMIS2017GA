<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.TagAddRelated" Codebehind="TagAddRelated.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/BusinessTree/BusinessTree.ascx" TagName="BusinessTree" TagPrefix="uc2" %>

<script type="text/javascript">    
    function ReturnSelectedTags()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        
        // BusinessTreeGetSelectedItems() is defined in BusinessTree.ascx
        var selectedTags = BusinessTreeGetSelectedItems();
        var recip = document.getElementById("<%= chkReciprocalAdd.ClientID %>")
        var relationshipType = document.getElementById("<%= ddRelationshipType.ClientID %>")
               
        oWindow.Reciprocal = recip.checked;
        oWindow.RelationshipType = relationshipType.value;
        oWindow.result = selectedTags
        oWindow.Close();
    }
</script>
<div class="PanelField Top">
    <asp:Label ID="lblChooseRelationshipType" runat="server" Text="" ToolTip="Select the type of relationship to be added." AssociatedControlID="ddRelationshipType"></asp:Label>

    <div class="PanelFieldValue">
        <asp:DropDownList ID="ddRelationshipType" runat="server" ToolTip="Select the type of relationship to be added.">
        </asp:DropDownList>
    </div>
</div>
<div class="PanelField Right">
    <div class="PanelFieldValue">
        <asp:CheckBox ID="chkReciprocalAdd" runat="server" ToolTip="Check this box if a reciprocal of the selected relationship should also exist from the specified tags to this tag" />
    </div>
    <asp:Label ID="lblReciprocal" runat="server" Text="" ToolTip="Check this box if a reciprocal of the selected relationship should also exist from the specified tags to this tag" AssociatedControlID="chkReciprocalAdd"></asp:Label>
</div>
<div class="PanelField Top">
    <asp:Label ID="lblChooseTags" runat="server" Text="" CssClass="Label"></asp:Label>
</div>
<uc2:BusinessTree ID="BusinessTree1" ShowOkCancelButtons="false" 
    runat="server"></uc2:BusinessTree>    
