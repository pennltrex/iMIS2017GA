<%@ Page language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Project Editor" %>
<%@ Register TagPrefix="uc1" TagName="Opportunity" Src="~/AsiCommon/Controls/OpportunityManagement/Opportunity.ascx" %>
<%@ Register TagPrefix="uc4" TagName="Navigation" Src="~/AsiCommon/Controls/OpportunityManagement/navigation.ascx" %>
<%@ Register TagPrefix="uc3" TagName="OpportunityTop" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityTop.ascx" %>

<script runat="server" language="C#">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        AddChildUserControl(Opportunity1);
    } 
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
	<table cellspacing="0" cellpadding="0" border="0" style="width:99%; height:99%;" align="center">
	    <tr>
	        <td valign="top" id="pagesubnav" rowspan="3">
	            <uc4:Navigation id="nav" runat="server"></uc4:Navigation>
	        </td>
			<td style="width:100%; height:100%; vertical-align:top;">
			    <table style="width:100%; height:100%;" cellspacing="0" cellpadding="0" border="0">
			        <tr>
			            <td class="TaskHeading">
				            <uc3:OpportunityTop id="OpportunityTop2" runat="server"></uc3:OpportunityTop>
			            </td>
		            </tr>
		            <tr>
			            <td class="WorkSpace" style="height:100%; vertical-align:top;">
			                <div id="content">
				                <uc1:Opportunity id="Opportunity1" runat="server"></uc1:Opportunity>
				            </div>
			            </td>
		            </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>