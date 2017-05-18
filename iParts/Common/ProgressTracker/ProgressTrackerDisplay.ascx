<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProgressTrackerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ProgressTracker.ProgressTrackerDisplay" %>
 <%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel id="ContentPanel" runat="server" Visible="true" class="ProgressTrackerPanel" translate="yes">
    
    <div id="ProgressBarTop" runat="server" Visible="false" class="ProgressBar">
        <asp:Label id="ProgressPercentTop" runat="server" Visible="false" />
    </div>
    
    <asp:Label id="SuccessfulMessageTop" runat="server" Visible="false" CssClass="SuccessfulMessage" />
       	
    <ul>
        <li id="liGoalPercent" runat="server">
            <span class="inset" id="divGoalPercent" runat="server" Visible="true" >
                <span class="count">
                    <asiweb:StyledLabel id="labelGoalPercent" runat="server" Text="0" />
                </span>
                <span class="label" id="labelGoalPercentDescription" runat="server" />
            </span>
        </li>
        <li id="liGoalCount" runat="server">
            <span class="inset" id="divGoalCount" runat="server" Visible="true" >
                <span class="count">            
                    <asiweb:StyledLabel id="labelGoalCount" runat="server" Text="0" />                   
                </span>
                <span class="label" id="labelGoalCountDescription" runat="server" />
            </span>	 
        </li>
        <li id="liGoalDaysRemaining" runat="server">
            <span class="inset" id="divGoalDaysRemaining" runat="server" Visible="true" >
                <span class="count">         
                    <asiweb:StyledLabel id="labelGoalDaysRemaining" runat="server" Text="0" />
                </span>
                <span class="label" id="labelGoalDaysRemainingDescription" runat="server" />
            </span>       
        </li>
    </ul> 
    
    <asp:Label id="SuccessfulMessageBottom" runat="server" Visible="false" CssClass="SuccessfulMessage" />
       
    <div id="ProgressBarBottom" runat="server" Visible="false" class="ProgressBar">
        <asp:Label id="ProgressPercentBottom" runat="server" Visible="false" />
    </div>
    
    <p id="labelProgressDescription" runat="server" Visible="false" />
         
    <asp:PlaceHolder id="QueryShortcut" runat="server" />

</asp:Panel>