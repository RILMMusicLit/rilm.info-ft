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
            <assert test="@type='person' or
                @type = 'matter'">
                This text has the wrong type attribute.
            </assert>
        </rule>
    </pattern>
</schema>