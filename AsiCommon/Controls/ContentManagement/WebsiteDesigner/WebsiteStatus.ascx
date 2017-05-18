<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_WebsiteStatus" Codebehind="WebsiteStatus.ascx.cs" %>
<script runat="server">  
    protected void Page_Load(object sender, EventArgs e)
    {
        WebsiteRootUrlDisplay.Visible = true;
        if (WebsiteRootUrlDisplay.Text.Length == 0)
            WebsiteRootUrlDisplay.Visible = false;
    }
</script>

<div class="AutoWidth">
   <asiweb:SmartControl ID="WebsiteIsActive" runat="server" BoundPropertyName="IsActive" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
</div>
<asiweb:SmartControl ID="UpdatedBy" runat="server" BoundPropertyName="UpdatedByUserKey" DisplayCaption="true" DisplayType="ReadOnlyField"></asiweb:SmartControl>
<asiweb:SmartControl ID="UpdatedOn" runat="server" BoundPropertyName="UpdatedOn" DisplayCaption="true" DisplayType="ReadOnlyField"></asiweb:SmartControl>
<asiweb:SmartControl ID="CreatedBy" runat="server" BoundPropertyName="CreatedByUserKey" DisplayCaption="true" DisplayType="ReadOnlyField"></asiweb:SmartControl>
<asiweb:SmartControl ID="CreatedOn" runat="server" BoundPropertyName="CreatedOn" DisplayCaption="true" DisplayType="ReadOnlyField"></asiweb:SmartControl>
<asiweb:SmartControl ID="WebsiteRootUrlDisplay" runat="server" BoundPropertyName="WebsiteLink" DisplayCaption="true" DisplayType="ReadOnlyField" OnClientMouseDown="this.target='_blank'"></asiweb:SmartControl>