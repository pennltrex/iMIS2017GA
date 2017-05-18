<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPreview1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPreview.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<div>
    <h3><asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:Label></h3>
    <div>
        <div class="CommandBar">
		    <asiweb:StyledButton id="btnBack" runat="server" CausesValidation="false" />
		    <asiweb:StyledButton id="btnRun" runat="server" CausesValidation="false" />
		    <asiweb:StyledButton id="btnCancel" runat="server" CausesValidation="false" />
        </div>
    </div>
    <div style="clear:both;">
        <asiweb:Lister2 ID="lstrResults" runat="server" ExportButtonLocation="TopRight"></asiweb:Lister2>
    </div>
</div>
