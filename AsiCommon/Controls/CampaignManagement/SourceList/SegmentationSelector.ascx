<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_SegmentationSelector" Codebehind="SegmentationSelector.ascx.cs" %>
<asiweb:StyledLabel runat="server" ID="Title" CssClass="mdTitle" Text="Selected Segment Definitions" />
<asp:Repeater runat="server" DataSource="<%#SelectedDefinitions%>" ID="SelectedSegmentsRepeater">
    <HeaderTemplate>
        <table class="Grid">
        <tr class="GridHeader">
            <td>
                <asiweb:StyledLabel runat="server" Text="Name" />
            </td>
             <td>
                <asiweb:StyledLabel runat="server" Text="Description" />
            </td>
            <td>
                
            </td>
            
        </tr>
    </HeaderTemplate>  
    <ItemTemplate>
    <tr class="GridRow">
        <td><%#Eval("Name")%></td>
        <td><%#Eval("Description")%></td>
        <td><asp:LinkButton ID="StyledImageButton1" runat="server" CommandName="Remove" CommandArgument='<%#Eval("SegmentDefinitionKey")%>' Text="remove" /></td>
    </tr>
    </ItemTemplate>  
    <FooterTemplate></table></FooterTemplate>
         
</asp:Repeater>
<hr style="width:100%" />
<div style="width:95%;">
    <div class="CommandBar">
        <asiweb:styledbutton runat="server" ID="CancelButton" Text="Cancel" />
        <asiweb:styledbutton runat="server" ID="AddAllButton" Text="Add All Segmentation Defs" />
        <asiweb:styledbutton runat="server" ID="SaveButton" Text="Create Source List" ToolTip="Create Source List from selected segmentation jobs." />
    </div>
</div>

<asiweb:Lister2 id="SegmentsGrid2" 
    runat="server"
    AjaxEnabled="false"
    SortingEnabled="true"
    PagingEnabled="true"
    PagerMode="Advanced"
    PageSize="20"
    ColumnReorderingEnabled="false"
    DataSourceDocumentPath="$/SegmentManagement/DefaultSystem/Queries/SegmentList"
    DeleteColumnLocation="None"
    AddButtonLocation="None"
    EditColumnLocation="None"
    SelectColumnLocation="Beginning"
    SelectColumnText="select"    
    EnableClientSideDelete="false"
    UseUniformKey="true"
    OnItemSelected="SegmentsGrid2_ItemSelected"
    LinkTargetBehavior="RaiseEvent" 
    DisableLoadingQueryFromCache="true"                                                       
/> 

