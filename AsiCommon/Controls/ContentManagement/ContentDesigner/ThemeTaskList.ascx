<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ThemeTaskList" Codebehind="ThemeTaskList.ascx.cs" %>
<script type="text/javascript">
    function RefreshList() {
        $('<%= RefreshList.ClientID %>').click();
    }
</script>
<asiweb:PanelTemplateControl2 ID="SectionOwnerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="PanelField AutoWidth" style="padding-top:25px;">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel ID="SectionOwnerLabel" runat="server" AssociatedControlID="ProducerList" Text="View task list for " translate="yes"/>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList ID="ProducerList" runat="server" DataSourceDocumentPath="$/ContentManagement/DefaultSystem/Queries/Groups/Content Authority Group Members" 
                    DataTextField="Name" DataValueField="key_UniformKey" ShowNullItem="false" AutoPostBack="true" OnDataChanged="ProducerList_Changed" />
            <asiweb:StyledButton ID="RefreshList" runat="server" OnClick="RefreshList_Click" style="display:none;"/>
        </div>
    </div>
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="WorkingPanel" runat="server" TemplateTitle="Website templates you are working on" Collapsed="False" FieldSet="true">
    <asp:Repeater ID="ContentItemsWorking" runat="server" OnDataBinding="ContentItemsWorking_DataBinding" OnItemDataBound="ContentItemsWorking_ItemDataBound">
        <ItemTemplate>
            <div>
                <asp:HyperLink ID="EditWorkingItemLink" runat="server"></asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="AwaitingApprovalPanel" runat="server" TemplateTitle="Website templates awaiting approval" Collapsed="false">
    <div class="ButtonPanel" ID="ApproveButtonPanel" runat="server">
        <asiweb:StyledButton ID="ApproveSelected" runat="server" Text="Approve Selected" OnClick="ApproveSelected_Click" />
        <asiweb:StyledButton ID="ApprRespondSelected" runat="server" Text="Return Selected" OnClick="ApprRespondSelected_Click" />
    </div>
    <asiweb:Lister2 ID="ContentItemsAwaitingApproval" runat="server" Title="" SelectMode="true" SelectMultipleEnabled="true"
        ColumnReorderingEnabled="false" GroupingEnabled="false" DataKeyNames="HierarchyKey" 
        DataSourceIsRealDataSource="true" SelectColumnLocation="Beginning" ExportButtonLocation="None"
        DisplayPropertiesList="ContentTitle,StatusUpdatedOn" DisplayPropertiesTitleOverride="Title,Date Submitted for Approval"
        TargetUrl="~/iMIS/ContentManagement/ThemeContentDesigner.aspx?ShowMenu=true&DialogMode=true&ShowHierarchyTree=false&Mode=EditContent" 
        LinkProperty="ContentTitle" LinkTargetHeight="95%25" LinkTargetWidth="95%25"
        TargetUrlKeyParameterName="ContentHierarchyKey" LinkTargetBehavior="NewWindowAllShare"
        OnNeedDataSource="ContentItems_NeedDataSource" />
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="DeletionRequestsPanel" runat="server" TemplateTitle="Website templates deletion requests" Collapsed="false">
    <div class="ButtonPanel" id="DeleteButtonPanel" runat="server">
        <asiweb:StyledButton ID="DeleteSelected" runat="server" Text="Delete Selected" OnClick="DeleteSelected_Click" />
        <asiweb:StyledButton ID="DelRespondSelected" runat="server" Text="Respond to Selected" OnClick="DelRespondSelected_Click" />
        <asiweb:StyledButton ID="DelRemoveSelected" runat="server" Text="Remove from List" OnClick="DelRemoveSelected_Click" />
    </div>
    <asiweb:Lister2 ID="ContentItemsAwaitingDelete" runat="server" Title="" SelectMode="true" SelectMultipleEnabled="true"
        ColumnReorderingEnabled="false" GroupingEnabled="false" DataKeyNames="HierarchyKey" 
        DataSourceIsRealDataSource="true" SelectColumnLocation="Beginning" ExportButtonLocation="None"
        DisplayPropertiesList="ContentTitle,StatusUpdatedOn" DisplayPropertiesTitleOverride="Title,Date Delete was Requested"
        TargetUrl="~/iMIS/ContentManagement/ThemeContentDesigner.aspx?ShowMenu=true&DialogMode=true&ShowHierarchyTree=false&Mode=EditContent" 
        LinkProperty="ContentTitle" LinkTargetHeight="95%25" LinkTargetWidth="95%25"
        TargetUrlKeyParameterName="ContentHierarchyKey" LinkTargetBehavior="NewWindowAllShare"
        OnNeedDataSource="ContentItems_NeedDataSource" />
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="ExpiringPanel" runat="server" TemplateTitle="Website templates that have expired or will soon expire" Collapsed="false">
    <asiweb:Lister2 ID="ContentItemsExpired" runat="server" Title="" SelectMode="false"
        ColumnReorderingEnabled="false" GroupingEnabled="false" DataKeyNames="HierarchyKey" 
        DataSourceIsRealDataSource="true" SelectColumnLocation="None" ExportButtonLocation="None"
        DisplayPropertiesList="ContentTitle,WorkflowExpirationDateActual" DisplayPropertiesTitleOverride="Title,Expiration Date"
        TargetUrl="~/iMIS/ContentManagement/ThemeContentDesigner.aspx?ShowMenu=true&DialogMode=true&ShowHierarchyTree=false&Mode=EditContent" 
        LinkProperty="ContentTitle" LinkTargetHeight="95%25" LinkTargetWidth="95%25"
        TargetUrlKeyParameterName="ContentHierarchyKey" LinkTargetBehavior="NewWindowAllShare"
        OnNeedDataSource="ContentItems_NeedDataSource" />
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="ChangeRequestPanel" runat="server" TemplateTitle="Content change requests assigned to you" Collapsed="false">
    <div class="ButtonPanel">
        <asiweb:StyledButton ID="CRMarkCompleteButton" runat="server" Text="Mark as Complete" OnClick="CRMarkCompleteButton_Click" translate="yes"/>
        <asiweb:StyledButton ID="CRRespondButton" runat="server" Text="Respond to Selected" OnClick="CRRespondButton_Click" translate="yes"/>
    </div>
    <asiweb:Lister2 ID="ContentChangeRequests" runat="server" Title="" SelectMode="true" SelectMultipleEnabled="true"
        ColumnReorderingEnabled="false" GroupingEnabled="false" DataKeyNames="ContentHierarchyKey,ContentDocumentVersionKey,ContentChangeRequestKey" 
        DataSourceIsRealDataSource="true" SelectColumnLocation="Beginning" ExportButtonLocation="None"
        DisplayPropertiesList="ContentTitle,RequestDateTime" DisplayPropertiesTitleOverride="Title,Date of Request" 
        SortPropertiesList="ContentTitle,RequestDateTime"
        TargetUrl="~/iMIS/ContentManagement/ContentDesigner.aspx?ShowMenu=true&DialogMode=true&ShowHierarchyTree=false&Mode=EditContent"
        LinkProperty="ContentTitle" LinkTargetHeight="95%25" LinkTargetWidth="95%25"
        TargetUrlKeyParameterName="ContentHierarchyKey" LinkTargetBehavior="NewWindowAllShare"
        OnNeedDataSource="ChangeRequests_NeedDataSource" OnItemCreated="ChangeRequests_ItemCreated" OnItemDataBound="ChangeRequests_ItemDataBound" />
