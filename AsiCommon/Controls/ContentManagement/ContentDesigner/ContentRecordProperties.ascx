<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentRecordProperties" Codebehind="ContentRecordProperties.ascx.cs" %>

<asiweb:PanelTemplateColumn ID="Column1" runat="server">
    <div class="AutoWidth" >
        <asiweb:SmartControl ID="ShowInTemplate" runat="server" BoundPropertyName="ShowInTemplateFlag" DisplayCaption="true" PositionCaption="Right" style="width: auto;" />
        <asiweb:SmartControl ID="OpenInNewWindow" runat="server" BoundPropertyName="OpenInNewWindowFlag" DisplayCaption="true" PositionCaption="Right" style="width: auto;"  />
        <asiweb:SmartControl ID="IsHTTPS" runat="server" BoundPropertyName="IsHTTPS" DisplayCaption="true" PositionCaption="Right" style="width: auto;" />
    </div>
</asiweb:PanelTemplateColumn>
<asiweb:PanelTemplateColumn ID="Column2" runat="server">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="IsMemberOnly" runat="server" BoundPropertyName="IsMemberOnly" DisplayCaption="true" PositionCaption="Right" style="width: auto;" />
        <asiweb:SmartControl ID="RequireAuthenticatedUser" runat="server" BoundPropertyName="RequireAuthenticatedUser" DisplayCaption="true" PositionCaption="Right" style="width: auto;" />
    </div>
</asiweb:PanelTemplateColumn>
<br style="clear:both;" />
    <div class ="AutoWidth">
        <asp:Label runat="server" ID="RedirectInstructionsLabel" AssociatedControlID="RedirectInstructionsDropDown"/>
        <asiweb:BusinessDropDownList runat="server" ID="RedirectInstructionsDropDown" AutoPostBack="True" OnSelectedIndexChanged="RedirectInstructionsDropDown_OnSelectedIndexChanged"/>
        <asiweb:InfoControl runat="server" ID="RedirectInstructionsInfo" ></asiweb:InfoControl>
        <br style="clear:both;" />
        <div class="PanelField Left" style="margin-left: 20px; margin-top: 5px;">
            <asp:Label runat="server" ID="RedirectTargetLabel" AssociatedControlID="RedirectTargetSelector" Enabled="True"></asp:Label>
            <div class="PanelFieldValue"  style="padding-bottom:5px;">
                <asiweb:BusinessDocumentBrowserControl ID="RedirectTargetSelector" runat="server" Required="True" RootFolder="@/" DisplayCaption="False" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="RedirectTargetValidator" ControlToValidate="RedirectTargetSelector_DocBrowserPath"
                 Enabled="True" EnableClientScript="False" Display="Dynamic" SetFocusOnError="True" Text="Required" />
            </div>
        </div>
    </div>
<br style="clear:both;" />
<asiweb:PanelTemplateColumn ID="Column3" runat="server" LabelWidth="20em">
    <asiweb:SmartControl ID="Description" runat="server" BoundPropertyName="Description" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl ID="Keywords" runat="server" BoundPropertyName="Keywords" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl ID="PublicationDate" runat="server" BoundPropertyName="PublicationDate" DisplayCaption="true" PositionCaption="Left" OnDataChange="PublicationDate_Changed" />
    <asiweb:SmartControl ID="PublishDateime" runat="server" BoundPropertyName="PublishDateTime" DisplayCaption="true" PositionCaption="Left" />
    <div class="PanelField Left">
        <asp:Label ID="PublishFrequencyCaption" runat="server" AssociatedControlID="PublishFrequency" />
        <div class="PanelFieldValue FloatNone">
            <asp:TextBox ID="PublishFrequency" runat="server" />
            <asp:RangeValidator ID="PublishFrequencyValidator" ControlToValidate="PublishFrequency" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="<br />Please enter a number greater than or equal to 0.<br />" Display="Dynamic" runat="server"/>
            <asp:RadioButtonList ID="PublishFrequencyUnit" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="AutoWidth" >
                <asp:ListItem>minutes</asp:ListItem>
                <asp:ListItem>hours</asp:ListItem>
                <asp:ListItem>days</asp:ListItem>
                <asp:ListItem>weeks</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <asiweb:SmartControl ID="ImportantUntil" runat="server" BoundPropertyName="ImportantUntilDate" DisplayCaption="true" PositionCaption="Left" />
    <asp:Repeater ID="UDFRepeater" runat="server" OnDataBinding="UDFDataBinding" OnItemCreated="UDFItemCreated">
        <ItemTemplate>
            <asiweb:SmartControl ID="UDFSmartControl" runat="server" UseParentControlBusinessItem="false" AtomComponentName="ContentUserDefinedField" BoundPropertyName="Value" PositionCaption="Left" />
        </ItemTemplate>
    </asp:Repeater>
    <asp:HiddenField ID="UDFSmartControlKeys" runat="server" />
    <%--<asiweb:SmartControl ID="HelpURL" runat="server" BoundPropertyName="HelpURL" DisplayCaption="true" PositionCaption="Left" />--%>
    <asiweb:SmartControl ID="ContentCode" runat="server" BoundPropertyName="ContentCode" DisplayCaption="true" PositionCaption="Left" />
    <asiweb:SmartControl ID="CacheDuration" runat="server" BoundPropertyName="CacheDuration" DisplayCaption="true" PositionCaption="Left">
        <asiweb:StyledLabel runat="server" ID="CacheOffMessage" CssClass="Info" Visible="False" Text="Note: All page caching is currently disabled in the web.config." />
    </asiweb:SmartControl>
<%--    <asiweb:SmartControl ID="CacheForAuthenticatedUsers" runat="server" BoundPropertyName="CacheForAuthenticatedUsers" DisplayCaption="true" PositionCaption="Left" />--%>
    <asiweb:SmartControl ID="PageWrapperCssClass" runat="server" BoundPropertyName="PageWrapperCssClass" DisplayCaption="true" PositionCaption="Left" />
    <div class="PanelField">
        <div class="PanelFieldValue AutoWidth FloatNone">
            <asp:CheckBox ID="IsPartOfTemplateContent" runat="server" Text="This content is part of the site's template design" TextAlign="Right" 
                AutoPostBack="true" OnCheckedChanged="IsPartOfTemplateContent_CheckedChanged" />
        </div>
        <br style="clear:both;" />
        <div class="PanelFieldValue AutoWidth" style="margin-left: 20px;">
            <asiweb:SmartControl ID="ContentAreaControl" runat="server" BoundPropertyName="ContentArea" DisplayCaption="true" PositionCaption="Left" />
        </div>
    </div>
</asiweb:PanelTemplateColumn>