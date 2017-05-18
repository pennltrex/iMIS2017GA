<%@ Control Language="C#" Inherits="AsiCommon.Controls.ContentManagement.ContentDesigner.ContentFolderWorkflowManagement" Codebehind="ContentFolderWorkflowManagement.ascx.cs" %>

<asiweb:SmartControl ID="AuthorityGroupList" runat="server" BoundPropertyName="WorkflowAuthorityGroupKey" DisplayCaption="true" OnDataChange="AuthorityGroup_Change" OnClientClick="AuthorityGroup_Clicked();" AutoPostBack="true" />
<asp:Panel ID="OtherWorkflow" runat="server" Visible="false">
    <div class="PanelField">
        <asiweb:BusinessLabel ID="OwnerCaption" runat="server" AssociatedControlID="OwnerList" />
        <asiweb:BusinessDropDownList ID="OwnerList" runat="server" BoundPropertyName="WorkflowOwnerGroupMemberKey" />
    </div>
    <div class="PanelField AutoWidth">
        <asiweb:SmartControl ID="NumDaysBeforeExpBox" runat="server" BoundPropertyName="WorkflowDaysBeforeExpire" DisplayCaption="false" style="float:left;" TextBoxWidth="50px" >
            <asiweb:StyledLabel ID="NumberOfDaysExpAfterLabel" runat="server" Text="" AssociatedControlID="<%#NumDaysBeforeExpBox.PrincipalControlID%>" style="float:right;" />
        </asiweb:SmartControl>
        <div style="clear:left; margin-left: 20px">
            <asiweb:SmartControl ID="UpdateChildrenExpire" runat="server" BoundPropertyName="WorkflowUpdateChildrenExpire" style="float:left;" DisplayCaption="true" PositionCaption="Right" />
        </div>
    </div>
</asp:Panel>

<script type="text/javascript">
    var AuthorityGroup_Clicked = function() {
        var noContentLabel = document.getElementById('<%# AuthorityGroupList.ClientID%>_Finder_FinderLabel');
        var otherWorkflow = document.getElementById('<%#OtherWorkflow.ClientID%>');
        if (noContentLabel != undefined && otherWorkflow != undefined)
            if(noContentLabel.innerText == "(No contentmanagerauthoritygroup selected)")
                otherWorkflow.style.display = 'none';

    }
</script>