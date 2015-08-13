<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
        <rule context="tei:item">
            <report test="child::tei:bibl[2]">
                There are two bibl's in this item.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:text">
            <assert test="descendant::tei:div[@type='heading']">
                This document is missing a heading div.
            </assert>
            <assert test="descendant::tei:div[@type='body']">
                This document is missing a body div.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:TEI">
        <assert test="tei:text[@type='institution'] or
            tei:text[@type='person'] or
            tei:text[@type='matter'] or
            tei:text[@type='generic'] or 
            tei:text[@type='group']">
            This text has a type value that is not allowed.
        </assert>
        </rule>
    </pattern>
</schema>