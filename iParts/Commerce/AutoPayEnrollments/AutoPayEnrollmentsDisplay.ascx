<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayEnrollmentsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayEnrollments.AutoPayEnrollmentsDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel runat="server" ID="panelShowEnrollments">
    <asiweb:StyledLabel ID="LabelPageTitle" runat="server"></asiweb:StyledLabel>
    <asiweb:BusinessDataGrid2 runat="server" id="EnrollmentGrid" OnNeedDataSource="EnrollmentGrid_OnNeedDataSource" AllowPaging="true"
        OnItemDataBound="EnrollmentGrid_OnItemDataBound" AllowMultiRowEdit="False" AutoGenerateColumns="False">
        <MasterTableView Width="100%" CommandItemDisplay="None" DataKeyNames="" EditMode="PopUp">
            <Columns>
                <telerik:GridBoundColumn UniqueName="InstructionId" HeaderText="Instruction ID" DataField="InstructionId" Visible="True" Display="False"/>
                <telerik:GridBoundColumn UniqueName="InstructionType" HeaderText="Enrollment Type" DataField="InstructionType" Visible="True" Display="False"/>
                <telerik:GridBoundColumn UniqueName="Description" HeaderText="Description" DataField="Description" />
                <telerik:GridBoundColumn UniqueName="Amount" HeaderText="Amount" DataField="Amount" dataFormatString="{0:###,##0.00}" />
                <telerik:GridBoundColumn UniqueName="Frequency" HeaderText="Frequency" DataField="Frequency"/>
                <telerik:GridBoundColumn UniqueName="PaymentOption" HeaderText="Payment Option" DataField="PaymentOption" />
                <telerik:GridBoundColumn UniqueName="CollectionDay" HeaderText="Collection Day" DataField="CollectionDay"/>
                <telerik:GridBoundColumn UniqueName="Status" HeaderText="Status" DataField="Status"/>
                <telerik:GridEditCommandColumn HeaderText="Edit" UniqueName="EditCommandColumn" ButtonType="LinkButton" EditText="" >
                        <HeaderStyle CssClass="text-hide"></HeaderStyle>
                </telerik:GridEditCommandColumn>
            </Columns>
        </MasterTableView>
    </asiweb:BusinessDataGrid2>
</asp:Panel>
<asp:Panel runat="server" ID="panelNoEnrollments">
    <asiweb:StyledLabel runat="server" ID="LabelNoEnrollmentsMessage"></asiweb:StyledLabel>
</asp:Panel>
<script>
    function RefreshEnrollmentParentWindow() {
        //$find("<%#EnrollmentGrid.ClientID%>").get_masterTableView().rebind();
        var masterTable = $find("<%#EnrollmentGrid.ClientID%>").get_masterTableView();
        if (masterTable != null) {
            masterTable.rebind();
        }
            
    };
</script>


