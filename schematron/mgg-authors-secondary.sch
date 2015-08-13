<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
        <rule context="tei:bibl//tei:author[not(@rend)][not(@subtype)]"> 
            <report test="preceding-sibling::tei:title" role="information" >
                Please make sure this author element should really be in smallcaps.  If not, please add @subtype="secondary".
            </report>
        </rule>
    </pattern>
    
</schema>