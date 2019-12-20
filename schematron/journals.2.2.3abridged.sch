<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <title>RILM Journals Collection Schematron 2.2.2</title>
     
   <!--Phases break the checks into sections for somewhat easier navigation-->
    
    <phase id="structure" >  
        <!--checks metadata structure-->
        <active pattern="structure.checks"/>
    </phase>
    
    <phase id="metadata" >  
        <!--checks for key metadata elements-->
        <active pattern="metadata.checks"/>
    </phase>
    
    <phase id="formatting" >
        <!--checks data formatting-->
        <active pattern="formatting.checks"/>
    </phase>
    
    <phase id="charset" >
        <!--checks for illegal characters-->
        <active pattern="charset.checks"/>
    </phase>
    
    <phase id="references" > 
        <!--checks references structure-->
        <active pattern="reference.checks"/>
    </phase>
    
    <!--Code for phases begins here-->
    
    <pattern id="structure.checks">
    <!-- Cardinality checks -->    
        <rule context="tei:teiCorpus">
            <assert role="error" test="count(tei:teiHeader) = 1">
                Error in Corpus header.
            </assert>
            <assert role="error" test="count(tei:TEI) > 0">
                The Corpus contains no headers.
            </assert>
        </rule>
        <rule context="/tei:teiHeader">
            <assert role="error" test="count(tei:fileDesc) = 1">
                Error in Corpus header/fileDesc.
            </assert>
            <assert role="error" test="count(tei:encodingDesc) = 1">
                Error in Corpus header/encodingDesc.
            </assert>
            <assert role="error" test="count(tei:revisionDesc) = 1">
                Error in Corpus header/revisionDesc.
            </assert>
            <assert role="error" test="count(tei:profileDesc) = 1">
                Error in Corpus header/profileDesc.
            </assert>
        </rule>
        <rule role="error" context="tei:sourceDesc">
            <assert test="count(tei:bibl) > 0">
                Error in sourceDesc/bibl.
            </assert>
        </rule>
        <rule context="tei:div|tei:bibl">
            <report role="error" test="(ancestor::tei:list or ancestor::body) and not(@xml:id)">
                The bibl element lacks a required ID attribute.
            </report>   
        </rule>
        
        <!-- Co-constraint checks -->    
        <rule role="error" context="tei:surname|tei:forename">
                    <assert test="count(tei:nameLink) = 0">
                        nameLink should not be a child of surname or forename.
                    </assert>
        </rule> 
        <rule context="tei:div|tei:bibl">
            <report test="ancestor::tei:list and not(@xml:id)">
                ID attribute is not present.
            </report>   
        </rule>      
    </pattern>
    
    <pattern id="metadata.checks">
        <!--checks corpus and article header identifiers-->
       <rule context="tei:bibl">            
            <!--The test for each assert selects bibls by excluding those in references, relatedItems, corpus, or article headers-->
            <assert role="error" test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:idno[@type='topic-id']">
                The Topic ID node is missing.
            </assert>          
            <assert role="error" test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:idno[@type='jid']">
                The JID node is missing.
            </assert>
            <assert role="error" test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI| tei:idno[@type='issn']">
                The ISSN node is missing.
            </assert>
            <assert role="warning" test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:publisher">
                The Publisher is missing.
            </assert>
            <assert role="warning" test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:pubPlace">
                The Publication Place is missing.
            </assert>
        </rule>
        <rule context="/tei:TEI/teiHeader/fileDesc/sourceDesc">
            <assert role="error" test="biblScope[@unit='yr']">
            The article year is missing.
        </assert>
        </rule>
        <rule context="tei:idno[@type='jid']">             
            <assert role="error" test="text()">
                The JID node contains no value.
            </assert>
        </rule>
        <rule context="tei:idno[@type='topic-id']">             
            <assert role="error" test="text()">
                The Topic ID node contains no value.
            </assert>
        </rule>
        <rule context="tei:idno[@type='accession-id']">             
            <report role="error" test="not(following-sibling::tei:idno/@type='Aptara-temp-id' or preceding-sibling::tei:idno/@type='Aptara-temp-id') and not(text())">
                The accession ID node contains no value.
            </report>
        </rule>
        <rule role="error" context="tei:idno[@type='issn']">             
            <assert test="text()">
                The ISSN node contains no value.
            </assert>
        </rule>
        <rule context="tei:publisher">             
            <assert role="error" test="text()">
                The Publisher node contains no value.
            </assert>
        </rule>
        <rule context="tei:pubPlace">             
            <assert role="warning" test="text()">
                The Publisher Place node contains no value.
            </assert>
        </rule>
        <rule context="tei:p">
            <report role="error" test="ancestor::tei:body and (node() or text())">
                Extraneous markup or text appears in the document body.
            </report>
        </rule>
        <rule context="tei:relatedItem">
            <assert test="tei:bibl">  
                The citation for the reviewed item is missing.
            </assert>         
        </rule>
        
        <!--check article-header-specific identifiers-->
        
        <rule context="tei:TEI">
            <assert role="error" test="count(tei:teiHeader) =1">
                Error in article header.
            </assert>
        </rule>
        <rule context="/tei:TEI/teiHeader">
            <assert role="error" test="count(tei:fileDesc) = 1">
                Error in Corpus header/fileDesc.
            </assert>
            <assert role="error" test="count(tei:encodingDesc) = 1">
                Error in Corpus header/encodingDesc.
            </assert>
            <assert role="error" test="count(tei:revisionDesc) = 1">
                Error in Corpus header/revisionDesc.
            </assert>
        </rule>
        <rule role="error" context="tei:biblScope[@unit='yr']">             
            <assert test="text()">
                The article year contains no date value.
            </assert>
        </rule>
        <rule context="tei:language/@ident">
            <!--This rule addresses the string representing the @ident attribute, not the node content.-->
            <assert role="error" test="string()">
                Language code is missing the required attribute.
            </assert>
            <!-- Needs another rule to validate against an external list of country codes -->
        </rule>   
        
        <!-- Algorithmic checks -->    
        
        <rule context="tei:biblScope[@unit='pp']">
            <let name="start" value="number(@from)"/>
            <let name="end" value="number(@to)"/>
            <report role="warning" test="ancestor::tei:list and ($end>0) and not($end >= $start)">
                The end page cannot be less than the start page.
            </report>
        </rule>
        
        <!--Needs another rule to validate bibl@type against controlled list of 
            subdocument types such as periodical-article, periodical-review, etc.-->
    </pattern>
    
    <pattern id="formatting.checks">
        <rule context="tei:biblScope[@unit='yr']">
            <report role="error" test="not(matches(.,'^\d{4}$')) and not(matches(.,'^\d{4}\-\d{4}$')) and not(matches(.,'^\d{4}–\d{4}$')) and not(matches(.,'^\d{4}/\d{4}$'))">
                The date has the wrong number of digits to be a year or range of years (YYYY or YYYY-YYYY).
            </report>
        </rule>
        <rule context="tei:idno[@type='issn']">
            <report role="error" test="not(matches(.,'^\d{4}\-\d{3}(\d|x|X)'))">
                The identifier has the wrong format to be an ISSN.
            </report>
        </rule>
        <rule context="tei:nameLink">              
            <assert role="warning" test="normalize-space(lower-case(.)) = 'von' or
                normalize-space(lower-case(.)) = 'van' or
                normalize-space(.) = 'de' or
                normalize-space(.) = 'den' or
                . = 'van der' or
                . = 'von der' or
                . = 'van den' or
                . = 'van de' or
                normalize-space(.) = 'ten' or
                normalize-space(.) = 'ter' or
                . = 'op de' or
                normalize-space(.) = 'd’' or
                normalize-space(.) = 'du' or
                normalize-space(.) = 'di' or
                . = 'de la' or
                normalize-space(.) = 'del' or
                . = 'de los' or
                . = 'de las' or
                normalize-space(.) = 'da' or
                normalize-space(.) = 'das' or
                normalize-space(.) = 'do' or
                normalize-space(.) = 'dos'">
                Check contents in nameLink
            </assert>
        </rule>       
    </pattern>
    
    <pattern id="charset.checks">
        <rule context="//text()">
            <!--
            <report role="error" test="contains(., '&#x201d;')">
                There is a right double quotation mark (U+201D) here!
            </report>
            <report role="error" test="contains(., '&#x201f;')">
                There is an inverted right double quotation mark (U+201F) here!
            </report>
            <report role="error" test="contains(., '&#x201b;')">
                There is a right single quotation mark (U+201B) here!
            </report>
            <report role="error" test="contains(., '&#x201c;')">
                There is a left double quotation mark (U+201C) here!
            </report>
            <report role="error" test="contains(., '&#x201e;')">
                There is an inverted left double quotation mark (U+201E) here!
            </report>
            <report role="error" test="contains(., '&#x201a;')">
                There is a left single quotation mark (U+201A) here!
            </report>
            <report role="error" test="contains(., '&#x00ab;')">
                There is a double quotation mark (U+00AB) here!
            </report>
            <report role="error" test="contains(., '&#x00bb;')">
                There is a double quotation mark (U+00BB) here!
            </report>
            <report role="error" test="contains(., '&#x2039;')">
                There is a single quotation mark here!
            </report>
            <report role="error" test="contains(., '&#x203a;')">
                There is a single quotation mark (U+203A) here!
            </report> -->
            <assert role="error" test=". = normalize-unicode(., 'NFC')">
                Content is not unicode-normalized.
            </assert>
            <report role="error" test="matches(., '[&#x80;-&#xa0;]')">
                Characters in this range should not be used.
            </report>
            <report role="error" test="matches(., '&#xfffd;')">
                The U+fffd character should not be used.
            </report>
        </rule>
    </pattern>
     
    <pattern id="reference.checks">
        
        <!-- Cardinality checks -->    
        
        <rule context="tei:bibl">
            <report role="error" test="ancestor::tei:list and not(@xml:id)">
                ID attribute is not present in the bibliographic reference for <value-of select=".."/>.
            </report>
        </rule>
        <rule context="tei:graphic/@url">
            <!--This rule checks that a full text file is attached.-->
            <assert role="error" test="string()">
                Full text file not correctly referenced in facsimile/graphic.
            </assert>
            
            <!--Needs another rule to compare the full text filename against the pattern ["RILMacc-"] 
                && [accession-id, or review-id, if present, or UUID] 
                && [filename extension from controlled list].-->  
            
        </rule>
       
        <!--The next bit checks basic structure in citations-->    
        
        <rule context="tei:div[@type='ography']">      
            <assert role="error" test="tei:list">
                An ography must contain a list.
            </assert>
        </rule>
        <rule context="tei:list">      
            <assert role="error" test="tei:item">
                A list must contain one or more items.
            </assert>
        </rule>
        <rule context="tei:item">      
            <assert role="warning" test="count(tei:bibl) = 1">
                A list item must contain at least one bibliographic reference, and more than one only when they refer to different editions of the same target document.
            </assert>
        </rule>
        <rule context="tei:bibl">
            <assert role="warning" test="ancestor::tei:sourceDesc | ancestor::tei:bibl| tei:title">
                A bibliographic reference should contain a title.
            </assert>
            <assert role="warning"  test="ancestor::tei:sourceDesc | ancestor::tei:bibl| tei:author | tei:editor">
                A bibliographic reference should to contain an author or editor.
            </assert>
            <report role="warning" test="tei:bibl">
                The citation for <value-of select=".."/> contains nested bibl elements. Does this citation really refer to (a) a multipart article split between several volumes, or (b) multiple editions (translations) of the same target document?
            </report>   
            <report role="error" test="ancestor::tei:list and tei:date">
                <!-- This rule is FAILING to find <date> children of <bibl> although it WORKS in isolation aaargh -->
                Dates in bibliographic references should be tagged as biblScope.
            </report> 
        </rule>

        <rule context="tei:author">
            <assert role="error" test="(ancestor::tei:sourceDesc | tei:persName) or (ancestor::tei:sourceDesc | tei:orgName)">
                Author names should be tagged as persName. If the author is not a person use orgName.
            </assert>
        </rule>
        
        <!--The following algorithmic checks test for adherence to permitted citation patterns-->
        <!--by AKP, 2015-08-05-07-->
        
        <rule context="tei:title/@type">
            <report test='ancestor::tei:teiHeader and not(string())'>
                The citation for <value-of select=".."/> lacks an attribute for title type. If unsure, use "generic".
            </report>
        </rule>
        <rule context="bibl">
            <report role="warning" test="matches(.,'^[p|S]\.\s?\d+$')">
                <!-- unfortunately this regex, which is valid in http://www.regextester.com/, does not work here -->
                The citation may include a stray page reference.
            </report>
        </rule>
        
        <!-- ******** Abstract pattern definition ******** -->
        
        <!--For books of all kinds-->
        <rule role="warning" abstract="true" id="book"> 
            <!--report test="ancestor::tei:teiHeader and not(following-sibling::tei:orgName) and not(following-sibling::tei:publisher) and not(following-sibling::tei:orgName or preceding-sibling::tei:orgName)">
                   The book citation for <value-of select=".."/> should include a publisher.
               </report>
            <report role="warning" test="ancestor::tei:list and not(following-sibling::tei:orgName) and not(following-sibling::tei:pubPlace) and not(following-sibling::tei:orgName or preceding-sibling::tei:orgName)">
                   The book citation for <value-of select=".."/> should include a publication place.
               </report-->
            <report role="error" test="ancestor::tei:list and not(following-sibling::tei:biblScope/@unit='yr') and not(preceding-sibling::tei:biblScope/@unit='yr') and not(count(tei:bibl) > 1)">
                    A book citation should include a publication date tagged as biblScope unit="yr".
                </report>         
        </rule> 
        
        <!--For monographs-->
        <rule abstract="true" id="monograph">
            <report role="error" test="tei:biblScope/@unit='pp'">
                The monograph citation should not contain page numbers.
            </report>
        </rule>
        
        <!--For edited collections-->
        <rule abstract="true" id="editedvol">
            <assert role="warning" test="(following-sibling::tei:editor or preceding-sibling::tei:editor)">
                A collected essay citation should include an editor.
            </assert>
            <!--assert role="warning" test="following-sibling::tei:biblScope/@unit='pp' and not(following-sibling::tei:ref)">
                A collected essay citation should include a page range if present in the source.
            </assert-->
        </rule>
        
        <!--For periodical articles-->
        <rule abstract="true" id="article">
            <report role="error" test="ancestor::tei:item and not(following-sibling::tei:biblScope/@unit='yr' or preceding-sibling::tei:biblScope/@unit='yr') and not(count(tei:bibl) > 1)">
                An article citation should include a publication date tagged as biblScope unit="yr".
            </report> 
            <!--report role="warning" test="ancestor::tei:item and (not(following-sibling::tei:biblScope/@unit='vol') or not(following-sibling::tei:biblScope/@unit='issue'))and not(following-sibling::tei:title) ">
                An article citation that is not in a collection or encyclopaedia should include a volume and/or issue number.
            </report>
            <report role="warning" test="ancestor::tei:item and (not(following-sibling::tei:biblScope/@unit='pp') and not (following-sibling::tei:biblScope/@unit='col')) and not(following-sibling::tei:ref)">
                An article citation should include a page (or column) range.
            </report-->
        </rule>
        
        <!--For dissertations-->
        <rule abstract="true" id="dissertation-algorithmic">
            <assert role="error" test="tei:orgName">
                The dissertation citation for <value-of select=".."/> should identify a university.
            </assert>
        </rule>
        <rule abstract="true" id="dissertation-cardinality">
            <report role="warning" test="ancestor::tei:list and tei:bibl/@type=''">
                The dissertation citation for <value-of select=".."/> should be tagged as @diss-doc or @diss-nondoc.
            </report>
        </rule>

        <!-- ******** Instantiate the abstract patterns ******** -->
        <rule context="tei:title[@type='monograph']">
            <extends rule="book" />
            <extends rule="monograph" />
        </rule>
        <rule context="tei:title[@type='collection']">
            <extends rule="book" />
            <extends rule="editedvol" />
        </rule>
        <rule context="tei:title[@type='article']">
            <extends rule="article" />            
        </rule>
        <rule context="tei:bibl[@type='diss-doc'] | tei:bibl[@type='diss-nondoc']">
            <extends rule="dissertation-algorithmic" />            
        </rule>
        <rule context="tei:orgName">
            <extends rule="dissertation-cardinality" />            
        </rule>
        <!-- add patterns for other doc types-->
    </pattern>  
</schema>