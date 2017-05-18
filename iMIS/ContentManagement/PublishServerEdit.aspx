<%@ Page Language="C#" Inherits="Asi.Web.UI.ContentManagement.PublishServerEdit" MasterPageFile="~/Templates/MasterPages/empty.master" Codebehind="PublishServerEdit.aspx.cs" %>
<asp:Content id="Content1" runat="server" ContentPlaceholderId="TemplateBody">
    <asiweb:PanelTemplateControl id="PanelTemplate1" TemplateTitle="Publishing server properties" runat="server" FieldSet="true" Collapsible="False" BorderStyle="None">       
	    <div class="AsiMessage">
		    <ul>
			    <li class="AsiWarning">Important: If you change this definition, you must stop and restart the application pool associated with ASIScheduler.</li>
		    </ul>
	    </div>       
        <asiweb:SmartControl ID="Description" runat="server" BoundPropertyName="Description" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper"/>       
        <asiweb:SmartControl ID="Code" runat="server" BoundPropertyName="Code" DisplayCaption="true" InputFieldCssClass="InputSmallWrapper"></asiweb:SmartControl>       
        <asiweb:SmartControl ID="LocalPublishPaht" runat="server" BoundPropertyName="LocalPublishPath" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper">
            <asp:Label ID="LocalPublishPathExample" runat="server" Text="(e.g., C:\Program Files\ASI\iMIS\Net)" CssClass="Info"></asp:Label>
        </asiweb:SmartControl>       
        <asiweb:SmartControl ID="LocalProtectedPath" runat="server" BoundPropertyName="LocalProtectedPath" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper">
            <asp:Label ID="LocalProtectedPathExample" runat="server" Text="(e.g., C:\Program Files\ASI\iMIS\IndexServiceProtected)" CssClass="Info"></asp:Label>
        </asiweb:SmartControl>       
        <asiweb:SmartControl ID="ServerIPAddressBox" runat="server" BoundPropertyName="ServerIPAddress" DisplayCaption="true" />       
        <asiweb:SmartControl ID="AlternateIPAddressBox" runat="server" BoundPropertyName="AlternateServerIPAddress" DisplayCaption="true" />       
        <asiweb:SmartControl ID="FrequencyBox" runat="server" BoundPropertyName="Frequency" DisplayCaption="true" MinValue="0" InputFieldCssClass="InputSmallWrapper"/>      
        <asiweb:SmartControl ID="PublishingSpeedBox" runat="server" BoundPropertyName="PublishingSpeed" DisplayCaption="true" MinValue="0" InputFieldCssClass="InputSmallWrapper"/>           
    </asiweb:PanelTemplateControl>
    <asiweb:PanelTemplateControl ID="IISSecurityPanel" runat="server" TemplateTitle="IIS security" FieldSet="true" Collapsed="true" BorderStyle="None">            
	    <div class="AsiMessage">
		    <ul>
			    <li class="AsiInformation">If the web server uses IIS security to protect content, please enter the login information that will give access to the site.</li>
		    </ul>
	    </div>          
        <asiweb:SmartControl ID="UserNameControl" runat="server" BoundPropertyName="IISSecurityUserName" DisplayCaption="true" PositionCaption="Left" />
        <asiweb:SmartControl ID="PasswordControl" runat="server" BoundPropertyName="IISSecurityPassword" DisplayCaption="true" PositionCaption="Left" />
        <asiweb:SmartControl ID="DomainControl" runat="server" BoundPropertyName="IISSecurityDomain" DisplayCaption="true" PositionCaption="Left" />
    </asiweb:PanelTemplateControl>
</asp:Content>