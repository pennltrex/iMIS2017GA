<%@ Page Title="Find a Contact" language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.ContactFinder" Codebehind="ContactFinder.aspx.cs" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="ContactFinderPanel" runat="server" TemplateTitle="Find a contact" Collapsible="false" FieldSet="true">
    	<asp:Label id="ErrorMessageLabel" runat="server" class="iMISUserMessage" />
    	<asiweb:PanelTemplateColumn ID="Column1" runat="server">
    	    <div class="PanelField">
    	        <asp:Label id="CustomerIdPrompt" runat="server" AssociatedControlID="CustomerId">Customer ID</asp:Label>
    	        <asp:TextBox id="CustomerId" runat="server"></asp:TextBox>
    	    </div>
    	    <div class="PanelField">
    	        <asp:Label id="FirstNamePrompt" runat="server" AssociatedControlID="FirstName">First name</asp:Label>
    	        <asp:TextBox id="FirstName" runat="server"></asp:TextBox>
    	    </div>
    	</asiweb:PanelTemplateColumn>
    	<asiweb:PanelTemplateColumn ID="Column2" runat="server">
    	    <div class="PanelField">
    	        <asp:Label id="CompanyNamePrompt" runat="server" AssociatedControlID="CompanyName">Company name</asp:Label>
    	        <asp:TextBox id="CompanyName" runat="server"></asp:TextBox>
    	    </div>
    	    <div class="PanelField">
    	        <asp:Label id="LastNamePrompt" runat="server" AssociatedControlID="LastName">Last name</asp:Label>
    	        <asp:TextBox id="LastName" runat="server"></asp:TextBox>
    	    </div>
    	</asiweb:PanelTemplateColumn>
        <asiweb:StyledButton id="FindButton" runat="server" Text="Find" cssclass="PrimaryButton" OnClick="FindButton_Click" />
	    <asiweb:BusinessDataGrid SkinID="StandardGrid" id="FindResults" Visible="False" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" runat="server" Width="98%">
		    <Columns>
			    <asp:TemplateColumn  HeaderText="Contact ID">
			        <ItemTemplate>
			          <asp:HyperLink id="link" runat="server"></asp:HyperLink>
			        </ItemTemplate>
			    </asp:TemplateColumn>					
			    <asp:BoundColumn DataField="LastName" DataFormatString="{0:c}" HeaderText="Last Name" SortExpression="LastName" />
			    <asp:BoundColumn DataField="FirstName" DataFormatString="{0:c}" HeaderText="First Name" SortExpression="FirstName" />
			    <asp:BoundColumn DataField="InstituteName" DataFormatString="{0:c}" HeaderText="Institute Name" />
		    </Columns>
	    </asiweb:BusinessDataGrid>
	    <asp:Label id="NoMatchLabel" Visible="False" runat="server">We're sorry.  No contacts matched your search criteria.</asp:Label>
    </asiweb:PanelTemplateControl2>
</asp:Content>