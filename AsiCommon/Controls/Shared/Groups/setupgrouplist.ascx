<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Utility.SetupGroupList" Codebehind="SetupGroupList.ascx.cs" %>
<%@ Register TagName="GroupsList" TagPrefix="asiweb" Src="~/AsiCommon/Controls/Shared/Groups/GroupsList.ascx" %>
<asp:HiddenField runat="server" ID="SystemEntityKeyHidden" />
<asp:HiddenField runat="server" ID="GroupTypeKeyHidden" />
<asiweb:GroupsList runat="server" ID="GroupsList" AddEnabled="<%#AddEnabled%>"  />