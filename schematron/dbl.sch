<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">   
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <pattern>
        <rule context="tei:text">
           <assert test="@type = 'matter' or
               @type='person' or
               @type='topic'">
               This document has the wrong topic type.
           </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:div[@type='ography']">
            <report test="lower-case(head)='literatur'">
                Is this an ography?
            </report>
                
        </rule>
    </pattern>
    
</schema>