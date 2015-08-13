<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <title>RILM Encyclopedias Collection Schematron 1.0.0</title>
    <pattern>
        <rule context="tei:nameLink">              
            <assert test="normalize-space(lower-case(.)) = 'von' or
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
                normalize-space(lower-case(.)) = 'père'
                ">
                Wrong content in genName.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text//text()">
            <report test="contains(., '&#x201d;')">
                There is a right double quotation mark (U+201D) here!
            </report>
            <report test="contains(., '&#x201f;')">
                There is an inverted right double quotation mark (U+201F) here!
            </report>
            <report test="contains(., '&#x201b;')">
                There is a right single quotation mark (U+201B) here!
            </report>
            <report test="contains(., '&#x201c;')">
                There is a left double quotation mark (U+201C) here!
            </report>
            <report test="contains(., '&#x201e;')">
                There is an inverted left double quotation mark (U+201E) here!
            </report>
            <report test="contains(., '&#x201a;')">
                There is a left single quotation mark (U+201A) here!
            </report>
            <report test="contains(., '&#x00ab;')">
                There is a double quotation mark (U+00AB) here!
            </report>
            <report test="contains(., '&#x00bb;')">
                There is a double quotation mark (U+00BB) here!
            </report>
            <report test="contains(., '&#x2039;')">
                There is a single quotation mark here!
            </report>
            <report test="contains(., '&#x203a;')">
                There is a single quotation mark (U+203A) here!
            </report>
            <assert test=". = normalize-unicode(., 'NFC')">
                Content is not unicode-normalized.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:list">              
            <assert test="count(tei:head) = 0">
                The head element is in the wrong place!
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:surname|tei:forename">
            <assert test="count(tei:nameLink) = 0">
                nameLink should not be a child of surname or forename.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:abbr">
            <report test= ". = 'd. J.' or
                . = 'd. Ä' or
                normalize-space(.) = 'd. J.' or
                normalize-space(.) = 'd. Ä.' or
                normalize-space(lower-case(.)) = 'jr.' or
                normalize-space(lower-case(.)) = 'sr.' or
                normalize-space(.) = 'I' or
                normalize-space(.) = 'II' or
                normalize-space(.) = 'III' or
                normalize-space(.) = 'IV' or
                normalize-space(lower-case(.)) = 'sen.' or
                normalize-space(lower-case(.)) = 'jun.'
                ">
                Wrong contents in abbr.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div|tei:p|tei:rilmPerson|tei:bibl">
            <report test="ancestor::tei:text and not(@xml:id)">
                ID attribute is not present.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="text()">
            <report test="matches(., '[&#x80;-&#xa0;]')">
                Characters in this range should not be used.
            </report>
            <report test="matches(., '&#xfffd;')">
                The U+fffd character should not be used.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:date">
            <report test="matches(.,'^\d{1}$')">
                This looks like it has the wrong number of digits to be a year.
            </report>
            <report test="matches(.,'^\d{2}$')">
                This looks like it has the wrong number of digits to be a year.
            </report>
            <report test="matches(.,'^\d{5}$')">
                This looks like it has the wrong number of digits to be a year.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='contents']">
            <assert test="parent::tei:div[@type='heading']">
                div@type="contents" should be a child of div@type="heading"
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='body']">
            <report test="descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='ref']">
                div@type="body" should not contain "works", "ography", or "ref" divs
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='ography']">
            <report test="descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='ref']">
                div@type="ography" should not contain "works", "ography", or "ref" divs
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='works']">
            <report test="descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='ref']">
                div@type="works" should not contain "works", "ography", or "ref" divs
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='ref']">
            <report test="descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='ref']">
                div@type="ref" should not contain "works", "ography", or "ref" divs
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='authors']">
            <report test="descendant::tei:div[@type='works'] or
                descendant::tei:div[@type='ography'] or
                descendant::tei:div[@type='ref'] or
                descendant::tei:div[@type='authors']">
                div@type="authors" should not contain "works", "ography", or "ref" divs
            </report>
        </rule>
    </pattern>
</schema>