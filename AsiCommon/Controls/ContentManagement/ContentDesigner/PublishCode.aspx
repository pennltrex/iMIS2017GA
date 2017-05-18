<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Deploy Content Items" CodeBehind="PublishCode.aspx.cs" Inherits="Asi.WebAppRoot.AsiCommon.Controls.ContentManagement.ContentDesigner.PublishCode" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl3" runat="server" FieldSet="true" TemplateTitle="Deploy Content Items" BorderStyle="None">
            <div>This will take zipped Content Items uploaded to the document system and deploy them to the webserver. This is done automatically when the webserver first starts but can be performed on demand on here.</div>
            <br />
            <asp:Button runat="server" ID="btnRunPublishCode" Text="Deploy Content Items" OnClick="PublishCode_Click"/>
            <asp:RadioButton GroupName="OptionGroup" ID="DisplayOptionShowSummary" runat="server" Text="Show Summary" Checked="true" />
            <asp:RadioButton GroupName="OptionGroup"  ID="DisplayOptionShowDetail" runat="server" Text="Show Detail"/>
            <asp:BulletedList id="PublishList" runat="server" class="list-group">
            </asp:BulletedList>
            <br />
            <asp:Label CssClass="AsiWarning" runat="server" ID="MessageLabel" Visible="false"></asp:Label>
        </asiweb:PanelTemplateControl2>
</asp:Content>