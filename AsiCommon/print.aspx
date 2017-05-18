<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.AsiCommon.Print" Codebehind="Print.aspx.cs" %>

<asp:Content id="content" runat="server" ContentPlaceHolderID="TemplateBody">

    <asp:Placeholder id="placeholder" runat="server"/>

    <script type="text/javascript" language="javascript">
        print();
    </script>
</asp:Content>