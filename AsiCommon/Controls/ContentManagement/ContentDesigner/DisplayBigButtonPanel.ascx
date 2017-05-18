<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_DisplayBigButtonPanel" Codebehind="DisplayBigButtonPanel.ascx.cs" %>
<asp:UpdatePanel ID="BigButtonUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" translate="yes">
    <ContentTemplate>           
        <div id="DivWrapper" runat="server" class="BigButtonWrapper">
            <asp:Image ID="BigButtonImage" runat="server" />
            <div id="DivRight" runat="server" class="BigButtonLinkList">       
                <asp:Repeater ID="LinkRepeater" runat="server" OnItemDataBound="LinkRepeaterItemDataBound">
                    <ItemTemplate>
                        <asiweb:BusinessHyperLink ID="Link" runat="server" Visible="true"/>
                        <asp:LinkButton ID="LinkButton" runat="server" CausesValidation="false" OnClick="LinkButtonOnClick" Visible="false" />                   
                        <asp:HiddenField ID="LinkButtonContactKey" runat="server" Visible="false"/>
                        <asp:HiddenField ID="LinkButtonLocationUrl" runat="server" Visible="false"/>                 
                        <asp:Literal runat="server" ID="linkBreak" Text="<br/>" Visible="true"/>                                           
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Panel ID="ErrorPanel" runat="server" Visible="false">
                    <asp:Label ID="ErrorMessage" runat="server" />
                </asp:Panel>        
            </div>
        </div> 
    </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
    //<![CDATA[
    function OnBehalfOfRefresh() {
        document.location.reload();
    }
    //]]>
</script>