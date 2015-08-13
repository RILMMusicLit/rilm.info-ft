<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
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
    </pattern>
</schema>