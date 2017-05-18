<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationProgramDetails" Codebehind="CertificationProgramDetails.ascx.cs" %>

<asiweb:PanelTemplateControl id="panel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    
    <div style="margin:5px;">
        <asiweb:StyledLabel runat="server" Translate="no" ID="certProgramDescription"></asiweb:StyledLabel>
    </div>
    
    <div class="PanelField Left" runat="server" id="PrerequisiteProgramDiv" Visible="false">
        <asp:Label ID="prerequisiteProgramCaption" runat="server" CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:StyledLabel ID="prerequisiteProgramValue" runat="server" />
        </div>
    </div>
    
    <div class="PanelField Left" runat="server" id="StatusDiv">
        <asp:Label ID="statusCaption" runat="server" CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:StyledLabel ID="statusValue" translate="yes" runat="server" />
        </div>
    </div>

    <div class="PanelField Left">
        <asp:Label ID="numberOfUnitsCaption" runat="server" CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:StyledLabel ID="numberOfUnitsValue" runat="server" />
        </div>
    </div>

    <div class="PanelField Left">
        <asp:Label ID="timeAllowedCaption" runat="server" CssClass="Label" />
        <div class="PanelFieldValue">
            <asiweb:StyledLabel ID="timeAllowedValue" runat="server" />
        </div>
    </div>
 
    <div style="clear:both;"></div>  
    <div class="PanelTitle">
        <asiweb:StyledLabel runat="server" ID="lblRequirements"/>
    </div>

    <asiweb:Lister2
        id="lstCertificationModule"
        runat="server"
        Width="100%"
        AjaxEnabled="false"
        SortingEnabled="false"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DeleteColumnLocation="None"
        AddButtonLocation="None"
        EditColumnLocation="None"
        SelectColumnLocation="None"
        OnItemDataBound="ItemDataBound"
        OnNeedDataSource="LstCertificationModuleNeedDataSource"
        AllowRowSelecting="false" 
        AllowGridRowSelectStyle="false" 
    />

    <div style="padding:5px;">
        <asiweb:StyledLabel runat="server" ID="lblNote" ></asiweb:StyledLabel>
    </div>

    <div class="CommandBar" >
        <asiweb:StyledButton ID="btnRegister" runat="server" OnClick="BtnRegisterClick" CssClass="PrimaryButton" />    
        <asiweb:StyledButton ID="btnClose" runat="server" OnClientClick="GetRadWindow().Close();" />
    </div>    
       
</asiweb:PanelTemplateControl>
