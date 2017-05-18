<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryChartViewerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.QueryChartViewer.QueryChartViewerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" translate="yes">                          
    <div class="ChartContainer" id="ChartContainerDiv" runat="server" style="width:100%;height:100%;">
        <telerik:RadHtmlChart runat="server" ID="RadChart1" Transitions="true" EnableViewState="false" />
    </div>                           
    <div class="AsiInformation" id="NoDataMessageDiv" runat="server" style="height:99%;width:99%;margin:auto;text-align:center;margin-top:5px;" Visible="false">
        <asp:Label ID="NoDataMessageLabel" runat="server" Visible="false" />
    </div>       
</telerik:RadAjaxPanel> 
<script>  
    //<![CDATA[  
    jQuery(window).resize(resizeChart_<%#ClientID%>);
    function resizeChart_<%#ClientID%>() {
        var chart = $find("<%#RadChart1.ClientID%>");
        var chartContainer = $get("<%#ChartContainerDiv.ClientID%>");
        if (chartContainer != null && chart != null) {
            chartContainer.style.display = "";                       
            if (chart._element.getAttribute('data-chartlayout')) {
                var size = $telerik.getBounds(chartContainer);
                if (chart._element.getAttribute('data-widthresize'))
                    chart.set_width(size.width + "px");
                if (chart._element.getAttribute('data-heightresize'))
                    chart.set_height(size.height + "px");
                chart.repaint();                
            }
        }
    }
    jQuery(document).ready(documentMode_<%#ClientID%>);
    function documentMode_<%#ClientID%>() {
        if (document.documentMode != null
            && document.documentMode == 5
            || document.documentMode == 7
            || document.documentMode == 8) {
            var chartContainer = jQuery("#<%#ChartContainerDiv.ClientID%>");
            //Needed to handle document mode issues
            chartContainer.append('<style>.k-tooltip{display:none!important;}</style>');
        }
    }       
    //]]>
</script>    
