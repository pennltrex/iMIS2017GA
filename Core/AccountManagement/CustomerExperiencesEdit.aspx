<%@ Register Src="~/Core/AccountManagement/CertificationManagement/CustomerExperienceList.ascx" TagName="CustomerExperienceList" TagPrefix="uc1" %>
<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Bae.Web.Customer.AccountManagement.CustomerExperiencesEdit" 
    Codebehind="CustomerExperiencesEdit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <style>.aspNetDisabled{ display: none!important;}</style>   
    <div>
        <asiweb:PanelTemplateControl ID="TablePanel1" runat="server" 
            Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" LabelWidth="10em">
                <asiweb:SmartControl ID="SmartControl1" runat="server" BoundPropertyName="ParentName" DisplayType="ReadOnlyField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="NameInput" BoundPropertyName="Name" DisplayType="EditableField" DisplayCaption="true" />
                <asiweb:SmartControl runat="server" ID="NameInputReadOnly" BoundPropertyName="Name" DisplayType="ReadOnlyField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="DescriptionInput" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="DescriptionInputReadOnly" BoundPropertyName="Description" DisplayType="ReadOnlyField" DisplayCaption="true"/>
                <div class="PanelField Left" runat="server" id="DivDate">
                    <asp:Label ID="DateInputCaption" runat="server" Text="Date" AssociatedControlID="DateInputValue" Width="10em" />
                    <div class="PanelFieldValue">
                        <asp:Label ID="DateInputValue" runat="server" />
                    </div>
                </div>
                <asiweb:SmartControl runat="server" ID="DateInput" BoundPropertyName="CompletionDate" DisplayType="EditableField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="LocationInput" BoundPropertyName="Location" DisplayType="EditableField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="LocationInputReadOnly" BoundPropertyName="Location" DisplayType="ReadOnlyField" DisplayCaption="true"/>
                <asiweb:SmartControl runat="server" ID="UnitsInput" BoundPropertyName="NumberOfUnits" DisplayType="EditableField" DisplayCaption="true"/>
                <div class="PanelField Left" runat="server" id="DivUnits">
                    <asp:Label ID="UnitsInputCaption" runat="server" AssociatedControlID="UnitsInputValue" Width="10em" />
                    <div class="PanelFieldValue">
                        <asp:Label ID="UnitsInputValue" runat="server" />
                    </div>
                </div>
                <asiweb:SmartControl runat="server" ID="ExperienceGradeInput" BoundPropertyName="Grade" DisplayType="EditableField" DisplayCaption="true"/>
                <div class="PanelField Left" runat="server" id="DivGrade" >
                    <asp:Label ID="CertificationGradeLabel" runat="server" AssociatedControlID="CertificationGradeInput" Text="Grade" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList runat="server" ID="CertificationGradeInput" Enabled="true" />
                    </div>
                </div>
                <asiweb:SmartControl runat="server" ID="NoteInput" BoundPropertyName="Note" DisplayType="EditableField" DisplayCaption="true" ValidateRequestMode="Disabled"/>           
                <asiweb:BusinessFileUpload BoundPropertyName="FileAttachmentDocumentKey" Caption="Attachment" DisplayCaption="true" DocumentTypesAllowed="DOC,DOCX,GIF,JPG,JPEG,PDF,PNG,PPT,PPTX,PPS,PPSX,RTF,TXT,XLS,XLSX" EnableDescriptionField="true" EnableDocumentDownload="true" ID="AttachmentDocumentControl" PositionCaption="Left" RenderPanelField="true" runat="server" UploadButtonText="Attach file" DeleteButtonText="Delete" ButtonType="Button" />
            </asiweb:PanelTemplateColumn>
        </asiweb:PanelTemplateControl>
    </div>
    
    <uc1:CustomerExperienceList ID="customerExperienceList" runat="server" Visible="false" />
    
    <div class="CommandBar" style="width:98%;position:absolute;bottom:10px;">
        <asiweb:StyledButton ID="SaveButton" runat="server" OnClick="SaveButtonClick" />
        <asiweb:StyledButton ID="CancelButton" runat="server" OnClick="CancelButtonClick" CausesValidation="False" />
    </div>
</asp:Content>