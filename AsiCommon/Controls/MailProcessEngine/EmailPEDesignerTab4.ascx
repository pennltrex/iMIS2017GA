<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailPEDesignerTab4" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailPEDesignerTab4.ascx.cs" %>
<%@ Register TagPrefix="cc2" TagName="SelectorCollectionLister" Src="~/AsiCommon/Controls/Shared/SelectorCollectionLister/SelectorCollectionLister.ascx" %>
<%@ Register TagPrefix="cc1" TagName="CurrentCollectionLister" Src="~/AsiCommon/Controls/Shared/SelectorCollectionLister/SelectorCollectionLister.ascx" %>



<table class=DataTable cellSpacing=1 cellPadding=2 width="80%" align=center border=0>
  <tr>
    <td><asp:placeholder id=ErrorMsgPlaceHolder runat="server"></asp:placeholder></TD></TR>
  <TR>
    <TD class="PanelTableValue" style="HEIGHT: 141px" vAlign=top noWrap align=center>
      <P><asp:label id=lblCurrentColumns runat="server" CssClass="mdTitle"></asp:label></P>
      <P><asp:placeholder id=PlaceholderCurrentCols runat="server"></asp:placeholder></P>
      <P><asp:label id=lblAllColumns runat="server" CssClass="mdTitle"></asp:label></P>
      <P><asp:placeholder id=PlaceholderAllCols runat="server"></asp:placeholder></P>
      <P>&nbsp;</P>
      <P>&nbsp;</P>
    </TD>
  </TR>
  <asp:panel id=QueryPanel runat="server"></asp:panel>
</TABLE>
