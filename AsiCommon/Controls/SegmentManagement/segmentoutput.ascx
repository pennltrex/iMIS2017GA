<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentOutput" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SegmentOutput.ascx.cs" %>

<table cellpadding="3" cellspacing="3">
    <tr>
        <td class="CommandBar">
            <table cellspacing="0" cellpadding="0">
	            <tr>
		            <td align="left">&nbsp;</td>
		            <td align="right">[ <a href="#">New</a> ]</td>
	            </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table class="Grid" cellspacing="0" cellpadding="3">
	            <tr class="GridHeader">
		            <th><asp:label id="lblSegmentCode" runat="server">Output</asp:label></th>
		            <th><asp:label id="lblDescription" runat="server">Description</asp:label></th>
	            </tr>
	            <tr class="GridRow">
		            <td colspan="2">
			            <asp:listbox id="OutputMethodsListBox" runat="server" width="80%" autopostback="True" rows="1" selectionmode="Multiple">
				            <asp:listitem value="To add additional output methods select them from the list...">To add additional output methods select them from the list...</asp:listitem>
			            </asp:listbox>
		            </td>
	            </tr>
	            <tr class="GridAlternateRow">
		            <td>Email</td>
		            <td>Use email server to send list</td>
	            </tr>
	            <tr class="GridRow">
		            <td>4 up labels</td>
		            <td>Send to printer</td>
	            </tr>
            </table>
        </td>
    </tr>
</table>
