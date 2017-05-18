<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TaskTop.ascx.cs" Inherits="Asi.Web.UI.Common.Tasks.TaskTop" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asp:Image ImageUrl="~/AsiCommon/Images/32/32_opp_mgmt.gif" alt='<%= Asi.ResourceManager.GetPhrase("TaskEditor","Task Editor") %>' align='absMiddle'>&nbsp;
<asp:label id="lblName" runat="server" width="100%"></asp:label>
