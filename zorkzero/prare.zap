
	.SEGMENT "0"


	.FUNCT	TOO-MANY-NEW,WHAT
	PRINTI	"[Warning: there are too many new "
	PRINT	WHAT
	PRINTR	"s.]"


	.FUNCT	NAKED-OOPS
	PRINTR	"[Please type a word(s) after OOPS.]"


	.FUNCT	CANT-OOPS
	PRINTR	"[There was no word to replace in that sentence.]"


	.FUNCT	CANT-AGAIN
	PRINTR	"[What do you want to do again?]"


	.FUNCT	CANT-USE-MULTIPLE,LOSS,WD
	SET	'CLOCK-WAIT,TRUE-VALUE
	PRINTI	"[You can't use more than one object at a time with """
	ICALL2	PRINT-VOCAB-WORD,WD
	PRINTR	"""!]"


	.FUNCT	MAKE-ROOM-FOR-TOKENS,CNT,LEXV,WHERE,LEN,?TMP2,?TMP1
	GETB	LEXV,0
	MUL	2,STACK >LEN
	MUL	P-LEXELEN,CNT
	ADD	WHERE,STACK
	LESS?	LEN,STACK \?CND1
	SUB	LEN,WHERE
	DIV	STACK,P-LEXELEN >CNT
	ICALL2	TOO-MANY-NEW,STR?23
?CND1:	GETB	LEXV,P-LEXWORDS >LEN
	ADD	CNT,LEN
	PUTB	LEXV,P-LEXWORDS,STACK
	MUL	2,WHERE
	ADD	LEXV,STACK >LEXV
	MUL	CNT,4
	ADD	LEXV,STACK >?TMP1
	MUL	2,LEN >?TMP2
	SUB	WHERE,P-LEXSTART
	SUB	?TMP2,STACK
	MUL	2,STACK
	COPYT	LEXV,?TMP1,STACK
	RTRUE	


	.FUNCT	REPLACE-ONE-TOKEN,N,FROM-LEXV,PTR,TO-LEXV,WHERE,CNT,X,?TMP1,?TMP2
	SUB	N,1 >CNT
	ZERO?	CNT /?CND1
	ICALL	MAKE-ROOM-FOR-TOKENS,CNT,TO-LEXV,WHERE
?CND1:	SET	'CNT,N
?PRG3:	DLESS?	'CNT,0 /TRUE
	ADD	PTR,P-LEXELEN >PTR
	GET	FROM-LEXV,PTR
	PUT	TO-LEXV,WHERE,STACK
	MUL	PTR,P-LEXELEN
	ADD	STACK,2 >X
	GETB	FROM-LEXV,X >?TMP2
	ADD	X,1
	GETB	FROM-LEXV,STACK >?TMP1
	MUL	WHERE,P-LEXELEN
	ADD	STACK,3
	CALL	INBUF-ADD,?TMP2,?TMP1,STACK
	ZERO?	STACK \?CND7
	ICALL2	TOO-MANY-NEW,STR?24
	RTRUE	
?CND7:	ADD	WHERE,P-LEXELEN >WHERE
	JUMP	?PRG3


	.FUNCT	PRINT-LEXV,QUIET,X,LEN,WD,IN-QUOTE,OWD
	ASSIGNED?	'X /?CND1
	MUL	QUIET,4
	ADD	TLEXV,STACK >X
?CND1:	ASSIGNED?	'LEN /?CND3
	SUB	P-LEN,QUIET >LEN
?CND3:	ZERO?	QUIET /?CCL6
	GRTR?	0,P-OFLAG \?CND5
?CCL6:	PRINTI	"[In other words:"
?CND5:	SET	'IN-QUOTE,FALSE-VALUE
	EQUAL?	QUIET,-1 \?CCL11
	SET	'OWD,W?APOSTROPHE
	JUMP	?PRG12
?CCL11:	SET	'OWD,0
?PRG12:	GET	X,0 >WD
	EQUAL?	WD,W?PERIOD,W?COMMA,W?APOSTROPHE /?CND14
	EQUAL?	WD,W?NO.WORD /?CND14
	EQUAL?	OWD,W?APOSTROPHE /?CND14
	EQUAL?	OWD,W?QUOTE \?CCL22
	ZERO?	IN-QUOTE \?CCL22
	SET	'IN-QUOTE,TRUE-VALUE
	JUMP	?CND14
?CCL22:	EQUAL?	WD,W?QUOTE \?CCL26
	ZERO?	IN-QUOTE /?CCL26
	SET	'IN-QUOTE,FALSE-VALUE
	JUMP	?CND14
?CCL26:	PRINTC	32
?CND14:	EQUAL?	WD,W?NO.WORD /?CND29
	EQUAL?	WD,0,W?INT.NUM,W?INT.TIM /?CCL33
	ICALL2	PRINT-VOCAB-WORD,WD
	JUMP	?CND29
?CCL33:	ADD	X,P-WORDLEN
	ICALL	BUFFER-PRINT,X,STACK,FALSE-VALUE,TRUE-VALUE
?CND29:	DLESS?	'LEN,1 /?REP13
	EQUAL?	WD,W?NO.WORD /?CND36
	SET	'OWD,WD
?CND36:	ADD	X,4 >X
	JUMP	?PRG12
?REP13:	ZERO?	QUIET /?CCL40
	GRTR?	0,P-OFLAG \FALSE
?CCL40:	PRINTR	"]"


	.FUNCT	COPY-INPUT,QUIET,LEN,?TMP1
	COPYT	G-LEXV,P-LEXV,LEXV-LENGTH-BYTES
	GETB	P-LEXV,P-LEXWORDS >P-LEN
	GET	OOPS-TABLE,O-START >TLEXV
	COPYT	G-INBUF,P-INBUF,61
	GETB	P-LEXV,P-LEXWORDS
	MUL	4,STACK >LEN
	DEC	'LEN
	GETB	TLEXV,LEN >?TMP1
	DEC	'LEN
	GETB	TLEXV,LEN
	ADD	?TMP1,STACK
	PUT	OOPS-TABLE,O-END,STACK
	ZERO?	QUIET \?CND1
	ICALL2	PRINT-LEXV,QUIET
?CND1:	SET	'P-OFLAG,FALSE-VALUE
	RETURN	P-OFLAG

	.ENDSEG

	.SEGMENT "HINTS"


	.FUNCT	V-$NUDGE
	SET	'CLOCK-WAIT,TRUE-VALUE
	PUT	TLEXV,0,W?SHOULD
	PRINTC	91
	CALL1	TELL-SAMPLE-COMMANDS
	RSTACK	


	.FUNCT	COUNT-ERRORS,NUM,THRESH
	ASSIGNED?	'NUM /?CND1
	SET	'NUM,1
?CND1:	FSET?	GREAT-HALL,TOUCHBIT \?CCL5
	SET	'THRESH,10
	JUMP	?CND3
?CCL5:	SET	'THRESH,2
?CND3:	ADD	NUM,P-ERRS >P-ERRS
	GRTR?	P-ERRS,THRESH \FALSE
	SET	'P-ERRS,0
	PRINTI	"[I'm having trouble understanding you. Maybe it's because you're not used to the rules for commands. "
	FSET?	GREAT-HALL,TOUCHBIT /?CCL11
	ZERO?	PROLOGUE-NOVICE-COUNTER /?CCL11
	PRINTI	"Here's the command you should type now:
	"
	GET	NOVICE-MOVES,PROLOGUE-NOVICE-COUNTER
	PRINT	STACK
	PRINTR	"
Please try that.]"
?CCL11:	CALL1	TELL-SAMPLE-COMMANDS
	RSTACK	


	.FUNCT	FIND-UEXIT-STR,P
?PRG1:	NEXTP	HERE,P >P
	LESS?	P,LOW-DIRECTION /FALSE
	GETPT	HERE,P
	PTSIZE	STACK
	EQUAL?	STACK,UEXIT \?PRG1
	CALL2	DIR-TO-STRING,P
	RSTACK	


	.FUNCT	TELL-SAMPLE-COMMANDS,VERB,SYN,OBJ,NUM,CT,N
	PRINTI	" Commands tell the computer what you want to do in the story. Here are some commands that you can type right now, although they may or may not be useful:
"
	GET	SAMPLE-COMMANDS-TABLE-0,0 >CT
	ZERO?	PRSO /?CCL3
	SET	'N,CT
	JUMP	?PRG4
?CCL3:	SET	'N,TELL-SAMPLE-COMMANDS-NUMBER
?PRG4:	ZERO?	PRSO /?CCL8
	PUSH	N
	JUMP	?CND6
?CCL8:	RANDOM	CT
?CND6:	GET	SAMPLE-COMMANDS-TABLE-0,STACK >VERB
	DLESS?	'N,0 /?REP5
	EQUAL?	VERB,W?GO \?CCL12
	CALL1	FIND-UEXIT-STR >OBJ
	ZERO?	OBJ /?PRG4
?CCL12:	INC	'NUM
	PRINTC	9
	ICALL2	PRINT-VOCAB-WORD,VERB
	ZERO?	OBJ /?CND15
	PRINTC	32
	PRINT	OBJ
?CND15:	CRLF	
	ZERO?	PRSO \?PRG4
?REP5:	GET	SAMPLE-COMMANDS-TABLE-1,0 >CT
	ZERO?	PRSO /?CCL21
	SET	'N,CT
	JUMP	?PRG22
?CCL21:	SET	'N,TELL-SAMPLE-COMMANDS-NUMBER
?PRG22:	ZERO?	PRSO /?CCL26
	PUSH	N
	JUMP	?CND24
?CCL26:	RANDOM	CT
?CND24:	GET	SAMPLE-COMMANDS-TABLE-1,STACK >VERB
	DLESS?	'N,0 /?REP23
	GET	VERB,3
	GET	STACK,2 >SYN
	ZERO?	SYN /?PRG22
	CALL	GET-SYNTAX,SYN,1,0,TRUE-VALUE
	ZERO?	STACK /?PRG22
	CALL	DETERMINE-OBJ,FALSE-VALUE,1,TRUE-VALUE >OBJ
	ZERO?	OBJ /?PRG22
	GET	OBJ,3 >OBJ
	ZERO?	OBJ /?PRG22
	INC	'NUM
	PRINTC	9
	ICALL2	PRINT-VOCAB-WORD,VERB
	PRINTC	32
	ICALL2	DPRINT,OBJ
	CRLF	
	ZERO?	PRSO \?PRG22
?REP23:	GET	SAMPLE-COMMANDS-TABLE-2,0
	DIV	STACK,2 >CT
	ZERO?	PRSO /?CCL39
	SET	'N,CT
	JUMP	?PRG40
?CCL39:	SET	'N,TELL-SAMPLE-COMMANDS-NUMBER
?PRG40:	ZERO?	N /?REP41
	ZERO?	PRSO /?CCL46
	PUSH	N
	JUMP	?CND44
?CCL46:	RANDOM	CT
?CND44:	MUL	STACK,2
	SUB	STACK,1 >VERB
	GET	SAMPLE-COMMANDS-TABLE-2,VERB >SYN
	GETB	SYN,8
	BTST	STACK,128 /?CCL51
	GETB	SYN,8
	JUMP	?CND49
?CCL51:	GETB	SYN,8
	BAND	STACK,127
	SHIFT	STACK,7
?CND49:	ZERO?	STACK \?CND47
	GET	SYN,3 >SYN
?CND47:	DLESS?	'N,0 /?REP41
	GET	SYN,3
	GET	STACK,3 >SYN
	ZERO?	SYN /?PRG40
	ADD	1,VERB
	GET	SAMPLE-COMMANDS-TABLE-2,STACK
	PUT	PARSE-RESULT,8,STACK
	CALL	GET-SYNTAX,SYN,2,0,TRUE-VALUE
	ZERO?	STACK /?PRG40
	CALL	DETERMINE-OBJ,FALSE-VALUE,1,TRUE-VALUE >OBJ
	ZERO?	OBJ /?PRG40
	GET	OBJ,3 >OBJ
	ZERO?	OBJ /?PRG40
	CALL	DETERMINE-OBJ,FALSE-VALUE,2,TRUE-VALUE >SYN
	ZERO?	SYN /?PRG40
	GET	SYN,3 >SYN
	ZERO?	SYN /?PRG40
	INC	'NUM
	PRINTC	9
	GET	SAMPLE-COMMANDS-TABLE-2,VERB
	ICALL2	PRINT-VOCAB-WORD,STACK
	PRINTC	32
	ICALL2	DPRINT,OBJ
	PRINTC	32
	ADD	1,VERB
	GET	SAMPLE-COMMANDS-TABLE-2,STACK
	ICALL2	PRINT-VOCAB-WORD,STACK
	PRINTC	32
	ICALL2	DPRINT,SYN
	CRLF	
	ZERO?	PRSO \?PRG40
?REP41:	ZERO?	P-WON \?CCL66
	RANDOM	2
	EQUAL?	STACK,1 \?CND65
?CCL66:	PRINTI	"	say """
	GETB	VOCAB,0
	ADD	1,STACK
	ADD	VOCAB,STACK >SYN
	GETB	SYN,0 >CT
