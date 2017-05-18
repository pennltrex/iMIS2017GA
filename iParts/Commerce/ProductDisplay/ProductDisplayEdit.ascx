<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ProductDisplay.ProductDisplayEdit" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

        <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" PositionCaption="Left" />
        
         <div class="AutoWidth">
            <asiweb:SmartControl ID="DisplayTitle" runat="server" BoundPropertyName="DisplayTitle" DisplayCaption="true" PositionCaption="Right" />
            <asiweb:SmartControl ID="DoNotRenderInDesignMode" runat="server" BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" PositionCaption="Right" />
            <asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" PositionCaption="Right" />        
        </div>
            
        <asiweb:SmartControl ID="ProductCode" runat="server" BoundPropertyName="ProductCode" DisplayCaption="true" PositionCaption="Left" />

        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayPicture" runat="server" BoundPropertyName="DisplayPicture" DisplayCaption="true" PositionCaption="Right" />        </div>
        
        <asiweb:SmartControl ID="MaxPictureWidth" runat="server" BoundPropertyName="MaxPictureWidth" DisplayCaption="true" PositionCaption="Left" MinValue="50" MaxValue="1000" />

        <div class="AutoWidth"><asiweb:SmartControl ID="AllowPictureUpscale" runat="server" BoundPropertyName="AllowPictureUpscale" DisplayCaption="true" PositionCaption="Right" />        </div>
            
        <asiweb:SmartControl ID="NonMemberPriceLabel" runat="server" BoundPropertyName="NonMemberPriceLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <asiweb:SmartControl ID="MemberPriceLabel" runat="server" BoundPropertyName="MemberPriceLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayBothPricesToNonMembers" runat="server" BoundPropertyName="DisplayBothPricesToNonMembers" DisplayCaption="true" PositionCaption="Right" />  </div> 
        <asiweb:SmartControl ID="MemberPriceForNonMemberLabel" runat="server" BoundPropertyName="MemberPriceForNonMemberLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayBothPricesToMembers" runat="server" BoundPropertyName="DisplayBothPricesToMembers" DisplayCaption="true" PositionCaption="Right" /> </div> 
        <asiweb:SmartControl ID="NonMemberPriceForMemberLabel" runat="server" BoundPropertyName="NonMemberPriceForMemberLabel" DisplayCaption="true" PositionCaption="Left" /> 
            
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayDiscount" runat="server" BoundPropertyName="DisplayDiscount" DisplayCaption="true" PositionCaption="Right" /> </div> 
        <asiweb:SmartControl ID="DiscountLabel" runat="server" BoundPropertyName="DiscountLabel" DisplayCaption="true" PositionCaption="Left" /> 
            
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayAddToCart" runat="server" BoundPropertyName="DisplayAddToCart" DisplayCaption="true" PositionCaption="Right" /> </div> 
            
        <asiweb:SmartControl ID="ItemAddedLabel" runat="server" BoundPropertyName="ItemAddedLabel" HtmlEncode="true" DisplayCaption="true" PositionCaption="Left" />        
            
 </asiweb:paneltemplatecontrol>