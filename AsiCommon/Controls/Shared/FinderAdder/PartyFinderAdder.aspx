<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.FinderAdder.PartyFinderAdder" Codebehind="PartyFinderAdder.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="FinderAdder" Src="~/AsiCommon/Controls/Shared/FinderAdder/FinderAdder.ascx" %>

<asp:Content ContentPlaceHolderID="TemplateBody" id="MainContent" runat="server"> 
    <script type="text/javascript">
        //<![CDATA[
        function SelectAndReturnParty(partyId) {
            if (partyId != null) {
                var oWindow = GetRadWindow();
                oWindow.newContactKey = partyId;
                oWindow.result = partyId;
                oWindow.Close();
            }
        }
        //]]>
    </script>
    <div class="col-md-12"> 
        <uc1:FinderAdder id="FinderAdder1" runat="server" 
            AllowExport="true" 
            DialogModeShowStatus="true" 
            DialogMode="true" 
            OnNeedDataSource="FinderAdder1_NeedDataSource" 
            Lister-AddButtonText="Add New" 
            />       
        <div style="clear: both;"></div>
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Text="Recent Contacts" Collapsible="False" >
            <ul id="RecentItemList" runat="server" class="RecentHistoryList" translate="no">
                <asp:Repeater ID="LinkRepeater" runat="server" OnItemDataBound="LinkRepeaterItemDataBound">
                    <ItemTemplate>
                        <li class="RecentHistoryItem">
                            <asiweb:StyledHyperlink ID="Link" runat="server" Visible="true"></asiweb:StyledHyperlink>
                        </li>                    
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </asiweb:PanelTemplateControl2>
    </div> 
</asp:Content>