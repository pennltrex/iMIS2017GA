<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeGiftEditorEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.TributeGiftEditor.TributeGiftEditorEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate> 
<asiweb:PanelTemplateControl ID="TributeGiftEditorEditPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">

    <asiweb:SmartControl ID="ShowNotifyDetailsControl" runat="server" BoundPropertyName="ShowNotifyDetails" CssClass="AutoWidth"
        DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="True" /> 
    
    <div runat="server" ID="NotificationOptionsDiv">  
    <asiweb:SmartControl ID="ShowNotifyTextControl" runat="server" BoundPropertyName="ShowNotifyText" CssClass="AutoWidth"
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"/> 
    
    <div style="clear: both;"></div>
    <div class="AutoWidth">
        <div class="ShowFieldset">
            <fieldset>
            <legend><%# GetTranslatedPhrase("Notification contact settings") %></legend> 
            <div id="IncludeEmailForIndividualDiv" runat="server">
                <asiweb:BusinessCheckBox ID="IncludeEmailForIndividual" runat="server" AutoPostBack="True" RenderPanelField="True"
                                BoundPropertyName="IncludeEmailForIndividual" DisplayCaption="True" PositionCaption="Right" />
                    <div class="SubItems">
                        <asiweb:BusinessCheckBox ID="RequireEmailForIndividual" runat="server" RenderPanelField="True"
                            BoundPropertyName="RequireEmailForIndividual" DisplayCaption="true" PositionCaption="right" />                                                                           
                    </div>
            </div>
            <asiweb:BusinessCheckBox ID="IncludeAddress" runat="server" BoundPropertyName="IncludeAddress" DisplayCaption="true" RenderPanelField="True" 
                            PositionCaption="Right" AutoPostBack="true" />
                <div id="IncludeAddressSubitemsDiv" runat="server" class="SubItems">
                    <asiweb:BusinessCheckBox ID="RequireAddress" runat="server" AutoPostBack="False" BoundPropertyName="RequireAddress"
                         DisplayCaption="True" PositionCaption="Right" RenderPanelField="True" />             
                    <asiweb:SmartControl ID="MultipleAddressLines" runat="server" BoundPropertyName="MultipleAddressLines" DisplayCaption="true" 
                                PositionCaption="Right" DataSaveUponStateChange="false" />                     
                    <asiweb:SmartControl ID="CreateAddressPurpose" runat="server" BoundPropertyName="CreateAddressPurpose" DisplayCaption="true" 
                                PositionCaption="Left" DataSaveUponStateChange="false" />

                </div>
            </fieldset>
         </div>
    </div>
    </div>  
           
    <asiweb:SmartControl ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" /> 
    
    <asiweb:SmartControl ID="HonoreeQueryPath" runat="server" BoundPropertyName="HonoreeQueryPath" DisplayCaption="true" PositionCaption="Left" 
        DataSaveUponStateChange="false" AutoPostBack="false" />
           
    </asiweb:PanelTemplateControl>    
    </ContentTemplate>
 </asp:UpdatePanel>