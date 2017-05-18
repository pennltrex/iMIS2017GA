<%@ Page Language="C#" AutoEventWireup="true" Title="Define Tags" Inherits="iMIS_ContentManagement_TagTree" Codebehind="TagTree.aspx.cs" %>

<%@ Register Src="../../AsiCommon/Controls/ContentManagement/TagBrowser.ascx" TagName="TagTree"
    TagPrefix="uc1" %>

<script runat="server">
    public override bool AjaxAnimationsEnabled
    {
        get
        {
            return false;
        }
    }
</script>
<asp:Content ID="Content0" runat="server" ContentPlaceHolderID="TemplateUserMessages"></asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:TagTree id="TagTree1" runat="server">
    </uc1:TagTree>

</asp:Content>
