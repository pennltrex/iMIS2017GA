<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostalCodeLookupDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.PostalCodeLookup.PostalCodeLookupDisplay" %>

<div id="<%#ClientID%>_PostalCodeLookup_Border" class="panel panel-border">
	<div class="panel-body">
		<label id="<%#ClientID%>_PostalCodeLookup_Label" for="<%#ClientID%>_PostalCodeLookup_PostalCode"><%=LookupLabelText %></label><input type="text" id="<%#ClientID%>_PostalCodeLookup_PostalCode" value="<%=postCode%>" maxlength="15" />
		<button id="<%#ClientID%>_PostalCodeLookup_Lookup" class="btn" onclick="postalCodeLookupClassInstance_<%#ClientID%>.SubmitPostalCode(event)"><%=SearchText %></button>
		<p id="<%#ClientID%>_PostalCodeLookup_NoResults" class="hidden AsiInformation"><%=NoResultsText %></p>
	</div>
	<div id="<%#ClientID%>_PostalCodeLookup_AddressOptions-Group" class="hidden panel-body">
		<select id="<%#ClientID%>_PostalCodeLookup_AddressOptions" onchange="postalCodeLookupClassInstance_<%#ClientID%>.SelectAddressTokenId(event,'<%=jsCallback%>')" style="max-width: 100%">
		</select>
	</div>
</div>
<div class="hidden" id="<%#ClientID%>_SearchInProgressText"><%=SearchInProgressText%></div>
<script type="text/javascript">
	//<![CDATA[
	var postalCodeLookupClassInstance_<%#ClientID%> = new PostalCodeLookupClass('<%#ClientID%>');
	postalCodeLookupClassInstance_<%#ClientID%>.ImisWebServerURL = '<%=ImisWebServerURL%>';
		postalCodeLookupClassInstance_<%#ClientID%>.jsClientId = '<%=jsClientId%>';

	jQuery(window).on('load', function () {
		var padding = parseInt(jQuery('#PostalCodeLookup_Border > div').css('padding'));
		var label = jQuery('#PostalCodeLookup_Label').outerWidth(true);
		var postCode = jQuery('#PostalCodeLookup_PostalCode').outerWidth(true);
		var button = jQuery('#PostalCodeLookup_Lookup').outerWidth(true);
		var minWidth = (padding * 3) + label + postCode + button;
		jQuery('#PostalCodeLookup_Border').css({ 'min-width': minWidth + 'px' });
	});
	//]]>
</script>
