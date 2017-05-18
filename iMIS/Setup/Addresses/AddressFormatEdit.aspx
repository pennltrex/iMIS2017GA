<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressFormatEdit.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.AddressFormatEdit" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">   
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false">
        <div class="row"  style="max-width: 800px">
            <div class="col-sm-9">
                <asiweb:BusinessTextBox ID="FormatCodeTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputMedium"/>
                <asiweb:BusinessTextBox ID="DescriptionTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputXLarge"/>
                <asiweb:BusinessTextBox ID="FormulaTextBox" runat="server" Rows="5" TextMode="MultiLine" DisplayCaption="True" RenderPanelField="True" CssClass="InputXLarge"/>
            </div>
            <div class="col-sm-3">
                <select id="select1" onclick="appendFormula(this);" onkeypress="enterKeyPress(event,this);" size="13" name="select1">
                    <option value="ADDRESS_1"> ADDRESS_1 </option>
                    <option value="ADDRESS_2"> ADDRESS_2 </option>
                    <option value="ADDRESS_3"> ADDRESS_3 </option>
                    <option value="CITY"> CITY </option>
                    <option value="STATE_PROVINCE"> STATE_PROVINCE </option>
                    <option value="ZIP"> ZIP </option>
                    <option value="COUNTRY"> COUNTRY </option>
                    <option value="[U]"> [U] - Uppercase </option>
                    <option value="[N]"> [N] - New line </option>
                    <option value="[S]"> [S] - Space </option>
                    <option value="[C]"> [C] - Comma </option>
                </select>
            </div>
        </div>
    </asiweb:PanelTemplateControl2>
</asp:content>