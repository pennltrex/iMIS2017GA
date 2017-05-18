<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminConsoleConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.AdminConsole.AdminConsoleConfigEdit" %>

<div class="ShowFieldset">
    <fieldset>
        <legend>RDP Connection</legend>
        <asiweb:smartcontrol id="ServerAddress" runat="server" boundpropertyname="ServerAddress"
            displaycaption="true" datasaveuponstatechange="false" />

        <asiweb:smartcontrol id="WindowsDomain" runat="server" boundpropertyname="WindowsDomain"
            displaycaption="true" datasaveuponstatechange="false" />

        <asiweb:smartcontrol id="WindowsU" runat="server" boundpropertyname="WindowsU"
            displaycaption="true" datasaveuponstatechange="false" />

        <asiweb:smartcontrol id="WindowsP" runat="server" boundpropertyname="WindowsP"
            displaycaption="true" datasaveuponstatechange="false" />

        <asiweb:smartcontrol id="Width" runat="server" boundpropertyname="Width"
            displaycaption="true" datasaveuponstatechange="false" MinValue="1024" MaxValue="2560" />

        <asiweb:smartcontrol id="Height" runat="server" boundpropertyname="Height"
            displaycaption="true" datasaveuponstatechange="false" MinValue="768" MaxValue="1440" />
    </fieldset>
</div>

<div class="ShowFieldset">
    <fieldset>
        <legend>Advanced Accounting Console</legend>
        <asiweb:smartcontrol id="DesktopCommandLine" runat="server" boundpropertyname="DesktopCommandLine"
            displaycaption="true" datasaveuponstatechange="false" />

        <asiweb:smartcontrol id="DesktopWorkingDirectory" runat="server" boundpropertyname="DesktopWorkingDirectory"
            displaycaption="true" datasaveuponstatechange="false" />
    </fieldset>
</div>  


