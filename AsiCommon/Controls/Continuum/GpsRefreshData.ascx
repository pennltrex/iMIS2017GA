<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GpsRefreshData.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Continuum.GpsRefreshData" %>
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
                <asiweb:BusinessTextBox runat="server" ID="NewYearInput"  />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="NewYearInputRequiredValidator" Display="Dynamic" ControlToValidate="NewYearInput" />
                <asp:RangeValidator runat="server" ID="NewYearInputRangeValidator" MinimumValue="2000" MaximumValue="2100" Type="Integer" Display="Dynamic" ControlToValidate="NewYearInput" />
                <asp:CustomValidator runat="server" ID="NewYearCustomValidator" OnServerValidate="NewYearCustomValdatorServerValidate" Display="Dynamic" />
            </div>
        </div>
    </div>
</asiweb:PanelTemplateControl>
