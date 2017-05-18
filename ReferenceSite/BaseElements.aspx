<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.DisplayPageBase" Title="Base Elements" %>

<script language="C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
 	    base.OnInit(e);

        CssLink.Attributes["href"] = Asi.Web.Utilities.GetTildeExpansion() + "/ReferenceSite/Assets/ReferenceGuide.css";
        CairnsNightImg.Src = Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() + "/images/UploadedImages/cairnsnight.jpg";

    }
</script>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="Server">
    <link rel="stylesheet" type="text/css" runat="server" ID="CssLink" />
</asp:Content>

<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <div class="RefPage">
        
        <div class="RefContent">
            <h1>Base Elements</h1>
            <p>This page describes some of the basic HTML elements that appear in your iMIS site and that you 
                can style within your theme. You can use this page to quickly test how these elements will look 
                if you want to make any style changes. When working with styles, we recommend using an in-browser 
                developer tool to help you inspect page elements to determine which CSS you may need to modify. 
                Your browser’s development tools are normally accessible by right-clicking a page element and 
                selecting <em>Inspect Element</em>.</p>
            <h2 id="RefBasicHTML" class="RefHeader">Basic HTML Elements</h2>
                
                <h3>Headings</h3>
                <p>Use heading tags <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code> to structure the content of your web pages.</p>
                <div class="RefExample">
                    <h1>Heading 1</h1>
                    <h2>Heading 2</h2>
                    <h3>Heading 3</h3>
                    <h4>Heading 4</h4>
                    <h5>Heading 5</h5>
                    <h6>Heading 6</h6>
                </div>
                <pre class="prettyprint RefCode">&lt;h1&gt;Heading 1&lt;/h1&gt;</pre>
                
            <h3>Paragraphs</h3>
            <p>Paragraphs are defined with the <code>&lt;p&gt;</code> tag.</p>
            <div class="RefExample">
	            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis odio quis ligula commodo lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ut volutpat dui. Donec dapibus eu magna eu tristique. </p>
                <p>Nam varius purus mauris, at suscipit ipsum imperdiet sit amet. Nulla interdum purus dui, id venenatis elit tristique in. Sed rhoncus convallis ipsum, id pretium enim imperdiet eu. Aliquam pretium euismod eros vitae dapibus. Donec a mi rutrum, ullamcorper velit in, commodo ipsum.</p>
            </div>
            <pre class="prettyprint RefCode">&lt;p&gt;...&lt;/p&gt;</pre>
            
            <h3>Links</h3>
            <p>Links are defined with the <code>&lt;a&gt;</code> tag and have four states that you can style: link, visited, hover, and active.</p>
            <div class="RefExample">
	            <a href="#">Example link</a>
            </div>
            <pre class="prettyprint RefCode">&lt;a href="#"&gt;Example link&lt;/a&gt;</pre>
            
            <h3>Images</h3>
            <p>Display images with the <code>&lt;img&gt;</code> tag.</p>
            <div class="RefExample">
	            <img runat="server" ID="CairnsNightImg" alt="Alternate text for the image">
            </div>
            <pre class="prettyprint RefCode">&lt;img src="/images/UploadedImages/cairnsnight.jpg" alt="Alternate text for the image"&gt;</pre>
            
            <h3>Lists</h3>
            <p>Ordered lists start with the <code>&lt;ol&gt;</code> tag, and unordered lists start with the <code>&lt;ul&gt;</code> tag.</p>
            <div class="RefExample">
	            <ol>
                    <li>Ordered list item</li>
                    <li>Ordered list item</li>
                </ol>
            </div>
            <pre class="prettyprint RefCode">&lt;ol&gt;
    &lt;li&gt;Ordered list item&lt;/li&gt;
    &lt;li&gt;Ordered list item&lt;/li&gt;
&lt;/ol&gt;</pre>
            <div class="RefExample">
	            <ul>
                <li>Unordered list item</li>
                <li>Unordered list item</li>
                </ul>
            </div>
            <pre class="prettyprint RefCode">&lt;ul&gt;
    &lt;li&gt;Unordered list item&lt;/li&gt;
    &lt;li&gt;Unordered list item&lt;/li&gt;
