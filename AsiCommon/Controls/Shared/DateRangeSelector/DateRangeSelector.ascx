<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_DateRangeSelector_DateRangeSelector" Codebehind="DateRangeSelector.ascx.cs" %>

<script type="text/javascript">
function radioFixed_Click() 
{
    // Show fixed dates section, hide relative dates section
    var divFixed = document.getElementById("<%= divFixedDates.ClientID %>");
    var divRelative = document.getElementById("<%= divRelativeDates.ClientID %>");
    divFixed.style.display = "block";
    divRelative.style.display = "none";
}
function radioRelative_Click() 
{
    // Show relative dates section, hide fixed dates section
    var divFixed = document.getElementById("<%= divFixedDates.ClientID %>");
    var divRelative = document.getElementById("<%= divRelativeDates.ClientID %>");
    divFixed.style.display = "none";
    divRelative.style.display = "block";
}
</script>

<div style="padding-left:35px;">
 
    <div style="white-space: nowrap;">
        <asp:RadioButton ID="radioRelative" Checked="true" GroupName="DateFilterType" runat="server" />
        <asp:RadioButton ID="radioFixed" GroupName="DateFilterType" runat="server" />
    </div>

    <div runat="server" id="divRelativeDates" style="text-align:left;float:left;padding-left:5px;">
        <span class="FloatNone">
            <asp:Label ID="lblRelative1" runat="server"/>
            <asp:TextBox style="min-width:0;Width:4em" ID="txtRelNumDaysBefore" runat="server"/>
            <asp:Label ID="lblRelative2" runat="server"/>
        </span>    
        <span class="FloatNone">
            <asp:Label ID="lblRelative3" runat="server"/>
            <asp:TextBox ID="txtRelNumDaysAfter" style="min-width:0;Width:4em" runat="server"/>
            <asp:Label ID="lblRelative4" runat="server"/>
        </span>
    </div>

    <div runat="server" id="divFixedDates" style="text-align:left;float:left;white-space: nowrap;padding-left:5px;">
        <asp:Label ID="lblBetween" runat="server" style="padding-right:5px;"/>
        <asiweb:BusinessCalendar id="fixedStartDate" runat="server" DisplayCaption="true" PositionCaption="Left"/>
        <asp:Label ID="lblAnd" runat="server" style="padding-right:5px;"/>      
        <asiweb:BusinessCalendar id="fixedEndDate" runat="server" DisplayCaption="true" PositionCaption="Left"/>
    </div>

</div>