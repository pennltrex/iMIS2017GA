<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.PackageManagement.Processlist" Codebehind="Processlist.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="DocumentExplorer" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>


    <uc1:DocumentExplorer id="ObjectBrowser1" runat="server"    />

<script type="text/javascript">
    //<![CDATA[
    addResizeEvent(Window_Resize);
    //]]>
    //addLoadEvent(ObjectBrowserResize);
    //addResizeEvent('ObjectBrowserResize');
</script>
