<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Design.ResourcePicker" Codebehind="ResourcePicker.ascx.cs" %>
<asp:Label id="ResourceTypeLabel" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt">xResource Type</asp:Label>
&nbsp;
<asp:DropDownList id="ResourceTypeDropDownList" runat="server" AutoPostBack="True" CssClass="BSAText" onselectedindexchanged="ResourceTypeDropDownList_SelectedIndexChanged"></asp:DropDownList>
<br>
<asp:Label id="ItemLabel" runat="server" style="text-align:right; vertical-align:top; width:100px" CssClass="BSAPrompt">xItems</asp:Label>
&nbsp;
<asp:ListBox id="ItemListBox" runat="server" AutoPostBack="True" Width="250" CssClass="BSAText" onselectedindexchanged="ItemListBox_SelectedIndexChanged"></asp:ListBox>
<br>
<asp:Label id="Label1" runat="server" style="TEXT-ALIGN:right" Width="100" CssClass="BSAPrompt"></asp:Label>
&nbsp;
<asp:CheckBox id="UseAtomCheckBox" runat="server" Visible="False" Text="Use Atom" AutoPostBack="True" CssClass="BSAText" oncheckedchanged="UseAtomCheckBox_CheckedChanged"></asp:CheckBox>
<br>
<asp:Label id="PropertyLabel" runat="server" style="text-align:right; vertical-align:top; width:100px" CssClass="BSAPrompt">xProperty</asp:Label>
&nbsp;
<asp:ListBox id="PropertyListBox" runat="server" Width="250" CssClass="BSAText"></asp:ListBox>

