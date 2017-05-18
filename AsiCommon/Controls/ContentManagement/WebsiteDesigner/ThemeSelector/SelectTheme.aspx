<%@ Page AutoEventWireup="true" CodeBehind="SelectTheme.aspx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.ContentManagement.WebsiteDesigner.ThemeSelector.SelectTheme" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">        
    <section class="theme-section"> 
        <asp:Repeater ID="ThemeRepeater" runat="server" OnItemDataBound="ThemeThumbsRepeaterItemDataBound">
            <ItemTemplate>
            <div class="theme-item">          
                <asp:ImageButton CssClass="theme-image" ID="ThemeThumbnail" runat="server" />           
                <asp:Panel CssClass="theme-caption" ID="ThemeThumbnailPanel" runat="server">
                    <h3 class="theme-title"><asp:Label runat="server" ID="ThemeDescription" CssClass="theme-title" translate="no" /></h3>
                    <asp:Label runat="server" ID="ThemeDetails" CssClass="theme-details"></asp:Label>			            
                </asp:Panel>	        
		    </div>                                           
            </ItemTemplate>
        </asp:Repeater>
    </section>
    <script type="text/javascript">
    function ReturnValue(templateName) {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        oWindow.result = templateName;
        oWindow.Close();
    }
    </script>
</asp:Content>