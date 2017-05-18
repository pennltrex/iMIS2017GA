﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddThisDisplay.ascx.cs" Inherits="Asi.Web.iParts.Social.AddThis.AddThisDisplay" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style <%= AddThisShowSmallIconsHtml %>" <%=AddThisHtml %> >
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript">    var addthis_config = { "data_track_clickback": true };</script>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js<%= AddThisPubIdHtml %>"></script>
<!-- AddThis Button END -->

</asp:Panel>