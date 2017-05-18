<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAddress.ascx.cs"
    Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddress" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Panel ID="ContentPanelDisplay" runat="server">  
    <div id="DivAllowEdit" runat="server">
        <asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" Text="Refresh" />
    </div>    
    <div class="row">
        <div class="col-sm-6">
            <asiweb:BusinessLabel ID="LabelFullAddress" runat="server" translate="no" />
            <asiweb:BusinessHyperLink runat="server" ID="MapLink"/><br />
            <asiweb:BusinessLabel ID="LabelPhoneNumber" runat="server" translate="no" />
            <asiweb:BusinessLabel ID="LabelFaxNumber" runat="server" translate="no" />
            <asiweb:HyperLink ID="LinkEmail" runat="server" translate="no" /> 
        </div>
        <div class="col-sm-6">                  
            <ul id="ulPreferences" runat="server" class="UnstyledList">
                <li id="liMail" runat="server" visible="false">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceMail" runat="server" />
                </li>
                <li id="liBill" runat="server" visible="false">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceBill" runat="server" />
                </li>
                <li id="liShip" runat="server" visible="false">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceShip" runat="server" />
                </li>
            </ul>              
            <div style="clear: both;"></div>                
            <div id="DivStatus" visible="false" runat="server">
                <asiweb:StyledLabel ID="LabelStatusPrompt" CssClass="SectionLabelSmaller" AssociatedControlID="LabelStatusName" runat="server" />                     
                <asiweb:StyledLabel ID="LabelStatusName" runat="server" DisplayCaption="false" /> 
            </div>       
            <div id="DivNote" visible="false" runat="server">        
                <asiweb:StyledLabel ID="LabelNote" runat="server" DisplayCaption="true" RenderPanelField="true" translate="no" />
            </div>                      
        </div>  
        <div style="clear:both"></div>                
    </div>
</asp:Panel>