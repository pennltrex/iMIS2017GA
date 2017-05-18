<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.TagEdit" Codebehind="TagEdit.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" TagName="AccessSettings" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>

<script type="text/javascript">
    function AddRelated_Callback(dialogWindow)
    {
        // Do nothing if no tags were selected.
        if (!dialogWindow.result || dialogWindow.result.length == 0)
            return;
        // Set values to be used during postback.
        var hdnAddSelectedTags = document.getElementById("<%= hdnAddSelectedTags.ClientID %>")
        hdnAddSelectedTags.value = dialogWindow.result;
        var hdnAddRelationshipType = document.getElementById("<%= hdnAddRelationshipType.ClientID %>")
        hdnAddRelationshipType.value = dialogWindow.RelationshipType;
        var hdnAddReciprocal = document.getElementById("<%= hdnAddReciprocal.ClientID %>")
        hdnAddReciprocal.value = dialogWindow.Reciprocal;
       
        // Trigger a postback when related tag is added.
        InitiateControlEventWithArgument('<%= addRelatedTrigger.ClientID %>', "");       
    }
    
    function ReturnTagKey()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        if (oWindow == null)
            return;
        var hdnTagKey = document.getElementById("<%= hdnTagKey.ClientID %>");
        oWindow.TagKey = hdnTagKey.value;
    }
    function ClearTagKey()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        if (oWindow == null)
            return;
        oWindow.TagKey = "";
    }
    </script>

<input type="hidden" id="hdnAddSelectedTags" runat="server" />
<input type="hidden" id="hdnAddRelationshipType" runat="server" />
<input type="hidden" id="hdnAddReciprocal" runat="server" />
<input type="hidden" id="hdnTagKey" runat="server" />

<asp:Panel ID="pnlEditControl" runat="server">

    <asiweb:PanelTemplateControl2 ID="PanelProperties" TemplateTitle="Propertiesx" runat="server" FieldSet="true" ShowBorder="True">
           
            <asiweb:SmartControl id="TagNameControl" runat="Server" BoundPropertyName="Name" DisplayCaption="true" DisplayType="EditableField"></asiweb:SmartControl>
            <asiweb:SmartControl id="TagDescriptionControl" runat="Server" BoundPropertyName="Description" DisplayCaption="true" DisplayType="EditableField"></asiweb:SmartControl>
            <div style="display:none" class="PanelField">
                <asiweb:SmartControl ID="FurtherDefinesParentControl" runat="server" BoundPropertyName="FurtherDefinesParent" DisplayCaption="true" DisplayType="EditableField" PositionCaption="Right" />&nbsp;
                <asp:Label ID="lblParentName" Font-Italic="true" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <asiweb:SmartControl id="TagAliasesControl" runat="Server" BoundPropertyName="TagAliasList" DisplayCaption="true" DisplayType="EditableField"></asiweb:SmartControl>         
        
   </asiweb:PanelTemplateControl2>

   <asiweb:PanelTemplateControl2 ID="PanelRelatedTags" TemplateTitle="RelatedTagsx" runat="server" Collapsed="true" ShowBorder="True">  
            
         <asp:UpdatePanel id="UpdatePanelRelatedTags" runat="server">
         <ContentTemplate>
                <div style="text-align:right"><asp:LinkButton ID="lnkAddRelated" runat="server"></asp:LinkButton></div>
                <asp:Button runat="server" id="addRelatedTrigger" style="display:none" Text=""></asp:Button>
                <radG:RadGrid ID="RelatedTagsGrid" runat="server" EnableAJAX="true" AutoGenerateColumns="false" AllowSorting="true"
                    HeaderStyle-Height="20px">
                    <MasterTableView RetrieveAllDataFields="false" EditMode="InPlace" 
                        DataKeyNames="TagRelationshipKey" AdditionalDataFieldNames="TagRelationshipKey, TagRelationshipTypeDescription, TargetTagName" AllowNaturalSort="true" AllowSorting="true">
                        <Columns>
                            <%-- column 0 --%>
                            <radG:GridEditCommandColumn ButtonType="ImageButton" HeaderStyle-Width="40px" 
                                EditImageUrl="~/AsiCommon/Images/icon_edit.gif" EditText="Editx"
                                UpdateImageUrl="~/AsiCommon/Images/icon_disk.gif" UpdateText="Updatex"
                                CancelImageUrl="~/AsiCommon/Images/icon_close.gif" CancelText="Cancelx" />
                            <%-- column 1 --%>                            
                            <radG:GridTemplateColumn HeaderText="Relationship Typex" SortExpression="TagRelationshipTypeDescription">
                                <ItemTemplate>
                                    <asp:Label ID="RelationshipType" runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="RelationshipType" runat="server"></asp:DropDownList>
                                </EditItemTemplate>
                            </radG:GridTemplateColumn>
                            <%-- column 2 --%>
                            <radG:GridTemplateColumn HeaderText="Related Tagx" SortExpression="TargetTagName">
                                <ItemTemplate>
                                    <asp:Label ID="RelatedTag" runat="server" />
                                </ItemTemplate>
                            </radG:GridTemplateColumn>
                            <%-- column 3 --%>
                            <radG:GridTemplateColumn HeaderText="Reciprocalx">
                                <ItemTemplate>
                                    <asp:CheckBox ID="Reciprocal" Enabled="false" runat="server"></asp:CheckBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="Reciprocal" Enabled="true" runat="server"></asp:CheckBox>
                                </EditItemTemplate>
                            </radG:GridTemplateColumn>
                            <%-- column 4 --%>
                            <radG:GridButtonColumn CommandName="Delete" ButtonType="ImageButton" Text="Deletex" HeaderStyle-Width="30px" ItemStyle-Width="30px"
                                ConfirmText="remove?x"  />
                        </Columns>
                        <NoRecordsTemplate>
                            <asp:label runat="server" id="NoRecordsLabel">No relationships defined.</asp:label>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings>
                        <Selecting AllowRowSelect="false" />
                        <Scrolling AllowScroll="false" UseStaticHeaders="false" />
                        <Resizing AllowColumnResize="false" AllowRowResize="false"/>
                    </ClientSettings>
                </radG:RadGrid>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="addRelatedTrigger" />
            </Triggers>
            </asp:UpdatePanel> 
      
   </asiweb:PanelTemplateControl2>
   
    <asp:UpdatePanel id="UpdatePanelTagMaintenance" runat="server">
        <ContentTemplate>
            <uc1:AccessSettings ID="SecurityTagMaintenance" runat="server"  UseContentACL="true" ShowBorder="True" />
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel> 
    
</asp:Panel>
