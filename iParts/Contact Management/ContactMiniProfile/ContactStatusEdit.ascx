<%@ Control Language="C#" CodeBehind="ContactStatusEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactStatusEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="ContactStatusFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    <div> 
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayCustomerId" runat="server" BoundPropertyName="DisplayCustomerId" DisplayCaption="true" PositionCaption="Right"  AutoPostBack="true" DataSaveUponStateChange="false" />        
        </div>
        <div class="SubItems">
            <asiweb:SmartControl ID="CustomerIdHeading" runat="server" BoundPropertyName="CustomerIdHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
        </div>
    </div>
    <div>
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayBillingCat" runat="server" BoundPropertyName="DisplayBillingCat" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false"/>
        </div>
        <div class="SubItems">
             <asiweb:SmartControl ID="CustomerBillingHeading" runat="server" BoundPropertyName="CustomerBillingHeading" DisplayCaption="true" DataSaveUponStateChange="false" />    
        </div>
    </div>
    <div>
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayCustomerJoinDate" runat="server" BoundPropertyName="DisplayCustomerJoinDate" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false" />
        </div>
        <div class="SubItems">
             <asiweb:SmartControl ID="CustomerJoinHeading" runat="server" BoundPropertyName="CustomerJoinHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
        </div>
    </div>
    <div>
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayCustomerType" runat="server" BoundPropertyName="DisplayCustomerType" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false" />
        </div>
        <div class="SubItems">
            <asiweb:SmartControl ID="CustomerTypeHeading" runat="server" BoundPropertyName="CustomerTypeHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
        </div>
    </div>
    <div>
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayCustomerStatus" runat="server" BoundPropertyName="DisplayCustomerStatus" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false" />
        </div>
        <div class="SubItems">             
             <asiweb:SmartControl ID="CustomerStatusHeading" runat="server" BoundPropertyName="CustomerStatusHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
        </div>
    </div>
    <div>
        <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayPaidThru" runat="server" BoundPropertyName="DisplayPaidThru" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" DataSaveUponStateChange="false" />
        </div>
        <div class="SubItems">
             <asiweb:SmartControl ID="CustomerPaidThruHeading" runat="server" BoundPropertyName="CustomerPaidThruHeading" DisplayCaption="true" DataSaveUponStateChange="false" />    
        </div>
    </div>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="ChangeContactStatus" runat="server" BoundPropertyName="ChangeContactStatus" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />       
    </div>
</asiweb:PanelTemplateControl>