?PRG69:	ADD	SYN,1
	GET	STACK,0
	RANDOM	STACK
	SUB	STACK,1
	MUL	CT,STACK
	ADD	3,STACK
	ADD	SYN,STACK >N
	LESS?	N,W?A /?PRG69
	GETB	N,8
	BTST	STACK,128 /?CCL78
	GETB	N,8
	JUMP	?CND76
?CCL78:	GETB	N,8
	BAND	STACK,127
	SHIFT	STACK,7
?CND76:	ZERO?	STACK /?PRG69
	EQUAL?	N,W?END.OF.INPUT,W?NO.WORD,W?INT.NUM /?PRG69
	EQUAL?	N,W?INT.TIM /?PRG69
	ICALL2	PRINT-VOCAB-WORD,N
	PRINTI	"""
"
?CND65:	IN?	JESTER,HERE \?CND81
	PRINTI	"	jester, give me the key
"
?CND81:	PRINTR	"Now you can try again.]"

	.ENDSEG

	.SEGMENT "0"


	.FUNCT	BUFFER-PRINT,BEG,END,CP,NOSP,WRD,NW,FIRST??,PN,TMP
	SET	'FIRST??,TRUE-VALUE
?PRG1:	EQUAL?	BEG,END /TRUE
	ZERO?	NOSP \?CTR6
	EQUAL?	NW,W?PERIOD,W?COMMA,W?APOSTROPHE \?CCL7
?CTR6:	SET	'NOSP,FALSE-VALUE
	JUMP	?CND5
?CCL7:	PRINTC	32
?CND5:	GET	BEG,0 >WRD
	ADD	BEG,P-WORDLEN
	EQUAL?	END,STACK \?CCL12
	SET	'NW,0
	JUMP	?CND10
?CCL12:	GET	BEG,P-LEXELEN >NW
?CND10:	EQUAL?	WRD,W?NO.WORD \?CCL15
	SET	'NOSP,TRUE-VALUE
	JUMP	?CND13
?CCL15:	EQUAL?	WRD,W?MY \?CCL17
	PRINTB	W?YOUR
	JUMP	?CND13
?CCL17:	EQUAL?	WRD,W?ME \?CCL19
	PRINTB	W?YOU
	SET	'PN,TRUE-VALUE
	JUMP	?CND13
?CCL19:	EQUAL?	WRD,W?ONE \?CCL21
	PRINTI	"object"
	JUMP	?CND13
?CCL21:	EQUAL?	WRD,FALSE-VALUE,W?ALL,W?PERIOD /?CCL23
	GETB	WRD,8
	BTST	STACK,128 /?CCL32
	GETB	WRD,8 >TMP
	JUMP	?CND30
?CCL32:	GETB	WRD,8
	BAND	STACK,127
	SHIFT	STACK,7 >TMP
?CND30:	ZERO?	TMP \?CCL23
	GET	WRD,3
	ZERO?	STACK \?CCL23
	BTST	TMP,4 /?CCL23
	BTST	TMP,2 /?CCL23
	SET	'NOSP,TRUE-VALUE
	JUMP	?CND13
?CCL23:	CALL2	CAPITAL-NOUN?,WRD
	ZERO?	STACK /?CCL35
	ICALL2	CAPITALIZE,BEG
	SET	'PN,TRUE-VALUE
	JUMP	?CND13
?CCL35:	ZERO?	FIRST?? /?CND36
	ZERO?	PN \?CND36
	ZERO?	CP /?CND36
	EQUAL?	WRD,W?HER,W?HIM,W?YOUR /?CND36
	PRINTI	"the "
?CND36:	EQUAL?	WRD,W?IT \?CCL45
	CALL2	VISIBLE?,P-IT-OBJECT
	ZERO?	STACK /?CCL45
	ICALL2	DPRINT,P-IT-OBJECT
	JUMP	?CND43
?CCL45:	EQUAL?	WRD,W?HER \?CCL49
	ZERO?	PN \?CCL49
	ICALL2	DPRINT,P-HER-OBJECT
	JUMP	?CND43
?CCL49:	EQUAL?	WRD,W?HIM \?CCL53
	ZERO?	PN \?CCL53
	ICALL2	DPRINT,P-HIM-OBJECT
	JUMP	?CND43
?CCL53:	EQUAL?	WRD,W?INT.NUM,W?INT.TIM \?CCL57
	GET	BEG,1
	PRINTN	STACK
	JUMP	?CND43
?CCL57:	ICALL2	WORD-PRINT,BEG
?CND43:	SET	'FIRST??,FALSE-VALUE
?CND13:	ADD	BEG,P-WORDLEN >BEG
	JUMP	?PRG1


	.FUNCT	CAPITALIZE,PTR,?TMP1
	GETB	PTR,3
	GETB	P-INBUF,STACK
	SUB	STACK,32
	PRINTC	STACK
	GETB	PTR,2
	SUB	STACK,1 >?TMP1
	GETB	PTR,3
	ADD	STACK,1
	CALL	WORD-PRINT,PTR,?TMP1,STACK
	RSTACK	


	.FUNCT	PRINT-PARSER-FAILURE,CLASS,OTHER,OTHER2,TMP,PR,N,X,?TMP1
	GET	ERROR-ARGS,1 >CLASS
	GET	ERROR-ARGS,2 >OTHER
	GET	ERROR-ARGS,3 >OTHER2
	EQUAL?	CLASS,PARSER-ERROR-ORPH-S \?CCL3
	GET	ORPHAN-S,O-LEXPTR
	SUB	STACK,P-LEXV
	DIV	STACK,2 >P-OFLAG
	COPYT	G-LEXV,O-LEXV,LEXV-LENGTH-BYTES
	COPYT	G-INBUF,O-INBUF,61
	GET	OOPS-TABLE,O-START
	PUT	OOPS-TABLE,O-AGAIN,STACK
	ICALL	MAKE-ROOM-FOR-TOKENS,1,O-LEXV,P-OFLAG
	PUT	O-LEXV,P-OFLAG,W?NO.WORD
	PRINTI	"[Wh"
	GET	ORPHAN-S,O-VERB
	CALL	DIR-VERB-WORD?,STACK
	ZERO?	STACK /?CCL8
	PRINTI	"ere"
	JUMP	?CND6
?CCL8:	GET	ORPHAN-S,O-WHICH
	EQUAL?	STACK,1 \?CCL13
	GET	ORPHAN-S,O-SYNTAX
	GETB	STACK,4
	JUMP	?CND11
?CCL13:	GET	ORPHAN-S,O-SYNTAX
	GETB	STACK,8
?CND11:	EQUAL?	PERSONBIT,STACK \?CCL10
	PRINTI	"om"
	JUMP	?CND6
?CCL10:	PRINTI	"at"
?CND6:	PRINTC	32
	GET	ORPHAN-S,O-SUBJECT >PR
	ZERO?	PR /?CCL16
	GET	ORPHAN-S,O-VERB >TMP
	ADD	WORD-FLAG-TABLE,2 >?TMP1
	GET	WORD-FLAG-TABLE,0
	INTBL?	TMP,?TMP1,STACK,132 >X \?CCL21
	GET	X,1
	JUMP	?CND19
?CCL21:	PUSH	FALSE-VALUE
?CND19:	BTST	STACK,512 \?CCL16
	PRINTI	"did "
	ICALL2	TELL-THE,PR
	PRINTC	32
	JUMP	?CND14
?CCL16:	PRINTI	"do you want "
	EQUAL?	WINNER,PLAYER /?CND22
	ICALL2	DPRINT,WINNER
	PRINTC	32
?CND22:	PRINTI	"to "
?CND14:	GET	ORPHAN-S,O-VERB
	CALL2	ROOT-VERB,STACK
	ICALL2	PRINT-VOCAB-WORD,STACK
	GET	ORPHAN-S,O-PART >TMP
	EQUAL?	TMP,0,1 /?CND24
	PRINTC	32
	ICALL2	PRINT-VOCAB-WORD,TMP
?CND24:	GET	ERROR-ARGS,2 >TMP
	ZERO?	TMP /?CND26
	PRINTC	32
	GET	ORPHAN-S,O-OBJECT >PR
	ZERO?	PR /?CCL30
	ICALL2	TELL-THE,PR
	JUMP	?CND28
?CCL30:	ICALL2	NP-PRINT,TMP
?CND28:	GET	ORPHAN-S,O-SYNTAX >TMP
	ZERO?	TMP /?CND26
	GET	ORPHAN-S,O-WHICH
	EQUAL?	STACK,1 \?CCL35
	GET	TMP,1 >TMP
	JUMP	?CND33
?CCL35:	GET	TMP,3 >TMP
?CND33:	ZERO?	TMP /?CND26
	GETB	O-LEXV,P-LEXWORDS >N
	SUB	P-OFLAG,P-LEXELEN
	GET	O-LEXV,STACK >PR
	GETB	PR,8
	BTST	STACK,128 /?CCL42
	GETB	PR,8
	JUMP	?CND40
?CCL42:	GETB	PR,8
	BAND	STACK,127
	SHIFT	STACK,7
?CND40:	ZERO?	STACK \?CND38
	GET	PR,3 >PR
?CND38:	EQUAL?	TMP,PR /?CND43
	INC	'N
	PUTB	O-LEXV,P-LEXWORDS,N
	PUT	O-LEXV,P-OFLAG,TMP
	ADD	P-OFLAG,P-LEXELEN >P-OFLAG
?CND43:	PUT	O-LEXV,P-OFLAG,W?NO.WORD
	MUL	P-WORDLEN,N
	ADD	1,STACK
	ICALL	INBUF-PRINT,TMP,O-INBUF,O-LEXV,STACK
	PRINTC	32
	ICALL2	PRINT-VOCAB-WORD,TMP
?CND26:	PRINTR	"?]"
?CCL3:	EQUAL?	CLASS,PARSER-ERROR-ORPH-NP \?CND1
	SET	'X,OTHER
	GET	X,8 >N
	GET	X,2 >PR
?PRG46:	GET	N,0
	EQUAL?	PR,STACK \?CCL50
	SUB	N,P-LEXV
	DIV	STACK,2 >P-OFLAG
	COPYT	G-LEXV,O-LEXV,LEXV-LENGTH-BYTES
	COPYT	G-INBUF,O-INBUF,61
	GET	OOPS-TABLE,O-START
	PUT	OOPS-TABLE,O-AGAIN,STACK
	ICALL2	WHICH-PRINT,X
	RTRUE	
?CCL50:	SUB	N,4 >N
	GRTR?	P-LEXV,N \?PRG46
?CND1:	EQUAL?	CLASS,PARSER-ERROR-NOMULT \?CCL54
	ICALL	CANT-USE-MULTIPLE,OTHER,OTHER2
	RTRUE	
?CCL54:	EQUAL?	CLASS,PARSER-ERROR-NOOBJ \?CCL56
	ICALL	CANT-FIND-OBJECT,OTHER,OTHER2
	RTRUE	
?CCL56:	EQUAL?	CLASS,PARSER-ERROR-TMNOUN \?CCL58
	GET	PARSE-RESULT,1
	ICALL2	TOO-MANY-NOUNS,STACK
	RTRUE	
?CCL58:	SET	'OTHER2,OTLEXV
	ZERO?	P-LEN \?PRD62
	GET	OTHER2,0
	CALL2	NAKED-ADJECTIVE?,STACK
	ZERO?	STACK \?CCL60
?PRD62:	SUB	OTLEXV,4 >OTHER2
	LESS?	P-LEXV,OTHER2 \?CND59
	LESS?	0,P-LEN \?CND59
	GET	OTHER2,0
	CALL2	NAKED-ADJECTIVE?,STACK
	ZERO?	STACK /?CND59
	GET	OTLEXV,0
	CALL	WORD-TYPE?,STACK,P-EOI-CODE,P-COMMA-CODE
	ZERO?	STACK /?CND59
?CCL60:	SUB	OTHER2,P-LEXV
	DIV	STACK,2
	ADD	P-LEXELEN,STACK >CLASS
	ICALL	MAKE-ROOM-FOR-TOKENS,1,P-LEXV,CLASS
	ICALL	MAKE-ROOM-FOR-TOKENS,1,G-LEXV,CLASS
	ADD	OTHER2,4
	ICALL	CHANGE-LEXV,STACK,W?ONE
	GETB	P-LEXV,P-LEXWORDS >P-LEN
	GET	OOPS-TABLE,O-START >TLEXV
	CALL2	PARSE-IT,FALSE-VALUE
	RSTACK	
?CND59:	GRTR?	P-LEN,0 \?CCL71
	SUB	OTLEXV,4 >OTHER2
	CALL2	CHANGE-AND-TO-THEN?,OTHER2
	ZERO?	STACK \?CTR70
	SET	'OTHER2,OTLEXV
	CALL2	CHANGE-AND-TO-THEN?,OTHER2
	ZERO?	STACK /?CCL71
?CTR70:	ICALL	CHANGE-LEXV,OTHER2,W?THEN
	GET	OOPS-TABLE,O-LENGTH >P-LEN
	GET	OOPS-TABLE,O-START >TLEXV
	ICALL1	PRINT-LEXV
	CALL2	PARSE-IT,FALSE-VALUE
	RSTACK	
?CCL71:	CALL1	DONT-UNDERSTAND
	RSTACK	


	.FUNCT	NAKED-ADJECTIVE?,WD
	CALL	WORD-TYPE?,WD,P-ADJ-CODE
	ZERO?	STACK /FALSE
	CALL	WORD-TYPE?,WD,P-DIR-CODE
	ZERO?	STACK \FALSE
	EQUAL?	WD,W?ONE /FALSE
	RTRUE	


	.FUNCT	CHANGE-AND-TO-THEN?,PTR,?TMP1
	GET	PTR,0
	EQUAL?	STACK,W?AND,W?COMMA \FALSE
	ADD	PTR,4 >PTR
	GET	PTR,0
	CALL	WORD-TYPE?,STACK,P-VERB-CODE,P-DIR-CODE >?TMP1
	ZERO?	?TMP1 /?PRD6
	RETURN	?TMP1
?PRD6:	GET	PTR,0
	CALL	WORD-TYPE?,STACK,P-EOI-CODE
	RSTACK	


	.FUNCT	DONT-UNDERSTAND
	SET	'CLOCK-WAIT,TRUE-VALUE
	GETB	P-LEXV,P-LEXWORDS
	EQUAL?	1,STACK \?CND1
	GET	P-LEXV,P-LEXSTART
	CALL	WORD-TYPE?,STACK,P-NOUN-CODE,P-ADJ-CODE
	ZERO?	STACK /?CND1
	ICALL2	MISSING,STR?25
	RTRUE	
?CND1:	CALL2	COUNT-ERRORS,1
	ZERO?	STACK \TRUE
	PRINTR	"[Sorry, but I don't understand. Please say that another way, or try something else.]"


	.FUNCT	MISSING,NV
	PRINTI	"[I think there's a "
	PRINT	NV
	PRINTR	" missing in that sentence!]"


	.FUNCT	CANT-FIND-OBJECT,NP,PART,TMP
	GET	NP,3
	ZERO?	STACK \?CCL3
	CALL2	NP-CANT-SEE,NP
	RSTACK	
?CCL3:	PRINTI	"[There isn't anything to "
	GET	PARSE-RESULT,1 >TMP
	ZERO?	TMP /?CCL6
	ICALL2	PRINT-VOCAB-WORD,TMP
	EQUAL?	PART,0,1 /?CND4
	PRINTC	32
	ICALL2	PRINT-VOCAB-WORD,TMP
	JUMP	?CND4
?CCL6:	PRINTI	"do that to"
?CND4:	PRINTR	"!]"


	.FUNCT	NP-CANT-SEE,NP,TMP
	ASSIGNED?	'NP /?CND1
	CALL1	GET-NP >NP
?CND1:	GET	NP,2 >TMP
	ZERO?	TMP /?CCL5
	PRINTC	91
	ICALL2	TELL-CTHE,WINNER
	PRINTI	" can't see "
	CALL2	CAPITAL-NOUN?,TMP
	ZERO?	STACK \?CTR7
	GET	NP,1 >TMP
	ZERO?	TMP /?CCL8
	GET	TMP,2
	ZERO?	STACK /?CCL8
?CTR7:	ICALL	NP-PRINT,NP,TRUE-VALUE
	JUMP	?CND6
?CCL8:	PRINTI	"any "
	ICALL2	NP-PRINT,NP
?CND6:	PRINTC	32
	GET	NP,5 >TMP
	ZERO?	TMP /?CCL15
	GETB	TMP,1
	EQUAL?	STACK,4 \?PRD19
	PRINTI	"in"
	JUMP	?CTR14
?PRD19:	GETB	TMP,1
	EQUAL?	STACK,6 \?CCL15
	GET	TMP,2 >TMP
	ZERO?	TMP /?CCL15
	GET	TMP,1
	CALL2	PRINT-VOCAB-WORD,STACK
	ZERO?	STACK /?CCL15
?CTR14:	PRINTC	32
	GET	TMP,3
	ICALL2	TELL-THE,STACK
	JUMP	?CND13
?CCL15:	PRINTI	"right "
	PRINTI	"here"
?CND13:	PRINTR	".]"
?CCL5:	CALL1	MORE-SPECIFIC
	RSTACK	


	.FUNCT	WHICH-LIST?,NP,SR,CT,V,?TMP1
	GET	SR,1 >CT
	ADD	SR,8 >V
	GET	SR,0
	GRTR?	CT,STACK /FALSE
	INTBL?	PSEUDO-OBJECT,V,CT >NP \?PRG7
	ADD	NP,2 >?TMP1
	SUB	NP,V
	ADD	2,STACK
	DIV	STACK,2
	SUB	CT,STACK
	INTBL?	PSEUDO-OBJECT,?TMP1,STACK /FALSE
?PRG7:	DLESS?	'CT,0 /FALSE
	GET	V,0
	CALL2	ACCESSIBLE?,STACK
	ZERO?	STACK \TRUE
	ADD	V,2 >V
	JUMP	?PRG7


	.FUNCT	WHICH-PRINT,NP,SR,LEN,SZ,REM,VEC
	SET	'SR,ORPHAN-SR
	GET	SR,1 >LEN
	GET	SR,0 >SZ
	EQUAL?	WINNER,PLAYER /?CCL3
	PRINTI	"""I don't understand "
	CALL	WHICH-LIST?,NP,SR
	ZERO?	STACK /?CCL6
	PRINTI	"if"
	JUMP	?CND1
