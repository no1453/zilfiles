

	.FUNCT	DO-CURSET:ANY:2:2,Y,X
	EQUAL?	1,CWIDTH,CHEIGHT \?CCL3
	CURSET	Y,X
	RFALSE	
?CCL3:	MUL	X,CWIDTH >X
	MUL	Y,CHEIGHT
	CURSET	STACK,X
	RFALSE	


	.FUNCT	DPRINT:ANY:2:2,OBJ,CASE
	GETP	OBJ,P?ADJDESC
	ZERO?	STACK /?CND1
	GETP	OBJ,P?ADJDESC
	PRINT	STACK
	EQUAL?	CASE,W?DER,W?DEN,W?DEM \?CCL5
	EQUAL?	CASE,W?DER /?CTR7
	EQUAL?	CASE,W?DEN \?CCL8
	FSET?	OBJ,DERBIT /?CCL8
?CTR7:	PRINTC	101
	JUMP	?CND3
?CCL8:	PRINTI	"en"
	JUMP	?CND3
?CCL5:	FSET?	OBJ,DERBIT \?CCL14
	PRINTI	"er"
	JUMP	?CND3
?CCL14:	FSET?	OBJ,DASBIT \?CCL16
	EQUAL?	CASE,W?EINEM /?CCL16
	PRINTI	"es"
	JUMP	?CND3
?CCL16:	FSET?	OBJ,DIEBIT \?CCL20
	EQUAL?	CASE,W?EINEM \?CCL20
	PRINTC	101
	JUMP	?CND3
?CCL20:	PRINTI	"en"
?CND3:	PRINTC	32
?CND1:	PRINTD	OBJ
	RTRUE	


	.FUNCT	DER-NOM-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"der "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"die "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"das "
?CND1:	CALL	DPRINT,OBJ,W?DER
	RSTACK	


	.FUNCT	DER-NOM-CAP-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"Der "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"Die "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"Das "
?CND1:	CALL	DPRINT,OBJ,W?DER
	RSTACK	


	.FUNCT	DER-ACC-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"den "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"die "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"das "
?CND1:	CALL	DPRINT,OBJ,W?DEN
	RSTACK	


	.FUNCT	DER-ACC-CAP-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"Den "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"Die "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"Das "
?CND1:	CALL	DPRINT,OBJ,W?DEN
	RSTACK	


	.FUNCT	DER-DAT-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT /?CTR2
	FSET?	OBJ,DASBIT \?CCL3
?CTR2:	PRINTI	"dem "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CND1
	PRINTI	"der "
?CND1:	CALL	DPRINT,OBJ,W?DEM
	RSTACK	


	.FUNCT	EIN-NOM-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT /?CTR2
	FSET?	OBJ,DASBIT \?CCL3
?CTR2:	PRINTI	"ein "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CND1
	PRINTI	"eine "
?CND1:	CALL	DPRINT,OBJ,W?EIN
	RSTACK	


	.FUNCT	EIN-NOM-CAP-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DASBIT /?CTR2
	FSET?	OBJ,DERBIT \?CCL3
?CTR2:	PRINTI	"Ein "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CND1
	PRINTI	"Eine "
?CND1:	CALL	DPRINT,OBJ,W?EIN
	RSTACK	


	.FUNCT	EIN-ACC-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"einen "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"eine "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"ein "
?CND1:	CALL	DPRINT,OBJ,W?EINEN
	RSTACK	


	.FUNCT	EIN-ACC-CAP-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"Einen "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"Eine "
	JUMP	?CND1
?CCL5:	FSET?	OBJ,DASBIT \?CND1
	PRINTI	"Ein "
?CND1:	CALL	DPRINT,OBJ,W?EINEN
	RSTACK	


	.FUNCT	EIN-DAT-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT /?CTR2
	FSET?	OBJ,DASBIT \?CCL3
?CTR2:	PRINTI	"einem "
	JUMP	?CND1
?CCL3:	FSET?	OBJ,DIEBIT \?CND1
	PRINTI	"einer "
?CND1:	CALL	DPRINT,OBJ,W?EINEM
	RSTACK	


	.FUNCT	PRONOUN-NOM-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"er"
	RTRUE	
?CCL3:	FSET?	OBJ,DASBIT \?CCL5
	PRINTI	"es"
	RTRUE	
?CCL5:	FSET?	OBJ,DIEBIT \?CCL7
	PRINTI	"sie"
	RTRUE	
?CCL7:	PRINTI	"es"
	RTRUE	


	.FUNCT	PRONOUN-NOM-CAP-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"Er"
	RTRUE	
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"Sie"
	RTRUE	
?CCL5:	PRINTI	"Es"
	RTRUE	


	.FUNCT	PRONOUN-ACC-PRINT:ANY:1:1,OBJ
	FSET?	OBJ,DERBIT \?CCL3
	PRINTI	"ihn"
	RTRUE	
?CCL3:	FSET?	OBJ,DIEBIT \?CCL5
	PRINTI	"sie"
	RTRUE	
?CCL5:	PRINTI	"es"
	RTRUE	


	.FUNCT	ZPROB:ANY:1:1,BASE
	ZERO?	LUCKY /?CCL3
	RANDOM	100
	GRTR?	BASE,STACK /TRUE
	RFALSE	
?CCL3:	RANDOM	300
	GRTR?	BASE,STACK /TRUE
	RFALSE	


	.FUNCT	RANDOM-ELEMENT:ANY:1:1,FROB
	GET	FROB,0
	RANDOM	STACK
	GET	FROB,STACK
	RSTACK	


	.FUNCT	PICK-ONE:ANY:1:1,FROB,L,CNT,RND,MSG,RFROB
	GET	FROB,0 >L
	GET	FROB,1 >CNT
	DEC	'L
	ADD	FROB,2 >FROB
	MUL	CNT,2
	ADD	FROB,STACK >RFROB
	SUB	L,CNT
	RANDOM	STACK >RND
	GET	RFROB,RND >MSG
	GET	RFROB,1
	PUT	RFROB,RND,STACK
	PUT	RFROB,1,MSG
	INC	'CNT
	EQUAL?	CNT,L \?CND1
	SET	'CNT,0
?CND1:	PUT	FROB,0,CNT
	RETURN	MSG

	.ENDI
