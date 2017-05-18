<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TaskDefinition.ascx.cs" Inherits="Asi.Web.UI.Common.Tasks.TaskDefinition" %>

<script type="text/javascript">
    function FinderPostback(window)
    {
        if (window.result)
       {
           var hiddenResult = document.getElementById('<%# FinderAdderSelectedKey.ClientID %>');
           hiddenResult.value = window.result;
           document.forms[0].submit();
       }
    }
</script>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<input type="hidden" id="FinderAdderSelectedKey" runat="server" />

<asiweb:PanelTemplateControl2 ID="PropertiesPanel1" runat="server" TemplateTitle="Task" Collapsible="false" FieldSet="true">

    <div class="PanelField Left">
        <asp:label id="lblOpportunityDescription" AssociatedControlID="lblOpportunityDescriptionValue" runat="server"/>
        <div class="PanelFieldValue">
            <asp:label id="lblOpportunityDescriptionValue" runat="server"/>
        </div>
    </div>
    
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" Width="50%">
    
        <asiweb:SmartControl id="scSubject" BoundPropertyName="Subject" DisplayCaption="true" TextBoxWidth="100%" runat="server" />
        <asiweb:SmartControl id="scCategory" BoundPropertyName="Category" DisplayCaption="true" runat="server" />
        
        <div class="PanelField Left">
            <asp:label id="lblAssignedTo" AssociatedControlID="lblAssignedToValue" runat="server" />
            <div class="PanelFieldValue" style="white-space:nowrap;">
                <asp:label id="lblAssignedToValue" runat="server" />
                <asiweb:StyledButton id="btnAssigneeLookup" Text="..." runat="server" /> 
		        <asiweb:StyledButton id="btnAssigneeClear" Text="X" runat="server" Enabled="false" />
		    </div>
		</div>
		
		<div class="PanelField Left">
		    <asp:label id="lblCompletedBy" AssociatedControlID="lblCompletedByValue" runat="server" />
		    <div class="PanelFieldValue">
		        <asp:label id="lblCompletedByValue" runat="server" />
		    </div>
		</div>
		
		<asiweb:SmartControl id="scCompletedOn" BoundPropertyName="CompletedOn" DisplayCaption="true" DisplayType="ReadOnlyField" runat="server" />
    
    </asiweb:PanelTemplateColumn>
    
    <asiweb:PanelTemplateColumn ID="Column2" runat="server"> 
        <asiweb:SmartControl id="scStatus" BoundPropertyName="TaskItemStatusCode" DisplayCaption="true" runat="server" Width="345px" />
        <asiweb:SmartControl id="scPriority" BoundPropertyName="Priority" DisplayCaption="true" runat="server" Width="345px" />
        <asiweb:SmartControl id="scStartDate" BoundPropertyName="StartDate" DisplayCaption="true" runat="server" Width="345px" />
        <asiweb:SmartControl id="scDueDate" BoundPropertyName="DueDate" DisplayCaption="true" runat="server" Width="345px" />
        <asiweb:SmartControl id="scStatusDate" BoundPropertyName="StatusDate" DisplayCaption="true" DisplayType="ReadOnlyField" runat="server" Width="345px" />
        <%-- Removed with server comment.  This was part of the freedom code, but should not be exposed for this release
        <asiweb:SmartControl id="scNotifyCreator" BoundPropertyName="NotifyCreatorCode" DisplayCaption="true" runat="server">
        --%>
    </asiweb:PanelTemplateColumn>
    
    <asiweb:SmartControl id="scComment" BoundPropertyName="Comment" DisplayCaption="true" runat="server" />
    
</asiweb:PanelTemplateControl2>