?CCL6:	PRINTI	"which"
	ZERO?	NP /?CND1
	PRINTC	32
	ICALL2	NP-PRINT,NP
	JUMP	?CND1
?CCL3:	PRINTI	"[Which"
	ZERO?	NP /?CND9
	PRINTC	32
	ICALL2	NP-PRINT,NP
?CND9:	PRINTI	" do"
?CND1:	PRINTI	" you mean"
	CALL	WHICH-LIST?,NP,SR
	ZERO?	STACK /?CND11
	EQUAL?	WINNER,PLAYER \?CND13
	PRINTC	44
?CND13:	SET	'REM,LEN
	ADD	SR,8 >VEC
?PRG15:	PRINTC	32
	GET	VEC,0
	ICALL2	TELL-THE,STACK
	EQUAL?	REM,2 \?CCL19
	EQUAL?	LEN,2 /?CND20
	PRINTC	44
?CND20:	PRINTI	" or"
	JUMP	?CND17
?CCL19:	GRTR?	REM,2 \?CND17
	PRINTC	44
?CND17:	DLESS?	'REM,1 /?CND11
	DLESS?	'SZ,1 /?CND11
	ADD	VEC,2 >VEC
	JUMP	?PRG15
?CND11:	EQUAL?	WINNER,PLAYER /?CCL31
	PRINTR	"."""
