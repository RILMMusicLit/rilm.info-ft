<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
        <rule context="tei:text">
            <assert test="count(tei:div[@type='heading'] >= 1)">
                Document does not have a heading div.
            </assert>
            <assert test="count(tei:div[@type='body'] >= 1)">
                Document does not have a body div.
            </assert>
            <assert test="count(tei:div[@type='ography'] >= 1)">
                Document does not have a ography div.
            </assert>
        </rule>
    </pattern>
    <!--<pattern>
        <rule context="tei:text[@type='person']">
            <assert test="descendant::tei:div[@type='heading']/tei:rilmPerson">
                The heading div does not contain a rilmPerson.
            </assert>
        </rule>
    </pattern>-->
    <pattern>
        <rule context="tei:item">
            <report test="child::tei:bibl[2]">
                There are two bibl's in this item.
            </report>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:item/text()">
            <report test="contains(., '&#x3b;')">
                This semi-colon should probably be removed and replaced by an item break.
            </report>
        </rule>
    </pattern>
</schema>