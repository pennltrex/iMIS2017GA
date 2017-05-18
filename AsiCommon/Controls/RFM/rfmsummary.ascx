<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMSummary" Codebehind="RFMSummary.ascx.cs" %>
<%@ Register TagPrefix="WSDC" TagName="WorkflowStatusDisplayControl" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowResultsDisplay.ascx" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<!-- <img height="5" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif" width="1"><br> -->

<asiweb:PanelTemplateControl ID="SummaryPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false">

    <asiweb:PanelTemplateColumn runat="server" ID="RFMSumLeftCol" Width="50%">
        <asiweb:StyledLabel ID="NameValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="DescriptionValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="QueryPopulationNameValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="QueryTransactionNameValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
    
    </asiweb:PanelTemplateColumn>

    <asiweb:PanelTemplateColumn runat="server" ID="RFMSumRightCol" Width="50%">
        <asiweb:StyledLabel ID="CreatedDateValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="CreatedByUserValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="ModifiedDateValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="ModifiedByUserValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
        <asiweb:StyledLabel ID="LastRunDateValue" runat="server" RenderPanelField="true" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>

    <asiweb:PanelTemplateColumn Width="100%">
        <br />
        <br />
        <asp:image id="imgBulletTrue" runat="server" borderwidth="0" imageurl= "~/AsiCommon/Images/16/check.gif"  
		    imagealign="AbsMiddle" visible="False"></asp:image>
	    <asp:image id="imgBulletFalse" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/16/cancel.gif"  
		    imagealign="AbsMiddle" visible="False"></asp:image>
	    <asp:label id="lblListCreated" cssclass="StatusProcess" runat="server"></asp:label>&nbsp;</td>                                                                                                                                                                                                         
	
        <WSDC:WorkflowStatusDisplayControl id="WorkflowStatusControl" runat="server" 
            BusinessItemKey = "<%# processEngineKey %>"       
            NoWorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("RFM_NoWorkflowItemSubmitted", "Lists have not been generated for this definition") %>'                                                                        
            WorkflowItemSubmitted = '<%# Asi.ResourceManager.GetPhrase("RFM_WorkflowItemSubmitted", "RFM analysis has been submitted for this definition  ") %>' 
            SuccessStatusMessage = '<%# Asi.ResourceManager.GetPhrase("RFMWorkflowSuccessStatus", "Lists have been generated for this definition  ")  %>'  
            OverRideMessage= "<%# overRideMessage %>"   
            ErrorStatusMessage = '<%# Asi.ResourceManager.GetPhrase("RFMWorkflowSuccessStatus", "An error has occurred while generating Lists")  %>'  
            ComponentKey = '<%# Asi.Business.Common.RegisteredComponentController.RegisteredComponent("RFMProcessEngine", "IProcessEngine").RegisteredComponentKey %>' />
        </WSDC:WorkflowStatusDisplayControl>
    </asiweb:PanelTemplateColumn>

</asiweb:PanelTemplateControl>