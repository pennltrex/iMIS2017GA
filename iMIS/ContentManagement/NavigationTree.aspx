<%@ Page language="c#" Inherits="Asi.Web.UI.ContentManagement.NavigationTree" EnableViewState="false" Codebehind="NavigationTree.aspx.cs" %>
<%@ Register TagPrefix="cc1" Namespace="Asi.Web.UI.Common.AsiTreeView" Assembly="Asi.WebRoot" %>
<asp:content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
<script language="javascript"><!--
	// Used to insert javascript for this page
    <asp:PlaceHolder id="JavaScriptPlaceHolder" runat="server"></asp:PlaceHolder>
    var highlightedMove = null;
    function SetMove(key, icon)
    {
        if (highlightedMove != null)
            highlightedMove.src = highlightedMove.src.replace(/move_on/,'move_off')
        highlightedMove = icon;
        highlightedMove.src = highlightedMove.src.replace(/move_off/,'move_on')
        
		document.getElementById(MoveHierarchyKeyID).value = key;
    }
    
    function ImageOver(image, imageName)
    {
        if (image != highlightedMove)
            image.src = WebRoot + "/AsiCommon/Images/ContentManagement/" + imageName + ".gif";
    }
    
    function SetTarget(key)
    {
		document.getElementById(TargetHierarchyKeyID).value = key;
		document.getElementById(ActionID).value = 'Move'
		if (document.getElementById(MoveHierarchyKeyID).value != null && document.getElementById(MoveHierarchyKeyID).value != key)
			document.forms[0].submit();
    }
    
    function SetPromote(key)
    {
		document.getElementById(MoveHierarchyKeyID).value = key;
		document.getElementById(ActionID).value = 'Promote'
		document.forms[0].submit();
    }

    function SetDemote(key)
    {
		document.getElementById(MoveHierarchyKeyID).value = key;
		document.getElementById(ActionID).value = 'Demote'
		document.forms[0].submit();
    }

    function SetDelete(key, name)
    {
		if(confirm('Are you sure you want to delete ' + name + ' and all of its descendants?'))
		{
			document.getElementById(MoveHierarchyKeyID).value = key;
			document.getElementById(ActionID).value = 'Delete'
			document.forms[0].submit();
		}
    }
	//-->
</script>

<asp:placeholder id="TitlePlaceHolder" runat="server"></asp:placeholder>
<cc1:AsiTreeView id="asiTreeView" runat="server" Width="46px" Height="60px"></cc1:AsiTreeView>
<input type="hidden" id="MoveHierarchyKey" runat="server" name="MoveHierarchyKey"/>
<input type="hidden" id="TargetHierarchyKey" runat="server" name="TargetHierarchyKey" />
<input type="hidden" id="Action" runat="server" name="Action" onserverchange="ActionChange"/>

</asp:content>