</asiweb:PanelTemplateControl2>
<asiweb:PanelTemplateControl2 ID="UnassignedChangedRequestPanel" runat="server" TemplateTitle="Unassigned content change requests" Collapsed="false">
    <div class="ButtonPanel">
        <asiweb:StyledButton ID="UCRMarkCompleteButton" runat="server" Text="Mark as Complete" OnClick="UCRMarkCompleteButton_Click" translate="yes"/>
        <asiweb:StyledButton ID="UCRRespondButton" runat="server" Text="Respond to Selected" OnClick="UCRRespondButton_Click" translate="yes"/>
    </div>
    <asiweb:Lister2 ID="UnassignedContentChangeRequests" runat="server" Title="" SelectMode="true" SelectMultipleEnabled="true"
        ColumnReorderingEnabled="false" GroupingEnabled="false" DataKeyNames="ContentHierarchyKey,ContentDocumentVersionKey,ContentChangeRequestKey"  
        DataSourceIsRealDataSource="true" SelectColumnLocation="Beginning" ExportButtonLocation="None"
        DisplayPropertiesList="ContentTitle,RequestDateTime" DisplayPropertiesTitleOverride="Title,Date of Request"
        SortPropertiesList="ContentTitle,RequestDateTime"
        TargetUrl="~/iMIS/ContentManagement/ContentDesigner.aspx?ShowMenu=true&DialogMode=true&ShowHierarchyTree=false&Mode=EditContent"
        LinkProperty="ContentTitle" LinkTargetHeight="95%25" LinkTargetWidth="95%25"
        TargetUrlKeyParameterName="ContentHierarchyKey" LinkTargetBehavior="NewWindowAllShare"
        OnNeedDataSource="UnassignedChangeRequests_NeedDataSource"
        OnItemCreated="ChangeRequests_ItemCreated" OnItemDataBound="ChangeRequests_ItemDataBound" />
</asiweb:PanelTemplateControl2>
<div id="Message" runat="server" class="AsiMessage" Visible="False">
    <div class="AsiInformation">
		<asp:label id="NothingToDisplay" runat="server" Text="" translate="yes" />
	</div>  
</div>
