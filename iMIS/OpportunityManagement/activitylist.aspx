<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Activities" %>

<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/OpportunityManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ActivityList" Src="~/AsiCommon/Controls/OpportunityManagement/ActivityList.ascx" %>
<%@ Register TagPrefix="uc4" TagName="Navigation" Src="~/AsiCommon/Controls/OpportunityManagement/navigation.ascx" %>
<%@ Register TagPrefix="uc3" TagName="OpportunityTop" Src="~/AsiCommon/Controls/OpportunityManagement/OpportunityTop.ascx" %>

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
			            <td>
				            <uc2:TaskButtons id="TaskButtons1" runat="server"></uc2:TaskButtons>
			            </td>
		            </tr>
		            <tr>
			            <td class="WorkSpace" style="height:100%; vertical-align:top;">
			                <div id="content">
                				<uc1:ActivityList id="ActivityList2" runat="server"/>
				            </div>
			            </td>
		            </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
