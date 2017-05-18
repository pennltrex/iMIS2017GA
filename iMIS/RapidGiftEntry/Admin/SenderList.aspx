<%@ Page Title="Sender List" Language="C#" AutoEventWireup="true" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.SenderList" Codebehind="SenderList.aspx.cs" %>

<asp:Content id="AppealListContent" runat="server" ContentPlaceHolderID="TemplateBody" >
    <asp:Panel runat="server" translate="yes">
	<asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" AutoGenerateColumns="False" AllowPaging="false" runat="server" Width="98%" OnItemDataBound="FindResults_OnItemDataBound">
		<Columns>
		    <asp:HyperLinkColumn DataTextField="Key" HeaderText="Sender Code" DataNavigateUrlField="Key" DataNavigateUrlFormatString="javascript:(function (window) {{ window.Argument = ['PopupReturn','{0}']; window.close(); }})(GetRadWindow());"
				SortExpression="Key" />
			<asp:BoundColumn DataField="Value" DataFormatString="{0:c}" HeaderText="Description" SortExpression="Value" />
		</Columns>
	</asiweb:BusinessDataGrid>
        </asp:Panel>
</asp:Content>