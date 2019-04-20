"DEMO for
				SAMPLER
	(c) Copyright 1984 Infocom, Inc.  All Rights Reserved."

<GC 0 T 5>

<BLOAT 70000 0 0 2700 0 0 0 0 0 256>

<SET REDEFINE T>

;<GLOBAL BIGFIX 10000>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<DEFINE IFILE (STR "OPTIONAL" (FLOAD? <>) "AUX" (TIM <TIME>))
	<INSERT-FILE .STR .FLOAD?>>

<PRINC "Sampler ZORK I: The Great Underground Empire
">

<OR <GASSIGNED? INSERT-CRUFTY>
    <DEFINE INSERT-CRUFTY (STR) <INSERT-FILE .STR T>>>

<COND (<GASSIGNED? PREDGEN>
       <ID 0>)>

<IFILE "MISC" T>
<IFILE "SYNTAX" T>
<IFILE "DUNGEON" T>
<IFILE "GLOBALS" T>
<IFILE "PARSER" T>
<IFILE "VERBS" T>
<IFILE "ACTIONS" T>
<IFILE "TUTORIAL" T>
<IFILE "PLANETFALL" T>
<IFILE "INFIDEL" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
<PROPDEF VALUE 0>
<PROPDEF TVALUE 0>

<GC 0 T>

<DEFINE CNT (STR OBL)
	<PRINC .STR>
	<PRIN1 <MAPF ,+ ,LENGTH .OBL>>
	<CRLF>>

<COND (<NOT <GASSIGNED? PREDGEN>>
       <GC-MON T>)>