?CCL31:	PRINTR	"?]"


	.FUNCT	NP-PRINT,NP,DO-QUANT,LEN,OBJ,CT,?TMP1
	LESS?	0,NP \?CCL3
	GRTR?	NP,LAST-OBJECT /?CCL3
	CALL2	TELL-THE,NP
	RSTACK	
?CCL3:	GETB	NP,1
	EQUAL?	STACK,4 \?CCL7
	GET	NP,1 >LEN
	ZERO?	LEN /FALSE
	DEC	'LEN
?PRG11:	MUL	CT,2
	ADD	NOUN-PHRASE-HEADER-LEN,STACK
	GET	NP,STACK >OBJ
	ZERO?	OBJ /?CND13
	ICALL2	TELL-THE,OBJ
?CND13:	IGRTR?	'CT,LEN /TRUE
	PRINTI	", "
	JUMP	?PRG11
?CCL7:	ZERO?	DO-QUANT /?CND18
	GET	NP,3 >LEN
	ZERO?	LEN /?CND18
	CALL2	GET-QUANTITY-WORD,LEN
	PRINTB	STACK
	GET	NP,2
	ZERO?	STACK /?CND18
	PRINTC	32
?CND18:	GET	NP,1 >LEN
	ZERO?	LEN /?CND24
	ICALL2	ADJS-PRINT,LEN
