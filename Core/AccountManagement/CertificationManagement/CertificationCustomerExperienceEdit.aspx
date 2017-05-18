<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Bae.Web.Customer.AccountManagement.CertificationManagement.CertificationCustomerExperienceEdit"
    MasterPageFile="~/Templates/MasterPages/empty.master" CodeBehind="CertificationCustomerExperienceEdit.aspx.cs" %>

<%@ Register Src="~/AsiCommon/Controls/ContentManagement/HeaderScript.ascx" TagName="HeaderScript" TagPrefix="uc1" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="TemplateHead" runat="server">
    <style>
        .StandardPanel {
            border-style: none !important;
        }
    </style>
    <uc1:HeaderScript ID="HeaderScript" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <asiweb:PanelTemplateControl ID="TablePanel1" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
        
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server">

            <asiweb:BusinessLabel runat="server" DisplayCaption="True" DisplayValue="True" TranslateOnlyCaptionAndToolTip="True" ID="CustomerExperienceTitle" BoundPropertyName="ParentName" RenderPanelField="True"></asiweb:BusinessLabel>
            <asiweb:BusinessLabel runat="server" DisplayCaption="True" DisplayValue="True" TranslateOnlyCaptionAndToolTip="True" ID="NameInputReadOnly" BoundPropertyName="Name" RenderPanelField="True"></asiweb:BusinessLabel>
            <asiweb:BusinessLabel runat="server" DisplayCaption="True" DisplayValue="True" TranslateOnlyCaptionAndToolTip="True" ID="DescriptionInputReadOnly" BoundPropertyName="Description" RenderPanelField="True"></asiweb:BusinessLabel>
            <asiweb:BusinessLabel runat="server" DisplayCaption="True" DisplayValue="True" TranslateOnlyCaptionAndToolTip="True" ID="DateInputReadOnly" BoundPropertyName="Date" RenderPanelField="True"></asiweb:BusinessLabel>
                 
            <div runat="server" ID="DateDiv" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel AssociatedControlID="DateInput" runat="server" Text="Date" CssClass="Required"/>                   
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="DateInput" BoundPropertyName="Date" DisplayCaption="False" ControlType="DatePicker"/>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="DateValidator" ControlToValidate="DateInputrad_Dp" Text="Required"></asiweb:AsiRequiredFieldValidator>                        
                </div>
            </div>

            <asiweb:SmartControl runat="server" ID="LocationInputReadOnly" BoundPropertyName="Location" DisplayType="ReadOnlyField" DisplayCaption="true"/>
                
            <div class="PanelField Left" runat="server" id="DivNOU">
                <asp:Label ID="lblNumberOfUnits" runat="server" CssClass="Label" Text='<%# UomName %>' />
                <div class="PanelFieldValue">
                    <asp:Label ID="txtNumberOfUnits" runat="server" Text='<%# NumberOfUnits %>' />
                </div>
            </div>

            <asiweb:SmartControl runat="server" ID="NoteInput" BoundPropertyName="Note" DisplayType="EditableField" DisplayCaption="true" ValidateRequestMode="Disabled" />
                
            <div class="PanelField Left" runat="server" id="DivGrade" >
                <asp:Label ID="Label1" runat="server" AssociatedControlID="GradeInput" Text="Grade" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" ID="GradeInput" Enabled="true" />
                </div>
            </div>
                
            <asiweb:BusinessFileUpload BoundPropertyName="FileAttachmentDocumentKey" Caption="Attachment" DisplayCaption="true" DocumentTypesAllowed="DOC,DOCX,GIF,JPG,JPEG,PDF,PNG,PPT,PPTX,PPS,PPSX,RTF,TXT,XLS,XLSX" EnableDescriptionField="true" EnableDocumentDownload="true" ID="AttachmentDocumentControl" PositionCaption="Left" RenderPanelField="true" runat="server" UploadButtonText="Attach file" DeleteButtonText="Delete" ButtonType="Button" />
            
        </asiweb:PanelTemplateColumn>

    </asiweb:PanelTemplateControl>

    <asiweb:SmartPanel ID="customData" runat="server" DisplayFormat="Update" UseParentAtomObject="false"
        AtomComponentName="CertificationModuleRegistration" Visible="true"
        PropertiesToHide="CertificationModuleKey, CertificationModuleRegistrationKey, CertificationProgramRegistrationKey,
        CustomerExperienceKey, RegistrationDate, RegistrationStatusCode, EarnedUnits, FileAttachmentDocumentKey, AvailableUnits"
        ColumnLabelWidth="15em" HideIfNoProperties="true" />

    <div class="CommandBar" style="width: 98%; position: absolute; bottom: 10px;">
        <asiweb:StyledButton ID="SaveButton" runat="server" OnClick="SaveButtonClick" CssClass="TextButton PrimaryButton" />
        <asiweb:StyledButton ID="CancelButton" runat="server" OnClick="CancelButtonClick" CausesValidation="False" CssClass="TextButton" />
    </div>

</asp:Content>

