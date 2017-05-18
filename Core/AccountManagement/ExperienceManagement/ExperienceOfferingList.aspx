﻿<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="ExperienceOfferingList" Src="ExperienceOfferingList.ascx" %>

<script runat="server">
    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(experienceOfferingList))
        {
            AddChildUserControl(experienceOfferingList);
        }
    }

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }

    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }
</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:ExperienceOfferingList ID="experienceOfferingList" runat="server" />
</asp:Content>