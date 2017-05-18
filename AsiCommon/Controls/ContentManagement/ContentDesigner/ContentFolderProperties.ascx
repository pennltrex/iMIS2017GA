<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentFolderProperties" Codebehind="ContentFolderProperties.ascx.cs" %>

<asiweb:SmartControl ID="Title" runat="server" BoundPropertyName="Title" DisplayCaption="true" />
<asiweb:SmartControl ID="FolderName" runat="server" BoundPropertyName="Name" DisplayCaption="true" />
<asiweb:SmartControl ID="DefaultWebsite" runat="server" BoundPropertyName="DefaultWebsiteKey" DisplayCaption="true" AutoPostBack="True"/>
<asiweb:SmartControl ID="AdditionalWebsites" runat="server" BoundPropertyName="AdditionalWebsiteKeys" DisplayCaption="true" PositionCaption="Left" AutoPostBack="True"/>           
<div class="AutoWidth">
<asiweb:SmartControl InputFieldStyle="width:20px" ID="DefaultWebsiteAlwaysDisplay" runat="server" BoundPropertyName="DefaultWebsiteAlwaysDisplay" DisplayCaption="true" PositionCaption="Right" />
</div>
<asiweb:SmartControl ID="PublishingServerOption" runat="server" BoundPropertyName="PublishingServerOption" DisplayCaption="true" AutoPostBack="true" ListSearchEnabled="false" />
<asiweb:SmartControl ID="PublishingServers" runat="server" BoundPropertyName="PublishingServerKeys" Visible="false" />
<%--<asiweb:SmartControl ID="ContentArea" runat="server" BoundPropertyName="ContentArea" DisplayCaption="true" PositionCaption="Left" />--%>

<script type="text/javascript">
    var matchPublishFileNameToTitle = new AsiWebControls.MatchTextBehavior('<%= FolderName.ClientID %>_TextField', '<%= Title.ClientID %>_TextField', "<%# string.IsNullOrEmpty(ContentFolder.Name) %>" == "True", '<%# Asi.Business.ContentManagement.Navigation.FolderNameConvertRegularExpression %>');
    matchPublishFileNameToTitle.initialize();
    //for some reason remove link showing up initially so forcibly hiding it
    var defaultWebsite = $get("<%#DefaultWebsite.ClientID%>_Finder_FinderLabel");
    var removeLink = $get("<%#DefaultWebsite.ClientID%>_ctl01");
    if (defaultWebsite != null && removeLink != null) {
        if (defaultWebsite.innerHTML == "<i>(No website selected)</i>")
            removeLink.Text = removeLink.innerHTML = "";
        else
            removeLink.Text = removeLink.innerHTML = "remove";
    }
</script>