?CND24:	GET	NP,8 >LEN
	ZERO?	LEN /?CCL28
	GET	LEN,0 >?TMP1
	GET	NP,2
	EQUAL?	?TMP1,STACK /?CTR27
	GET	LEN,0
	GETB	STACK,8
	BTST	STACK,128 /?CCL37
	GET	LEN,0
	GETB	STACK,8
	JUMP	?CND35
?CCL37:	GET	LEN,0
	GETB	STACK,8
	BAND	STACK,127
	SHIFT	STACK,7
?CND35:	BTST	STACK,8192 \?CCL28
	SUB	LEN,4 >LEN
	LESS?	P-LEXV,LEN \?CCL28
	GET	LEN,0 >?TMP1
	GET	NP,2
	EQUAL?	?TMP1,STACK \?CCL28
?CTR27:	ADD	LEN,P-WORDLEN
	ICALL	BUFFER-PRINT,LEN,STACK,FALSE-VALUE,TRUE-VALUE
	JUMP	?CND26
?CCL28:	GET	NP,2 >LEN
	ZERO?	LEN /?CND26
	ICALL2	PRINT-VOCAB-WORD,LEN
?CND26:	GET	NP,4 >LEN
	ZERO?	LEN /?CND40
	CALL2	PMEM?,LEN
	ZERO?	STACK /?CND40
	GETB	LEN,1
	EQUAL?	STACK,2 \?CND40
	PRINTI	" of "
	ICALL2	NP-PRINT,LEN
