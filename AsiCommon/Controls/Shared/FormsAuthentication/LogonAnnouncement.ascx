<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.FormsAuthentication.LogonAnnouncement" Codebehind="LogonAnnouncement.ascx.cs" %>
<style type="text/css">
#modalPage
{
    display: none;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0px; left: 0px;
}
.modalBackground
{
    filter: Alpha(Opacity=40); -moz-opacity:0.4; opacity: 0.4;
    width: 100%; height: 100%; background-color: #999999;
    position: absolute;
    z-index: 500;
    top: 0px; left: 0px;
}
.modalContainer
{
    position: absolute;
    width: 300px;
    left: 50%;
    top: 50%;
    z-index: 750;
}
.modal
{
    background-color: yellow;
    color: red;
    border: solid 4px red; position: relative;
    top: -150px;
    left: -150px;
    z-index: 1000;
    width: 300px;
    height: 300px;
    padding: 0px;
}
.modalTop
{
    width: 292px;
    background-color: #000099;
    padding: 4px;
    color: #ffffff;
    text-align: right;
}
.modalTop a, .modalTop a:visited
{
    color: #ffffff;
}
.modalBody
{
    padding: 10px;
}
</style>
<div id="modalPage">
    <div class="modalBackground">
    </div>
    <div class="modalContainer">
        <div class="modal">
            <div class="modalBody">
                <table>
                    <tr>
                        <td></td>
                        <td><asp:Literal runat="server" ID="AnnouncementLiteral"></asp:Literal></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">
function revealModal(divID)
{
    window.onscroll = function () { document.getElementById(divID).style.top = document.body.scrollTop; };
    document.getElementById(divID).style.display = "block";
    document.getElementById(divID).style.top = document.body.scrollTop;
}

function hideModal(divID)
{
    document.getElementById(divID).style.display = "none";
}
</script>