<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassic" Codebehind="DesignClassic.ascx.cs" %>
<%@ Reference Control="~/asicommon/controls/querybuilder/designmain.ascx" %>

<telerik:RadTabStrip ID="RadTabStrip" SelectedIndex="0" ScrollChildren="false"   
    runat="server" Orientation="HorizontalTop" ScrollPosition="0" CausesValidation="True" AutoPostBack="true" 
    OnTabClick="RadTabStripTabClick" SkinId="SubTabs">     
    <Tabs>
        <telerik:RadTab Text="Summary" PageViewID="SummaryTab" Enabled="true" />
        <telerik:RadTab Text="Sources" PageViewID="SourcesTab" Enabled="true" />
        <telerik:RadTab Text="Filters" PageViewID="FiltersTab" Enabled="false" />
        <telerik:RadTab Text="Display" PageViewID="ColumnsTab" Enabled="false" />
        <telerik:RadTab Text="Sorting" PageViewID="SortingTab" Enabled="false" />
    </Tabs>
</telerik:RadTabStrip> 
<div style="padding-top:0.3em;">
    <asp:PlaceHolder id="ChildControlsPlaceHolder" runat="server"></asp:PlaceHolder>
</div>