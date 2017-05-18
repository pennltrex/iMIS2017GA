<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true"  %>
<%@ Register TagPrefix="asiweb" TagName="RegisterToCertificationProgram" Src="~/AsiCommon/Controls/CertificationManagement/RegisterToCertificationProgram.ascx" %>


<script runat="server">

    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }
</script>
<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:RegisterToCertificationProgram ID="RegisterToCertificationProgram" runat="server" />
</asp:Content>