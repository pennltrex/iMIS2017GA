<%@ Page Title="Find a Company" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.CompanyFinder" Codebehind="CompanyFinder.aspx.cs" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="ContactFinderPanel" runat="server" TemplateTitle="Find a company" Collapsible="false" FieldSet="true">
        <div class="PanelField">
            <asp:Label id="CompanyNamePrompt" runat="server" AssociatedControlID="CompanyName" style="width: 10em !important;">Company name</asp:Label>
            <div class="PanelFieldValue AutoWidth">
                <asp:TextBox id="CompanyName" runat="server"></asp:TextBox>
		        <asiweb:StyledButton id="FindButton" runat="server" Text="Find" onclick="FindButton_Click" />
            </div>
        </div>
	    <asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" Visible="False" AutoGenerateColumns="False" runat="server" Width="98%">
		    <Columns>
		    <asp:TemplateColumn  HeaderText="ID">
			        <ItemTemplate>
			          <asp:HyperLink id="link" runat="server"></asp:HyperLink>
			        </ItemTemplate>
			    </asp:TemplateColumn>
			    <asp:BoundColumn DataField="InstituteName" DataFormatString="{0:c}" HeaderText="Institute Name" />
		    </Columns>
	    </asiweb:BusinessDataGrid>
	    <asp:Label id="NoMatchLabel" Visible="False" runat="server">No companies matched your search criteria.</asp:Label>
    </asiweb:PanelTemplateControl2>
</asp:Content>