?CND40:	GET	NP,6 >LEN
	ZERO?	LEN /FALSE
	CALL2	PMEM?,LEN
	ZERO?	STACK /FALSE
	GETB	LEN,1
	EQUAL?	STACK,2 \FALSE
	PRINTI	" except "
	CALL2	NP-PRINT,LEN
	RSTACK	


	.FUNCT	ADJS-PRINT,ADJT,LEN,WD,CT,TMP
	GET	ADJT,2 >LEN
	ZERO?	LEN /?CND1
	EQUAL?	LEN,PLAYER,ME \?CCL5
	PRINTI	"your "
	JUMP	?CND1
?CCL5:	ICALL2	NP-PRINT,LEN
	PRINTI	"'s "
?CND1:	GET	ADJT,4 >LEN
	ZERO?	LEN /FALSE
	ADD	ADJT,10 >ADJT
	GRTR?	LEN,ADJS-MAX-COUNT \?CND9
	SET	'LEN,ADJS-MAX-COUNT
?CND9:	DEC	'LEN
	MUL	2,LEN
	ADD	ADJT,STACK >ADJT
?PRG11:	GET	ADJT,0 >WD
	EQUAL?	WD,W?MY \?CCL15
	PRINTI	"your "
	JUMP	?CND13
?CCL15:	EQUAL?	WD,W?INT.NUM,W?INT.TIM \?CCL17
	PRINTN	P-NUMBER
	PRINTC	32
	JUMP	?CND13
