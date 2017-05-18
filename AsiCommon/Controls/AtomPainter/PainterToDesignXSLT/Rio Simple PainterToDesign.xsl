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
		   <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
		</xsl:for-each>
		
		<xsl:for-each select="//AtomPainter:TemplatePage[position()=1]">
		   <!-- need this check to process only the first one -->
		   <xsl:if test="position()=1">		   		      
			  <xsl:apply-templates select="." />
		   </xsl:if>
		</xsl:for-each>
     </xsl:element>
	 </xsl:if>
  </xsl:template>
  
  <xsl:template match="AtomPainter:TemplatePage">
	 <xsl:element name="{name()}">
	    <xsl:for-each select="@*">
		   <xsl:attribute name="{name()}"><xsl:value-of select="current()"/></xsl:attribute>
		</xsl:for-each>	    
		
		<xsl:variable name="template-page-node"><xsl:value-of select="." /></xsl:variable>
		
		
		<AtomPainter:TemplateTitle>
		   <xsl:for-each select="descendant::*">
		      <xsl:if test="count(ancestor::AtomPainter:TemplatePage)=1 and name()='AtomPainter:TemplateTitle'">
			     <xsl:call-template name="Title">		   
		            <xsl:with-param name="title-node" select="./*"/>
		         </xsl:call-template>
			  </xsl:if>		
		   </xsl:for-each>
		</AtomPainter:TemplateTitle>
		
		<AtomPainter:TemplateName>
		   <xsl:for-each select="descendant::*">
		      <xsl:if test="count(ancestor::AtomPainter:TemplatePage)=1 and name()='AtomPainter:TemplateName'">
			     <xsl:call-template name="Title">		   
		            <xsl:with-param name="title-node" select="./*"/>
		         </xsl:call-template>
			  </xsl:if>		
		   </xsl:for-each>
		</AtomPainter:TemplateName>
		
		<xsl:choose>
		   <xsl:when test="count(//AtomPainter:TemplateBody) = 0">
		      <xsl:element name="AtomPainter:TemplateBody" />
		   </xsl:when>
		   <xsl:otherwise>		
		      <xsl:for-each select="descendant::*">
		         <xsl:if test="count(ancestor::AtomPainter:TemplatePage)=1 and name()='AtomPainter:TemplateBody'">
		            <xsl:call-template name="Body">		   
		               <xsl:with-param name="body-node" select="." />
		            </xsl:call-template>
		         </xsl:if>
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
		      <xsl:with-param name="current-element" select="$name-node" />
		   </xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		   <xsl:element name="AtomPainter:TemplateName" />
		</xsl:otherwise>
	 </xsl:choose>
  </xsl:template>
  
  <xsl:template name="Title">
     <xsl:param name="title-node" />
	 	 
	       <xsl:call-template name="inner-html-tags">
		      <xsl:with-param name="current-element" select="$title-node" />
           </xsl:call-template>
		
  </xsl:template> 
  
  <xsl:template name="Body">
     <xsl:param name="body-node" />	 
	 
	 <xsl:copy-of select="$body-node" />      
	 
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
	    <xsl:when test="$current-element">
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
		</xsl:when>
		<xsl:otherwise>
				 <xsl:value-of select="." />
	    </xsl:otherwise>
     </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>