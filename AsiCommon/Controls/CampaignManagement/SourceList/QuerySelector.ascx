<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_QuerySelector" Codebehind="QuerySelector.ascx.cs" %>
<%@ Register TagName="ObjectBrowser" TagPrefix="boa" Src="~/AsiCommon/Controls/BSA/objectbrowser2.ascx"%>

<div style="width:95%; height: auto;">
    <boa:ObjectBrowser runat="server" ID="ObjectBrowserControl" 
        DocumentPath="$/Common/Shared Documents" Mode="SelectContent" ShowSummary="false"  
        Text="Select a Query" TypeFilter="FOL,IQD" DoubleClickAction="SelectAndReturnValue" />
</div>
