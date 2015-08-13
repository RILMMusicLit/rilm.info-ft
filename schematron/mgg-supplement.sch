<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">   
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <title>RILM MGG Schematron 1.0.3</title>
    <pattern>
        <rule context="tei:nameLink">              
            <assert test="normalize-space(.) = 'von' or
                normalize-space(.) = 'vom' or
                normalize-space(.) = 'van' or
                normalize-space(.) = 'de' or
                normalize-space(.) = 'den' or
                . = 'van der' or
                normalize-space(.) = 'vander' or
                . = 'von der' or
                . = 'van den' or
                . = 'van de' or
                . = 'von den' or
                normalize-space(.) = 'ten' or
                normalize-space(.) = 'te' or
                normalize-space(.) = 'ter' or
                lower-case(.) = 'op de' or
                normalize-space(.) = 'd’' or
                normalize-space(.) = 'du' or
                normalize-space(.) = 'di' or
                normalize-space(.) = 'dei' or
                normalize-space(.) = 'de’' or
                . = 'de la' or
                normalize-space(.) = 'del' or
                normalize-space(.) = 'della' or
                . = 'de los' or
                . = 'de las' or
                normalize-space(.) = 'da' or
                normalize-space(.) = 'das' or
                normalize-space(.) = 'do' or
                normalize-space(.) = 'dos' or
                normalize-space(.) = 'des' or
                normalize-space(.) = 'af' or
                normalize-space(.) = 'ze' or
                normalize-space(.) = 'z' or
                normalize-space(.) = 'e' or
                normalize-space(lower-case(.)) = '(von)' or
                normalize-space(lower-case(.)) = '(vom)' or
                normalize-space(lower-case(.)) = '(van)' or
                normalize-space(.) = '(de)' or
                normalize-space(.) = '(den)' or
                lower-case(.) = '(van der)' or
                normalize-space(.) = '(vander)' or
                lower-case(.) = '(von der)' or
                lower-case(.) = '(van den)' or
                lower-case(.) = '(van de)' or
                lower-case(.) = '(von den)' or
                normalize-space(.) = '(ten)' or
                normalize-space(.) = '(te)' or
                normalize-space(.) = '(ter)' or
                lower-case(.) = '(op de)' or
                normalize-space(.) = '(d’)' or
                normalize-space(.) = '(du)' or
                normalize-space(.) = '(di)' or
                normalize-space(.) = '(dei)' or
                normalize-space(.) = '(de’)' or
                lower-case(.) = '(de la)' or
                normalize-space(.) = '(del)' or
                normalize-space(.) = '(della)' or
                lower-case(.) = '(de los)' or
                lower-case(.) = '(de las)' or
                normalize-space(.) = '(da)' or
                normalize-space(.) = '(das)' or
                normalize-space(.) = '(do)' or
                normalize-space(.) = '(dos)' or
                normalize-space(.) = '(des)' or
                normalize-space(.) = '(af)' or
                normalize-space(.) = '(ze)' or
                normalize-space(.) = '(z)' or
                normalize-space(.) = '(e)'
                "
                role="warning">
                Wrong contents in nameLink
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:genName">
            <assert test=". = 'd. J.' or
                . = 'd. Ä' or
                normalize-space(.) = 'd.J.' or
                normalize-space(.) = 'd.Ä.' or
                normalize-space(lower-case(.)) = 'jr.' or
                normalize-space(lower-case(.)) = 'sr.' or
                normalize-space(.) = 'I' or
                normalize-space(.) = 'II' or
                normalize-space(.) = 'III' or
                normalize-space(.) = 'IV' or
                normalize-space(lower-case(.)) = 'sen.' or
                normalize-space(lower-case(.)) = 'jun.' or
                normalize-space(lower-case(.)) = 'snr' or
                normalize-space(lower-case(.)) = 'jnr' or
                normalize-space(lower-case(.)) = 'fils' or
                normalize-space(lower-case(.)) = 'père' or
                '(d. J.)' or
                . = '(d. Ä)' or
                normalize-space(.) = '(d.J.)' or
                normalize-space(.) = '(d.Ä.)' or
                normalize-space(lower-case(.)) = '(jr.)' or
                normalize-space(lower-case(.)) = 'sr.)' or
                normalize-space(.) = '(I)' or
                normalize-space(.) = '(II)' or
                normalize-space(.) = '(III)' or
                normalize-space(.) = '(IV)' or
                normalize-space(lower-case(.)) = '(sen.)' or
                normalize-space(lower-case(.)) = '(jun.)' or
                normalize-space(lower-case(.)) = '(snr)' or
                normalize-space(lower-case(.)) = '(jnr)' or
                normalize-space(lower-case(.)) = '(fils)' or
                normalize-space(lower-case(.)) = '(père)'
                "
                role="warning">
                Wrong content in genName.
            </assert>
        </rule>
    </pattern>
   <!-- <pattern>
        <rule context="tei:text//text()">
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
          <assert test=". = normalize-unicode(., 'NFC')"
               role="error">
                Content is not unicode-normalized.
            </assert>
       </rule>
    </pattern>-->
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
        <rule context="tei:abbr">
            <report test= ". = 'd. J.' or
                . = 'd. Ä' or
                normalize-space(.) = 'd.J.' or
                normalize-space(.) = 'd.Ä.' or
                normalize-space(lower-case(.)) = 'jr.' or
                normalize-space(lower-case(.)) = 'sr.' or
                normalize-space(.) = 'I' or
                normalize-space(.) = 'II' or
                normalize-space(.) = 'III' or
                normalize-space(.) = 'IV' or
                normalize-space(lower-case(.)) = 'sen.' or
                normalize-space(lower-case(.)) = 'jun.'
                "
                role="warning">
                This looks like it should be tagged with genName rather than abbr
            </report>
            <report test="normalize-space(.) = 'Fs.'"
                role="error">
                This is not a name; it is a title that starts with "Fs." and contains a personal name.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div|tei:p|tei:bibl">
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
        <rule context="tei:title[not(@*)]">
            <report test="tei:hi[@rend='italic']"
                role="warning">
                Title (without any attributes) should not contain hi rend='italic'
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:editor">
            <report test="@rend='sup'"
                role="error">
                Editor should not have @rend="sup" 
            </report>
            <report test="@rend='sub'"
                role="error">
                Editor should not have @rend="sub"
            </report>
            <report test="@rend='roman'"
                role="error">
                Editor should not have @rend="roman" (it will be rendered Roman automatically)
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
        <rule context="tei:text[@type='person']//tei:div[@type='works'][position()>1]">
            <report test="."
                role="information">
                There is usually only one div@type='works' in a person article 
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
            <report test="following-sibling::tei:div[@type='bio']"
                role="error">
                section and bio div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='bio']"
                role="error">
                section and bio div's should not be siblings
            </report>
            <report test="following-sibling::tei:div[@type='works']"
                role="error">
                section and works div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='works']"
                role="error">
                section and works div's should not be siblings
            </report>
            <report test="following-sibling::tei:div[@type='criticism']"
                role="error">
                section and criticism div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='criticism']"
                role="error">
                section and criticism div's should not be siblings
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='person']//tei:div[@type='section']">
            <report test="following-sibling::tei:div[@type='ography']"
                role="error">
                In person articles, section and ography div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='ography']"
                role="error">
                In person articles, section and ography div's should not be siblings
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='section']">
            <report test="following-sibling::tei:div[@type='ography']"
                role="error">
                In famliy articles, section and ography div's should not be siblings
            </report>
            <report test="preceding-sibling::tei:div[@type='ography']"
                role="error">
                In family articles, section and ography div's should not be siblings
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='person']//tei:div[@type='section']">
            <report test="parent::tei:body"
                role="warning">
                In a person article, div@type="section" should only be used as a child of another div
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='family']//tei:div[@type='section']">
            <report test="parent::tei:body"
                role="warning">
                In a family article, div@type="section" should only be used as a child of another div
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='ography']">
            <report test="tei:head[contains(., 'diskographie')]/following-sibling::tei:list//tei:title"
                role="warning">
                Discopgraphies should not be fully tagged in this way.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='works']">
            <report test="tei:head[contains(., 'diskographie')]"
                role="warning">
                div's with "diskographie" in the heading should be @type="ography"
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
        <rule context="tei:text[@type='person']//tei:div[@type='works']">
            <report test="preceding::tei:div[@type='criticism']"
                role="warning">
                In a person article, works div's should appear before criticism div's
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text[@type='person']//tei:div[@type='ography']">
            <report test="following::tei:div[@type='criticism'] and
                not(tei:head[contains(., 'diskographie')])"
                role="warning">
                In a person article, ography div's should appear after criticism div's (discographies are an exception)
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='person']//tei:div[@type='works']">
            <report test="preceding-sibling::tei:div[@type='criticism']"
                role="warning">
                In a person section, works div's should appear before criticism div's
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='person']//tei:div[@type='ography']">
            <report test="following-sibling::tei:div[@type='criticism']"
                role="warning">
                In a person section, ography div's should appear after criticism div's
            </report>
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
    <pattern>
        <rule context=".">
            <report test="tei:div[@type='one-section']"
                role="error">
                div@type="one-section" should not be used in the Personenteil
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:p//tei:rilmPerson[position()>1]">
            <report test="."
                role="warning">
                rilmPerson not positioned at the very start of a div@type="bio" should not be fully tagged in this way.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:p[position()>1]//tei:rilmPerson">
            <report test="."
                role="warning">
                rilmPerson not positioned at the very start of a div@type="bio" should not be fully tagged in this way.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='criticism']|tei:div[@type='works']|tei:div[@type='ography']|tei:div[@type='authors']">
            <report test="descendant::tei:rilmPerson">
                &lt;rilmPerson> should only appear in div@type="bio" and div@type="heading"
            </report>
        </rule>
    </pattern>
</schema>