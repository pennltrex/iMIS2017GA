<%@ Page Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentTypeEdit" MasterPageFile="~/Templates/MasterPages/Empty.master" CodeBehind="ContentTypeEdit.aspx.cs" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="Panel1" runat="server" ShowHeader="false" BorderStyle="None">


            <div ID="iPartTypeHolder" runat="server" ClientIDMode="Static">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelRegType" AssociatedControlID="RadioIpartType"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asp:RadioButtonList runat="server" ID="RadioIpartType" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                            <asp:ListItem Value="new">Client-based (preferred)</asp:ListItem>
                            <asp:ListItem Value="old">ASCX-based</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>    
            </div>  
            <div id="iPartSettings" style="display:none;" ClientIDMode="Static" runat="server">
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl3" runat="server" FieldSet="true" TemplateTitle="Content Type Properties" BorderStyle="None">              
                    <asiweb:SmartControl ID="Name" TextBoxWidth="100%" runat="server" BoundPropertyName="Name" DisplayCaption="true" PositionCaption="top" />
                    <asiweb:SmartControl ID="Description" runat="server" BoundPropertyName="Description" DisplayCaption="true" PositionCaption="top" TextBoxColumns="70" />
                    <div id="jPartSettings" runat="server" ClientIDMode="Static">
                        <asiweb:SmartControl ID="DisplayHtmlPath" TextBoxWidth="100%" runat="server" BoundPropertyName="DisplayHtmlPath" DisplayCaption="true" PositionCaption="top" />
                        <asiweb:SmartControl ID="ConfigHtmlPath" TextBoxWidth="100%" runat="server" BoundPropertyName="ConfigHtmlPath" DisplayCaption="true" PositionCaption="top" />
                    </div>
                </asiweb:PanelTemplateControl2>
                <div style="clear:both;"></div>  
                <asiweb:PanelTemplateControl2 ID="AdvancedPanel" runat="server" FieldSet="true" TemplateTitle="Advanced Properties" Collapsed="False" BorderStyle="None">
                    <div id="OldAdvancedSettings" runat="server" ClientIDMode="Static">
                        <asiweb:SmartControl ID="ExecuteLink" TextBoxWidth="100%" runat="server" BoundPropertyName="ExecuteLink" DisplayCaption="true" PositionCaption="top" />
                        <asiweb:SmartControl ID="ContentTypeKey" runat="server" BoundPropertyName="AtomKey" DisplayCaption="true" ReadOnly="true" PositionCaption="Top" />
                        <asiweb:SmartControl ID="AssemblyName" TextBoxWidth="100%" runat="server" BoundPropertyName="AssemblyName" DisplayCaption="true" PositionCaption="top"/>
                        <asiweb:SmartControl ID="TypeName" TextBoxWidth="100%" runat="server" BoundPropertyName="TypeName" DisplayCaption="true" PositionCaption="top" />
                        <asiweb:SmartControl ID="ContentTypeAssemblyName" TextBoxWidth="100%" runat="server" BoundPropertyName="ContentTypeAssemblyName" DisplayCaption="true" PositionCaption="top" />
                        <asiweb:SmartControl ID="ContentTypeName" TextBoxWidth="100%" runat="server" BoundPropertyName="ContentTypeName" DisplayCaption="true" PositionCaption="top"/>
                        <asiweb:SmartControl ID="NewLink" TextBoxWidth="100%" runat="server" BoundPropertyName="NewLink" DisplayCaption="true" PositionCaption="top"/>
                        <asiweb:SmartControl ID="EditLink" TextBoxWidth="100%" runat="server" BoundPropertyName="EditLink" DisplayCaption="true" PositionCaption="top" />
                    </div>
                    <asiweb:SmartControl ID="ParameterLink" TextBoxWidth="100%" runat="server" BoundPropertyName="ParameterLink" DisplayCaption="true" PositionCaption="top" />
                    <asiweb:SmartControl ID="IconUrl" TextBoxWidth="100%" runat="server" BoundPropertyName="IconUrl" DisplayCaption="true" PositionCaption="top" />
                    <asiweb:SmartControl ID="HelpUrl" TextBoxWidth="100%" runat="server" BoundPropertyName="HelpUrl" DisplayCaption="true" PositionCaption="top" />
                </asiweb:PanelTemplateControl2>
    
    
                <div style="clear:both;"></div>  
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl2" runat="server" FieldSet="true" TemplateTitle="Content Type Summary" Collapsed="true" BorderStyle="None">
                    <asiweb:SmartControl ID="UpdatedByDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="UpdatedByUserKey" DisplayCaption="true" />
                    <asiweb:SmartControl ID="UpdatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="UpdatedOn" DisplayCaption="true" />
                    <asiweb:SmartControl ID="CreatedByDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="CreatedByUserKey" DisplayCaption="true" />
                    <asiweb:SmartControl ID="CreatedOnDisplay" runat="Server" DisplayType="ReadOnlyField" BoundPropertyName="CreatedOn" DisplayCaption="true" />
                </asiweb:PanelTemplateControl2>
            </div>
    </asiweb:PanelTemplateControl2>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            
            jQuery("input:radio[name$=RadioIpartType]").change(function () {
                
                if (this.value === "new") {
                    //new
                    jQuery("#OldAdvancedSettings").hide();
                    jQuery("#jPartSettings").show();
                    jQuery("input[id*='_ExecuteLink_']").val("~/iParts/ClientSide/Asi.Web.iParts.ClientSide/ClientSideDisplay.ascx");
                    jQuery("input[id*='_AssemblyName_']").val("Asi.Web");
                    jQuery("input[id*='_TypeName_']").val("Asi.Web.Mvc.ClientSideContentItem");
                    jQuery("input[id*='_EditLink_']").val("~/iParts/ClientSide/Asi.Web.iParts.ClientSide/ClientSideConfigEdit.ascx");
                    jQuery("input[id*='_NewLink_']").val("~/iParts/ClientSide/Asi.Web.iParts.ClientSide/ClientSideConfigEdit.ascx");
                }
                else {
                    //old
                    jQuery("#OldAdvancedSettings").show();
                    jQuery("#jPartSettings").hide();
                }
                
                jQuery("#iPartSettings").show();
                jQuery("#iPartTypeHolder").hide();
            });


        });
    </script>    
</asp:Content>

