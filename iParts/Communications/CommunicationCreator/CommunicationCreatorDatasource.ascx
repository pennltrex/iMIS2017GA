<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationCreatorDatasource.ascx.cs" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.CommunicationCreatorDatasource" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<h2><%=PageTitle%></h2>
<div class="AsiMessage" runat="server" ID="QueryWarningMessage" Visible="False" translate="yes">
   <div id="Div1" class="AsiWarning" runat="server">
      <asp:Image ID="UserWarningIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
      <div runat="server" ID="QueryWarning"></div>
   </div>       
</div>
<br />
<asiweb:BusinessDocumentBrowserControl runat="server" Caption="Query" DisplayCaption="True" PositionCaption="Left" Required="True" TextBoxWidth="350px"
    ID="QuerySelector" DocumentTypesAllowed="IQD" AutoPostBack="true" RenderPanelField="True" translate="Yes" DocumentHierarchyPath="$/Common/Communications/Queries">
</asiweb:BusinessDocumentBrowserControl>

<asp:label id="QueryPathErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:label>
<div runat="server"  id="DivListers" Visible="True">
    <%-- Two separate divs for our lister to avoid view state problems when we change from a query that supports a select column to one that does not, or vice versa --%>
    <div runat="server" id="DivListerWithSelect" visible="False">
        <%-- We programatically created a Lister2 here --%>
    </div>
    <div runat="server" id="DivListerWithoutSelect" visible="False">
     <%-- We programatically created a Lister2 here --%>
    </div>
</div>
<div runat="server" id="PartyNameDisplay" Visible="False"></div>
<div runat="server" id="DivNoData" visible="False">
    There is no data to display.
</div>
<br />
<div style="float: right;">
    <asp:LinkButton runat="server" ID="ButtonModeSwitchLink" OnClick="ButtonModeSwitchOnClick" Text="" CausesValidation="False" />
</div>
<div style="clear: both;"></div>
