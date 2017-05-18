<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceCodeListItem" Codebehind="SourceCodeListItem.ascx.cs" %>
    <td>
        <div style="float:left;white-space:nowrap;">
            <asiweb:StyledHyperlink ID="SelectLink" runat="server" NavigateFromTemplateUrl="?ContentCode=CM.SourceCode&iUniformKey={0}" ToolTip="Edit Item" Text="select" Style="float:left;margin-right:10px;" translate="yes"/>
            <asiweb:SmartControl ID="Code" runat="server" BoundPropertyName="Code" DisplayType="ReadOnlyField" DisableDefaultCssClass="true" />
        </div>
    </td>
    <td colspan="2"><asp:Repeater runat="server" ID="SegmentsRepeater" DataSource="<%#GetSourceLists()%>"><ItemTemplate><%#Eval("DisplayText")%></ItemTemplate><SeparatorTemplate>,</SeparatorTemplate></asp:Repeater></td>
    <td><asiweb:SmartControl ID="FirstResponseDate" runat="server" BoundPropertyName="FirstResponseDate" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl ID="LastDropDate" runat="server" BoundPropertyName="LastDropDate" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl ID="SmartControl1" runat="server" BoundPropertyName="SourceCodeTypeCode" DisplayType="ReadOnlyField" /></td>
    <td><asiweb:SmartControl ID="SmartControl2" runat="server" BoundPropertyName="MemberObjectType" DisplayType="ReadOnlyField" /></td>   
    <td><asiweb:SmartControl ID="SourceCodeStatusCode" runat="server" BoundPropertyName="SourceCodeStatusCode" DisplayType="ReadOnlyField" translate="yes"/></td>
