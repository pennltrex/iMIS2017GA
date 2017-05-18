<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactCommunitiesDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactCommunities.ContactCommunitiesDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true">

    <asp:Label ID="designMode" runat="server" Visible="false" CssClass="Information" />
         
    <asiweb:TitleBar ID="pageCaption" runat="server" Visible="false" CssClass="TitleBarCaption" />  
      
    <asiweb:StyledLabel ID="noRecordsMessage" Text='<%#NotSubscribedMessage %>' Visible="False" runat="server" translate="yes"/>

    <asiweb:Lister2 ID="contactCommunitiesLister" runat="server"
    AjaxEnabled="false"
    EditColumnLocation="None" 
    DeleteColumnLocation="None"
    EnableClientSideDelete="false"
    SelectColumnLocation="None"
    DataKeyNames="CommunityDocumentKey" 
    OnNeedDataSource="SubscriptionsNeedDataSource" 
    TargetUrlKeyParameterName="iUniformKey"
    OnItemDataBound="SubscriptionsListerOnItemDataBound"
    TargetUrl="~/iCore/Communities/CommunityLayouts/CommunityNewsFeed.aspx"       
    LinkProperty="Community"
    EnableTheming="false"
    LinkPropertyTargetBehavior="SameWindow"
    BorderStyle="None"
    PagerPosition="Bottom"
    AllowGridRowSelectStyle="false"
    EnableEmbeddedGridSkin="false"
    HeaderVisible="false"
    DisplayPropertiesList="Community"
    DisplayPropertiesTitleOverride="Community"
    PagingEnabled="true"
    PagerMode="Simple"
    ExportButtonLocation="None" 
    BorderWidth="0"
    Wrap="true"
    CssClass="SimpleGrid"
    RefreshButtonImageUrl="about:blank"
    /> 
   
</asp:Panel>
<div runat="server" id="DivErrors" visible="false">
                <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" />
            </div>