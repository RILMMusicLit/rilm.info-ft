<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
     <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <title>RILM MGG Schematron for Deliver System - Working Copy</title>
    
    <pattern>
        <rule context="tei:q|tei:quote|tei:title|tei:soCalled">
            <report test="contains(., '&#x201d;')"
                role="information">
                There is a right double quotation mark (U+201D) here!
            </report>
            <report test="contains(., '&#x201f;')"
                role="information">
                There is an inverted right double quotation mark (U+201F) here!
            </report>
            <report test="contains(., '&#x201b;')"
                role="information">
                There is a right single quotation mark (U+201B) here!
            </report>
            <report test="contains(., '&#x201c;')"
                role="information">
                There is a left double quotation mark (U+201C) here!
            </report>
            <report test="contains(., '&#x201e;')"
                role="information">
                There is an inverted left double quotation mark (U+201E) here!
            </report>
            <report test="contains(., '&#x201a;')"
                role="information">
                There is a left single quotation mark (U+201A) here!
            </report>
            <report test="contains(., '&#x00ab;')"
                role="information">
                There is a double quotation mark (U+00AB) here!
            </report>
            <report test="contains(., '&#x00bb;')"
                role="information">
                There is a double quotation mark (U+00BB) here!
            </report>
            <report test="contains(., '&#x2039;')"
                role="information">
                There is a single quotation mark (U+2039) here!
            </report>
            <report test="contains(., '&#x203a;')"
                role="information">
                There is a single quotation mark (U+203A) here!
            </report>
        </rule>
    </pattern>
    <!-- need a rule for quotes right before or after q, quote, or title tags -->
    <pattern>
        <rule context="tei:text//text()">
          <assert test=". = normalize-unicode(., 'NFC')"
               role="error">
                Content is not unicode-normalized.
            </assert>
       </rule>
    </pattern>
    <pattern>
        <rule context="tei:list">              
            <assert test="count(tei:head) = 0"
                role="error">
                The head element is in the wrong place. It should be a child of div, not list.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:surname|tei:forename">
            <assert test="count(tei:nameLink) = 0"
                role="error">
                nameLink should not be a child of surname or forename.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:docAuthor|tei:author|tei:editor">
            <assert test="count(tei:rilmPerson) = 0"
                role="error">
                rilmPerson should not be a child of docAuthor, author, or editor.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:div|tei:p|tei:bibl|tei:docAuthor|tei:notatedMusic|tei:figure|tei:tableFigure">
            <report test="ancestor::tei:text and not(@xml:id)"
                role="error">
                ID attribute is not present.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="//text()">
            <report test="matches(., '[&#x80;-&#x9f;]')"
                role="error">
                Characters in this range should not be used.
            </report>
            <report test="matches(., '&#xfffd;')"
                role="error">
                The U+fffd character should not be used.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='heading']">
            <report test="descendant::tei:div[@type='bio'] or
                descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='criticism'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='section']"
                role="error">
                The div @type='heading' looks to have ended in the wrong place.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='bio']">
            <report test="tei:div[@type='works']"
                role="error">
                The div @type='bio' looks to have ended in the wrong place.
            </report>
            <report test="tei:div[@type='criticism']"
                role="error">
                The div @type='bio' looks to have ended in the wrong place.
            </report>
            <report test="tei:div[@type='ography']"
                role="error">
                The div @type='bio' looks to have ended in the wrong place.
            </report>
            <report test="tei:div[@type='bio']"
                role="error">
                div @type='bio' should not contain another div @type='bio'.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='works']">
            <report test="tei:div[@type='criticism']"
                role="error">
                The div @type='works' looks to have ended in the wrong place.
            </report>
            <report test="tei:div[@type='ography']"
                role="error">
                The div @type='works' looks to have ended in the wrong place.
            </report>  
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='criticism']">
            <report test="tei:div[@type='ography']"
                role="error">
                The div @type='works' looks to have ended in the wrong place.
            </report>  
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='person']">
            <report test="descendant::tei:div[@type='bio'][2]"
                role="error">
                There should only be one div@type="bio" in a person article
            </report>
            <report test="descendant::tei:div[@type='criticsm'][2]"
                role="error">
                There should only be one div@type="criticism" in a person article
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='section']">
            <assert test="parent::tei:div[@type='person'] or 
                parent::tei:div[@type='works'] or
                parent::tei:div[@type='ography'] or
                parent::tei:div[@type='criticism'] or
                parent::tei:div[@type='section']"
                role="information">
                In a family article, div@type="section" is usually the child of div@type="person", div@type="works",  div@type="ography", div@type="criticism", or div@type="section" (there are exceptions)  
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='bio']">
            <assert test="parent::tei:div[@type='person']"
                role="warning">
                In a family article, div@type="bio" should always be the child of div@type="person"
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='person']">
            <assert test="preceding-sibling::tei:div[@type='person'] or
                following-sibling::tei:div[@type='person']"
                role="warning">
                All 'person' div's should either be followed by or preceded by a person div as a sibling.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='person']">
            <assert test="ancestor::tei:text[@type='family']"
                role="warning">
                div@type="person" should only appear in family articles. The text node of this article may need to be changed to type="family".
            </assert>
            <assert test="parent::tei:body"
                role="warning">
                div@type="person" should be the direct child of body
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:body//tei:div[@type='authors'][2]">
            <report test="."
                role="error">
                There should only be one div@type="authors" as a child of body (and it should be at the end).
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='section']">
            <report test="tei:div[@type='ography']"
                role="warning">
                div@type="section" should not contain div@type="ography"
            </report>
            <report test="tei:div[@type='works']"
                role="warning">
                div@type="section" should not contain div@type="works"
            </report>
            <report test="tei:div[@type='bio']"
                role="error">
                div@type="section" should not contain div@type="bio"
            </report>
            <report test="tei:div[@type='criticism']"
                role="error">
                div@type="section" should not contain div@type="criticism"
            </report>
            <assert test="tei:div[@type='section'] or tei:div[@type='authors'] or not(tei:div)"
                role="warning">
                All children div's of div@type="section" should either be div@type="section" or div@type="authors"
            </assert>
            <report test="parent::tei:body"
                role="warning">
                In the Personenteil, div@type="section" is usually only used as a child of another div
            </report>
            <report test="following-sibling::tei:div[@type='bio']"
                role="warning">
                section and bio div's should not be siblings
            </report>
            <report test="following-sibling::tei:div[@type='works']"
                role="warning">
                section and works div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='works']"
                role="warning">
                section and works div's should not be siblings
            </report>
            <report test="following-sibling::tei:div[@type='criticism']"
                role="warning">
                section and criticism div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='criticism']"
                role="warning">
                section and criticism div's should not be siblings
            </report>
            <report test="following-sibling::tei:div[@type='ography']"
                role="warning">
                section and ography div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='ography']"
                role="warning">
                section and ography div's should not be siblings
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='contents']">
            <assert test="parent::tei:div[@type='heading']"
                role="error">
                div@type="contents" should be a child of div@type="heading"
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:persName">
            <report test="tei:orgName"
                role="warning">
                persName should not contain orgName
            </report>
        </rule>
    </pattern>  
    <pattern>
        <rule context="tei:div[@type='heading']">
            <report test="descendant::tei:div[@type='bio'] or
                descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='criticism'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='section']"
                role="error">
                The div @type='heading' should not contain divs with type 'bio', 'works', 'criticism', 'ography', or 'section'.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='contents']">
            <report test="descendant::tei:div[@type='bio'] or
                descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='criticism'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='section']"
                role="error">
                The div @type='contents' should not contain divs with type 'bio', 'works', 'criticism', 'ography', or 'section'.
            </report>
        </rule>
    </pattern>
<!-- is there a reason to have 'one-section'?
        <pattern>
        <rule context=".">
            <report test="tei:div[@type='one-section']"
                role="error">
                div@type="one-section" should not be used in the Personenteil
            </report>
        </rule>
    </pattern>-->
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='works']">
            <assert test="parent::tei:div[@type='person']" role="warning">
                In family articles, works divs should all be children of person divs.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:docAuthor">
            <report test="tei:persName[2]"
                role="error">
                Each docAuthor should contain only one persName.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='person']">
            <assert test="descendant::tei:rilmPerson" 
                role="information">
                This family member section might be missing a rilmPerson element.
            </assert>
        </rule>
    </pattern>
    <pattern>
    <rule context="tei:text//text()">
        <report test="contains(., '&#x2192;')"
            role="warning">
            There is an arrow (U+2192) here!
        </report>
    </rule>
    </pattern>
    <pattern>
        <rule context="//text()">
            <report test="matches(., '/*\s?[0-9]+')"
                role="warning">
                The asterisk here should perhaps be a Birth tag.
            </report>
        </rule>
    </pattern>
</sch:schema>