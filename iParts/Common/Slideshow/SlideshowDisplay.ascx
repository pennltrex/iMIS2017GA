<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Slideshow.SlideshowDisplay" %>

<div runat="server" id="Carousel" class="carousel slide" data-ride="carousel" translate="yes">    
    <!-- Indicators -->    
    <asp:PlaceHolder id="SlideshowIndicatorsPlaceholder" runat="server"></asp:PlaceHolder>
    <!-- Slides -->
    <div class="carousel-inner bg-img" role="listbox">
        <asp:PlaceHolder id="SlideshowPlaceholder" runat="server"></asp:PlaceHolder>    
    </div>
    <!-- Controls -->
    <asp:Panel runat="server" ID="SlideshowControls">
        <a class="left carousel-control" href="#<%= Carousel.ClientID %>" role="button" data-slide="prev">
            <span class="icon-prev" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#<%= Carousel.ClientID %>" role="button" data-slide="next">
            <span class="icon-next" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </asp:Panel>
</div>