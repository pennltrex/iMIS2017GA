<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMRankings" Codebehind="RFMRankings.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asiweb:PanelTemplateControl ID="DefinitionPanel" runat="server" FieldSet="true" ShowHeader="false" Collapsible="false">

    <asiweb:PanelTemplateColumn runat="server" ID="RFMDefLeftCol" Width="50%">
        <div id="Rankings" class="PanelField">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel ID="lblRange" runat="server" RenderPanelField="true" DisplayCaption="true" />
            </div>
            <div class="PanelFieldValue">
                <asp:radiobuttonlist id="rblRange" runat="server" autopostback="True" repeatdirection="Horizontal" onselectedindexchanged="StatusChanged"></asp:radiobuttonlist>
            </div>
	    </div>
        <asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder>
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>