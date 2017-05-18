<%@ Page language="c#" Inherits="Asi.WebRoot.iMIS.RapidGiftEntry.Admin.ContactEdit" Codebehind="ContactEdit.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="../Header.ascx" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script type="text/javascript">
	    var PopupObject;
    	
	    function Popup(object, title, url, height, width)
	    {

	        var top = window.top.outerHeight / 2 + window.top.screenY - (height / 2);
	        var left = window.top.outerWidth / 2 + window.top.screenX - (width / 2);

	        PopupObject = object;
		    var newurl = url;
	        newurl += (url.indexOf("?") > -1 ? "&" : "?") + "TemplateType=D";
	        if(websiteKey != '00000000-0000-0000-0000-000000000000')
	            newurl += "&WebsiteKey=" + websiteKey;
	        window.open(newurl, title, 'resizable=yes,scrollbars=yes,status=0,width=' + width + ',height=' + height + ', top=' + top + ', left=' + left);
	    }
    	
	    function PopupReturn(value)
	    {
		    var textBox = PopupObject.parentNode.getElementsByTagName("input");
		    textBox[0].value = value;
		    textBox[0].fireEvent('onchange');
	    }			
    </script>
    <asp:Panel ID="HeaderPanel" Runat="server">
	    <uc1:Header id="HeaderControl" runat="server"></uc1:Header>
        <asp:Label id="Msg" runat="server" ForeColor="red"></asp:Label>
    </asp:Panel>

    <asiweb:PanelTemplateControl2 ID="ContactInformationPanel" runat="server" TemplateTitle="Contact information" FieldSet="true">
	    <div class="PanelField">
	        <asp:label  id="CustomerTypeLabel" runat="server" text="Customer type" AssociatedControlID="CustomerType" />
	        <div class="PanelFieldValue">
	            <asp:dropdownlist id="CustomerType" runat="server" DataValueField="CustomerTypeCode" DataTextField="Description" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="PrefixCodeLabel" runat="server" text="Prefix" AssociatedControlID="PrefixCode" />
	        <div class="PanelFieldValue">
	            <asp:dropdownlist translate="no"  id="PrefixCode" runat="server" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="FirstNameLabel" runat="server" text="First" AssociatedControlID="FirstName" CssClass="Required" />
	        <div class="PanelFieldValue">
		        <asp:textbox id="FirstName" runat="server" Columns="25" MaxLength="20" />
		        <asiweb:RequiredFieldValidator runat="server" ControlToValidate="FirstName" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="MiddleNameLabel" runat="server" text="Middle" AssociatedControlID="MiddleName" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="MiddleName" runat="server" Columns="25" MaxLength="20" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="LastNameLabel" runat="server" text="Last" AssociatedControlID="LastName" CssClass="Required" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="LastName" runat="server" Columns="25" MaxLength="30" />
	            <asiweb:RequiredFieldValidator runat="server" ControlToValidate="LastName" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="InformalLabel" runat="server" text="Informal" AssociatedControlID="Informal" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="Informal" runat="server" Columns="25" MaxLength="30" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="SuffixCodeLabel" runat="server" text="Suffix" AssociatedControlID="SuffixCode" />
	        <div class="PanelFieldValue">
	            <asp:dropdownlist translate="no"  id="SuffixCode" runat="server" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="DesignationLabel" runat="server" text="Designations" AssociatedControlID="Designation" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="Designation" runat="server" Columns="25" MaxLength="30" />
	        </div>
	    </div> 
	    <div class="PanelField">
	        <asp:label id="InstituteContactIdLabel" runat="server" text="Institute ID" AssociatedControlID="InstituteContactId" />
	        <div class="PanelFieldValue AutoWidth">            
                <asp:textbox id="InstituteContactId" runat="server" Columns="10" MaxLength="10" ontextchanged="InstituteContactIdChanged" AutoPostBack="true" />			    
                <a onclick="return Popup(this, 'FindCompany', 'CompanyFinder.aspx?', 500, 600)" href="#">
                <asp:Image runat="server" SkinID="FindImage" /></a>
                <asp:label id="ContactNotFoundMessage" runat="server" text="ID not found" visible="false" />
			    <br/>
		        <asp:checkbox id="FlowdownCheckbox" runat="server" text="Flowdown" checked="true" TextAlign="Right" CssClass="FloatNone" />                               
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="InstituteNameLabel" runat="server" text="Institute name" AssociatedControlID="InstituteName" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="InstituteName" runat="server" Columns="40" MaxLength="80" CssClass="InputLarge" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="InstituteSortLabel" runat="server" text="Sort" AssociatedControlID="InstituteSort" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="InstituteSort" runat="server" Columns="40" MaxLength="80" CssClass="InputLarge"/>
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="TitleLabel" runat="server" text="Title" AssociatedControlID="ContactTitle" />
	        <div class="PanelFieldValue">
	            <asp:dropdownlist id="ContactTitle" runat="server" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="EmailAddressLabel" runat="server" text="E-mail" AssociatedControlID="EmailAddress" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="EmailAddress" runat="server" Columns="25" MaxLength="100" CssClass="InputLarge" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="DayPhoneLabel" runat="server" text="Work phone" AssociatedControlID="DayPhone" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="DayPhone" runat="server" MaxLength="20" Columns="25" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="EveningPhoneLabel" runat="server" text="Home phone" AssociatedControlID="EveningPhone" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="EveningPhone" runat="server" MaxLength="20" Columns="25" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="TollFreePhoneLabel" runat="server" text="Toll free phone" AssociatedControlID="TollFreePhone" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="TollFreePhone" runat="server" MaxLength="20" Columns="25" />
	        </div>
	    </div>
	    <div class="PanelField">
	        <asp:label id="FaxLabel" runat="server" text="Fax" AssociatedControlID="Fax" />
	        <div class="PanelFieldValue">
	            <asp:textbox id="Fax" runat="server" MaxLength="20" Columns="25" />
	        </div>
	    </div>
	</asiweb:PanelTemplateControl2>
	<asiweb:PanelTemplateControl2 ID="AddressPanel" runat="server" Collapsed="true" TemplateTitle="Primary address" FieldSet="true">
	    <div class="PanelField">
	        <asp:label id="Address1Label" runat="server" text="Address (1)" AssociatedControlID="Address1" />
	        <asp:textbox id="Address1" runat="server" Columns="25" MaxLength="40" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="Address2Label" runat="server" text="Address (2)" AssociatedControlID="Address2" />
	        <asp:textbox id="Address2" runat="server" Columns="25" MaxLength="40" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="Address3Label" runat="server" text="Address (3)" AssociatedControlID="Address3" />
	        <asp:textbox id="Address3" runat="server" Columns="25" MaxLength="40" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="TownLabel" runat="server" text="City" AssociatedControlID="City" />
	        <asp:textbox id="City" runat="server" Columns="25" MaxLength="40" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="StateProvinceLabel" runat="server" text="State/Prov" AssociatedControlID="StateProvince" />
	        <asp:dropdownlist id="StateProvince" runat="server" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="PostalCodeLabel" runat="server" text="Zip" AssociatedControlID="PostalCode" />
	        <asp:textbox id="PostalCode" runat="server" Columns="10" MaxLength="10" />
	    </div>
	    <div class="PanelField">
	        <asp:label id="CountryLabel" runat="server" text="Country" AssociatedControlID="Country" />
	        <asp:dropdownlist id="Country" runat="server" DataValueField="CountryName" DataTextField="CountryName" />
	    </div>
    </asiweb:PanelTemplateControl2>
    <asiweb:PanelTemplateControl2 ID="LoginPanel" runat="server" Collapsed="true" TemplateTitle="Login information" FieldSet="true">
        <div class="PanelField" runat="server" id="LoginIdRow">
            <asp:label id="WebLoginLabel" runat="server" text="Login ID" AssociatedControlID="WebLogin" />
            <div class="PanelFieldValue">
                <asp:textbox id="WebLogin" runat="server" Columns="25" MaxLength="30" />
					        <asp:CustomValidator id="WebLoginCustomValidator" runat="server" ControlToValidate="Password" OnServerValidate="WebLoginCustomValidator_ServerValidation" 
					            ErrorMessage="Required" />
            </div>
        </div>
        <div class="PanelField" runat="server" id="LoginPasswordRow">
            <asp:label id="PasswordLabel" runat="server" text="Password" AssociatedControlID="Password" />
            <div class="PanelFieldValue">
                <asp:TextBox class="DataEntry" id="Password" TextMode="Password" Columns="25" MaxLength="50" runat="server" />
					        <asp:CustomValidator id="PasswordCustomValidator" runat="server" ControlToValidate="WebLogin" OnServerValidate="PasswordCustomValidator_ServerValidation" 
					            ErrorMessage="Required" />
						    <asp:label id="PasswordSetLabel" Visible="False" runat="server" text="Password is set." />
            </div>
        </div>
        <div class="PanelField" runat="server" id="LoginConfirmPasswordRow">
            <asp:label id="ConfirmPasswordLabel" runat="server" text="Retype Password" AssociatedControlID="ConfirmPassword" />
            <div class="PanelFieldValue">
                <asp:TextBox class="DataEntry" id="ConfirmPassword" TextMode="Password" Columns="25" MaxLength="50" runat="server" />							
							<asp:CustomValidator id="ConfirmPasswordCustomValidator" runat="server" ControlToValidate="WebLogin" OnServerValidate="ConfirmPasswordCustomValidator_ServerValidation" 
					            ErrorMessage="Required" Display="Dynamic" />
					        <asp:CompareValidator runat="server" ControlToValidate="ConfirmPassword" ControlToCompare="Password" Type="String" EnableClientScript="True" ErrorMessage="Passwords must match." Display="Dynamic" />
            </div>
        </div>
    </asiweb:PanelTemplateControl2>
</asp:Content>
<asp:Content id="ButtonContent" runat="server" ContentPlaceHolderID="TemplateButtonBar">
    <asiweb:StyledButton id="SaveButton" runat="server" Text="Save" AccessKey="S" OnClick="SaveButtonOnClick" CssClass="PrimaryButton" style="float:right; margin-right: 20px;" />
</asp:Content>