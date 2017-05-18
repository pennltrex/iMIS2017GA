<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.UserManagement.StaffUserEdit" Codebehind="StaffUserEdit.ascx.cs" %>
<script type="text/javascript">
    var subjectUniformKey = '<%= CurrentContext.SubjectUniformKey %>';

    function AddAccessKeyword() 
    {
        //ShowDialog(url,                                                                                       args,width,height,title,        iconUrl,templateType, callBackFunction, windowName,     closeWindowOnCommit, preserveStatefulBusinessContainer, dialogCloseFunction) 
        ShowDialog('~/AsiCommon/Controls/Contact/User/UserAccessKeywordSelect.aspx?iUniformKey=' + subjectUniformKey + '&CurrentUserAccessKeywords=<%= CurrentStaffUser["AccessKeywords"].ToString() %>', null, 500, 400, 'Select Access Keyword', null, 'E', AccessKeywordSelectCallback, null, false, true, null);
    }

    function AccessKeywordSelectCallback(dialogWindow) 
    {
        try
        {
            if (!dialogWindow.result || dialogWindow.result == '')
                return;
            document.getElementById('<%# AddedAccessKeywords.ClientID %>').value = dialogWindow.result;
            document.getElementById('<%# AddAccessKeywordButton.ClientID %>').click();
        }
        catch (e)
        {
            // Ignore this IE-specific error (it means the dialog window is no longer available...nothing we can do anyway).  
            // It happens after adding an access keyword, then going back into the add access keyword popup (before saving), and clicking cancel.
            if (e.message.indexOf("Can't execute code from a freed script") >= 0)
                ;
            else
                throw e;
        } 
    }
  
</script>

<input type="hidden" runat="server" id="AddedAccessKeywords" name="AddedAccessKeywords" />

<asiweb:PanelTemplateControl2 runat="server" ID="WebInfoPanel" ShowHeader="false" FieldSet="true" BorderStyle="None" translate="yes">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server">
        <asiweb:SmartControl runat="server" ID="StaffUser_LetterClosing" BoundPropertyName="StandardClosing1" DisplayType="EditableField" DisplayCaption="true" CaptionCssClass="CapitalizeFirst"/>
        <asiweb:SmartControl runat="server" ID="StaffUser_TitleOther" BoundPropertyName="StandardClosing2" DisplayType="EditableField" DisplayCaption="true" />
        <div class="PanelField">
            <asiweb:BusinessLabel runat="server" ID="StaffUser_SignaturePrompt" AssociatedControlID="StaffUser_SignatureUpload" Text="Signature"></asiweb:BusinessLabel>
            <div class="PanelFieldValue">
                <asp:Image runat="server" ID="StaffUser_SignatureImage" />
                <asiweb:StyledImageButton runat="server" ID="StaffUser_SignatureDelete" IconStyle="Delete" OnClick="StaffUser_SignatureDelete_Click" />
                <asp:FileUpload id="StaffUser_SignatureUpload" runat="server" OnDataBinding="Signature_DataBinding"/>
                
            </div>
        </div>
        <div style="clear: both;"></div>
        <asiweb:SmartControl runat="server" ID="StaffUser_CheckTasksOnLogin" BoundPropertyName="CheckTickler" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" CaptionStyle="width:15em;" CaptionCssClass="CapitalizeFirst" />  
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>
<h2><%# GetTranslatedPhrase("Module authorization levels") %></h2>
<asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl1" ShowHeader="false" FieldSet="true" BorderStyle="None" translate="yes">
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelSystem" BoundPropertyName="LevelSystem" DisplayType="EditableField" OnDataChange="StaffUser_LevelSystem_DataChanged" DisplayCaption="true" PositionCaption="Left" Caption="System" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelMembership" BoundPropertyName="LevelMembership" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelBilling" BoundPropertyName="LevelDues" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelEvents" BoundPropertyName="LevelMeeting" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelFundRaising" BoundPropertyName="LevelFundRaising" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" Caption="Fundraising" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelOrderEntry" BoundPropertyName="LevelOrderEntry" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelCashAR" BoundPropertyName="LevelCashAR" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" Caption="Finance" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelCertification" BoundPropertyName="LevelCert" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelReferral" BoundPropertyName="LevelReferral" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelExposition" BoundPropertyName="LevelExpo" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl runat="server" ID="StaffUser_LevelServiceCentral" BoundPropertyName="LevelSC" DisplayType="EditableField" OnDataChange="StaffUser_Level_DataChanged" DisplayCaption="true" PositionCaption="Left" />    
</asiweb:PanelTemplateControl2>
<asp:UpdatePanel runat="server" ID="StaffUserEditUpdatePanel1" ViewStateMode="Enabled" UpdateMode="Conditional">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="AccessKeywordList"/>
        <asp:AsyncPostBackTrigger ControlID="AddAccessKeywordButton"/>
    </Triggers>
    <ContentTemplate>
        <asiweb:PanelTemplateControl2 runat="server" ID="PanelTemplateControl2" ShowHeader="false" FieldSet="true" BorderStyle="None">
                 <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3" runat="server" Width="300px">
                    <asiweb:SmartControl runat="server" ID="StaffUser_SpecificTypes" BoundPropertyName="EditTypes" OnDataChange="StaffUser_SpecificTypes_DataChanged" DisplayType="EditableField" DisplayCaption="true" CaptionCssClass="CapitalizeFirst" /> 
                    <div id="AccessKeywordListContainer" class="ShowFieldset" style="clear:left;">            
                         <fieldset>
                            <legend>
                                <asiweb:BusinessLabel runat="server" ID="AccessKeywordListLabel" Text="Access keywords"></asiweb:BusinessLabel>
                            </legend>
                                <asiweb:Lister2 ID="AccessKeywordList" runat="server" Title="Access keywords" OnItemDeleted="AccessKeywordList_ItemDeleted" AjaxEnabled="True"
                                    HeaderVisible="false" OnNeedDataSource="AccessKeywordList_NeedDataSource"
                                    DataSourceIsRealDataSource="true" PagingEnabled="false" 
                                    ExportButtonLocation="None" GroupingEnabled="false" SortingEnabled="false" ColumnReorderingEnabled="false"
                                    LinkTargetBehavior="NewWindowAllShare" AddTargetClientScript="AddAccessKeyword()" AddButtonText="Add access keyword" AddButtonLocation="TopRight"
                                    SelectColumnLocation="None" DeleteColumnLocation="End" DeleteColumnText="remove" />
                        </fieldset>
                    </div>
                    <asp:Button ID="AddAccessKeywordButton" runat="server" style="display:none" OnClick="AccessKeywordList_ItemAdded" />
                </asiweb:PanelTemplateColumn>
        </asiweb:PanelTemplateControl2>
    </ContentTemplate>
</asp:UpdatePanel>