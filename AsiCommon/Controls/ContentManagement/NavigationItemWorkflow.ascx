<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_NavigationItemWorkflow" Codebehind="NavigationItemWorkflow.ascx.cs" %>

<asiweb:SmartControl ID="RemoveAfterDaysBox" runat="server" BoundPropertyName="WorkflowRemoveAfterDays" DisplayCaption="true" UnitText="days" AutoPostBack="true" OnDataChange="RemoveAfterDaysBox_DataChange" PositionCaption="Top" />
<asiweb:SmartControl ID="NotifyContactList" runat="server" BoundPropertyName="WorkflowNotifyContactKey" DisplayCaption="true" PositionCaption="Top" />
