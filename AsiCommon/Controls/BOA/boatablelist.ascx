<%@ Control language="c#" Inherits="Asi.Web.UI.Common.BOA.BOATableList" AutoEventWireup="true" Codebehind="BOATableList.ascx.cs" %>
<script type="text/javascript" id="asicustom">
<!--
// when ok is clicked, return the selected tables
function OKClicked()
{
	var retval = "";
	var list = document.getElementById('<%= TableList.ClientID %>');
	var count = list.options.length;
	for (i=0;i<count;i++)
	{
		if (list.options[i].selected)
		{
			if (retval != "")
				retval = retval + ",";
			retval = retval + list.options[i].value;
		}
	}
	self.returnValue = retval;
	self.close();
	return cancelSubmit();
}
//-->
</script>
<div>
<asp:Label ID="TablesViewsLabel" CssClass="BSAText" Runat="server">Tables and Views:</asp:Label>
&nbsp;<asp:ListBox id="TableList" Rows="20" SelectionMode="Multiple" runat="server"></asp:ListBox>
</div>
