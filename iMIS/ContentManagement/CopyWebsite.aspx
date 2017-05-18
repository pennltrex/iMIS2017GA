<%@ Page Title="Copy Website" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="iMIS_ContentManagement_CopyWebsite" Codebehind="CopyWebsite.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="UserMessageDisplay" Src="~/AsiCommon/Controls/ContentManagement/UserMessageDisplay.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    
    <script type="text/javascript">
    //<![CDATA[
        function CopyWebsiteNameSaveButton_Click()
        {
            var fileNameField = $get('<%=CopyWebsiteName.ClientID%>');
            if (fileNameField)
            {
                var fileNameValue = fileNameField.value;
                if (fileNameValue != '' && fileNameValue != null)
                {
                    var oWindow = GetRadWindow();
                    oWindow.result = fileNameValue;                    
                }
            }
        }

        function CopyWebsiteNameCancelButton_click()
        {
            var oWindow = GetRadWindow();
            oWindow.result = '';
        }
                
    //]]>
    </script> 
    <asp:Panel id="Panel1" runat="server">
        <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" TemplateTitle="New website properties" BorderStyle="none" Collapsible="False">
            <asiweb:StyledLabel runat="server" ID="CopyWebsiteNameLabel" CssClass="Required" AssociatedControlID="CopyWebsiteName"></asiweb:StyledLabel>
            <asiweb:BusinessTextBox runat="server" id="CopyWebsiteName"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" style="font-weight:bold" id="CopyWebsiteNameRequiredValidator" ControlToValidate="CopyWebsiteName"></asiweb:AsiRequiredFieldValidator>
        </asiweb:PanelTemplateControl>
    </asp:Panel>

</asp:Content>
