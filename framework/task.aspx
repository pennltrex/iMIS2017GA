<%@ Page language="c#" AutoEventWireup="false" MasterPageFile="~/framework/framework.master" Title="Medina Task" %>

<asp:Content ID="HeadContent" runat="server" ContentPlaceHolderID="TemplateHead">
    <style type="text/css">
        body
        {
            MARGIN-LEFT:5px;
            MARGIN-TOP:5px;
            MARGIN-BOTTOM:5px;
            MARGIN-RIGHT:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <span style="height:18px" id="mainTitle">
        <span id="mainTitleLeft">&nbsp;</span>
        <span id="mainTitleLeftText"><span id="TaskDescription">&nbsp;</span>&nbsp;<span id="TaskDescription2">&nbsp;</span></span>
        <span id="mainTitleRight">&nbsp;</span>
        <span id="mainTitleRightText"></span>
    </span>
</asp:Content>
