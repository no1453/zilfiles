

	.FUNCT	GRATING-EXIT:ANY:0:0
	ZERO?	GRATE-REVEALED /?CCL3
	FSET?	GRATE,OPENBIT \?CCL6
	RETURN	GRATING-ROOM
?CCL6:	PRINTI	"Das Gitter ist geschlossen."
	CRLF	
	ICALL2	THIS-IS-IT,GRATE
	RFALSE	
?CCL3:	PRINTI	"In die Richtung kannst du nicht gehen."
	CRLF	
	RFALSE	


	.FUNCT	TREASURE-INSIDE:ANY:0:0
	EQUAL?	PRSA,V?OPEN \FALSE
	ICALL2	SCORE-OBJ,EMERALD
	RFALSE	


	.FUNCT	IN-MAZE?:ANY:1:1,PLACE
	EQUAL?	PLACE,MAZE-1,MAZE-2,MAZE-3 /TRUE
	EQUAL?	PLACE,MAZE-4,MAZE-5,MAZE-6 /TRUE
	EQUAL?	PLACE,MAZE-7,MAZE-8,MAZE-9 /TRUE
	EQUAL?	PLACE,MAZE-10,MAZE-11,MAZE-12 /TRUE
	EQUAL?	PLACE,MAZE-13,MAZE-14,MAZE-15 /TRUE
	EQUAL?	PLACE,DEAD-END-1,DEAD-END-2,DEAD-END-3 /TRUE
	EQUAL?	PLACE,DEAD-END-4 /TRUE
	RFALSE	


	.FUNCT	CANYON-VIEW-F:ANY:1:1,RARG
	EQUAL?	RARG,M-BEG \FALSE
	EQUAL?	PRSA,V?LEAP \FALSE
	ZERO?	PRSO \FALSE
	ICALL2	JIGS-UP,STR?181
	RTRUE	


	.FUNCT	GO:ANY:0:0
?FCN:	CALL	QUEUE,I-FIGHT,-1
	PUT	STACK,0,1
	ICALL	QUEUE,I-SWORD,-1
	CALL	QUEUE,I-THIEF,-1
	PUT	STACK,0,1
	ICALL	QUEUE,I-CANDLES,40
	ICALL	QUEUE,I-LANTERN,200
	PUTP	INFLATED-BOAT,P?VTYPE,NONLANDBIT
	ADD	DEF1,2
	PUT	DEF1-RES,1,STACK
	ADD	DEF1,4
	PUT	DEF1-RES,2,STACK
	ADD	DEF2B,2
	PUT	DEF2-RES,2,STACK
	ADD	DEF2B,4
	PUT	DEF2-RES,3,STACK
	ADD	DEF3A,2
	PUT	DEF3-RES,1,STACK
	ADD	DEF3B,2
	PUT	DEF3-RES,3,STACK
	SET	'HERE,WEST-OF-HOUSE
	ICALL2	THIS-IS-IT,MAILBOX
	CLEAR	-1
	ICALL1	INIT-STATUS-LINE
	CRLF	
	FSET?	HERE,TOUCHBIT /?CND1
	ICALL1	V-VERSION
	CRLF	
?CND1:	SET	'LIT,TRUE-VALUE
	SET	'WINNER,ADVENTURER
	SET	'PLAYER,WINNER
	MOVE	WINNER,HERE
	ICALL1	V-LOOK
	ICALL1	MAIN-LOOP
	JUMP	?FCN

	.ENDI
