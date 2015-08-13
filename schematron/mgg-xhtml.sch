<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.w3.org/1999/xhtml" prefix="html"/>
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
</schema>