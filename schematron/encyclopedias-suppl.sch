<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
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
</schema>