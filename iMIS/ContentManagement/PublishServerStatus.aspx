<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="iMIS_ContentManagement_PublishServerStatus" Codebehind="PublishServerStatus.aspx.cs" %>

<asp:Content id="Content1" runat="Server" ContentPlaceHolderId="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="PanelTemplate" runat="server" Text="Pending requests">
        <table cellpadding="3" cellspacing="3" border="0" width="600px">
           <tr >
               <td valign="top" colspan="3">&nbsp;<b>Request</b></td>
               <td valign="top">&nbsp;&nbsp;&nbsp;<b>Priority</b></td>
            </tr>
        <asiweb:BusinessRepeater ID="PublishStatusRepeater" runat="server">
        <ItemTemplate>
            <asiweb:BusinessTextBox id="PublishRequestKey" runat="server" BoundPropertyName="PublishRequestKey" style="display:none;"></asiweb:BusinessTextBox>
            <tr>
                <td valign="top" colspan="3">
                    <asiweb:StyledImageButton ID="CancelButton" runat="server" IconStyle="Delete" AlternateText="Cancel request" CommandName="Cancel"/>&nbsp;
                    <asiweb:BusinessLabel ID="IndexLabel" runat="server"></asiweb:BusinessLabel>
                    <asiweb:BusinessLabel ID="RequestDateTimeLabel" runat="server" Text="Requested on"></asiweb:BusinessLabel>
                    <asiweb:BusinessLabel ID="RequestDateTime" runat="server"></asiweb:BusinessLabel>
                </td>
                <td valign="top">&nbsp;&nbsp;
                    <asiweb:BusinessDropDownList ID="PriorityList" runat="server" BoundPropertyName="PublishPriorityCode" DataSourceDocumentPath="$/ContentManagement/DefaultSystem/Queries/ValueList/PublishPriorityList" DataValueField="Code" DataTextField="Description" CommandName="PriorityChanged"></asiweb:BusinessDropDownList>
                </td>
            </tr>
            <tr>
                <td  valign="top" colspan="3">
                    <asp:Image ID="ProgressBar" runat="server" SkinID="ProgressBar" CssClass="PublishServerStatusProgressBar" /><br />
                    (<asiweb:BusinessLabel ID="PublishPercentage" runat="server"></asiweb:BusinessLabel>&nbsp;<asiweb:BusinessLabel ID="PublishedCount" runat="Server"></asiweb:BusinessLabel>/<asiweb:BusinessLabel ID="TotalCount" runat="Server"></asiweb:BusinessLabel>;&nbsp;<asiweb:BusinessLabel ID="ErrorCountLabel" runat="server" Text="Errors:"></asiweb:BusinessLabel> <asiweb:BusinessLabel ID="ErrorLabel" runat="server"></asiweb:BusinessLabel>)
                </td>
                <td valign="top">&nbsp;</td>
            </tr>
        </ItemTemplate>
        <EmptyTemplate>
            <%= Asi.ResourceManager.GetPhrase("NoPendingPublishRequests", "There are no pending publish requests.") %>
        </EmptyTemplate>
        </asiweb:BusinessRepeater>
        </table>
    </asiweb:PanelTemplateControl2>
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Text="Recent completed requests" Collapsed="true">
        <table cellpadding="3" cellspacing="3" border="0" width="600px">
        <asiweb:BusinessRepeater ID="CompletedRequestRepeater" runat="server">
        <ItemTemplate>
            <tr>
                <td rowspan="3" valign="top">
                    <asiweb:BusinessLabel ID="IndexLabel" runat="server"></asiweb:BusinessLabel>
                </td>
                <td>
                    <asiweb:BusinessLabel ID="RequestDateTimeLabel" runat="server" Text="Requested on"></asiweb:BusinessLabel> <asiweb:BusinessLabel ID="RequestDateTime" runat="server"></asiweb:BusinessLabel> 
                    <asiweb:BusinessLabel ID="RequestUserLabel" runat="server" Text="by"></asiweb:BusinessLabel> <asiweb:BusinessLabel ID="RequestUser" runat="server"></asiweb:BusinessLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <asiweb:BusinessLabel ID="RequestPublishPathLabel" runat="server" Text="Path:"></asiweb:BusinessLabel> <asiweb:BusinessLabel ID="RequestPublishPath" runat="server"></asiweb:BusinessLabel>
                </td>
            </tr>
            <tr>
            <td>
                <asiweb:BusinessLabel ID="PublishDateTimeLabel" runat="server" Text="Published on"></asiweb:BusinessLabel> <asiweb:BusinessLabel ID="PublishDateTime" runat="server"></asiweb:BusinessLabel>
                (<asiweb:BusinessLabel ID="PublishPercentage" runat="server"></asiweb:BusinessLabel>
                 <asiweb:BusinessLabel ID="PublishedCount" runat="Server"></asiweb:BusinessLabel>/<asiweb:BusinessLabel ID="TotalCount" runat="Server"></asiweb:BusinessLabel>; 
                <asiweb:BusinessLabel ID="CanceledCountLabel" runat="server" Text="Canceled:"></asiweb:BusinessLabel> 
                <asiweb:BusinessLabel ID="CanceledCount" runat="server"></asiweb:BusinessLabel>
                <asiweb:BusinessLabel ID="ErrorCountLabel" runat="server" Text="Errors:"></asiweb:BusinessLabel> 
                <asiweb:BusinessLabel ID="ErrorLabel" runat="server"></asiweb:BusinessLabel>)<br /><br />
            </td>
           </tr>
        </ItemTemplate>
        <EmptyTemplate>
            <%= Asi.ResourceManager.GetPhrase("NoCompletedPublishRequests", "There are no completed publish requests.") %>
        </EmptyTemplate>
        </asiweb:BusinessRepeater>
        </table>
    </asiweb:PanelTemplateControl2>
</asp:Content>