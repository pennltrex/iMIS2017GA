<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.SegmentManagement.SegmentationJobSummary1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="JobSummary.ascx.cs" %>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" Collapsible="false">

    <asiweb:PanelTemplateColumn runat="server" ID="SegJobLeftCol" Width="50%">
        <asiweb:StyledLabel ID="Name" runat="server" RenderPanelField="true" DisplayCaption="true" translate="no"/>
        <asiweb:StyledLabel ID="Description" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" translate="no"/>
        <asiweb:StyledLabel ID="QueryName" runat="server" RenderPanelField="true" DisplayCaption="true" translate="no"/>
        <asiweb:StyledLabel ID="Status" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="CreatedBy" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="LastEditor" runat="server" RenderPanelField="true" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>

    <asiweb:PanelTemplateColumn runat="server" ID="SegJobRightCol">
        <asiweb:StyledLabel ID="LastRunDate" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="LastRunUser" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="CreatedDate" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="InactiveDate" runat="server" RenderPanelField="true" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
    <br />
    <br />
    <asp:image id="imgBullet1True" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/check.gif"  imagealign="AbsMiddle" visible="False"></asp:image>
    <asp:image id="imgBullet1False" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/cancel.gif" imagealign="AbsMiddle" visible="False"></asp:image>
    <asp:label id="lblSegmentCount" runat="server" cssclass="StatusProcess"></asp:label>
    <br />	    
    <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server" 
                 BusinessItemKey = "<%#mJob.SegmentationJobKey%>" 
                 OverRideMessage= "<%# overRideMessage %>"               
                 ComponentKey = '<%# Asi.Business.Common.RegisteredComponentController.RegisteredComponent("SegmentationJob", "BusinessController").RegisteredComponentKey %>'
                 >
    </WSDC:WorkflowStatusDisplayControl>
  		
</asiweb:PanelTemplateControl2>
