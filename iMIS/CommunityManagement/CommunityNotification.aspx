<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Business.CommunityManagement" %>
<%@ Register TagName="CommentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentList.ascx" %>

<script runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        PostedByControl.BoundAtom = CommunityDocument;
        PostedDateControl.BoundAtom = CommunityDocument;
    }
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        
        if (!IsPostBack)
            DataBind();
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        if (PostedByControl.BoundAtomProperty.HasForeignReference)
            PostedByControl.Text = PostedByControl.BoundAtomProperty.GetForeignObjectDisplayValue(PostedByControl.BoundAtom);

        Guid hierarchyKey = CommunityDocument.GetCommunityContentHierarchyKey(CommunityDocumentType.Comment, CommunityDocument.AtomKey);
        int commentCount = CommunityDocument.GetCommunityDocumentCount(
            hierarchyKey,
            CommunityDocumentType.Comment,
            CommunityDocumentRetrievalRecursionType.One,
            StatefulBusinessContainer);
        // Check for new comments since the last time the user was active.
        if (Asi.Security.AppPrincipal.CurrentIdentity.IsAuthenticated && Asi.Security.AppPrincipal.CurrentIdentity.LastActivityDate > DateTime.MinValue)
        {
            Predicate<CommunityDocument> filter = new Predicate<CommunityDocument>(CommunityDocument.IsNewToUser);
            int newComments = CommunityDocument.GetCommunityDocumentCount(
                hierarchyKey,
                CommunityDocumentType.Comment,
                CommunityDocumentRetrievalRecursionType.One,
                filter,
                StatefulBusinessContainer);
            if (newComments > 0)
                lnkViewItem.Text = ResourceManager.GetPhrase("CommunityManagement.ForumTopic.CommentCountWithNew", "{0} {1} <strong>({2} new)</strong>", commentCount, commentCount == 1 ? ResourceManager.GetWord("reply") : ResourceManager.GetWord("replies"), newComments);
            else
                lnkViewItem.Text = ResourceManager.GetPhrase("CommunityManagement.ForumTopic.CommentCount", "{0} {1}", commentCount, commentCount == 1 ? ResourceManager.GetWord("reply") : ResourceManager.GetWord("replies"));
        }
        else
            lnkViewItem.Text = ResourceManager.GetPhrase("CommunityManagement.ForumTopic.CommentCount", "{0} {1}", commentCount, commentCount == 1 ? ResourceManager.GetWord("reply") : ResourceManager.GetWord("replies"));

        LastCommentControl.Text = string.Empty;
        var lastComment = CommunityDocument.GetMostRecentChild(hierarchyKey, CommunityDocumentType.Comment, CommunityDocumentRetrievalRecursionType.One, null, Container);
        if (lastComment != null)
            LastCommentControl.Text = ResourceManager.GetPhrase("CommunityManagement.ForumTopic.LastComment", "last reply on <span class=\"CommunityItemDate\">{0:MMMM d, yyyy}</span> by <span class=\"CommunityItemAuthor\">{1}</span>", lastComment.CreatedOn, lastComment.CreatedByUser.Contact.GetString("FullName"));
    }

    private CommunityDocument mCommunityDocument = null;
    private CommunityDocument CommunityDocument
    {
        get
        {
            if (mCommunityDocument == null)
            {
                Guid uniformKey = new Guid(Request["iUniformKey"]);
                mCommunityDocument = CommunityDocument.GetFromCommunityDocumentKey(uniformKey, Container, true);
            }
            return mCommunityDocument;
        }
    }
    protected void SmartControl_NeedBoundAtom(object sender, EventArgs e)
    {
        SmartControl control = sender as SmartControl;
        if (control != null)
        {
            control.BoundAtom = CommunityDocument;
        }
    }
    protected void CommentList1_OnDataBinding(object sender, EventArgs e)
    {
        if (CommunityDocument.CommunityDocumentType == CommunityDocumentType.BlogEntry || CommunityDocument.CommunityDocumentType == CommunityDocumentType.ForumTopic)
            CommentList1.DataSource = CommunityDocument.GetCommunityDocumentList(
                CommunityDocument.GetCommunityContentHierarchyKey(CommunityDocumentType.Comment, CommunityDocument.AtomKey),
                CommunityDocumentType.Comment,
                CommunityDocumentRetrievalRecursionType.One,
                CommunityDocumentRetrievalSortType.CreatedDateAscending,
                StatefulBusinessContainer);
    }

    protected void CommentList1_OnItemCreated(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            SmartControl titleControl = e.Item.FindControl("TitleControl") as SmartControl;
            titleControl.BoundAtom = e.Item.DataItem as Asi.Atom.IAtom;
            BusinessLabel postedDateControl = e.Item.FindControl("PostedDateControl") as BusinessLabel;
            postedDateControl.BoundAtom = e.Item.DataItem as Asi.Atom.IAtom;
            BusinessLabel postedByControl = e.Item.FindControl("PostedByControl") as BusinessLabel;
            postedByControl.BoundAtom = e.Item.DataItem as Asi.Atom.IAtom;
            SmartControl bodyControl = e.Item.FindControl("BodyControl") as SmartControl;
            bodyControl.BoundAtom = e.Item.DataItem as Asi.Atom.IAtom;
        }
    }

    protected void CommentList1_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            BusinessLabel postedByControl = e.Item.FindControl("PostedByControl") as BusinessLabel;
            postedByControl.Text = postedByControl.BoundAtomProperty.GetForeignObjectDisplayValue(postedByControl.BoundAtom);
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server" Visible="false">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server" Visible="false">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <!-- Notification Start -->
    <div>
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" UseParentControlBusinessItem="false" BoundPropertyName="Title" ID="TitleControl" DisplayType="ReadOnlyField" DisplayCaption="false" OnNeedBoundAtom="SmartControl_NeedBoundAtom" style="float: left !important; text-align: left !important; width: 90% !important; color: Blue; font-weight: bold;" />
        <div style="font-size: smaller; margin-bottom: 10px; clear: both;">
            <asp:Literal ID="PostedStart" runat="server" Text="posted&nbsp;" /><asiweb:BusinessLabel runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CreatedOn" ID="PostedDateControl" OnNeedBoundAtom="SmartControl_NeedBoundAtom" DisplayValue="true" /><asp:Literal ID="PostedBy" runat="server" Text="&nbsp;by&nbsp;" /><asiweb:BusinessLabel runat="server" BoundPropertyName="CreatedByUserKey" AtomComponentName="CommunityDocument" ID="PostedByControl" OnNeedBoundAtom="SmartControl_NeedBoundAtom" DisplayValue="true" />
        </div>
        <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" UseParentControlBusinessItem="false" BoundPropertyName="Body" ID="BodyControl" DisplayType="ReadOnlyField" DisplayCaption="false" OnNeedBoundAtom="SmartControl_NeedBoundAtom" style="clear: both; margin-bottom: 10px;" />

        <div style="width:100%;">
            <div style="font-size: smaller;">
                <asp:Literal ID="LastCommentControl" runat="server" />
            </div>
            <div style="white-space:nowrap; text-align: right;">
                <asp:Label ID="lnkViewItem" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div style="padding-left: 20px; border: 1px solid black;">
        <asp:Repeater ID="CommentList1" runat="server" OnItemCreated="CommentList1_OnItemCreated" OnItemDataBound="CommentList1_OnItemDataBound" OnDataBinding="CommentList1_OnDataBinding">
            <ItemTemplate>
                <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" UseParentControlBusinessItem="false" BoundPropertyName="Title" ID="TitleControl" DisplayType="ReadOnlyField" DisplayCaption="false" style="float: left !important; text-align: left !important; width: 90% !important; color: Blue; font-weight: bold;" />
                <div style="font-size: smaller; margin-bottom: 10px; clear: both;">
                    <asp:Literal ID="PostedStart" runat="server" Text="posted&nbsp;" /><asiweb:BusinessLabel runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayValue="true" /><asp:Literal ID="PostedBy" runat="server" Text="&nbsp;by&nbsp;" /><asiweb:BusinessLabel runat="server" BoundPropertyName="CreatedByUserKey" AtomComponentName="CommunityDocument" ID="PostedByControl" DisplayValue="true" />
                </div>
                <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" UseParentControlBusinessItem="false" BoundPropertyName="Body" ID="BodyControl" DisplayType="ReadOnlyField" DisplayCaption="false" style="clear: both; margin-bottom: 10px;" />
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
    <!-- Notification End -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TemplateButtonBar" Runat="Server" Visible="false">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SideBarPlaceHolder" Runat="Server" Visible="false">
</asp:Content>

