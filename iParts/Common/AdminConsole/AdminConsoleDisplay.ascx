<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminConsoleDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.AdminConsole.AdminConsoleDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<div runat="server" id="DivDesignMode" visible="false">
    <p>
        Server address: <%#ServerAddress%><br />
        Windows username: <%#WindowsU%>
    </p>
    <div runat="server" id="DivDesignError" visible="false">
        <p>
            There are some problems with the connection settings.
        </p>
        <ul>
            <asp:Repeater runat="server" ID="RepeaterDesignError">
                <ItemTemplate>
                    <li>
                        <%#Container.DataItem%>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>

<div runat="server" id="DivErrors" visible="false">
    <p>
        Unable to connect to the iMIS Advanced Accounting Console.
    </p>
    <ul>
        <asp:Repeater runat="server" ID="RepeaterError">
            <ItemTemplate>
                <li>
                    <%#Container.DataItem%>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>

<div runat="server" id="DivAccessDenied" visible="false">
    <p>
        Access denied.
    </p>
</div>

<div runat="server" id="DivRedirect" visible="false">

    <p>
        Redirecting to the Advanced Accounting Console ...
    </p>
    <p>
        <asp:HyperLink runat="server" ID="HyperlinkRdp"></asp:HyperLink>
    </p>

    <script type="text/javascript">
        window.location.href = "<asp:Literal runat="server" ID="LiteralRdp"></asp:Literal>";
    </script>

</div>



