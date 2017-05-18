<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WeightUomControl" Codebehind="WeightUom.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<INPUT id="uploadControl" type="file" runat="server" onkeyup="ToggleUploadButton();"
onclick="ToggleUploadButton();" onlosecapture="ToggleUploadButton();" 
onreadystatechange="ToggleUploadButton();"
onblur="ToggleUploadButton();" onmouseout="ToggleUploadButton();">
<asi:StyledButton id="UploadButton" Runat=Server Text=<%#ButtonText%>></asi:StyledButton>
<script language="javascript">
	var uploadButtonId = "<asp:Literal runat = server Text=<%#UploadButton.ClientID%>/>";
	var uploadControlId = "<asp:Literal runat=server Text=<%#uploadControl.ClientID%>/>";
	var uploadControl = document.getElementById(uploadControlId);
	var uploadButton = document.getElementById(uploadButtonId);
	var pathRegex = "^[a-z|A-Z]:...+";
	var regex = new RegExp(pathRegex);
	ToggleUploadButton();
	
	function ToggleUploadButton()
	{
		uploadButton.disabled = !uploadControl.value.match(regex);
	}
</script>
