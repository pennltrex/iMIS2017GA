<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupMain.ascx.cs" Inherits="Asi.Web.UI.Common.QueryBuilder.GroupMain" %>
<%@ Import Namespace="Asi" %>
<asp:PlaceHolder ID="MainMessagePlaceHolder" Runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server"></asp:PlaceHolder>

<div runat="server" ID="InfoMessage" class="Info Section">
    <p>Optionally, create a group where the members of the group are determined by the results of the query. Requires that one or more of the defined query sources includes a Contact Key column.</p>
</div>

<asiweb:PanelTemplateControl2 ID="PanelGeneralInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("GeneralInfo", "General Information") %>'
                        Collapsible="false" FieldSet="true" ShowBorder="False">
<div class="PanelField Left">
    <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelGroupName" CssClass="Required" AssociatedControlID="GroupName" />
                </div>
    <div class="PanelFieldValue">
    <asiweb:BusinessTextBox runat="server" ID="GroupName"  MaxLength="65"  />
        <asiweb:AsiRequiredFieldValidator runat="server" ID="GroupNameValidator" ControlToValidate="GroupName" Display="Dynamic" ValidationGroup="CreateGroup" Enabled="False" SetFocusOnError="true"/>
            
    </div>
 </div>
 <div class="PanelField Left">
     <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelContactKeyColumn" CssClass="Required" AssociatedControlID="ContactKeyColumn" />
                </div>   
    <div class="PanelFieldValue">
    <asiweb:BusinessDropDownList runat="server" ID="ContactKeyColumn"  />
        <asiweb:AsiRequiredFieldValidator runat="server" ID="ContactKeyColumnValidator" ControlToValidate="ContactKeyColumn" Display="Dynamic" ValidationGroup="CreateGroup" Enabled="False" SetFocusOnError="true"/>
                
     </div>
 </div>
     
<asiweb:BusinessDropDownList runat="server" ID="RefreshFrequency" RenderPanelField="True" DisplayCaption="True" Caption="Refresh members every"/>
<asiweb:StyledButton runat="server" ID="PublishGroup" CssClass="PrimaryButton" Text="Create Group" OnClick="PublishGroup_OnClick" ValidationGroup="CreateGroup" CausesValidation="True" />

</asiweb:PanelTemplateControl2>