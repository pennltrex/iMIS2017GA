<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.Bob.ObjectAutoGen" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ObjectAutoGen.ascx.cs" %>

<div style="width:99%;">
    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"/>
    <h2><asp:Label id="lblUDObjectGeneration" runat="server" /></h2>   
    <div style="float:right;">
        <asiweb:StyledButton ID="btnCreate" runat="server" ShowWaitDialog="true" />
    </div><br/>
    <span class="mdTitle">
        <asp:Label id="lblResults" Runat="server" />
    </span>
    <asp:TextBox id="txtResults" Runat="server" TextMode="MultiLine" Width="100%" Height="300px" ReadOnly="True"/>
</div>