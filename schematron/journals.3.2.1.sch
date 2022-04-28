<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <title>RAFT TEI checks</title>
    <pattern id="structure.checks">
        <!-- Cardinality checks -->
        <rule context="tei:teiCorpus">
            <assert role="error" test="count(tei:teiHeader) = 1"> Error in Corpus header. </assert>
            <assert role="error" test="count(tei:TEI) > 0"> The Corpus contains no headers.
            </assert>
        </rule>
        <rule context="/tei:teiHeader">
            <assert role="error" test="count(tei:fileDesc) = 1"> Error in Corpus header/fileDesc. </assert>
            <assert role="error" test="count(tei:encodingDesc) = 1"> Error in Corpus
                header/encodingDesc. </assert>
            <assert role="error" test="count(tei:revisionDesc) = 1"> Error in Corpus
                header/revisionDesc. </assert>
            <assert role="error" test="count(tei:profileDesc) = 1"> Error in Corpus
                header/profileDesc. </assert>
        </rule>
        <rule role="error" context="tei:sourceDesc">
            <assert test="count(tei:bibl) > 0"> Error in sourceDesc/bibl. </assert>
        </rule>
        <rule context="tei:div | tei:bibl">
            <report role="error" test="(ancestor::tei:list or ancestor::body) and not(@xml:id)"> The
                bibl element lacks a required ID attribute. </report>
        </rule>
        <rule context="tei:div | tei:bibl">
            <report test="ancestor::tei:list and not(@xml:id)"> ID attribute is not present.
            </report>
        </rule>
    </pattern>
    <pattern id="metadata.checks">
        <!--checks corpus and article header identifiers-->
        <rule context="tei:bibl">
            <assert role="error"
                test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:idno[@type = 'topic-id']"
                > The Topic ID node is missing. </assert>
            <assert role="error"
                test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:idno[@type = 'jid']"
                > The JID node is missing. </assert>
            <assert role="error"
                test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:idno[@type = 'issn']"
                > The ISSN node is missing. </assert>
            <assert role="warning"
                test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:publisher"
                > The Publisher is missing. </assert>
            <assert role="warning"
                test="ancestor::tei:list | ancestor::tei:relatedItem | ancestor::tei:TEI | tei:pubPlace"
                > The Publication Place is missing. </assert>
        </rule>
        <rule context="/tei:TEI/teiHeader/fileDesc/sourceDesc">
            <assert role="error" test="biblScope[@unit = 'yr']"> The article year is missing.
            </assert>
        </rule>
        <rule context="tei:idno[@type = 'jid']">
            <assert role="error" test="text()"> The JID node contains no value. </assert>
        </rule>
        <rule context="tei:idno[@type = 'topic-id']">
            <assert role="error" test="text()"> The Topic ID node contains no value. </assert>
        </rule>
         <rule context="tei:idno[@type = 'accession-id']">
              <report role="error"
                   test="not(following-sibling::tei:idno/@type = 'Aptara-temp-id' or preceding-sibling::tei:idno/@type = 'Aptara-temp-id')
                   and not(following-sibling::tei:idno/@type = 'temp-id' or preceding-sibling::tei:idno/@type = 'temp-id')
                   and not(text())"
                   > The accession ID node contains no value. </report>
         </rule>
         <rule context="tei:idno[@type = 'temp-id']">
              <report role="error" test="contains(text(),'-')"> This is not a valid temporary identifier. </report>
         </rule>
        <rule role="error" context="tei:idno[@type = 'issn']">
            <assert test="text()"> The ISSN node contains no value. </assert>
        </rule>
        <rule context="tei:publisher">
            <assert role="error" test="text()"> The Publisher node contains no value. </assert>
        </rule>
        <rule context="tei:pubPlace">
            <assert role="warning" test="text()"> The Publisher Place node contains no value.
            </assert>
        </rule>
        <rule context="tei:p">
            <report role="error" test="ancestor::tei:body and (node() or text())"> Extraneous markup
                or text appears in the document body. </report>
        </rule>
        <rule context="tei:relatedItem">
            <assert test="tei:bibl"> The citation for the reviewed item is missing. </assert>
        </rule>
        <!--check article-header-specific identifiers-->
        <rule context="tei:TEI">
            <assert role="error" test="count(tei:teiHeader) = 1"> Error in article header. </assert>
        </rule>
        <rule context="/tei:TEI/teiHeader">
            <assert role="error" test="count(tei:fileDesc) = 1"> Error in Corpus header/fileDesc. </assert>
            <assert role="error" test="count(tei:encodingDesc) = 1"> Error in Corpus
                header/encodingDesc. </assert>
            <assert role="error" test="count(tei:revisionDesc) = 1"> Error in Corpus
                header/revisionDesc. </assert>
        </rule>
        <rule role="error" context="tei:biblScope[@unit = 'yr']">
            <assert test="text()"> The article year contains no date value. </assert>
        </rule>
        <rule context="tei:language/@ident">
            <!--This rule addresses the string representing the @ident attribute, not the node content.-->
            <assert role="error" test="string()"> Language code is missing the required attribute.
            </assert>
        </rule>
        <!--check for non-latin characters added 2022/01, key -->
        <rule context="tei:sourceDesc/tei:bibl/tei:title[not(@type = 'nonroman')]">
            <report role="warning" test="matches(., '[&#x370;-&#x1dff;]')">This title element
                probably should have a type="nonroman" attribute.</report>
            <report role="warning" test="matches(., '[&#x1f00;-&#x1fff;]')">This title element
                probably should have a type="nonroman" attribute.</report>
            <report role="warning" test="matches(., '[&#x2e80;-&#xfffd;]')">This title element
                probably should have a type="nonroman" attribute.</report>
        </rule>
        <!-- new title-type checks below, added 2012/02 key -->
        <rule context="tei:idno[@type = 'temp-id']">
            <report role="error"
                test="(count(following-sibling::tei:title[not(*) and normalize-space()]) > 1) and (count(following-sibling::tei:title[@type = 'title_entry']) = 1)"
                >A new article record should include a true title or a title entry, but not
                both.</report>
        </rule>
        <rule context="tei:title[@type = 'title_entry']">
            <assert role="error"
                test="(ancestor::tei:bibl[@type = 'periodical-backcover'] | ancestor::tei:bibl[@type = 'periodical-frontcover'] | ancestor::tei:bibl[@type = 'advertisement'] | ancestor::tei:bibl[@type = 'course-list'] | ancestor::tei:bibl[@type = 'news'] | ancestor::tei:bibl[@type = 'periodical-colloquy'] | ancestor::tei:bibl[@type = 'periodical-correspondence'] | ancestor::tei:bibl[@type = 'periodical-editorial'] | ancestor::tei:bibl[@type = 'periodical-frontmatter'] | ancestor::tei:bibl[@type = 'periodical-backmatter'])"
                >This bibl @type normally has a true title, not a title entry.</assert>
            <assert role="error"
                test="contains(text(), 'Back cover') or contains(text(), 'Front cover') or contains(text(), 'Advertisement') or contains(text(), 'Course list') or contains(text(), 'News') or contains(text(), 'Discussion') or contains(text(), 'Letters') or contains(text(), 'Editorial') or contains(text(), 'Front matter') or contains(text(), 'Publications list') or contains(text(), 'Back matter') or contains(text(), 'Contributors') or contains(text(), 'Society membership') or contains(text(), 'Index')"
                >This title entry contains an invalid string.</assert>
        </rule>

        <!-- Algorithmic checks -->
        <rule context="tei:biblScope[@unit = 'pp']">
            <let name="start" value="number(@from)"/>
            <let name="end" value="number(@to)"/>
            <report role="warning" test="ancestor::tei:list and ($end > 0) and not($end >= $start)">
                The end page cannot be less than the start page. </report>
        </rule>
    </pattern>
    <pattern id="formatting.checks">
        <rule context="tei:biblScope[@unit = 'yr']">
            <report role="error"
                test="not(matches(., '^\d{4}$')) and not(matches(., '^\d{4}\-\d{4}$')) and not(matches(., '^\d{4}–\d{4}$')) and not(matches(., '^\d{4}/\d{4}$'))"
                > The date has the wrong number of digits to be a year or range of years (YYYY or
                YYYY-YYYY). </report>
        </rule>
        <rule context="tei:idno[@type = 'issn']">
            <report role="error" test="not(matches(., '^\d{4}\-\d{3}(\d|x|X)'))"> The identifier has
                the wrong format to be an ISSN. </report>
        </rule>
        <rule context="tei:nameLink">
            <assert role="warning" test="
                    normalize-space(lower-case(.)) = 'von' or
                    normalize-space(lower-case(.)) = 'van' or
                    normalize-space(lower-case(.)) = 'de' or
                    normalize-space(lower-case(.)) = 'den' or
                    lower-case(.) = 'van der' or
                    lower-case(.) = 'von der' or
                    lower-case(.) = 'van den' or
                    lower-case(.) = 'van de' or
                    normalize-space(lower-case(.)) = 'ten' or
                    normalize-space(lower-case(.)) = 'ter' or
                    lower-case(.) = 'op de' or
                    normalize-space(lower-case(.)) = 'd’' or
                    normalize-space(lower-case(.)) = 'du' or
                    normalize-space(lower-case(.)) = 'di' or
                    normalize-space(lower-case(.)) = 'del' or
                    normalize-space(lower-case(.)) = 'de los' or
                    normalize-space(lower-case(.)) = 'de las' or
                    normalize-space(lower-case(.)) = 'de la' or
                    normalize-space(lower-case(.)) = 'la' or
                    normalize-space(lower-case(.)) = 'da' or
                    normalize-space(lower-case(.)) = 'das' or
                    normalize-space(lower-case(.)) = 'do' or
                    normalize-space(lower-case(.)) = 'dos'"> Check contents in nameLink
            </assert>
        </rule>
    </pattern>
    <pattern id="charset.checks">
        <rule context="//text()">
            <assert role="error" test=". = normalize-unicode(., 'NFC')"> Content is not
                 unicode-normalized. You can normalize it to NFC at https://dencode.com/en/string/unicode-normalization .</assert>
            <report role="error" test="matches(., '[&#x80;-&#xa0;]')"> Characters in this range
                should not be used. </report>
            <report role="error" test="matches(., '&#xfffd;')"> The U+fffd character should not be
                used. </report>
        </rule>
    </pattern>
    <pattern id="reference.checks">
        <rule context="tei:bibl">
            <report role="error" test="ancestor::tei:list and not(@xml:id)"> ID attribute is not
                present in the bibliographic reference for <value-of select=".."/>. </report>
        </rule>
        <rule context="tei:graphic/@url">
            <!--This rule checks that a full text file is attached.-->
            <assert role="error" test="string()"> Full text file not correctly referenced in
                facsimile/graphic. </assert>
        </rule>
        <!--Check basic structure in citations-->
        <rule context="tei:div[@type = 'ography']">
            <assert role="error" test="tei:list"> An ography must contain a list. </assert>
        </rule>
        <rule context="tei:list">
            <assert role="error" test="tei:item"> A list must contain one or more items. </assert>
        </rule>
        <rule context="tei:item">
            <assert role="warning" test="count(tei:bibl) = 1"> A list item must contain at least one
                bibliographic reference, and more than one only when they refer to different
                editions of the same target document. </assert>
        </rule>
        <rule context="tei:bibl">
            <assert role="warning" test="ancestor::tei:sourceDesc | ancestor::tei:bibl | tei:title">
                A bibliographic reference should contain a title. </assert>
            <assert role="warning"
                test="ancestor::tei:sourceDesc | ancestor::tei:bibl | tei:author | tei:editor"> A
                bibliographic reference should to contain an author or editor. </assert>
            <report role="warning" test="tei:bibl"> The citation for <value-of select=".."/>
                contains nested bibl elements. Does this citation really refer to (a) a multipart
                article split between several volumes, or (b) multiple editions (translations) of
                the same target document? </report>
        </rule>
        <rule context="tei:author">
            <assert role="error"
                test="(ancestor::tei:sourceDesc | tei:persName) or (ancestor::tei:sourceDesc | tei:orgName)"
                > Author names should be tagged as persName. If the author is not a person use
                orgName. </assert>
        </rule>
        <rule context="tei:title[@type = 'article']">
            <report role="warning" test="text()[starts-with(upper-case(.), 'ART')]">The title
                element should not contain "article" or an abbreviation of it.</report>
        </rule>
        <rule context="tei:item/tei:bibl/tei:title">
            <!-- checks for T and TT in the same element, but too many legitimate brackets (2022-01 key):
            <report role="warning" test="contains(text(),'&#x5b;')">This might be a title and its translation. If so, separate into two &lt;title> elements at the bracket, and add attribute type="translated" to the second.</report>
            -->
            <!-- applicable only to Russian, and unclear of meaning: 
                <report role="warning" test="contains(text(),'//')">This might be a title and its translation. If so, separate into two &lt;title> elements at the bracket, and add attribute type="translated" to the second.</report> 
            -->
            <!--tests for volume number included in <title> element (2022-01 key): -->
            <report role="warning" test="contains(text(), '\s\d')">The number here might be a volume
                number. If so, move to a &lt;biblScope> element.</report>
        </rule>
        <!-- tests for series number included in <series> element: (2022-01 key)-->
        <rule context="tei:item/tei:bibl/tei:series">
            <report role="error" test="contains(text(), '\.\d')">The number in this series element
                is the series volume number. Move to a &lt;biblScope> element with
                unit="series".</report>
        </rule>
        <rule context="tei:pubPlace">
            <report role="warning"
                test="text()[contains(upper-case(.), 'O.J.')] | text()[contains(upper-case(.), 'O. J.')]"
                >"o.J." is not part of the publication place name.</report>
        </rule>
        <rule context="tei:publisher">
            <report role="warning"
                test="text()[contains(upper-case(.), 'O.J.')] | text()[contains(upper-case(.), 'O. J.')]"
                >"o.J." is not part of the publisher name.</report>
        </rule>
        <rule context="tei:title/@type">
            <report test="ancestor::tei:teiHeader and not(string())"> The citation for <value-of
                    select=".."/> lacks an attribute for title type. If unsure, use "generic".
            </report>
        </rule>
        <!-- ******** Abstract pattern definition ******** -->
        <!--For books of all kinds-->
        <rule role="warning" abstract="true" id="book">
            <report role="error"
                test="ancestor::tei:list and not(following-sibling::tei:biblScope/@unit = 'yr') and not(preceding-sibling::tei:biblScope/@unit = 'yr') and not(count(tei:bibl) > 1)"
                > A book citation should include a publication date tagged as biblScope unit="yr".
            </report>
        </rule>
        <!--For monographs-->
        <rule abstract="true" id="monograph">
            <report role="error" test="tei:biblScope/@unit = 'pp'"> The monograph citation should
                not contain page numbers. </report>
        </rule>
        <!--For edited collections-->
        <rule context="tei:title[@type = 'collection']">
            <!--added these tests for incorrect title @type: -key 9/2019-->
            <report role="error" test="following-sibling::tei:biblScope[@unit = 'issue']"> This is a
                periodical, not a collection. </report>
            <report role="error" test="following-sibling::tei:biblScope[@unit = 'sd']"> This is
                either a periodical, or should not have a biblScope/@unit='sd'. </report>
            <report role="error"
                test="text()[contains(upper-case(.), 'ZEITSCHRIFT')] | text()[contains(upper-case(.), 'REVISTA')] | text()[contains(upper-case(.), 'MITTEILUNG')] | text()[contains(upper-case(.), 'BULLETIN')]"
                >This is a periodical, not a collection.</report>
        </rule>
        <rule abstract="true" id="editedvol">
            <assert role="warning"
                test="(following-sibling::tei:editor or preceding-sibling::tei:editor)"> A collected
                essay citation should include an editor. </assert>
        </rule>
        <!--For periodical articles-->
        <rule abstract="true" id="article">
            <report role="error"
                test="ancestor::tei:item and not(following-sibling::tei:biblScope/@unit = 'yr' or preceding-sibling::tei:biblScope/@unit = 'yr') and not(count(tei:bibl) > 1)"
                > An article citation should include a publication date tagged as biblScope
                unit="yr". </report>
        </rule>
        <rule context="tei:title[@type = 'periodical']">
            <!--added this tests for incorrect title @type: -key 9/2019-->
            <report role="error"
                test="text()[contains(upper-case(.), 'GROVE')] | text()[contains(upper-case(.), 'MGG')] | text()[contains(upper-case(.), 'MONOGR')] | text()[contains(upper-case(.), 'FESTSCHR')]"
                >This is a collection, not a periodical.</report>
        </rule>
        <!--For dissertations-->
        <rule abstract="true" id="dissertation-algorithmic">
            <assert role="error" test="tei:orgName"> The dissertation citation for <value-of
                    select=".."/> should identify a university. </assert>
        </rule>
        <rule abstract="true" id="dissertation-cardinality">
            <report role="warning" test="ancestor::tei:list and tei:bibl/@type = ''"> The
                dissertation citation for <value-of select=".."/> should be tagged as @diss-doc or
                @diss-nondoc. </report>
        </rule>
        <rule context="tei:title[@type = 'article']">
            <report role="error" test="following-sibling::tei:seg">Dissertations are monographs, not
                articles.</report>
        </rule>
        <!-- ******** Instantiate the abstract patterns ******** -->
        <rule context="tei:title[@type = 'monograph']">
            <extends rule="book"/>
            <extends rule="monograph"/>
        </rule>
        <rule context="tei:title[@type = 'collection']">
            <extends rule="book"/>
            <extends rule="editedvol"/>
        </rule>
        <rule context="tei:title[@type = 'article']">
            <extends rule="article"/>
        </rule>
        <rule context="tei:bibl[@type = 'diss-doc'] | tei:bibl[@type = 'diss-nondoc']">
            <extends rule="dissertation-algorithmic"/>
        </rule>
        <rule context="tei:orgName">
            <extends rule="dissertation-cardinality"/>
        </rule>
    </pattern>
</schema>
