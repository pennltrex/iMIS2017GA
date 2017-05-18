<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.TagBrowser" Codebehind="TagBrowser.ascx.cs" %>
<%@ Register Src="TagEdit.ascx" TagName="TagEdit" TagPrefix="uc1" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/BusinessTree/BusinessTree.ascx" TagName="BusinessTree" TagPrefix="uc2" %>

<asp:Panel ID="BrowserPanel" runat="server" CssClass="TagBrowserWrapper">
    <asp:Panel id="Panel1" runat="server">
        <asp:UpdatePanel ID="TreeUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <uc2:BusinessTree ID="TagTree" ShowDeleteButton="true" ShowNewButton="true" RadMenuCssOverride="float:none !Important"  
                ShowResetButton="false" CheckBoxes="false" ShowOkCancelButtons="false" DragAndDrop="true"
                runat="server" ShowExportButton="true" ShowImportButton="true" OnExportClicked="BusinessTree_Export"></uc2:BusinessTree>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="TagEdit1" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>

    <div style="float:right;width:74%;">

        <asp:Panel id="TagPane" runat="server">
            <asp:UpdatePanel ID="TagUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <uc1:TagEdit ID="TagEdit1" runat="server"></uc1:TagEdit>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="TagTree" />
                </Triggers>
           </asp:UpdatePanel>
        </asp:Panel>

    </div>

    <div style="clear:both"></div>

</asp:Panel>