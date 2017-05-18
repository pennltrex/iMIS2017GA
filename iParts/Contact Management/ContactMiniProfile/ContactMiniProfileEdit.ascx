<%@ Control Language="C#" CodeBehind="ContactMiniProfileEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactMiniProfileEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl ID="MiniProfile2Fields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    
    <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="100" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>
    
    <div class="Section"></div>
    <asp:UpdatePanel runat="server" ID="ContactNameOptionsUpdatePanel">
        <ContentTemplate>
            <div class="AutoWidth">
                <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                <asiweb:SmartControl ID="DisplayContactName" runat="server" BoundPropertyName="DisplayContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                <asiweb:SmartControl ID="DisplayContactTitle" runat="server" BoundPropertyName="DisplayContactTitle" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                <asiweb:SmartControl ID="DisplayInstitute" runat="server" BoundPropertyName="DisplayInstitute" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />                
                <div class="AutoWidth">
                    <asiweb:SmartControl ID="DisplayMobilePhone" runat="server" BoundPropertyName="DisplayMobilePhone" DisplayCaption="true" PositionCaption="Right"  AutoPostBack="true" DataSaveUponStateChange="false" EnableAjaxPostback="True"/>
                </div>
                <div class="SubItems">             
                    <asiweb:SmartControl ID="MobilePhoneHeading" runat="server" BoundPropertyName="MobilePhoneHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
                </div>              
                <asiweb:SmartControl ID="EditContactName" runat="server" BoundPropertyName="EditContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" OnDataChange="EditContactNameAllowedChange" AutoPostBack="True" EnableAjaxPostback="True"/>
                <div class="SubItems"> 
                    <asiweb:SmartControl runat="server" EnableAjaxPostback="True" ID="IncludePrimaryOrganizationSelectionControl"
                        BoundPropertyName="IncludePrimaryOrganizationSelection" DisplayCaption="True"
                        OnDataChange="IncludePrimaryOrganizationSelectionChanged" AutoPostBack="True"
                        PositionCaption="Right" DataSaveUponStateChange="False" />
                    <asiweb:SmartControl runat="server" id="RequirePrimaryOrganizationSelectionControl"
                        BoundPropertyName="RequirePrimaryOrganizationSelection" DisplayCaption="True" 
                        PositionCaption="Right" DataSaveUponStateChange="False" />
                    <asiweb:SmartControl ID="OrganizationListQueryPathControl" runat="server" 
                        BoundPropertyName="OrganizationListQueryPath" DisplayCaption="True" InputFieldCssClass="InputXLargeWrapper"
                        DataSaveUponStateChange="False" DocumentTypesAllowed="IQD" HIControlType="DocumentPathSelector" />
                </div>
            </div>  
        </ContentTemplate>
    </asp:UpdatePanel> 

    <div class="SectionLabel">Picture</div>
        <div class="AddPaddingHorizontal Section">  
        <div class="AutoWidth">    
            <asiweb:SmartControl ID="displayContactPicture" runat="server" BoundPropertyName="DisplayContactPicture" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" />    
        </div>          
        <div class="AutoWidth">    
            <asiweb:SmartControl id="enableEdit" runat="server" boundpropertyname="EnableEdit" displaycaption="True" positioncaption="Right" DataSaveUponStateChange="false" />		
        </div>            
        <asiweb:SmartControl id="maxFileSize" runat="server" boundpropertyname="MaxFileSize" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="1" MaxValue="1073741824" />        
        <asiweb:SmartControl id="maxImageWidth" runat="server" boundpropertyname="MaxImageWidth" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="50" MaxValue="1000" />    
        <asiweb:SmartControl id="fileTypes" runat="server" boundpropertyname="FileTypes" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" />         
    </div>

    <div class="SectionLabel">Address</div>
    <div class="AddPaddingHorizontal Section">    
        <asiweb:SmartControl ID="AddressToDisplay" runat="server" BoundPropertyName="AddressToDisplay" DisplayCaption="true" DataSaveUponStateChange="false" />  
    </div>

    <div class="SectionLabel">Status</div>
    <div class="AddPaddingHorizontal">
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel">      
            <asp:Button runat="server" id="refreshTrigger" style="display:none" Text="" OnClick="RefreshTriggerClick"></asp:Button>            
            <div class="AutoWidth">
                <asiweb:SmartControl ID="DisplayCustomerId" runat="server" BoundPropertyName="DisplayCustomerId" DisplayCaption="true" PositionCaption="Right"  DataSaveUponStateChange="false" />
            </div>
            <div class="SubItems">
                <asiweb:SmartControl ID="CustomerIdHeading" runat="server" BoundPropertyName="CustomerIdHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
            </div>
                       
            <div class="AutoWidth">
                <asiweb:SmartControl ID="DisplayBillingCat" runat="server" BoundPropertyName="DisplayBillingCat" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false"/>
            </div>
            <div class="SubItems">
                <asiweb:SmartControl ID="CustomerBillingHeading" runat="server" BoundPropertyName="CustomerBillingHeading" DisplayCaption="true" DataSaveUponStateChange="false" />    
            </div>
                     
            <div class="AutoWidth">
                <asiweb:SmartControl ID="DisplayCustomerJoinDate" runat="server" BoundPropertyName="DisplayCustomerJoinDate" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            </div>
            <div class="SubItems">
                <asiweb:SmartControl ID="CustomerJoinHeading" runat="server" BoundPropertyName="CustomerJoinHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
            </div>            
            <div id="DisplayCustomerTypeDiv" runat="server">
                <div class="AutoWidth">
                    <asiweb:SmartControl ID="DisplayCustomerType" runat="server" BoundPropertyName="DisplayCustomerType" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                </div>
                <div class="SubItems">
                    <asiweb:SmartControl ID="CustomerTypeHeading" runat="server" BoundPropertyName="CustomerTypeHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
                </div>
            </div>           
            <div class="AutoWidth">
                <asiweb:SmartControl ID="DisplayCustomerStatus" runat="server" BoundPropertyName="DisplayCustomerStatus" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            </div>
            <div class="SubItems">             
                <asiweb:SmartControl ID="CustomerStatusHeading" runat="server" BoundPropertyName="CustomerStatusHeading" DisplayCaption="true" DataSaveUponStateChange="false" />
            </div>           
            <div id="PaidThruDiv" runat="server">
                <div class="AutoWidth">
                    <asiweb:SmartControl ID="DisplayPaidThru" runat="server" BoundPropertyName="DisplayPaidThru" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
                </div>
                <div class="SubItems">
                    <asiweb:SmartControl ID="CustomerPaidThruHeading" runat="server" BoundPropertyName="CustomerPaidThruHeading" DisplayCaption="true" DataSaveUponStateChange="false" />    
                </div>
            </div>
            <div class="AutoWidth">
                <asiweb:SmartControl ID="ChangeContactStatus" runat="server" BoundPropertyName="ChangeContactStatus" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />       
            </div>
        </telerik:RadAjaxPanel>        
    </div>
</asiweb:PanelTemplateControl>
