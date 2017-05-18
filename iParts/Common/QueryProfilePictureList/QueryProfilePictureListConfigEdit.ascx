<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryProfilePictureListConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.QueryProfilePictureList.QueryProfilePictureListConfigEdit" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
        
    <div class="AutoWidth">
    
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            
    </div>  
 
    <asiweb:SmartControl 
        ID="ListSourceQuery" runat="server" 
        BoundPropertyName="ListSourceQuery" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 

    <div class="PanelField Left" ID="DivLabelIQAError" runat="server" >
        <div>
            <span id="LabelIQAErrorLabel" class="Label"></span>
        </div>
        <div class="PanelFieldValue">
            <asp:Label ID="LabelIQAError" runat="server" />
        </div>
    </div>  
                      
    <asiweb:SmartControl ID="MaxRecords" runat="server" BoundPropertyName="MaxRecords" 
        DisplayCaption="true" DataSaveUponStateChange="false" />   
        
      <div class="PanelField Left">
        <div>
            <asp:Label id="LabelSelectDataColumn" AssociatedControlID="SelectDataColumn" runat="server" ></asp:Label> 
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectDataColumn" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div style="clear: both;"></div>
    
    <asiweb:SmartControl ID="QueryStringParameterName" runat="server" BoundPropertyName="QueryStringParameterName" 
        DisplayCaption="true" DataSaveUponStateChange="false" /> 
        
    <asiweb:SmartControl ID="ListDescription" runat="server" BoundPropertyName="ListDescription" 
        DisplayCaption="true" DataSaveUponStateChange="false" />     
        
    <asiweb:SmartControl ID="NoRecordsFound" runat="server" BoundPropertyName="NoRecordsFound" 
        DisplayCaption="true" DataSaveUponStateChange="false" />                  
    
    <asiweb:SmartControl ID="ClickUrl" runat="server" BoundPropertyName="ClickUrl" 
        DisplayCaption="true" DataSaveUponStateChange="false" />     
          
    <asiweb:SmartControl ID="ImageDimension" runat="server" BoundPropertyName="ImageDimension" 
        DisplayCaption="true" DataSaveUponStateChange="false" />     
        
    <asiweb:SmartControl ID="DisplayOrientation" runat="server" BoundPropertyName="DisplayOrientation" 
        DisplayCaption="true" DataSaveUponStateChange="false" />  
                      
    <asp:HiddenField ID="HiddenParametersCount" runat="server" Value="0" />   
     
 </asiweb:paneltemplatecontrol>