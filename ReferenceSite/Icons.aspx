<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.WebRoot.ReferenceSite.Icons" Title="Icons reference" CodeBehind="Icons.aspx.cs" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="Server">
    <link rel="stylesheet" type="text/css" runat="server" ID="CssLink" />
</asp:Content>

<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" runat="Server">

    <div class="RefPage">

        <div class="RefContent">

            <h1>Icons</h1>
            <p>
                This page demonstrates the code used to display icons found throughout iMIS. The examples here can be used in HTML or in ASP.NET code to display the iMIS system icons.
            </p>

            <h2 id="Icons" class="RefHeader">The icons</h2>
            
            <asp:Repeater runat="server" ID="IconList">
                <HeaderTemplate>
                    <ul class="RefIconList">
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <asiweb:StyledIcon runat="server" ButtonType="Link" NavigateUrl="#" ID="IconControl" IconToDisplay="<%# (StyledIcon.IconType)Container.DataItem %>" /><br />
                        <asp:Label runat="server" ID="ClassLabel" Text="<%# GetShortenedIconClass((StyledIcon.IconType)Container.DataItem) %>" />
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
            
            <h2 id="IconsInHTML" class="RefHeader">Using the icons in HTML</h2>
            <p>
                If you are using the links in C# code is is highly recommended that you use the methods outlined in the sections below to ensure that your 
                code is upgrade-friendly and is updated when we make changes to the CSS classes or HTML structure. However, if you do not have access to the 
                C# code you may still use these icons by applying the correct CSS classes. To use them simply use the class <code>sysicon</code> combined with the
                class listed above for the icon you wish to use. For example, <code>sysicon sysicon-add</code>.
            </p>
            <p>
                If you would like to display the icon in a psuedo element you can apply the class <code>sysicon--before</code> or <code>sysicon--after</code> instead of <code>sysicon</code>.
                This is useful if you want to display text along with the icon on the same element.
            </p>
            <p>
                It's important that any icon not displayed with accompanying text provides a text alternative for screen readers that can be visually hidden for sighted users.
                To do this use text within the icon element and add the class <code>text-hide</code> to the element, or write the text alongside the element and use the class 
                <code>screen-reader-text</code> to hide it.
            </p>
            
            <div class="RefExample">
                <span class="sysicon sysicon-add text-hide" title="Add">Add with visually hidden text</span><br />
                <span class="sysicon--before sysicon-edit">Edit usung before psuedo element</span><br />
                <a href="#"><span class="sysicon sysicon-delete"></span>Delete icon in a link</a>
            </div>
            <pre class="prettyprint RefCode">
&lt;span class=&quot;sysicon sysicon-add text-hide&quot;&gt;Add with visually hidden text&lt;/span&gt;&lt;br /&gt; 
&lt;span class=&quot;sysicon--before sysicon-edit&quot;&gt;Edit usung before psuedo element&lt;/span&gt;&lt;br /&gt; 
&lt;a href=&quot;#&quot;&gt;&lt;span class=&quot;sysicon sysicon-delete&quot;&gt;&lt;/span&gt;Delete icon in a link&lt;/a&gt;
</pre>
            <h2 id="IconsInCSharp" class="RefHeader">Using the icons in C#</h2>
            
            <p>If you have access to C# code we highly recommend that you use either method below to generate the icons you need.</p>
            
            <h3>Use the StyledIcon user control (preferred method)</h3>
            
            <p>
                The StyledIcon asiweb user control is a flexible control that you can use to generate the markup for an icon by itself, 
                with text, or inside a link or link button. The only required property is the IconToDisplay, but there are a number of other properties
                available to customize the output.
            </p>
            
            <div class="RefExample">
                <asiweb:StyledIcon runat="server" IconToDisplay="Download" Text="Download file" ToolTip="Download" /><br />
                <asiweb:StyledIcon runat="server" IconToDisplay="Check" Text="Commit this action" ButtonType="LinkButton" DisplayText="True" /><br/>
                <asiweb:StyledIcon runat="server" IconToDisplay="Person" Text="View contact" ButtonType="Link" DisplayText="True" NavigateUrl="~/party.aspx?ID=101" />
            </div>
            <pre class="prettyprint RefCode">
