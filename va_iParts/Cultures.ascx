<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_Cultures" Codebehind="Cultures.ascx.cs" %>


<style type="text/css">
    thead
    {
        font-weight: bold;
    }
    
    /* Table hover style */
    .main tr th
    {
        background-color: #dadada;
        font-weight: bold;
    }
    
    /* Table odd rows style */
    .main tr:nth-child(odd)
    {
        background-color: #ffffff;
    }
    
    /* Table even rows style */
    .main tr:nth-child(even)
    {
        background-color: #efefef;
    }
    
    /* Table hover style */
    .main tr:hover
    {
        background-color: #dadada;
    }
    
    
    .nomain tr th
    {
        background-color: #dadada;
        font-weight: bold;
    }
    
    /* Table odd rows style */
    .nomain tr:nth-child(odd)
    {
        background-color: white;
    }
    
    /* Table even rows style */
    .nomain tr:nth-child(even)
    {
        background-color:white;
    }
    
    /* Table hover style */
    .nomain tr:hover
    {
        background-color:white;
    }
    div .MainForm
    {
        background: url("/imismain10/images/section_bg.png") repeat scroll 0 0;
        border: 1px solid #F4F4F4;
        box-shadow: 0 0 10px #C4C4C4;
        margin: 10px auto 10px;
        overflow: hidden;
        padding: 15px 15px 25px 15px;
        width: 800px;
    }
</style>

<div class="MainForm">
    <h3>Culture editor</h3>
    <asp:Label ID="lblMessage" runat="server" />
    <asp:ListView ID="lvCultures" runat="server" OnItemDataBound="lvCulturesOnItemDataBound" OnItemEditing="lvCulturesEditing"
    OnItemUpdating="lvCulturesUpdating" OnItemCanceling="lvCulturesCanceling" OnItemInserting="lvCulturesInserting"
    DataKeyNames="CultureID" OnItemDeleting="lvCulturesDeleting" OnItemCommand="lvCulturesCommand" >
        <LayoutTemplate>
            <div class="AltRow">
            <table class="main" border="1 solid black" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;">
                <tr>
                    <td colspan="5" style="text-align:right">
                        <asp:Button ID="btnAddNew" runat="server" Text="New Culture" OnClick="btnAddNewClick" Font-Underline="True" />
                    </td>
                </tr>
                <tr bgcolor="#EBEBEB">
                    <th style="text-align: left;width: 25%;">
                        <asp:Label ID="lblCultureIDTitle" runat="server" Text="Culture ID" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblCultureNameTitle" runat="server" Text="Name" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblVersionsTitle" runat="server" Text="Versions" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblActiveVersionTitle" runat="server" Text="Active Version" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblActionsTitle" runat="server" Text="Actions" />
                    </th>
                </tr>
                <tr id="ItemPlaceHolder" runat="server" />
            </table>
            </div>
        </LayoutTemplate>
        <EmptyDataTemplate>
            <table border="0" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center;">
                <tr>
                    <td colspan="5" style="text-align:right">
                        <asp:Button ID="btnAddNew2" runat="server" Text="New Culture" OnClick="btnAddNewClick" Font-Underline="True" />
                    </td>
                </tr>
                <tr bgcolor="#EBEBEB">
                    <th style="text-align: left;width: 25%;">
                        <asp:Label ID="lblCultureIDTitle" runat="server" Text="Culture ID" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblCultureNameTitle" runat="server" Text="Name" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblVersionsTitle" runat="server" Text="Versions" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblActiveVersionTitle" runat="server" Text="Active Version" />
                    </th>
                    <th style="text-align: center;">
                        <asp:Label ID="lblActionsTitle" runat="server" Text="Actions" />
                    </th>
                </tr>
                <tr>
                    <td colspan="5">
                        Empty List
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr>
                <td style="text-align: left;">
                    <asp:Label ID="lblCultureID" runat="server" Text='<%# (string)Eval("CultureID") %>' />
                </td>
                <td style="text-align: center;">
                    <asp:Label ID="lblCultureName" runat="server" Text='<%# (string)Eval("Name") %>' />
                </td>
                <td style="text-align: center;">
                    <asp:Label ID="lblVersions" runat="server" Text='<%# (int)Eval("Versions") %>' />
                </td>
                <td style="text-align: center;">
                    <asp:Label ID="lblActiveVersion" runat="server" Text='<%# (string)Eval("ActiveVersion") %>' />
                </td>
                <td style="text-align: center;">
                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" CommandName="Edit" />&nbsp;
                    <asp:LinkButton ID="lbtnVersionEdit" runat="server" Text="Versions" CommandName="VersionsEdit" CommandArgument='<%# Bind("CultureID") %>' />&nbsp;
                    <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CommandName="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: White">
                <td colspan="5">
                    <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center; border: 1px solid black;">
                        <tr>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblCultureIDTitle" runat="server" Text="Culture ID" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:Label ID="lblCultureID" runat="server" Text='<%# Bind("CultureID") %>' />
                            </td>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="DisplayNameLbl" runat="server" Text="Display Name" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:TextBox ID="displayName" runat="server" Text='<%# Bind("DisplayName") %>' />
                            </td>                           
                            <td rowspan="3" style="vertical-align:top; text-align: center">
                                <asp:LinkButton ID="lbtnUpdate" runat="server" Text="Update" CommandName="Update" />&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblVersionsTitle" runat="server" Text="Versions" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:Label ID="lblVersions" runat="server" Text='<%# Eval("Versions") %>'  />
                            </td>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblActiveVersionTitle" runat="server" Text="Active Version" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:Label ID="lblActiveVersion" runat="server" Text='<%# Eval("ActiveVersion") %>' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <tr style="background-color: White">
                <td colspan="5">
                    <table class="nomain" cellpadding="3" cellspacing="0" style="width: 100%; text-align: center; border: 1px solid black;">
                        <tr>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblCultureIDTitle" runat="server" Text="Culture ID" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:TextBox ID="txtCultureID" runat="server" Text="" />
                            </td>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="lblNameTitle" runat="server" Text="Name" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:TextBox ID="txtName" runat="server" Text="" />
                            </td>
                            <th style="vertical-align:top; text-align: right">
                                <asp:Label ID="DisplayNameLbl" runat="server" Text="Display Name" />
                            </th>
                            <td style="vertical-align:top; text-align: left">
                                <asp:TextBox ID="displayName" runat="server" Text="" />
                            </td>                            
                            <th rowspan="3" style="vertical-align:top; text-align: center">
                                <asp:LinkButton ID="lbtnSave" runat="server" Text="Save" CommandName="Insert" />&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </InsertItemTemplate>
    </asp:ListView>
</div>