?CCL17:	EQUAL?	WD,W?NO.WORD /?CND13
	CALL2	CAPITAL-NOUN?,WD
	ZERO?	STACK /?CCL21
	GETB	P-LEXV,P-LEXWORDS >TMP
	ZERO?	TMP /?CCL21
	INTBL?	WD,P-LEXV+2,TMP,132 >TMP \?CCL21
	ICALL2	CAPITALIZE,TMP
	JUMP	?CND19
?CCL21:	ICALL2	PRINT-VOCAB-WORD,WD
?CND19:	PRINTC	32
?CND13:	IGRTR?	'CT,LEN /TRUE
	SUB	ADJT,2 >ADJT
	JUMP	?PRG11


	.FUNCT	TOO-MANY-NOUNS,WD
	PRINTI	"[I can't understand that many nouns with "
	ZERO?	WD /?CCL3
	PRINTC	34
	ICALL2	PRINT-VOCAB-WORD,WD
	PRINTC	34
	JUMP	?CND1
?CCL3:	PRINTI	"that verb"
?CND1:	PRINTR	".]"


	.FUNCT	INBUF-ADD,LEN,BEG,SLOT,DBEG,TMP,?TMP1
	GET	OOPS-TABLE,O-END >TMP
	ZERO?	TMP /?CCL3
	SET	'DBEG,TMP
	JUMP	?CND1
