<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowConfigEditPanel.ascx.cs" Inherits="Asi.Web.iParts.Common.Slideshow.SlideshowConfigEditPanel" %>
<%@ Register Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl2 ID="Panel1" runat="server" Collapsible="false" FieldSet="true" ShowBorder="False">
    
    <telerik:RadDialogOpener runat="server" id="DialogOpener1" />
    
    <div id="fieldsRow_0" runat="server" class="PanelField Left">
        <label>Slide</label>
        <div class="PanelFieldValue" style="padding-top: 0.4em;padding-bottom: 0.4em;">        
            <asp:LinkButton ID="MoveLeft" runat="server" OnClick="MoveTabLinkClick"/>
            <asp:LinkButton ID="MoveRight" runat="server" OnClick="MoveTabLinkClick"/> 
            <asp:LinkButton ID="RemoveTabLink" runat="server" OnClick="RemoveTabLinkClick"/>
        </div>
    </div>

    <div class="PanelField Left">
        <asiweb:BusinessLabel CssClass="Required" ID="SlideNameLabel" runat="server" AssociatedControlID="TabNameControl" />
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox ID="TabNameControl" runat="server" />
            <asp:RequiredFieldValidator ID="TabNameControlRequiredValidator" runat="server" ControlToValidate="TabNameControl" Display="Dynamic" Text="Required" />  
        </div>
    </div>

    <div class="PanelField Left">
        <asiweb:BusinessLabel ID="SlideImageLabel" runat="server" AssociatedControlID="SlideImageControl" />
        <div class="PanelFieldValue">
            <div id="ImageManagerDiv" style="white-space:nowrap; display:inline-block;">
                <asiweb:BusinessTextBox ID="SlideImageControl" runat="server" CssClass="InputXLarge"/>                  
                <span style="margin-left:.8em;line-height:2.1em;">
                    <a runat="server" ID="SlideImageLaunchImageManagerHref">select</a>                  
                </span>       
            </div>             
        </div>
    </div>
        
    <div class="PanelField Left">
        <asiweb:BusinessLabel ID="SlideUrlLabel" runat="server" AssociatedControlID="SlideUrlControl" />
         <div class="PanelFieldValue">        
            <asiweb:BusinessDocumentBrowserControl ID="SlideUrlControl" runat="server" RootFolder="@/" CssClass="InputXLargeWrapper" />
        </div>
    </div>
    
    <div class="PanelField Left">
        <asiweb:BusinessLabel ID="SlideCssNameLabel" runat="server" AssociatedControlID="SlideCssNameControl" />
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox ID="SlideCssNameControl" runat="server" CssClass="InputMedium"/>
        </div>
    </div>

    <div class="PanelField Left">
        <asiweb:BusinessLabel ID="SlideTextLabel" runat="server" AssociatedControlID="SlideTextControl" />
        <div class="PanelFieldValue">      
            <asiweb:BusinessHtmlEditor ID="SlideTextControl" runat="server" CssClass="ContentHtmlEditor" EnableCombinedHandler="false" EnableTextareaMode="false" ContentAreaMode="Div" ToolsFile="~/RadControls/Editor/ToolsFileBasic.xml" 
                Height="20em" style="display:block;margin-left:auto;margin-right:auto;margin-top:1.0em;margin-bottom:1.0em;width:95%;" /> 
        </div>
    </div>
    
</asiweb:PanelTemplateControl2>
<div style="clear: both;"></div>

