<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressMapperConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.AddressMapper.AddressMapperConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:SmartControl ID="AddressToDisplay" runat="server" BoundPropertyName="AddressToDisplay" DisplayCaption="true" DataSaveUponStateChange="false" ShowNullItem="False" />

<asiweb:SmartControl ID="ApiKey" runat="server" BoundPropertyName="ApiKey" DisplayCaption="true" PositionCaption="Left"  DataSaveUponStateChange="false"/>
        
<asiweb:SmartControl ID="MapWidth" runat="server"  BoundPropertyName="MapWidth" 
    DisplayCaption="true" DataSaveUponStateChange="false" PositionCaption="Left" MinValue="175" MaxValue="1000" /> 
<asiweb:SmartControl ID="MapHeight"  runat="server"  BoundPropertyName="MapHeight" 
    DisplayCaption="true" DataSaveUponStateChange="false"  PositionCaption="Left"   MinValue="175" MaxValue="1000" />
<asiweb:SmartControl ID="ZoomLevel"  runat="server"  BoundPropertyName="ZoomLevel" 
    DisplayCaption="true" DataSaveUponStateChange="false"  PositionCaption="Left" MinValue="0" MaxValue="22" />
  
 