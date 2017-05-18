<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GiftAidReclaimDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidReclaim.GiftAidReclaimDisplay" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asiweb:PanelTemplateControl ID="ptcMain" runat="server" FieldSet="true" ShowHeader="true" Text="Gift Aid" Collapsible="false"  >
    <asp:placeholder id="phControls" Runat="server"></asp:placeholder>
</asiweb:PanelTemplateControl>

<style type="text/css">
    div.row
    {
        clear: both;
        padding-top: 0.25em;
        width: 100%;
    }
    div.rowRight
    {
        clear: both;
        padding-top: 0.25em;
        width: 100%;
        text-align:right;
    }    
    div.row span.label
    {
        float: left;
        width: 13em;
        text-align: left;
        padding-right: 3px;
    }
    div.row label.label
    {
        float: left;
        width: 13em;
        text-align: left;
        padding-right: 3px;
    }    
    span.error
    {
        font-weight: bold;
        color: Red;
    }   
    /*Temp - only here until the style is in the main IMIS style sheets*/ 
    .HelpHintLabel  
    {
                color:#808080;
                font-style:italic;
    }
    .HelpHint  {
                color:#808080;
    }
.GiftAidLabelPlaceholder
{
float: left;
text-align: left;
font-size: 0.9em;
font-weight: bold;
color: #666666;
width: 20%;
min-width: 10em;
padding-top: 3px;
padding-right: 3px;
padding-bottom: 3px;
padding-left: 3px;
/* white-space: pre-line; */
}
</style>
