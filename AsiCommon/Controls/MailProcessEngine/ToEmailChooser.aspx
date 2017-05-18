<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Recipient List" %>
<%@ Register TagPrefix="emailChooser" TagName="ToEmailChooserTop" Src="~/AsiCommon/Controls/MailProcessEngine/ToEmailChooserTop.ascx" %>
<%@ Register TagPrefix="emailChooser" TagName="ToEmailChooserBody" Src="~/AsiCommon/Controls/MailProcessEngine/EmailPEDesignerTab4.ascx" %>

<%@ Import Namespace="Asi.Web.UI"%>

<script runat="server">

    /// <see cref="DisplayPageBase.CommandButtonRequisites(CommandButtonRequisiteArgs)"/>
    public override void CommandButtonRequisites(CommandButtonRequisiteArgs e)
    {
        e.SetNeed(CommandButtonType.Ok, toEmailChooserBody.AllowedToEdit);
        e.SetNeed(CommandButtonType.Cancel, toEmailChooserBody.AllowedToEdit);
        e.SetClientClick(CommandButtonType.Ok, "GetRadWindow().Close(); return true;");

        base.CommandButtonRequisites(e);
    }

</script>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">

    <table cellSpacing="0" cellPadding="0" border="0" class="Portfolio">
	    <tr>
		    <td class="TaskHeading">
		        <emailChooser:ToEmailChooserTop id="toEmailChooserTop" runat="server"/>
		    </td>
	    </tr>
	    <tr>
		    <td class="TaskBar">&nbsp;</td>
	    </tr>
	    <tr>
		    <td class="WorkSpace" valign="top">
			    <emailChooser:ToEmailChooserBody id="toEmailChooserBody" runat="server"/>
			</td>
	    </tr>
    </table>

</asp:Content>