&lt;asiweb:StyledIcon runat=&quot;server&quot; IconToDisplay=&quot;Download&quot; Text=&quot;Download file&quot; ToolTip=&quot;Download&quot; /&gt;&lt;br/&gt;
&lt;asiweb:StyledIcon runat=&quot;server&quot; IconToDisplay=&quot;Check&quot; Text=&quot;Commit this action&quot; ButtonType=&quot;LinkButton&quot; DisplayText=&quot;True&quot; /&gt;&lt;br/&gt; 
&lt;asiweb:StyledIcon runat=&quot;server&quot; IconToDisplay=&quot;Person&quot; Text=&quot;View contact&quot; ButtonType=&quot;Link&quot; DisplayText=&quot;True&quot; NavigateUrl=&quot;~/party.aspx?ID=101&quot; /&gt;
</pre>
            
            <table class="SimpleTable ShowTableBorders VAlignTop">
                <tbody>
                    <tr>
                        <th>Property</th>
                        <th>Default value</th>
                        <th>Description</th>
                    </tr>
                    <tr>
                        <td>IconToDisplay</td>
                        <td>None</td>
                        <td>The type of to use.</td>
                    </tr>
                    <tr>
                        <td>Text</td>
                        <td></td>
                        <td>The text to display by the icon.</td>
                    </tr>
                    <tr>
                        <td>DisplayText</td>
                        <td>False</td>
                        <td>Whether the defined text should dispaly to sighted users.</td>
                    </tr>
                    <tr>
                        <td>ToolTip</td>
                        <td></td>
                        <td>The tool tip to display when hovering over the icon. 
                            This is useful to display for sighted users but is not an acceptable text alternative for screen readers.</td>
                    </tr>
                    <tr>
                        <td>PseudoElementToUse</td>
                        <td>None</td>
                        <td>Specify which psuedo element should be used to display the icon, if any.</td>
                    </tr>
                    <tr>
                        <td>ButtonType</td>
                        <td>None</td>
                        <td>
                            If you would like your icon to display within a link or link button use this property to specify.
                        </td>
                    </tr>
                    <tr>
                        <td>OuterCssClass</td>
                        <td></td>
                        <td>The CSS class to apply to the surrounding link or link button, if applicable.</td>
                    </tr>
                    <tr>
                        <td>IconCssClass</td>
                        <td></td>
                        <td>The CSS class to apply to the icon element. This property is set automatically when you select an <code>IconToDisplay</code>.</td>
                    </tr>
                    <tr>
                        <td>NavigateUrl</td>
                        <td></td>
                        <td>The URL to navigate to when the icon is clicked. This is currently only used when the <code>ButtonType</code> is set to <code>Link</code>.</td>
                    </tr>
                    <tr>
                        <td>OnClientClick</td>
                        <td></td>
                        <td>The client-side event that occurs on click. This is currently only used when the <code>ButtonType</code> is set to <code>LinkButton</code>.</td>
                    </tr>
                    <tr>
                        <td>OnClick</td>
                        <td></td>
                        <td>The server-side event that occurs on click. This is currently only used when the <code>ButtonType</code> is set to <code>LinkButton</code>.</td>
                    </tr>
                </tbody>
            </table>
            
            <h3>Using the GetIconCssClass() method</h3>
            <p>
                If for some reason you cannot use the StyledIcon user control you can get the correct CSS class to apply by using the <code>GetIconCssClass()</code> method
                of the StyledIcon class. This will give you the appropriate CSS class for the icon you need, which you can apply to any element.
            </p>
            <table class="SimpleTable ShowTableBorders VAlignTop">
                <tbody>
                    <tr>
                        <th>Parameter</th>
                        <th>Default value</th>
                        <th>Description</th>
                    </tr>
                    <tr>
                        <td>IconType</td>
                        <td></td>
                        <td>The type of icon to use.</td>
                    </tr>
                    <tr>
                        <td>PsuedoElementToUse</td>
                        <td>None</td>
                        <td>The psuedo element to use to display the icon, if any.</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
               

     <%-- This is to generate the page's TOC --%>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            var ToC =
                "<nav role='navigation' class='RefTOC'>" +
                    "<ul>";
            var newLine, el, title, link;
            jQuery("h2.RefHeader").each(function () {
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
        });

    </script>
    
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

</asp:Content>