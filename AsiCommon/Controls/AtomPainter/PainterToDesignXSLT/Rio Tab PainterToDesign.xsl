<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:AtomPainter="http://www.advsol.com/AtomPainter" version="1.0">

  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
    
  <xsl:template match="/">
     <xsl:choose>
	    <xsl:when test="count(AtomPainter:Panel)=1">
           <AtomPainter:Panel xmlns:AtomPainter="http://www.advsol.com/AtomPainter">
              <xsl:apply-templates select="//AtomPainter:Template[position()=1]" />
		   </AtomPainter:Panel>
		</xsl:when>
		<xsl:otherwise>
		   <xsl:apply-templates select="//AtomPainter:Template[position()=1]" />
		</xsl:otherwise>
	 </xsl:choose>
  </xsl:template>
  
  <xsl:template match="AtomPainter:Template">
     <xsl:if test="position()=1">
     <xsl:element name="{name()}">
	    <xsl:for-each select="@*">
		   <xsl:attribute name="{name()}"><xsl:value-of select="current()"/></xsl:attribute>
		</xsl:for-each>
		<xsl:for-each select="current()//AtomPainter:TemplatePage[count(ancestor::AtomPainter:Template)=1]">
		   
		   <xsl:call-template name="TemplatePage">
			  <xsl:with-param name="template-page-node" select="." />
		   </xsl:call-template> 
		   
		</xsl:for-each>
     </xsl:element>
	 </xsl:if>
  </xsl:template>
  
  <xsl:template name="TemplatePage">
     <xsl:param name="template-page-node" />
	 
	 <xsl:element name="{name()}">
	    <xsl:for-each select="@*">
		   <xsl:attribute name="{name()}"><xsl:value-of select="current()"/></xsl:attribute>
		</xsl:for-each>	    

		<xsl:for-each select="$template-page-node//child::AtomPainter:TemplateName[count(ancestor::AtomPainter:Template)=1]">
		   <xsl:if test="position()=number($template-page-node/@index) + 1">
		      <xsl:call-template name="Name">
		         <xsl:with-param name="name-node" select="."/>
			  </xsl:call-template>
		   </xsl:if>
		</xsl:for-each>				
		
		<xsl:for-each select="$template-page-node//child::AtomPainter:TemplateTitle[count(ancestor::AtomPainter:Template)=1]">
		   <xsl:if test="count(ancestor::AtomPainter:Template)=1">
		      <xsl:call-template name="Title">
		         <xsl:with-param name="title-node" select="."/>
		      </xsl:call-template>
		   </xsl:if>
		</xsl:for-each>

		<xsl:choose>
		   <xsl:when test="count($template-page-node//child::AtomPainter:TemplateBody[count(ancestor::AtomPainter:Template)=1])=0">
		      <xsl:element name="AtomPainter:TemplateBody" />
		   </xsl:when>
		   <xsl:otherwise>
		<xsl:for-each select="$template-page-node//child::AtomPainter:TemplateBody[count(ancestor::AtomPainter:Template)=1]">
		   <xsl:call-template name="inner-html-tags">
		      <xsl:with-param name="current-element" select="." />
		   </xsl:call-template>		  
		</xsl:for-each>
		   </xsl:otherwise>
		</xsl:choose>
	 
	 </xsl:element>    
		
  </xsl:template>
  
  <xsl:template name="Name">
     <xsl:param name="name-node" />
	 
     <xsl:choose>
	    <xsl:when test="$name-node">
	       <xsl:call-template name="inner-html-tags">
		      <xsl:with-param name="current-element" select="." />
		   </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		   <xsl:element name="AtomPainter:TemplateName" />
		</xsl:otherwise>
	 </xsl:choose>
  </xsl:template>
  
  <xsl:template name="Title">
     <xsl:param name="title-node" />
	 
     <xsl:choose>
	    <xsl:when test="$title-node">
	       <xsl:call-template name="inner-html-tags">
		      <xsl:with-param name="current-element" select="." />
		   </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		   <xsl:element name="AtomPainter:TemplateTitle" />
		</xsl:otherwise>
	 </xsl:choose>    
  </xsl:template> 
    
  
  <xsl:template name="inner-html-tags">	
     <xsl:param name="current-element" />
     
     <xsl:choose>
        <xsl:when test="$current-element/*=node()">
	       <xsl:for-each select="$current-element">              
                    <xsl:element name="{name()}">
                       <xsl:for-each select="@*">
                          <xsl:attribute name="{name()}">
                             <xsl:value-of select="current()" />
                          </xsl:attribute>
                       </xsl:for-each>
					   <xsl:if test="current()=text()">   
	                      <xsl:value-of select="current()" />
	                   </xsl:if>
		               <xsl:for-each select="$current-element/*">				 
		                  <xsl:call-template name="inner-html-tags">
		                     <xsl:with-param name="current-element" select="." />
		                  </xsl:call-template>
	                   </xsl:for-each>
                    </xsl:element>				 
           </xsl:for-each>	   
	    </xsl:when>
	    <xsl:otherwise>           
     	         <xsl:for-each select="$current-element">                          
                    <xsl:element name="{name()}">
                       <xsl:for-each select="@*">
                          <xsl:attribute name="{name()}">
                             <xsl:value-of select="current()" />
                          </xsl:attribute>
                       </xsl:for-each>
		               <xsl:if test="current()=text()">   
	                      <xsl:value-of select="current()" />
	                   </xsl:if>					  
					   <xsl:value-of select="following-sibling::text()" />					   
                    </xsl:element>
                 </xsl:for-each>			  
	    </xsl:otherwise>
     </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>