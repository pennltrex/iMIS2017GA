<%@ Control Language="c#" Inherits="AsiCommon_Controls_AtomPainter2_FieldRepeater" Codebehind="FieldRepeater.ascx.cs" %>

<asp:repeater id="Fields" runat="server" OnItemDataBound="Fields_ItemDataBound" OnItemCreated="Fields_ItemCreated">
	<HeaderTemplate>
		<ul style="margin:0;padding:0;">
	</HeaderTemplate>
	<ItemTemplate>
	    <li style="white-space:nowrap; border-bottom: solid 1px #cdcdcd; list-style-type: none;">
	        <asp:ImageButton Visible="false" ID="SmartControlButton" runat="server" OnClientClick="SDPropertyButtonClick(this)" ImageUrl="~/asicommon/images/atompainter/AtomIcon_small.gif" ImageAlign="AbsBottom" />
	        <asp:ImageButton ID="PromptButton" runat="server" OnClientClick="SDPropertyButtonClick(this)" ImageUrl="~/asicommon/images/atompainter/prompt.gif" ImageAlign="AbsBottom" />
	        <asp:ImageButton ID="ReadOnlyButton" runat="server" OnClientClick="SDPropertyButtonClick(this)" ImageUrl="~/asicommon/images/atompainter/readonlydata.gif" ImageAlign="AbsBottom" />
	        <asp:ImageButton Visible="false" ID="EditButton" runat="server" OnClientClick="SDPropertyButtonClick(this)" ImageAlign="AbsBottom" />
	        <asp:Label ID="PropertyName" runat="server" Text='<%# DataBinder.Eval(((DictionaryEntry)Container.DataItem).Value, "Caption") %>'></asp:Label>
	    </li>
	</ItemTemplate>
	<FooterTemplate>
		</ul>
	</FooterTemplate>
</asp:repeater>