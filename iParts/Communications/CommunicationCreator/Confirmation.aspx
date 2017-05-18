<%@ Page Language="C#" Inherits="Asi.Web.iParts.Communications.CommunicationCreator.Confirmation" Codebehind="Confirmation.aspx.cs" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:content id="MainContent" runat="server" contentplaceholderid="TemplateBody">   
  
    <asp:Panel runat="server" ID="MessagePanel" Style="padding:1em;">
        <div runat="server" id="MessageDiv">
            <asiweb:StyledLabel runat="Server" ID="TitleLabel" Text='<%# Title %>' />
        </div>
    </asp:Panel>
    

</asp:content>