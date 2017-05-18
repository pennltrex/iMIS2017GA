<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GpsMeasureInputs.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Continuum.GpsMeasureInputs" %>
<%@ Import Namespace="Asi" %>
<asiweb:PanelTemplateControl runat="server" ID="RecruitmentPanel" BorderStyle="None" Collapsible="false">
    <div class="PanelBlock">    
        <div class="PanelField">
            <asp:RadioButton runat="server" ID="ChooseExistingYearOption" AutoPostBack="True" OnCheckedChanged="YearOptionChanged" GroupName="YearOptionGroup" 
                TextAlign="Right" CssClass="FloatNone" />
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList runat="server" ID="ExistingYearSelect" ShowNullItem="false" OnSelectedIndexChanged="ExistingYearSelectChanged" 
                    AutoPostBack="true" />                
            </div>    
        </div>
        <div class="PanelField">
            <asp:RadioButton runat="server" ID="AddNewYearOption" AutoPostBack="True" OnCheckedChanged="YearOptionChanged" GroupName="YearOptionGroup" 
                TextAlign="Right" CssClass="FloatNone" />    
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="NewYearInput" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="NewYearInputRequiredValidator" Display="Dynamic" />
                <asp:RangeValidator runat="server" ID="NewYearInputRangeValidator" MinimumValue="2000" MaximumValue="2100" Type="Integer" Display="Dynamic" />
                <asp:CustomValidator runat="server" ID="NewYearCustomValidator" OnServerValidate="NewYearCustomValdatorServerValidate" Display="Dynamic" />
            </div>
        </div>
    </div>
    <div class="PanelBlock">
        <h3><asiweb:StyledLabel runat="server" ID="KeyHeaderLabel" Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.KeyHeaderLabel", "Key Performance Indicators") %>' /></h3>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="OverallPerfIndexLabel" AssociatedControlID="OverallPerfIndexInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.OverallPerfIndexLabel", "Overall Performance Index") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="OverallPerfIndexInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="OverallPerfIndexRangeValidator" Display="Dynamic" ControlToValidate="OverallPerfIndexInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <h3><asiweb:StyledLabel runat="server" ID="RecruitementHeaderLabel" Text='<%# ResourceManager.GetWord("Recruitment") %>' /></h3>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="RecruitmentIndexLabel" AssociatedControlID="RecruitmentIndexInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.RecruitmentIndexLabel", "Recruitment Acquisition Index") %>'></asiweb:StyledLabel>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="RecruitmentIndexInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="RecruitmentIndexRangeValidator" Display="Dynamic" ControlToValidate="RecruitmentIndexInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="ConversionRateLabel" AssociatedControlID="ConversionRateInput" 
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInput.ConversionRateLabel", "Conversion Rate") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="ConversionRateInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="ConversionRateRangeValidator" Display="Dynamic" ControlToValidate="ConversionRateInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="NewMemberAcquisitionLabel" AssociatedControlID="NewMemberAcquisitionInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.NewMemberAcquistionLabel", "New Member Acquisition") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="NewMemberAcquisitionInput" Text='<%# Zero %>' CssClass="AlignRight" /> 
                <asp:RangeValidator runat="server" ID="NewMemberAcquisitionRangeValidator" Display="Dynamic" ControlToValidate="NewMemberAcquisitionInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="NewVisitorLabel" AssociatedControlID="NewVisitorsInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInput.NewVistorLabel", "New Visitors to Website") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="NewVisitorsInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="NewVisitorRangeValidator" Display="Dynamic" ControlToValidate="NewVisitorsInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>        
        <h3><asiweb:StyledLabel runat="server" ID="EngagementHeaderLabel" Text='<%# ResourceManager.GetWord("Engagement") %>' /></h3>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="EngagementIndexLabel" AssociatedControlID="EngagementIndexInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.EngagementIndexLabel", "Engagement Index") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="EngagementIndexInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="EngagementIndexRangeValidator" Display="Dynamic" ControlToValidate="EngagementIndexInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="ActivityPerMemberLabel" AssociatedControlID="ActivityPerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.ActivityPerMemberLabel", "Activity Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="ActivityPerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="ActivityPerMemberRangeValidator" Display="Dynamic" ControlToValidate="ActivityPerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="CommitteeParticipationPerMemberLabel" AssociatedControlID="CommitteeParticipationPerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.CommitteeParticipationPerMemberLabel", "Committee Participation Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="CommitteeParticipationPerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="CommitteeParticipationPerMemberRangeValidator" Display="Dynamic" ControlToValidate="CommitteeParticipationPerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="DirectMailPerMemberLabel" AssociatedControlID="DirectMailPerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.DirectMailPerMemberLabel", "Direct Mail Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="DirectMailPerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="DirectMailPerMemberRangeValidator" Display="Dynamic" ControlToValidate="DirectMailPerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="EmailsPerMembersLabel" AssociatedControlID="EmailsPerMembersInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.EmailsPerMembersLabel", "Emails Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="EmailsPerMembersInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="EmailsPerMembersRangeValidator" Display="Dynamic" ControlToValidate="EmailsPerMembersInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="FinancialActivitiesPerMemberLabel" AssociatedControlID="FinancialActivitiesPerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.FinancialActivitiesPerMemberLabel", "Financial Activities Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="FinancialActivitiesPerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="FinancialActivitiesPerMemberRangeValidator" Display="Dynamic" ControlToValidate="FinancialActivitiesPerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>                
        <h3><asiweb:StyledLabel runat="server" ID="GrowthHeaderLabel" Text='<%# ResourceManager.GetWord("Growth") %>' /></h3>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="GrowthIndexLabel" AssociatedControlID="GrowthIndexInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.GrowthIndexLabel", "Growth Index") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="GrowthIndexInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="GrowthIndexRangeValidator" Display="Dynamic" ControlToValidate="GrowthIndexInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="EventRegistrationsPerMemberLabel" AssociatedControlID="EventRegistrationsPerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.EventRegistrationsPerMemberLabel", "Event Registrations Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="EventRegistrationsPerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="EventRegistrationsPerMemberRangeValidator" Display="Dynamic" ControlToValidate="EventRegistrationsPerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="MemberIncreaseLabel" AssociatedControlID="MemberIncreaseInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.MemberIncreaseLabel", "Member Increase") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="MemberIncreaseInput" Text="0" CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="MemberIncreaseRangeValidator" Display="Dynamic" ControlToValidate="MemberIncreaseInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Integer" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="RenewalRateLabel" AssociatedControlID="RenewalRateInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.RenewalRateLabel", "Renewal Rate") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="RenewalRateInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="RenewalRateRangeValidator" Display="Dynamic" ControlToValidate="RenewalRateInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="RevenuePerMemberLabel" AssociatedControlID="RevenuePerMemberInput"
                Text='<%# ResourceManager.GetPhrase("GpsMeasureInputs.ActivityPerMemberLabel", "Activity Per Member") %>' />
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="RevenuePerMemberInput" Text='<%# Zero %>' CssClass="AlignRight" />
                <asp:RangeValidator runat="server" ID="RevenuePerMemberRangeValidator" Display="Dynamic" ControlToValidate="RevenuePerMemberInput"
                    MinimumValue="0" MaximumValue="100000000" Type="Double" />
            </div>
        </div>        
    </div>
</asiweb:PanelTemplateControl>