&lt;/ul&gt;</pre>
            
            
            
            <h3>Horizontal rule</h3>
            <p>Insert a horizontal rule with the <code>&lt;hr&gt;</code> tag when you need to separate content.</p>
            <div class="RefExample">
                <hr />
            </div>
            <pre class="prettyprint RefCode">&lt;hr /&gt;</pre>
            
            <h3>Blockquotes</h3>
            <p>Use the <code>&lt;blockquote&gt;</code> tag to mark content as quoted from a source. You can also apply the <code>.Quote</code> class to a <code>&lt;blockquote&gt;</code> to highlight the text.</p>
            <div class="RefExample">
	            <blockquote>Nam feugiat tristique mauris, et interdum libero tempor vitae. Nulla vulputate porttitor mauris, in commodo sapien lobortis et. Nam quis tristique leo, in scelerisque justo. Proin commodo enim vel ante porttitor tincidunt.</blockquote>
            </div>
            <pre class="prettyprint RefCode">&lt;blockquote&gt;Nam feugiat tristique mauris...&lt;/blockquote&gt;</pre>
            
            <div class="RefExample">
	            <blockquote class="Quote"><p>Nam feugiat tristique mauris, et interdum libero tempor vitae. Nulla vulputate porttitor mauris, in commodo sapien lobortis et. Nam quis tristique leo, in scelerisque justo. Proin commodo enim vel ante porttitor tincidunt.</p></blockquote>
            </div>
            <pre class="prettyprint RefCode">&lt;blockquote class="Quote"&gt;&lt;p&gt;Nam feugiat tristique mauris...&lt;/p&gt;&lt;/blockquote&gt;</pre>
            

            <h2 id="RefButtons" class="RefHeader">Buttons</h2>
            
                <h3>Basic buttons</h3>
                <p>You can apply a standard button style to any element by using the <code>.TextButton</code> class. However, we recommend primarily using it with <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code>, and <code>&lt;input type="button" /&gt;</code>.</p>
            
                <div class="RefExample">
                    <a href="#" class="TextButton">a.TextButton</a>                    
                    <button class="TextButton">button.TextButton</button>
                    <input type="button" value="input.TextButton" class="TextButton"/>
                    <br/>
                    <br/>
                    <a href="#" class="TextButton PrimaryButton">a.TextButton.PrimaryButton</a>
                    <button class="TextButton PrimaryButton">button.TextButton.PrimaryButton</button>
                    <input type="button" value="input.TextButton.PrimaryButton" class="TextButton PrimaryButton"/>
                    <br/>
                    <br/>
                    <a href="#" class="TextButton" disabled="disabled" >a.TextButton disabled</a>
                    <button class="TextButton" disabled="disabled">button.TextButton disabled</button>
                    <input type="button" value="input.TextButton disabled" class="TextButton" disabled="disabled"/>
                    <br/>
                    <br/>
                    <a href="#" class="TextButton MediumButton">a.TextButton.MediumButton</a>
                    <br/>
                    <br/>
                    <a href="#" class="TextButton LargeButton">a.TextButton.LargeButton</a>
                    
                    
                </div>
                <pre class="prettyprint RefCode">
&lt;!--Plain text button--&gt;
&lt;a href="#" class="TextButton"&gt;a.TextButton&lt;/a&gt;                    
&lt;button class="TextButton"&gt;button.TextButton&lt;/button&gt;
&lt;input type="button" value="input.TextButton" class="TextButton"/&gt;

&lt;!--Primary text button--&gt;                    
&lt;a href="#" class="TextButton PrimaryButton"&gt;a.TextButton.PrimaryButton&lt;/a&gt;
&lt;button class="TextButton PrimaryButton"&gt;button.TextButton.PrimaryButton&lt;/button&gt;
&lt;input type="button" value="input.TextButton.PrimaryButton" class="TextButton PrimaryButton"/&gt;

&lt;!--Disabled text button--&gt;                    
&lt;a href="#" class="TextButton" disabled="disabled" &gt;a.TextButton disabled&lt;/a&gt;
&lt;button class="TextButton" disabled="disabled"&gt;button.TextButton disabled&lt;/button&gt;
&lt;input type="button" value="input.TextButton disabled" class="TextButton" disabled="disabled"/&gt;

