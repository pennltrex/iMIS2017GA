<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryChartViewerConfigEdit.ascx.cs" 
    Inherits="Asi.Web.iParts.Common.QueryChartViewer.QueryChartViewerConfigEdit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>

<script type="text/javascript">
    //<![CDATA[

    function TypeChanged(cName, Index) {

        // Get value of selected control and index        
        var elm = document.getElementById(cName);
        var base = cName;
        var tmp = Index + "_Type";
        base = base.substring(0, cName.length - tmp.length);
              
        if (elm != null) {
            // Get element value
            if (elm.value == "0" || elm.value == "1") {
                // First get a base for the control name
                // Dipslay text box and hide list
                tmp = base + Index + "_ValueBox";
                if (document.getElementById(tmp) != null)
                    document.getElementById(tmp).style.display = 'block';

                tmp = base + Index + "_ValueList";
                if (document.getElementById(tmp) != null)
                    document.getElementById(tmp).style.display = 'none';
                   
            }
            else {
               
                var tmp0 = base + Index + "_ValueBox";
                if (document.getElementById(tmp0) != null) {
                    document.getElementById(tmp0).style.display = 'none';
                    document.getElementById(tmp0).value = 0;            
                }

                var tmp1 = base + Index + "_ValueList";
                if (document.getElementById(tmp1) != null) {
                    document.getElementById(tmp1).style.display = 'block';
                }
                                
            }
                
        }
        else
            alert('Cannot find control');
    }

    function FormatChanged(clstName, ctextName) {
        // Get value of selected control and index        
        var elm = document.getElementById(clstName);
        if (elm != null) {

            if (elm.value == "99") {
                // First get a base for the control name
                // Display text box and hide list
                if (document.getElementById(ctextName) != null)
                    document.getElementById(ctextName).style.display = 'block';
            }
            else {
                if (document.getElementById(ctextName) != null)
                    document.getElementById(ctextName).style.display = 'none';
            }
        }
        else
            alert('Cannot find control');
    }
    //]]>
</script>

