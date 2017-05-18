<%@ Page language="C#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Segment List" %>
<%@ Register TagPrefix="uc3" TagName="JobTop" Src="~/AsiCommon/Controls/SegmentManagement/JobTop.ascx" %>
<%@ Register TagPrefix="uc2" TagName="TaskButtons" Src="~/AsiCommon/Controls/SegmentManagement/TaskButtons.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SegmentList" Src="~/AsiCommon/Controls/SegmentManagement/SegmentList.ascx" %>
<%@ Register TagPrefix="uc4" TagName="LeftNav" Src="~/AsiCommon/Controls/SegmentManagement/navigation.ascx" %>

<asp:Content id="SegmentListContent" runat="server" ContentPlaceHolderID="TemplateBody">
	<table class="Portfolio" style="height:100%;" border="0">
	    <tr>
	        <td valign="top" id="pagesubnav" rowspan="3">
	            <uc4:LeftNav id="NavigationControl" runat="server"></uc4:LeftNav>
			</td>
			<td style="width:100%; height:100%; vertical-align:top;">
			    <table style="width:100%; height:100%;" cellspacing="0" cellpadding="0" border="0">
			        <!--tr>
			            <!--td class="TaskBar">
			                <uc2:taskbuttons id="Taskbuttons1"   ShowNewButton=false runat="server"></uc2:taskbuttons>
			            </td>
			        </tr-->
		            <!--tr>
			            <td class="TaskHeading"><uc3:jobtop id="JobTop2" runat="server"></uc3:jobtop></td>
		            </tr-->
		            <tr>
			            <td class="WorkSpace" valign="top" style="height:100%;">
			                <div id="content">
			                    <uc1:SegmentList id="SegmentList1" runat="server"></uc1:SegmentList>
			                </div>
			            </td>
		            </tr>
			    </table>
			</td>
	    </tr>
	</table>
</asp:Content>