?CCL3:	GET	OOPS-TABLE,O-LENGTH
	MUL	P-WORDLEN,STACK >TMP
	GETB	G-LEXV,TMP >?TMP1
	ADD	TMP,1
	GETB	G-LEXV,STACK
	ADD	?TMP1,STACK >DBEG
?CND1:	SUB	LEN,1
	ADD	DBEG,STACK
	LESS?	INBUF-LENGTH,STACK /FALSE
	ADD	DBEG,LEN
	PUT	OOPS-TABLE,O-END,STACK
	ADD	P-INBUF,BEG >?TMP1
	ADD	G-INBUF,DBEG
	COPYT	?TMP1,STACK,LEN
	PUTB	G-LEXV,SLOT,DBEG
	SUB	SLOT,1
	PUTB	G-LEXV,STACK,LEN
	RTRUE	


	.FUNCT	INBUF-PRINT,WD,INBUF,LEXV,SLOT,DBEG,CTR,TMP,LEN,?TMP1
	SET	'LEN,11
	GET	OOPS-TABLE,O-END >TMP
	ZERO?	TMP /?CCL3
	SET	'DBEG,TMP
	JUMP	?CND1
?CCL3:	GET	OOPS-TABLE,O-LENGTH
	MUL	P-WORDLEN,STACK >TMP
	GETB	LEXV,TMP >?TMP1
	ADD	TMP,1
	GETB	LEXV,STACK
	ADD	?TMP1,STACK >DBEG
?CND1:	GETB	INBUF,0 >?TMP1
	SUB	LEN,1
	ADD	DBEG,STACK
	LESS?	?TMP1,STACK /FALSE
	ADD	INBUF,DBEG
	DIROUT	D-TABLE-ON,STACK
	ICALL2	PRINT-VOCAB-WORD,WD
	DIROUT	D-TABLE-OFF
	ADD	1,DBEG
	GETB	INBUF,STACK >LEN
	ADD	2,DBEG >DBEG
	ADD	DBEG,LEN
	PUT	OOPS-TABLE,O-END,STACK
	PUTB	LEXV,SLOT,DBEG
	SUB	SLOT,1
	PUTB	LEXV,STACK,LEN
	RTRUE	


	.FUNCT	SETUP-ORPHAN,STR,A,B
	DIROUT	D-TABLE-ON,O-INBUF
	PRINT	STR
	ZERO?	A /?CND1
	LESS?	0,A \?CCL5
	GRTR?	A,LAST-OBJECT /?CCL5
	ICALL2	DPRINT,A
	JUMP	?CND3
?CCL5:	PRINT	A
?CND3:	ZERO?	B /?CND1
	LESS?	0,B \?CCL12
	GRTR?	B,LAST-OBJECT /?CCL12
	ICALL2	DPRINT,B
	JUMP	?CND1
?CCL12:	PRINT	B
?CND1:	DIROUT	D-TABLE-OFF
	PUTB	O-INBUF,0,INBUF-LENGTH
	LEX	O-INBUF,O-LEXV
	GETB	O-LEXV,P-LEXWORDS >A
	ZERO?	A /FALSE
	INTBL?	0,O-LEXV+2,A,132 /FALSE
	GETB	O-LEXV,P-LEXWORDS
	MUL	P-LEXELEN,STACK
	ADD	1,STACK >P-OFLAG
	ICALL	MAKE-ROOM-FOR-TOKENS,1,O-LEXV,P-OFLAG
	PUT	O-LEXV,P-OFLAG,W?NO.WORD
	SUB	0,P-OFLAG >P-OFLAG
	PUT	OOPS-TABLE,O-AGAIN,P-LEXV+2
	RTRUE	


	.FUNCT	INSERT-ADJS,E,CT,PTR,WD
	LESS?	P-OFLAG,0 \?CCL3
	SUB	0,P-OFLAG >PTR
	JUMP	?CND1
?CCL3:	SET	'PTR,P-OFLAG
?CND1:	EQUAL?	E,FALSE-VALUE,TRUE-VALUE /FALSE
	GET	E,2 >CT
	ZERO?	CT /?CND7
	CALL2	PMEM?,CT
	ZERO?	STACK /?CCL11
	GET	CT,2 >CT
	JUMP	?CND9
?CCL11:	GETPT	CT,P?SYNONYM
	GET	STACK,0 >CT
?CND9:	GETB	VOCAB,0
	ADD	1,STACK
	ADD	VOCAB,STACK
	GETB	STACK,0
	ADD	CT,STACK >CT
	CALL	INSERT-ADJS-WD,PTR,CT >PTR
?CND7:	GET	E,4 >CT
	ZERO?	CT /FALSE
	ADD	E,10 >E
?PRG16:	DLESS?	'CT,0 /TRUE
	GET	E,CT >WD
	GET	ERROR-ARGS,3
	EQUAL?	WD,STACK /?PRG16
	CALL	INSERT-ADJS-WD,PTR,WD >PTR
	JUMP	?PRG16


	.FUNCT	INSERT-ADJS-WD,PTR,WD
	ICALL	MAKE-ROOM-FOR-TOKENS,1,G-LEXV,PTR
	PUT	G-LEXV,PTR,WD
	ADD	PTR,P-LEXELEN >PTR
	MUL	2,PTR
	SUB	STACK,1
	ICALL	INBUF-PRINT,WD,G-INBUF,G-LEXV,STACK
	RETURN	PTR

	.ENDSEG

	.ENDI
