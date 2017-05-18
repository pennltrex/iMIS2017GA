<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidDeclarationConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.GiftAidDeclarationConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false" borderstyle="None">
    <div>
        <asiweb:SmartControl 
            ID="CommitSequenceControl" runat="server"
            BoundPropertyName="CommitSequence" DisplayCaption="true"
            PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />
        
        <asiweb:SmartControl 
            ID="SmartControl1" runat="server" 
            BoundPropertyName="Mode" DisplayCaption="true"
            PositionCaption="Left" DataSaveUponStateChange="false"   />
        <asiweb:SmartControl 
            ID="GiftAidCheckboxLabel" runat="server" 
            BoundPropertyName="GiftAidCheckboxLabel" DisplayCaption="true"
            PositionCaption="Left" DataSaveUponStateChange="false" />
    
        <asiweb:SmartControl 
            ID="DisplayGiftAidConfirmationMessageOverride" runat="server" 
            BoundPropertyName="DisplayGiftAidConfirmationMessageOverride" DisplayCaption="true"
            PositionCaption="Right" DataSaveUponStateChange="false"  CssClass="AutoWidth" OnClientClick="toggleConfirmationMessageFields()" />
                    
            <div class="SubItems">
                <asiweb:SmartControl 
                    ID="GiftAidConfirmationMessageOverride" runat="server" 
                    BoundPropertyName="GiftAidConfirmationMessageOverride" DisplayCaption="true"
                    PositionCaption="Left" DataSaveUponStateChange="false" />
            </div>

         <asiweb:SmartControl 
            ID="ExistingDeclarationMessage" runat="server" 
            BoundPropertyName="ExistingDeclarationMessage" DisplayCaption="true"
            PositionCaption="Left" DataSaveUponStateChange="false" />
             
    </div>
</asiweb:paneltemplatecontrol>

<script type="text/javascript">
    //<![CDATA[
    jQuery(document).ready(function () {
        // add_load and remove_load ensures this works across ajax requests
        Sys.Application.add_load(function () {
            toggleConfirmationMessageFields();
            Sys.Application.remove_load(function () {
                toggleConfirmationMessageFields();
            });
        });
    });

    function toggleConfirmationMessageFields() {
        var displayGiftAidConfirmationMessageOverride = jQuery("#<%#DisplayGiftAidConfirmationMessageOverride.ClientID%>_CheckBoxSet");
        var giftAidConfirmationMessageOverride = jQuery("#<%#GiftAidConfirmationMessageOverride.ClientID%>_TextArea");

        if (displayGiftAidConfirmationMessageOverride == null || giftAidConfirmationMessageOverride == null)
            return;

        if (displayGiftAidConfirmationMessageOverride.prop("checked"))
            giftAidConfirmationMessageOverride.prop("disabled", false);
        else
            giftAidConfirmationMessageOverride.prop("disabled", true);
    }
    //]]>
</script>
 