<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:AtomPainter="http://www.advsol.com/AtomPainter"
				xmlns:xslout="http://www.advsol.com/xslout" version="1.0">

  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />
  
  <xsl:namespace-alias stylesheet-prefix="xslout" result-prefix="xsl" />
  
  <xsl:template match="/">
     <xslout:stylesheet version="1.0">
	 <xslout:output method="xml" encoding="utf-8" omit-xml-declaration="no" indent="yes" />     
	   
	 <xslout:template match="/">
	    <xsl:for-each select="//processing-instruction()">
	       <xslout:processing-instruction name="{name()}">
		      <xsl:value-of select="." />
		   </xslout:processing-instruction>
		</xsl:for-each>
	    <xsl:apply-templates select="AtomPainter:Template" />
	 </xslout:template>
	 </xslout:stylesheet>
  </xsl:template>
  
  <xsl:template match="AtomPainter:Template">     
	 <xsl:call-template name="write-xsl-tags">
		<xsl:with-param name="current-element" select="." />
     </xsl:call-template>
  </xsl:template>
  
    <xsl:template name="write-xsl-tags">	
     <xsl:param name="current-element" />
	 
	 <!--
	 <xsl:if test="name()='AtomPainter:TemplateBody'">
	    <xsl:element name="AtomPainter:TemplateBody">
	    <xslout:for-each select="//{name()}">
		   <xslout:if test="count(ancestor::AtomPainter:Template)=1">
		      <xslout:copy-of select="current()/*" />
		   </xslout:if>
		</xslout:for-each>
		</xsl:element>
	 </xsl:if>		     
	 -->
	     
     <xsl:choose>
        <!-- <xsl:when test="$current-element/*=node() and count(parent::AtomPainter:TemplateBody)=0 and not(name()='AtomPainter:TemplateBody')"> -->
		<!-- <xsl:when test="$current-element/*=node() and count(parent::AtomPainter:TemplateBody)=0"> -->
		<xsl:when test="$current-element/*=node()">
	       <xsl:for-each select="$current-element">		      
			  <xsl:choose>
			  
			  <xsl:when test="name()='AtomPainter:TemplateName' or name()='AtomPainter:TemplateTitle' or name()='AtomPainter:TemplateBody'">
				    <xslout:variable name="template_{local-name()}">
					   <xsl:choose>
					      <xsl:when test="name()='AtomPainter:TemplateBody'">
						     <xsl:copy-of select="./*" />
						  </xsl:when>
						  <xsl:otherwise>
						     <xsl:copy-of select="." />
						  </xsl:otherwise>
					   </xsl:choose>
					</xslout:variable>
				    <xslout:for-each select="//{name()}">
					   <xslout:if test="count(ancestor::AtomPainter:Template)=1">
					      <xslout:choose>
						     <xslout:when test="string-length(.) &gt; 0 or count(child::*) &gt; 0">
							    <xslout:copy-of select="." />
							 </xslout:when>
							 <xslout:otherwise>
							 
							    <xslout:element name="{name()}">
                       			   <xslout:for-each select="@*">
                          			   <xslout:attribute name="{concat('{', 'name()','}')}">
                             			   <xslout:value-of select="current()" />
                          			   </xslout:attribute>
                       			   </xslout:for-each>	
								   <xslout:copy-of select="$template_{local-name()}" />	   
		            			</xslout:element>
							 </xslout:otherwise>
							 
						  </xslout:choose>
					   </xslout:if>
					</xslout:for-each>
			     </xsl:when>
			  
			     <xsl:when test="name()='AtomPainter:Template'">				    
					   <xslout:element name="{name()}">
					      <xslout:attribute name="TemplateTypeCode">
						     <xslout:value-of select="//{name()}/@TemplateTypeCode" />
						  </xslout:attribute>
						  <xsl:for-each select="child::*">
						     <xsl:call-template name="write-xsl-tags">
							    <xsl:with-param name="current-element" select="." />
							 </xsl:call-template>
						  </xsl:for-each>
					   </xslout:element>					
				 </xsl:when>
				 <xsl:when test="name()='AtomPainter:TemplatePage'">
				    <xslout:for-each select="//{name()}">
					   <xslout:if test="count(ancestor::AtomPainter:Template)=1">
					   <xslout:element name="{name()}">
					      <xslout:attribute name="index">
						     <xslout:value-of select="@index" />
						  </xslout:attribute>
						  <xsl:for-each select="child::*">
						     <xsl:call-template name="write-xsl-tags">
							    <xsl:with-param name="current-element" select="." />
							 </xsl:call-template>
						  </xsl:for-each>
					   </xslout:element>
					   </xslout:if>
					</xslout:for-each>
				 </xsl:when>
				 <xsl:otherwise>
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
		                  <xsl:call-template name="write-xsl-tags">
		                     <xsl:with-param name="current-element" select="." />
		                  </xsl:call-template>
	                   </xsl:for-each>
                    </xsl:element>
		         </xsl:otherwise>
		      </xsl:choose>
           </xsl:for-each>	   
	    </xsl:when>
	    <xsl:otherwise>
		   <!-- <xsl:if test="count(parent::AtomPainter:TemplateBody)=0 and not(name()='AtomPainter:TemplateBody')" > -->
		   <!-- <xsl:if test="count(parent::AtomPainter:TemplateBody)=0" > -->
		   
     	   <xsl:for-each select="$current-element">		      
		      <xsl:choose>
			     <xsl:when test="name()='AtomPainter:TemplateName' or name()='AtomPainter:TemplateTitle' or name()='AtomPainter:TemplateBody'">
				    <xslout:variable name="template_{local-name()}">
					   <xsl:choose>
					      <xsl:when test="name()='AtomPainter:TemplateBody'">
						     <xsl:copy-of select="./*" />
						  </xsl:when>
						  <xsl:otherwise>
						     <xsl:copy-of select="." />
						  </xsl:otherwise>
					   </xsl:choose>
					</xslout:variable>
				    <xslout:for-each select="//{name()}">
					   <xslout:if test="count(ancestor::AtomPainter:Template)=1">
					      <xslout:choose>
						     <xslout:when test="string-length(.) &gt; 0 or count(child::*) &gt; 0">
							    <xslout:copy-of select="." />
							 </xslout:when>
							 <xslout:otherwise>
							 
							    <xslout:element name="{name()}">
                       			   <xslout:for-each select="@*">
                          			   <xslout:attribute name="{concat('{', 'name()','}')}">
                             			   <xslout:value-of select="current()" />
                          			   </xslout:attribute>
                       			   </xslout:for-each>	
								   <xslout:copy-of select="$template_{local-name()}" />
		            			</xslout:element>
								
							    
							 </xslout:otherwise>
						  </xslout:choose>
					   </xslout:if>
					</xslout:for-each>
			     </xsl:when>
				 <xsl:otherwise>
                    <xsl:element name="{name()}">
                       <xsl:for-each select="@*">
                          <xsl:attribute name="{name()}">
                             <xsl:value-of select="current()" />
                          </xsl:attribute>
                       </xsl:for-each>					   
		            </xsl:element>
			     </xsl:otherwise>
		      </xsl:choose>			 
           </xsl:for-each>
		   <!-- </xsl:if> -->
	    </xsl:otherwise>
     </xsl:choose>
  </xsl:template>
  
 <!--  <xslout:template name="inner-html-tags">	
     <xslout:param name="current-element" />
     
     <xslout:choose>
        <xslout:when test="$current-element/*=node()">
	       <xslout:for-each select="$current-element">              
                    <xslout:element name="{name()}">
                       <xslout:for-each select="@*">
                          <xslout:attribute name="{name()}">
                             <xslout:value-of select="current()" />
                          </xslout:attribute>
                       </xslout:for-each>
					   <xslout:if test="current()=text()">   
	                      <xslout:value-of select="current()" />
	                   </xslout:if>
		               <xslout:for-each select="$current-element/*">				 
		                  <xslout:call-template name="inner-html-tags">
		                     <xslout:with-param name="current-element" select="." />
		                  </xslout:call-template>
	                   </xslout:for-each>
                    </xslout:element>				 
           </xslout:for-each>	   
	    </xslout:when>
	    <xslout:otherwise>           
     	         <xslout:for-each select="$current-element">                          
                    <xslout:element name="{name()}">
                       <xslout:for-each select="@*">
                          <xslout:attribute name="{name()}">
                             <xslout:value-of select="current()" />
                          </xslout:attribute>
                       </xslout:for-each>
		               <xslout:if test="current()=text()">   
	                      <xslout:value-of select="current()" />
	                   </xslout:if>					  
					   <xslout:value-of select="following-sibling::text()" />					   
                    </xslout:element>
                 </xslout:for-each>			  
	    </xslout:otherwise>
     </xslout:choose>
  </xslout:template> -->
  
</xsl:stylesheet>