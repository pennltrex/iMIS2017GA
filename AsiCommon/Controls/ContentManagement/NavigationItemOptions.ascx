<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="AsiCommon_Controls_ContentManagement_NavigationItemOptions" Codebehind="NavigationItemOptions.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ShowHeader="False" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="20em" ValueWidth="30px">
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="OpenInNewWindowBox" runat="server" BoundPropertyName="OpenInNewWindowFlag" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="UseHttpsBox" runat="Server" BoundPropertyName="IsHTTPS" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="NavigationItemHomePageBox" runat="server" BoundPropertyName="IsHomePage" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="NavigationItemActiveBox" runat="server" BoundPropertyName="IsActive" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="NavigationItemHiddenBox" runat="Server" BoundPropertyName="IsHidden" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="NavigationItemExpandedBox" runat="server" BoundPropertyName="IsExpandedByDefault" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
        <asiweb:SmartControl InputFieldStyle="width:20px;" ID="NavigationItemUnAuthenticatedOnlyBox" runat="server" BoundPropertyName="IsUnAuthenticatedOnly" DisplayCaption="true" PositionCaption="Right" RenderPanelField="True" />
    </asiweb:PanelTemplateColumn>
    <asiweb:PanelTemplateColumn ID="Column2" runat="server" LabelWidth="60%">
        <div class="PanelField Top">            
            <asp:Label ID="AlwaysShowLabel" runat="server" AssociatedControlID="NavigationPaneList"/>            
            <div class="SubItems AutoWidth FloatNone">
                <asp:CheckBoxList RepeatLayout="Table" ID="NavigationPaneList" runat="server" style="margin-left:10px; float:none;" Visible="true">
                    <asp:ListItem Text="Inherit from Parent" Value="" Enabled="false" Selected="true"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>
