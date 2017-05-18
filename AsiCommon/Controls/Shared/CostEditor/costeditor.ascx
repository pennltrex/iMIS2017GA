<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CostEditor.CostEditor" Codebehind="CostEditor.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="CostEditorPanel" TemplateTitle="Costs" Collapsible="false">

    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <table>
	    <tr>
		    <td><asp:placeholder id="phCostTable" runat="server"></asp:placeholder></td>
	    </tr>
	    <tr>
		    <td>
		        <div class="CommandBar">
		            <asiweb:StyledButton ID="btnOK" runat="server" CommandButtonType="Ok" OnClick="btnOK_ServerClick" />
		            <asiweb:StyledButton ID="btnCancel" runat="server" CommandButtonType="Cancel" OnClick="btnCancel_ServerClick" />
		        </div>
		    </td>
	    </tr>
    </table>

</asiweb:PanelTemplateControl2>