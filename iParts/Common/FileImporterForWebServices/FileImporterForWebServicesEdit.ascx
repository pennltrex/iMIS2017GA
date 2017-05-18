<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileImporterForWebServicesEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesEdit" %>
<%@ Import Namespace="Asi"%>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" />
    <%-- ReSharper disable UnknownCssClass --%>
    <div class="AutoWidth">
        <%-- ReSharper restore UnknownCssClass --%>
        
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" />

        <%-- ReSharper disable UnknownCssClass --%>
        <asiweb:BusinessRadioButtonList ID="UseContractBuilders" OnSelectedIndexChanged="RuleTypeRadioButtonList_SelectedIndexChanged" AutoPostBack="True" runat="server" DisplayCaption="True" Caption='<%# ResourceManager.GetPhrase("FileImporterForWebServices.UseContractBuilders2", "Available file formats")%>' 
            RenderPanelField="True" CssClass="AutoWidth" RepeatDirection="Horizontal" PositionCaption="Top">
            <%-- ReSharper restore UnknownCssClass --%>
            <asp:ListItem Text="Standard" Value="Standard" Enabled="True"/>
            <asp:ListItem Text="Custom" Value="Custom" Selected="True" Enabled ="True"/>
        </asiweb:BusinessRadioButtonList>
        <%-- ReSharper disable UnknownCssClass --%>
        <div class="PanelField">
            <%-- ReSharper restore UnknownCssClass --%>
            <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" ></asp:Label>
            <asiweb:MultiSelectControl2 RenderPanelField="true" ID="FileTypeSelector" Height="15em" Width="22em" runat="server"
                Caption="Standard File Formats" PositionCaption="Top" DisplayCaption="true" />
            <asiweb:MultiSelectControl2 RenderPanelField="true" ID="BuildersTypeSelector" Height="15em" Width="22em" runat="server" 
                Caption="Custom File Formats" PositionCaption="Top" DisplayCaption="true">
            </asiweb:MultiSelectControl2>
        </div>
    </div>   
</asiweb:paneltemplatecontrol>
