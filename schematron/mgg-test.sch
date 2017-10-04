<?xml version="1.0" encoding="UTF-8"?>
    <schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
        <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
       <!-- <pattern>
            <rule context="//tei:div[@type='section']|tei:div[@type='bio']| tei:div[@type='works']|tei:div[@type='ography']|tei:div[@type='person'] / tei:list[1]|tei:table[1]|tei:p[1]">
                <assert test="following-sibling::tei:div[@type='authors']"
                    role="error">
                    This section looks to be missing an authors section.
                </assert>
            </rule>
        </pattern>-->

        <!--<pattern>
            <rule context="//text()">
                <report test="matches(., '&#x002B;')"
                    role="error">
                    The U+fffd character should not be used.
                </report>
            </rule>
        </pattern>-->
       <!--     -->
        <pattern>
            <rule context="tei:quote[preceding-sibling::node()[1]]">
                <report test="contains(., '&#x201d;')"
                    role="information">
                    There is a quote symbol directly before a quote element.
                </report>
            </rule>
        </pattern>
    </schema>