&lt;!--Medium sized text button--&gt;                    
&lt;a href="#" class="TextButton MediumButton"&gt;a.TextButton.MediumButton&lt;/a&gt;                  

&lt;!--Large text button--&gt;
&lt;a href="#" class="TextButton LargeButton"&gt;a.TextButton.LargeButton&lt;/a&gt;
</pre>
            
            <h2 id="RefUserMessages" class="RefHeader">User messages</h2>
            <p>Apply the following styles to convey messages of certain types to the user.</p>
            <div class="RefExample">
	            <p class="AsiInformation">AsiInformation: Donec luctus nibh sed augue tincidunt</p>
                <p class="AsiSuccess">AsiSuccess: Donec luctus nibh sed augue tincidunt</p>
                <p class="AsiWarning">AsiWarning: Donec luctus nibh sed augue tincidunt</p>
                <p class="AsiError">AsiError: Donec luctus nibh sed augue tincidunt</p>
            </div>
            <pre class="prettyprint RefCode">&lt;p class="AsiInformation"&gt;AsiInformation: Donec luctus nibh sed augue tincidunt&lt;/p&gt;
&lt;p class="AsiSuccess"&gt;AsiSuccess: Donec luctus nibh sed augue tincidunt&lt;/p&gt;
&lt;p class="AsiWarning"&gt;AsiWarning: Donec luctus nibh sed augue tincidunt&lt;/p&gt;
&lt;p class="AsiError"&gt;AsiError: Donec luctus nibh sed augue tincidunt&lt;/p&gt;</pre>
            
            <h2 id="RefEmphasisClasses" class="RefHeader">Emphasis classes</h2>
            <h3>Callouts</h3>
            <p>To help focus attention on a particular area, apply the callout classes to any element using the <code>.CalloutArea1</code> and <code>.CalloutArea2</code> classes.</p>
            <div class="RefExample">
                <p class="CalloutArea1">CalloutArea1: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis odio quis ligula commodo lobortis. Pellentesque habitant morbi tristique senectus.</p>
                <p class="CalloutArea2">CalloutArea2: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis odio quis ligula commodo lobortis. Pellentesque habitant morbi tristique senectus.</p>

            </div>
            <pre class="prettyprint RefCode">&lt;p class="CalloutArea1"&gt;CalloutArea1: Lorem ipsum dolor sit amet... &lt;/p&gt;
&lt;p class="CalloutArea2"&gt;CalloutArea2: Lorem ipsum dolor sit amet... &lt;/p&gt;</pre>
            
            <h3>Featured link</h3>
            <p>Apply the <code>.FeatureActionLink</code> class to call attention to a link.</p>
            <div class="RefExample">
	            <a href="#" class="FeatureActionLink">Featured link</a>
            </div>
            <pre class="prettyprint RefCode">&lt;a href="#" class="FeatureActionLink"&gt;Featured link&lt;/a&gt;</pre>
            
            <h3>Featured text</h3>
            <p>Apply the <code>.FeatureText</code> class to call attention to a section of content.</p>
            <div class="RefExample">
	            <p class="FeatureText">Nullam in vulputate odio. Sed id urna vulputate, porta orci et, luctus mi. In dapibus dui non nibh porta mollis ac quis libero. Nunc eget quam hendrerit neque malesuada semper sed sed ante.</p>
            </div>
            <pre class="prettyprint RefCode">&lt;p class="FeatureText"&gt;Nullam in vulputate odio...&lt;/p&gt;</pre>
            
            

        </div>
    
    </div>
    
    <%-- This is to generate the page's TOC --%>
    <script type="text/javascript">
        var ToC =
            "<nav role='navigation' class='RefTOC'>" +
                "<ul>";
        var newLine, el, title, link;
        jQuery("h2.RefHeader").each(function() {
            el = jQuery(this);
            title = el.text();
            link = "#" + el.attr("id");
            newLine =
                "<li>" +
                    "<a href='" + link + "'>" +
                    title +
                    "</a>" +
                    "</li>";
            ToC += newLine;
        });
        ToC +=
            "</ul>" +
                "</nav>";
        jQuery(".RefPage").prepend(ToC);
    </script>
    
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

</asp:Content>


