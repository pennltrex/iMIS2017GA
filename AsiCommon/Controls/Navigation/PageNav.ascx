<%@ Control Language="C#" Inherits="AsiCommon_Controls_Navigation_PageNav" Codebehind="~/AsiCommon/Controls/Navigation/PageNav.ascx.cs" %>

<div id="MenuTable" style="white-space:nowrap; width:100%; height:100%; margin-top:1px;">
    <div style="display:none; position:absolute; width:auto; white-space:nowrap; left:0px;" >
        <table cellpadding="0" cellspacing="0" id="ScrollButtons" runat="server">
            <tr>
                <td><a onmouseover="jumpright()" onmouseout="if (righttime != null) clearTimeout(righttime);" onmousedown="jumpright()" onmouseup="clearTimeout(righttime)"><asp:Image id="LeftArrowFF" runat="server" SkinId="NavArrowLeftFF" /></a></td>
                <td><a onmouseover="moveright()" onmouseout="moverightstop()" onmousedown="jumpright()" onmouseup="clearTimeout(righttime)"><asp:Image id="LeftArrow" runat="server" SkinId="NavArrowLeft" /></a></td>
                <td><a onmouseover="moveleft()" onmouseout="moveleftstop()" onmousedown="jumpleft()" onmouseup="clearTimeout(lefttime)"><asp:Image id="RightArrow" runat="server" SkinId="NavArrowRight"/></a></td>
                <td><a onmouseover="jumpleft()" onmouseout="if (lefttime != null) clearTimeout(lefttime);" onmousedown="jumpleft()" onmouseup="clearTimeout(lefttime)"><asp:Image id="RightArrowFF" runat="server" SkinId="NavArrowRightFF"/></a></td>
            </tr>
        </table>
    </div>
    <div id="MenuDiv" style="white-space:nowrap; height:100%;">
        <div id='outerSpan' style='width:2400;height:100%; z-index:3;'>
            <div id='innerSpan' style='position:absolute;width:2400;clip:rect(0 2400 auto 0);height:100%;'>
                <div id='test2' style='position:absolute;left:0;top:1;height:100%;'>
                    <asp:PlaceHolder ID="NavMenuPlaceHolder" runat="server" Visible="true" />
                </div>
            </div>
        </div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    </div>
</div>

<input type='text' style="position:absolute; top: 0px; left: 40px; display:none;" id="TestInput" />

<%--<input type="text" id="lastKeyStroke" size="5" /><input type="text" id="keyStrokesDisplay" />--%>