<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false"
    borderstyle="None">
    <div class="Section">
        <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
            DisplayCaption="true" DataSaveUponStateChange="false" InputFieldCssClass="InputXLargeWrapper" />
      
        <div class="AutoWidth AddPaddingVertical">
            <asiweb:SmartControl 
                ID="DoNotRenderInDesignMode" runat="server" 
                BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />
            
            <asiweb:SmartControl 
                ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />          
        </div> 
    </div> 
    <div style="clear: both;"></div> 
    <div class="AutoWidth">
        <asiweb:SmartControl BoundPropertyName="DisplayForAuthorizedUsersOnly" DataSaveUponStateChange="false" DisplayCaption="true" ID="DisplayForAuthorizedUsersOnly" PositionCaption="Right" runat="server" />         
    </div>  
    <div class="ShowFieldset">
            		
		<fieldset>		        
            <legend>Chart data</legend>               
            <!-- Begin chart data section -->   
            <asiweb:SmartControl 
                ID="ChartSourceQuery" runat="server" 
                BoundPropertyName="ChartSourceQuery" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" InputFieldCssClass="InputXLargeWrapper" /> 
                                                                      
            <div class="PanelField Left" ID="DivQueryProperty" runat="server" visible="false">
                <div class="PanelFieldLabel">
                    <label id="QueryPropertyLabel" for="LabelQueryProperty"></label>
                </div>
                <div class="PanelFieldValue">
                    <asp:Label ID="LabelQueryProperty" runat="server"/>
                </div>
            </div> 
            
            <div class="PanelField Left" id="DivSeriesDataColumn" runat="server" visible="false">
                <div class="PanelFieldLabel">
                    <label id="LabelSeriesDataColumn" for="SelectSeriesColumn" runat="server">Series data column</label>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectSeriesColumn" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="clear: both;"></div> 

            <div class="PanelField Left" id="DivSeriesDataFormat" runat="server" visible="false">
                <div class="PanelFieldLabel">
                    <label id="LabelSeriesDataFormat" for="SelectSeriesFormat" runat="server">Series data format</label>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectSeriesFormat" runat="server" ></asp:DropDownList><asp:TextBox ID="txtSeriesFormat" runat="server" Visible="false"></asp:TextBox>
                </div>
            </div>
            <div style="clear: both;"></div>       
                                 
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="LabelSelectDataColumn" AssociatedControlID="SelectDataColumn" runat="server">Data axis</asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectDataColumn" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="clear: both;"></div>             
                  
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="LabelSelectDataFormat" AssociatedControlID="SelectDataFormat" runat="server">Data axis format</asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectDataFormat" runat="server" ></asp:DropDownList><asp:TextBox ID="txtDataFormat" runat="server" />
                </div>
            </div>
            <div style="clear: both;"></div>             
        
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="LabelSelectLabelColumn" AssociatedControlID="SelectLabelColumn" runat="server">Label axis column</asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectLabelColumn" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="clear: both;"></div>             
 
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="LabelSelectLabelsFormat" AssociatedControlID="SelectLabelsFormat" runat="server">Label axis format</asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectLabelsFormat" runat="server"></asp:DropDownList><asp:TextBox ID="txtLabelsFormat" runat="server" ></asp:TextBox>
                </div>
            </div>
            <div style="clear: both;"></div>  
      
            <div class="AutoWidth">    
                <asiweb:SmartControl 
                    ID="HideEmptyChart" runat="server" 
                    BoundPropertyName="HideEmptyChart" DisplayCaption="true"  
                    PositionCaption="Right" DataSaveUponStateChange="false" OnClientChange="EnableDisableNoDataMessage()" /> 
            </div>
            <div style="clear: both;"></div>  
    
            <asiweb:SmartControl 
                ID="NoDataMessage" runat="server" 
                BoundPropertyName="NoDataMessage" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false"/>  
            <!-- End chart data section -->        
        </fieldset>
        
        <fieldset>           
            <legend>Display options</legend>
            <!-- Begin display option section --> 
            <asiweb:SmartControl ID="ChartTitle" runat="server" BoundPropertyName="ChartTitle" 
                DisplayCaption="true" DataSaveUponStateChange="false" />
            
            <asiweb:SmartControl ID="ChartType" runat="server" BoundPropertyName="ChartType" 
                DisplayCaption="true" DataSaveUponStateChange="false" AutoPostBack="true" />
            
            <asiweb:SmartControl 
                ID="EnableStackedSeries" runat="server" 
                BoundPropertyName="EnableStackedSeries" DisplayCaption="true"  
                PositionCaption="Right" DataSaveUponStateChange="false" /> 
            
            <div class="PanelField Left">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel id="LabelSelectSkinName" AssociatedControlID="SelectSkinName" runat="server">Skin</asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asp:DropDownList ID="SelectSkinName" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div style="clear: both;"></div>         
            
            <asiweb:SmartControl 
                ID="ChartWidth" runat="server" 
                BoundPropertyName="ChartWidth" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" />   

            <asiweb:SmartControl 
                ID="ChartHeight" runat="server" 
                BoundPropertyName="ChartHeight" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" /> 

            <!-- End display option section -->                           
        </fieldset>        
        
        <fieldset>           
            <legend>Labels</legend>
            <!-- Begin labels section --> 
            <asiweb:SmartControl 
                ID="ChartSeriesLabel" runat="server" 
                BoundPropertyName="ChartSeriesLabel" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" />     
    
            <asiweb:SmartControl 
                ID="ChartSeriesLegendPosition" runat="server" 
                BoundPropertyName="ChartSeriesLegendPosition" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" ShowNullItem="false" />
      
            <asiweb:SmartControl 
                ID="DisplayChartLabels" runat="server" 
                BoundPropertyName="DisplayChartLabels" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />           
        
             <asiweb:SmartControl 
                ID="ChartLabelRotationAngle" runat="server" 
                BoundPropertyName="ChartLabelRotationAngle" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" /> 
    
            <asiweb:SmartControl 
                ID="EnableTooltips" runat="server" 
                BoundPropertyName="EnableTooltips" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />     
                                              
            <!-- End labels section -->                            
        </fieldset> 

    </div>                      
                                                                 
    <asp:Panel ID="PanelSettings" runat="server" Visible="true" EnableViewState="true">
        <asiweb:PanelTemplateControl ID="LabelSettings" TemplateTitle="Query Settings" runat="server" FieldSet="true" ShowHeader="true" BorderStyle="None" >
            <asp:Table ID="TableSettings" runat="server" CellPadding="5" EnableViewState="true"></asp:Table>
        </asiweb:PanelTemplateControl>
    </asp:Panel>      
    
    <asp:HiddenField ID="HiddenParametersCount" runat="server" Value="0" />
     
 </asiweb:paneltemplatecontrol>
 
 <script type="text/javascript">
    //<![CDATA[
    EnableDisableNoDataMessage();
    function EnableDisableNoDataMessage() {
        var hideEmptyChart = $get("<%#HideEmptyChart.ClientID%>_CheckBoxSet");
        var noDataMessage = $get("<%#NoDataMessage.ClientID%>");

        if (hideEmptyChart != undefined)
            if (hideEmptyChart.checked){
                noDataMessage.disabled = true;
                noDataMessage.style.display = "none";
            }
            else
            {
               noDataMessage.disabled = false;
               noDataMessage.style.display = "block";
            }
               
    }
 //]]>
</script>