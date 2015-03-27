# Mapping Resources for PDF

These mapping resources are used to derive content from PDF (*Portable Document Format*) files that include CJK (Chinese, Japanese, and Korean) information. These mapping resources are in use by Adobe Reader, Adobe Acrobat (Pro and Standard), and Acrobat Distiller. (Note that these are soon to be part of the Adobe Document Cloud family.) These mapping resources are also useful for third-party PDF clients, thus the need for this open source project.

## Contents

This project includes the following mapping resources for PDF, divided into two categories, ToUnicode and everything else:

*mappingresources4pdf_2unicode.zip*: ToUnicode Mapping Resources (for Adobe-GB1, Adobe-CNS1, Adobe-Japan1, and Adobe-Korea1)  
*mappingresources4pdf_other.zip*: All Other Mapping Resources

The reason to separate the ToUnicode mapping resources from the other mapping resources is related to the static nature of the other mapping mapping resources. The ToUnicode mapping resources are subject to change when a new Supplement is defined, or when a new version of Unicode triggers additional mappings in CMap resources that in turn influence these mapping resources.

## Mapping Resources for PDF Versus CMap Resources

Mapping resources for PDF should not be confused with CMap resources. While both types of resources share the same file structure and syntax, they have very different functions. CMap resources unidirectionally map character codes, such as Unicode, to CIDs (*Character IDs*). Mapping resources for PDF have a variety of functions, such as mapping CIDs to character codes, or mapping character codes to other character codes.

## Getting Involved

Send suggestions for changes to the Mapping Resources for PDF project maintainer, [Dr. Ken Lunde](mailto:lunde@adobe.com?subject=[GitHub] Mapping Resources for PDF), for consideration.
