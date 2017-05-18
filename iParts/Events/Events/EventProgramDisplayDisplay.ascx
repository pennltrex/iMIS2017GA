<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventProgramDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventProgramDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
    
<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="yes">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server"/>    
    <asp:UpdatePanel ID="EventRegisterUpdatePanel" runat="server" EnableViewState="True" ChildrenAsTriggers="True">
        <ContentTemplate>
            <div class="AsiMessage" runat="server" ID="DeleteRegistrationWarningMessage" Visible="False">
               <div class="AsiWarning" runat="server">
                    <asp:Image ID="DeleteRegistrationWarningIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
                    <div runat="server" ID="DeleteRegistrationWarning"></div>
                </div>       
            </div>
            <div class="AsiMessage" runat="server" ID="ConflictMessage">
                <div class="AsiError" runat="server">
                    <asp:Image ID="UserMessageIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiError" />			                  
                    <div runat="server" ID="ConflictError"></div>
                </div>
            </div>        
            <div class="AsiMessage" runat="server" ID="ConflictWarningMessage" Visible="False">
               <div class="AsiWarning" runat="server">
                    <asp:Image ID="UserWarningIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
                    <div runat="server" ID="ConflictWarning"></div>
                </div>       
            </div>
            <div class="AsiMessage"  ID="CutoffDatesNeedSavingErrorTextbox" runat="server" Visible="False">
               <div class="AsiWarning" runat="server">
                    <asp:Image ID="UserErrorIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
                    <div runat="server" ID="CutoffDatesNeedSavingErrorMessage"></div>
                </div>       
            </div>
            <asp:Panel ID="CaptionHeader" runat="server" CssClass="TitleBarCaption">
                <span runat="server" id="SpanProgramsBy">
                    <asiweb:StyledLabel ID="LabelProgramsBy" runat="server" Text="Select programs by" AssociatedControlID="SelectProgramsBy" />
                    <asiweb:BusinessDropDownList ID="SelectProgramsBy" runat="server" OnSelectedIndexChanged="SelectProgramsBySelectedIndexChanged"
                        AutoPostBack="true" />&nbsp;&nbsp;&nbsp;</span>
                <asiweb:BusinessCheckBox runat="server" ID="CheckBoxItineraryOnly" CssClass="DisplayInlineBlock" AutoPostBack="true"
                    OnCheckedChanged="CheckBoxItineraryOnlyCheckedChanged" />
                <div runat="server" id="DivSelectRegistrationOption" style="padding-top: 0.5em;">
                    <asiweb:StyledLabel runat="server" ID="LabelSelectRegistrationOption" CssClass="HelperText"></asiweb:StyledLabel>
                </div>
                <br />
            </asp:Panel>                         
            <div runat="server" id="DivGroupWrapper" class="ProgramGroup">
                <%-- create specific div for containing certain types of dynamically loaded controls --%>
                <%-- we do this to ensure we don't have any viewstate issues with incompatible control types --%>
                <div runat="server" id="DivPanelListerWrapper">
                    <%-- we add all listers wrapped with panels in here --%>
                </div>
                <div runat="server" id="DivListerWrapper">
                    <%-- we add all listers NOT wrapped with panels in here --%>
                </div>
            </div>
            <div style="display: none;">
                <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" OnClick="RefreshButtonClick" />
                <asp:HiddenField ID="FunctionKeyHidden" runat="server" />
                <asp:HiddenField ID="HiddenEventCode" runat="server" />
                <asp:HiddenField ID="HiddenScrollToTag" runat="server" />
                <asp:HiddenField runat="server" ID="FunctionRegistrationQuantityHidden" />
                <asp:HiddenField runat="server" ID="FunctionFormFunctionId" />
                <asp:HiddenField runat="server" ID="FunctionResponseValues" />
                <asp:HiddenField runat="server" ID="HiddenWaitlistChoice" />
               <input runat="server" ID="SaveMessagesLabelId"/>
                <input runat="server" ID="SaveFormSuccess"/>
                <asp:Button ID="RegisterButton" runat="server" CausesValidation="false" OnClick="RegisterButtonClick" />
                <asp:Button ID="UnregisterButton" runat="server" CausesValidation="false" OnClick="UnregisterButtonClick" />
                <asp:Button ID="DeleteRegOptionButton" runat="server" CausesValidation="false" OnClick="DeleteRegOptionButtonClick" />
                <asp:Button ID="SaveFunctionResponsesButton" runat="server" CausesValidation="false" OnClick="SaveFunctionResponsesButtonClick"/>     
                <asp:Button ID="RegisterFromWaitListHiddenButton" CausesValidation="false" OnClick="AddFromWaitListBtnClick" runat="server" />          
            </div>
            <asp:Label runat="server" ID="RegistrationOptionsMessage" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel> 
</asp:Panel>