"RECORD for
			    The Lurking Horror
	(c) Copyright 1986 Infocom, Inc. All Rights Reserved."

<SYNTAX \#RANDOM OBJECT = V-$RANDOM>
<SYNTAX \#COMMAND = V-$COMMAND>
<SYNTAX \#RECORD = V-$RECORD>
<SYNTAX \#UNRECORD = V-$UNRECORD>

<ROUTINE V-$COMMAND ()
	 <DIRIN 1>
	 <RTRUE>>

<ROUTINE V-$RANDOM ()
	 <COND (<NOT <PRSO? ,INTNUM>>
		<TELL "Illegal call to #RANDOM." CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<CONSTANT D-RECORD-ON 4>
<CONSTANT D-RECORD-OFF -4>

<ROUTINE V-$RECORD ()
	 <DIROUT ,D-RECORD-ON> ;"all READS and INPUTS get sent to command file"
	 <RTRUE>>

<ROUTINE V-$UNRECORD ()
	 <DIROUT ,D-RECORD-OFF>
	 <RTRUE>>
