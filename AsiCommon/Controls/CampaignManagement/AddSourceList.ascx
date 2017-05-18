<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_AddSourceList" Codebehind="AddSourceList.ascx.cs" %>
<script type="text/javascript">
function BSABrowserCallback(window)
{
    if (!window.result)
        return;
    document.getElementById("<%#QueryKey.ClientID%>").value = window.result;
    document.getElementById("<%#AddQueryButton.ClientID%>").click();
}
function OnAddClick()
{
  OpenObjectBrowser('iTypeFilter=IQD,FOL&amp;iAllowFolderSelect=0',BSABrowserCallback)
  event.returnValue = false;
  return false;
   
}
</script>
<table>
<tr>
    <td class="PanelTablePrompt"><asiweb:SmartControl ID="OriginTypeCaption" runat="server" BoundPropertyName="OriginListType" DisplayType="Caption" BoundBusinessItem="<%#SourceList%>"/></td>
    <td class="PanelTableValue"><asiweb:SmartControl ID="OriginTypeInput" runat="server" BoundPropertyName="OriginListType" DisplayType="EditableField"  BoundBusinessItem="<%#SourceList%>" /></td>
</tr>
<tr>
    <td class="PanelTablePrompt"></td>
    <td class="PanelTableValue"></td>
    
</tr>
<asp:HiddenField runat="server" ID="QueryKey" />
<asp:Button runat="server" ID="AddQueryButton" style="visibility:hidden;" />
</table>