<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotificationLinkEdit.aspx.cs" Inherits="Asi.Web.iParts.Common.Tasks.NotificationLinkEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>
<asp:content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">   
    <asiweb:PanelTemplateControl2 ID="NavigationLinkPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">       
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LinkTargetLabel" AssociatedControlID="LinkTargetControl">Link target</asiweb:StyledLabel> 
            </div>
            <div class="PanelFieldValue InputXLargeWrapper">               
                <asiweb:BusinessDocumentBrowserControl AutoPostBack="False" Caption="Link target" DisplayCaption="true" ID="LinkTargetControl" PositionCaption="Left" Required="True" RootFolder="@/" runat="server" ShowAddress="false" TextBoxWidth="400"  />                                                                                       
            </div>
        </div>     
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" CssClass="Required" ID="LinkTextLabel" Text='<%# ResourceManager.GetPhrase("LinkText", "Link text")%>' EnableViewState="true" AssociatedControlID="LinkTextTextBox"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="LinkTextTextBox" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>
                <asiweb:AsiRequiredFieldValidator ID="AsiRequiredFieldValidator" runat="server" ControlToValidate="LinkTextTextBox"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>   
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="UrlParameterLabel" Text='<%# ResourceManager.GetPhrase("UrlParameter", "Url parameter")%>' EnableViewState="true" AssociatedControlID="UrlParameterTextBox"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox AutoPostBack="false" runat="server" ID="UrlParameterTextBox" DisplayCaption="False" RenderPanelField="False" ClientIDMode="Static" CssClass="WideTextBox"/>            
            </div>
        </div> 
        
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="SourceCodeLabel" Text="Source code" EnableViewState="true" AssociatedControlID="SourceCode"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessComboBox ID="SourceCode" runat="server" TranslateOnlyCaptionAndToolTip="true" RenderPanelField="True" AllowCustomText="false" DisplayCaption="False" PositionCaption="Left"
                    EnableLoadOnDemand="True" Filter="Contains" OnItemsRequested="SourceCodeItemsRequested" ShowNullItem="true" ClientIDMode="Static" />     
            </div>
        </div>
                               
        <div style="clear:both;"></div>       
    </asiweb:PanelTemplateControl2>    
    <script type="text/javascript">
        //<![CDATA[
        if (window.attachEvent) {
            window.attachEvent("onload", initDialog);
        }
        else if (window.addEventListener) {
            window.addEventListener("load", initDialog, false);
        }

        var linkUrl = jQuery("#<%=LinkTargetControl.ClientID%>_DocBrowserPath");      
        var linkName = document.getElementById("LinkTextTextBox");
        var linkParam = document.getElementById("UrlParameterTextBox");
        var linkParamValue = document.getElementById("SourceCode");

        var workLink = null;

        //Initialize the popup dialog if any values exist
        function initDialog() {
            //Return the arguments supplied from the parent page
            var args = GetRadWindow().Argument;
            var hrefString = jQuery(args.outerHTML);
            hrefString = hrefString.attr('href');
            if (hrefString != undefined) {
                if (hrefString.indexOf("[@]") >= 0) 
                    hrefString = "@/" + hrefString.substring(4).replace(".aspx", "");                  
                if (hrefString.indexOf("[~") >= 0)
                    hrefString = hrefString.replace("[","").replace("]","");

                linkUrl.val(hrefString);
            }
            linkName.value = args.innerHTML;
            workLink = args;
            
        }

        //Fires when the Ok button is clicked
        function insertLink() {
            //Create an object and set some custom properties to it            
            workLink.href = linkUrl.val();            
            workLink.name = linkName.value;
            workLink.qsParam = linkParam.value;

            if (linkParamValue.value) {
                workLink.sourceCode = linkParamValue.value;
            }
            
            GetRadWindow().close(workLink); //Use the close function of the getRadWindow to close the dialog and pass the arguments from the dialog to the callback function on the main page.
        }
        //]]>
    </script>      
</asp:content>