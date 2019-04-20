

	.FUNCT	RT-AC-LG-BAKER-ST-DOOR
	EQUAL?	GL-PRSA,V?KNOCK \?CCL3
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \?CCL6
	PRINTR	"You are already inside."
?CCL6:	FSET?	LG-BAKER-ST-DOOR,FL-OPENED \?CCL8
	PRINTR	"The door is already open."
?CCL8:	FSET?	CH-HUDSON,FL-ASLEEP \?CCL10
	PRINTR	"There is no answer."
?CCL10:	FSET?	LG-BAKER-ST-DOOR,FL-LOCKED /?CCL12
	FSET	LG-BAKER-ST-DOOR,FL-OPENED
	MOVE	CH-HUDSON,RM-ENTRY-HALL
	ICALL2	RT-THIS-IS-IT,CH-HUDSON
	PRINTR	"Mrs Hudson appears and says, ""Please come in Dr Watson."" She steps back into the hall to allow room for you to pass."
?CCL12:	FCLEAR	LG-BAKER-ST-DOOR,FL-LOCKED
	SET	'GL-PLACE-CUR,RM-ENTRY-HALL
	MOVE	CH-HUDSON,GL-PLACE-CUR
	MOVE	CH-PLAYER,GL-PLACE-CUR
	ICALL2	RT-THIS-IS-IT,CH-HUDSON
	PRINTI	"You hear a bolt sliding back and the door opens to reveal a worried Mrs Hudson."
	CRLF	
	CRLF	
	PRINTI	"""Oh Doctor Watson, I'm so glad to see you. It's Mr Holmes, sir. Three days have come and gone since he's been out of his rooms. He won't eat and I know he hasn't slept. Now there's a visitor who says he's here about some important government business. I tried to send him away, but he insisted on waiting in the parlour. That's when I sent for you. Thank God you've come."""
	CRLF	
	ICALL	RT-EXEC-RM-DESCFCN,RM-ENTRY-HALL,K-M-DESC-1
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	GL-PRSA,V?KICK,V?HIT,V?MUNG \?CCL14
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL /FALSE
	FSET?	LG-BAKER-ST-DOOR,FL-OPENED /FALSE
	PRINTR	"Mrs Hudson pokes her head out the door and says, ""I'm not opening the door until you knock like a proper gentleman."" She slams the door in your face."
?CCL14:	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-221B-BAKER-ST \?CCL24
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	
?CCL24:	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	


	.FUNCT	RT-AC-LG-PARLOUR-DOOR
	EQUAL?	GL-PRSA,V?OPEN \?CCL3
	FSET?	CH-HOLMES,FL-ASLEEP \FALSE
	ICALL2	RT-CTHEO-PRINT,CH-HUDSON
	PRINT	K-HUDSON-WORRIED-MSG
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-PARLOUR \?CCL11
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL11:	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \FALSE
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	


	.FUNCT	RT-AC-LG-HOLMES-STUDY-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-VESTIBULE \?CCL6
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY \FALSE
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	


	.FUNCT	RT-AC-LG-HOLMES-BEDROOM-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY \?CCL6
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-HOLMES-BEDROOM \FALSE
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	


	.FUNCT	RT-AC-LG-BAR-OF-GOLD-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BAR-OF-GOLD \?CCL6
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-SWAN-LANE \FALSE
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	


	.FUNCT	RT-AC-LG-LAIR-DOOR
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH,V?OPEN /?PRD8
	EQUAL?	GL-PRSA,V?CLOSE,V?UNLOCK,V?LOCK \?CCL6
?PRD8:	FSET?	CH-AKBAR,FL-LOCKED /?CCL6
	FSET?	CH-AKBAR,FL-ASLEEP /?CCL6
	PRINTI	"Akbar"
	FSET?	TH-WATSONS-HAT,FL-WORN \?CND12
	PRINTI	" says, ""Forgive me, sir,"" and"
?CND12:	PRINTR	" stops you as you move toward the door."
?CCL6:	EQUAL?	GL-PRSA,V?OPEN \?CCL15
	FSET?	CH-HOLMES,FL-LOCKED \?CCL15
	PRINTR	"Holmes calls out, ""Watson! I'm still tied up!"" You pause and look back, torn by indecision."
?CCL15:	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \?CCL19
	EQUAL?	GL-PLACE-CUR,RM-LAIR \FALSE
	CALL2	RT-DO-WALK,P?OUT
	RSTACK	
?CCL19:	EQUAL?	GL-PRSA,V?UNLOCK \?CCL24
	EQUAL?	GL-PRSI,TH-LAIR-KEY \?CCL24
	FSET?	LG-LAIR-DOOR,FL-LOCKED \?CCL24
	FCLEAR	LG-LAIR-DOOR,FL-LOCKED
	ICALL	RT-CYOU-MSG,STR?821,STR?822
	ICALL2	RT-THEO-PRINT,LG-LAIR-DOOR
	PRINTR	"."
?CCL24:	EQUAL?	GL-PRSA,V?LOCK \FALSE
	EQUAL?	GL-PRSI,TH-LAIR-KEY \FALSE
	FSET?	LG-LAIR-DOOR,FL-OPENED /FALSE
	FSET?	LG-LAIR-DOOR,FL-LOCKED /FALSE
	FSET	LG-LAIR-DOOR,FL-LOCKED
	ICALL	RT-CYOU-MSG,STR?808,STR?809
	ICALL2	RT-THEO-PRINT,LG-LAIR-DOOR
	PRINTR	"."


	.FUNCT	RT-AC-LG-JERICHO-PARLOUR-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-SOUTH-AISLE \?CCL6
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-JERICHO-PARLOUR \FALSE
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	


	.FUNCT	RT-AC-LG-SHOPS,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"The shops are closed for the Jubilee."
?CCL3:	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?SEARCH \FALSE
	PRINTR	"The shops are all closed for the Jubilee."


	.FUNCT	RT-AC-LG-WATER,CONTEXT,CLASS,CAP?
	EQUAL?	CONTEXT,K-M-SDESC \?CCL3
	EQUAL?	CLASS,K-DESC-A \?CCL6
	PUSH	TRUE-VALUE
	JUMP	?CND4
?CCL6:	PUSH	FALSE-VALUE
?CND4:	ICALL	PRINT-SDESC,STR?823,CLASS,STACK,FALSE-VALUE
	RTRUE	
?CCL3:	ZERO?	CONTEXT \FALSE
	ZERO?	GL-NOW-PRSI? \?CCL10
	EQUAL?	GL-PRSA,V?ENTER,V?LEAP \?CCL13
	EQUAL?	GL-WINNER,CH-PLAYER \?CCL16
	PRINTR	"You may not remember this, but you can't swim."
?CCL16:	PRINTR	"That's not very polite."
?CCL13:	EQUAL?	GL-PRSA,V?DRINK \?CCL18
	PRINT	K-YUCK-MSG
	CRLF	
	RTRUE	
?CCL18:	EQUAL?	GL-PRSA,V?EXAMINE \?CCL20
	PRINTR	"The water is black, oily, slimy, dirty, and otherwise unwholesome-looking."
?CCL20:	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?SEARCH \?CCL22
	PRINTR	"The water is so black and oily that you can't see a thing."
?CCL22:	EQUAL?	GL-PRSA,V?REACH-IN,V?SEARCH \?CCL24
	PRINTR	"Slimy things brush up against your hand, so you quickly pull it back."
?CCL24:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-WASTE-OF-BULLETS-MSG
	RSTACK	
?CCL10:	ZERO?	GL-NOW-PRSI? /FALSE
	EQUAL?	GL-PRSA,V?PUT,V?PUT-ON \FALSE
	FSET?	GL-PRSO,FL-BODYPART /?CTR33
	EQUAL?	GL-PRSO,CH-ME,CH-PLAYER \?CCL34
?CTR33:	PRINT	K-YUCK-MSG
	CRLF	
	RTRUE	
?CCL34:	EQUAL?	GL-PRSO,TH-ANCHOR,PSEUDO-OBJECT /?CTR38
	LOC	GL-PRSO
	EQUAL?	STACK,GLOBAL-OBJECTS,LOCAL-GLOBALS \?CCL39
?CTR38:	ICALL	RT-PERFORM,V?DROP,GL-PRSO
	RTRUE	
?CCL39:	EQUAL?	GL-PRSO,CH-TRAINED-PIGEON \?CCL43
	REMOVE	GL-PRSO
	ICALL1	RT-KILL-PIGEON
	PRINTI	"The pigeon struggles briefly, its feathers too wet to fly, then sinks below the water."
	RTRUE	
?CCL43:	REMOVE	GL-PRSO
	FCLEAR	GL-PRSO,FL-WORN
	PRINTR	"Plop."


	.FUNCT	RT-AC-LG-UP-DOWN-STREAM,CONTEXT
	EQUAL?	CONTEXT,K-M-SDESC \?CCL3
	GETP	LG-UP-DOWN-STREAM,P?OBJ-NOUN
	PRINTB	STACK
	RTRUE	
?CCL3:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	ICALL1	RT-IMPOSSIBLE-MSG
	RTRUE	


	.FUNCT	RT-AC-LG-BRITISH-MUSEUM-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-GREAT-RUSSELL-ST \?CCL6
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-BRITISH-MUSEUM \FALSE
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	


	.FUNCT	RT-AC-LG-WESTMINSTER-DOOR
	EQUAL?	GL-PRSA,V?ENTER,V?THROUGH \FALSE
	EQUAL?	GL-PLACE-CUR,RM-BROAD-SANCTUARY \?CCL6
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-NAVE \FALSE
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	


	.FUNCT	RT-AC-LG-PLAQUES,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"It looks mighty like a plaque."
?CCL3:	EQUAL?	GL-PRSA,V?TAKE \?CCL5
	PRINTI	"The plaque is firmly attached to the "
	EQUAL?	GL-PLACE-CUR,RM-MANUSCRIPT-ROOM \?CCL8
	PRINTI	"desk"
	JUMP	?CND6
?CCL8:	PRINTI	"wall"
?CND6:	PRINTR	". You can't remove it."
?CCL5:	EQUAL?	GL-PRSA,V?READ,V?EXAMINE \?CCL10
	EQUAL?	GL-PLACE-CUR,RM-BROAD-SANCTUARY \?CCL13
	SET	'GL-WINDOW,PT?307
	JUMP	?CND11
?CCL13:	EQUAL?	GL-PLACE-CUR,RM-MANUSCRIPT-ROOM \?CCL15
	SET	'GL-WINDOW,PT?407
	JUMP	?CND11
?CCL15:	EQUAL?	GL-PLACE-CUR,RM-MADAME-TUSSAUDS \?CCL17
	SET	'GL-WINDOW,PT?507
	JUMP	?CND11
?CCL17:	EQUAL?	GL-PLACE-CUR,RM-GREAT-RUSSELL-ST \?CCL19
	SET	'GL-WINDOW,PT?607
	JUMP	?CND11
?CCL19:	EQUAL?	GL-PLACE-CUR,RM-MONUMENT \?CCL21
	SET	'GL-WINDOW,PT?707
	JUMP	?CND11
?CCL21:	EQUAL?	GL-PLACE-CUR,RM-THE-BLACK-MUSEUM \?CCL23
	SET	'GL-WINDOW,PT?807
	JUMP	?CND11
?CCL23:	EQUAL?	GL-PLACE-CUR,RM-THREADNEEDLE-ST \?CCL25
	SET	'GL-WINDOW,PT?907
	JUMP	?CND11
?CCL25:	EQUAL?	GL-PLACE-CUR,RM-TOWER-ENTRANCE \?CCL27
	SET	'GL-WINDOW,PT?1007
	JUMP	?CND11
?CCL27:	EQUAL?	GL-PLACE-CUR,RM-TRAFALGAR-SQUARE \?CCL29
	SET	'GL-WINDOW,PT?1107
	JUMP	?CND11
?CCL29:	EQUAL?	GL-PLACE-CUR,RM-VICTORIA-STREET \?CCL31
	SET	'GL-WINDOW,PT?1207
	JUMP	?CND11
?CCL31:	EQUAL?	GL-PLACE-CUR,RM-SWAN-LANE \?CCL33
	SET	'GL-WINDOW,PT?1307
	JUMP	?CND11
?CCL33:	EQUAL?	GL-PLACE-CUR,RM-JERUSALEM-CHAMBER \?CCL35
	SET	'GL-WINDOW,PT?1407
	JUMP	?CND11
?CCL35:	SET	'GL-WINDOW,PT?1607
?CND11:	ICALL2	RT-WINDOW,GL-WINDOW
	SET	'GL-WINDOW,FALSE-VALUE
	RTRUE	
?CCL10:	EQUAL?	GL-PRSA,V?PUT,V?PUT-ON \FALSE
	ZERO?	GL-NOW-PRSI? /FALSE
	PRINTI	"Putting anything on "
	ICALL2	RT-THEO-PRINT,LG-PLAQUES
	PRINTI	" would"
	CALL1	RT-WASTE-OF-TIME-MSG
	RSTACK	


	.FUNCT	RT-DF-LG-WAX-STATUES,CONTEXT,CLASS
	EQUAL?	CONTEXT,K-M-SDESC \?CCL3
	ICALL	PRINT-SDESC,STR?824,CLASS,FALSE-VALUE,TRUE-VALUE
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESCFCN \FALSE
	EQUAL?	GL-PLACE-CUR,RM-MADAME-TUSSAUDS \?CCL8
	PRINTR	"The statues are of King John, Sir Francis Drake, Sir Walter Raleigh, and William the Conqueror."
?CCL8:	EQUAL?	GL-PLACE-CUR,RM-CHAMBER-OF-HORRORS \FALSE
	PRINTR	"The statues are of Guy Fawkes, Charles I, and Saint Thomas Becket."


	.FUNCT	RT-AC-LG-WINDOW,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	EQUAL?	GL-PLACE-CUR,RM-221B-BAKER-ST \?CCL6
	PRINTR	"It is a bow window, far above your head."
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-SOUTH-TRANSEPT \?CCL8
	PRINTI	"It is the largest rose window in all England"
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND9
	PRINT	K-BRIGHTENS-UP-MSG
?CND9:	PRINTR	"."
?CCL8:	EQUAL?	GL-PLACE-CUR,RM-NORTH-TRANSEPT \FALSE
	PRINTI	"It is set high in the north wall of the Abbey"
	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1,2,3 \?CND13
	PRINT	K-BRIGHTENS-UP-MSG
?CND13:	PRINTR	"."
?CCL3:	EQUAL?	GL-PRSA,V?SHOOT \?CCL16
	ZERO?	GL-NOW-PRSI? \?CCL16
	CALL1	RT-WASTE-OF-BULLETS-MSG
	RSTACK	
?CCL16:	IN?	GL-WINNER,RM-SOUTH-TRANSEPT /?CTR19
	IN?	GL-WINNER,RM-NORTH-TRANSEPT \?CCL20
?CTR19:	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?SEARCH,V?LOOK-OUTSIDE \?CCL25
	PRINTR	"You cannot see through the stained-glass window."
?CCL25:	CALL1	RT-TOUCH-VERB?
	ZERO?	STACK /FALSE
	ICALL2	RT-CTHEO-PRINT,LG-WINDOW
	PRINTR	" is too high."
?CCL20:	IN?	GL-WINNER,RM-221B-BAKER-ST \?CCL29
	CALL1	RT-TOUCH-VERB?
	ZERO?	STACK /?CCL32
	ICALL2	RT-CTHEO-PRINT,LG-WINDOW
	PRINTR	" is too high."
?CCL32:	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?LOOK-OUTSIDE,V?SEARCH \FALSE
	ICALL2	RT-CTHEO-PRINT,LG-WINDOW
	PRINTR	" is too high to see in."
?CCL29:	IN?	GL-WINNER,RM-HOLMES-STUDY \FALSE
	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?LOOK-OUTSIDE,V?SEARCH \?CCL39
	PRINTI	"You look down into Baker Street."
	CRLF	
	CALL2	RT-DESCRIBE-PLACE-CONTENTS,RM-221B-BAKER-ST
	RSTACK	
?CCL39:	EQUAL?	GL-PRSA,V?MUNG \?CCL41
	ICALL2	RT-CTHEO-PRINT,LG-WINDOW
	PRINTR	" is made of reinforced glass. It can't be broken."
?CCL41:	EQUAL?	GL-PRSA,V?OPEN \FALSE
	ICALL2	RT-CTHEO-PRINT,LG-WINDOW
	PRINTR	" is jammed shut. It can't be opened."


	.FUNCT	RT-AC-LG-TOMBS-ABBEY,CONTEXT
	GETP	LG-TOMBS-ABBEY,P?OBJ-NOUN
	EQUAL?	STACK,W?ABBEY \?CCL3
	EQUAL?	CONTEXT,K-M-SDESC \?CCL6
	PRINTI	"Abbey"
	RTRUE	
?CCL6:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL10
	EQUAL?	GL-PLACE-CUR,RM-NAVE \?CCL13
	CALL1	RT-ALREADY-IN-ROOM-MSG
	RSTACK	
?CCL13:	EQUAL?	GL-PLACE-CUR,RM-BROAD-SANCTUARY \FALSE
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	
?CCL10:	EQUAL?	GL-PRSA,V?EXIT \?CCL17
	EQUAL?	GL-PLACE-CUR,RM-NAVE \?CCL20
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	
?CCL20:	CALL1	RT-NOT-IN-ROOM-MSG
	RSTACK	
?CCL17:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-IMPOSSIBLE-MSG
	RSTACK	
?CCL3:	EQUAL?	CONTEXT,K-M-SDESC \?CCL25
	PRINTI	"tombs"
	RTRUE	
?CCL25:	FSET?	GL-PLACE-CUR,FL-INDOORS \?CTR26
	EQUAL?	GL-PLACE-CUR,RM-JERICHO-PARLOUR,RM-JERUSALEM-CHAMBER,RM-NORTH-CLOISTER \?CCL27
?CTR26:	ICALL2	RT-CANT-SEE-ANY-MSG,LG-TOMBS-ABBEY
	RTRUE	
?CCL27:	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL31
	EQUAL?	GL-PLACE-CUR,RM-SOUTH-AMBULATORY,RM-NORTH-AMBULATORY \?CCL34
	PRINTR	"There are so many of them! None stands out in particular."
?CCL34:	EQUAL?	GL-PLACE-CUR,RM-CONFESSOR-CHAPEL \?CCL36
	PRINTR	"Two of them are especially interesting. One is the tomb of Edward the Confessor. The other is of Henry V."
?CCL36:	PRINTR	"One tomb in particular catches your eye."
?CCL31:	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-SHOOT-DEAD-MSG
	RSTACK	


	.FUNCT	RT-AC-LG-STREETLIGHT
	CALL1	RT-TOUCH-VERB?
	ZERO?	STACK /?CCL3
	ICALL2	RT-CTHEO-PRINT,LG-STREETLIGHT
	PRINTR	" is too high."
?CCL3:	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-WASTE-OF-BULLETS-MSG
	RSTACK	


	.FUNCT	RT-AC-LG-STAIRWAY
	EQUAL?	GL-PRSA,V?CLIMB-UP \?CCL3
	CALL2	RT-DO-WALK,P?UP
	RSTACK	
?CCL3:	EQUAL?	GL-PRSA,V?CLIMB-DOWN \FALSE
	CALL2	RT-DO-WALK,P?DOWN
	RSTACK	


	.FUNCT	RT-AC-LG-SHAFT-OF-LIGHT,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"Well, it's not really a shaft of light. It's more like a diffused murkiness. But any light that penetrates an English church from the outside counts as a shaft."
?CCL3:	ZERO?	GL-NOW-PRSI? \?CCL5
	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-WASTE-OF-BULLETS-MSG
	RSTACK	
?CCL5:	ZERO?	GL-NOW-PRSI? /FALSE
	EQUAL?	GL-PRSA,V?PUT \FALSE
	EQUAL?	GL-PRSO,TH-MAGNIFYING-GLASS \?CCL16
	CALL1	RT-WHO-SAYS?
	EQUAL?	STACK,CH-HOLMES \?CCL19
	PRINTR	"""Your Afghan experience is showing, Watson. The hot sun there would surely produce rays capable, when focused, of producing a flame. Alas, our English sun is too weak to produce such an effect."""
?CCL19:	PRINTR	"The rays from England's sun are too weak to focus."
?CCL16:	EQUAL?	GL-PRSO,TH-GREEN-PAPER,TH-WHITE-PAPER,TH-BLUE-PAPER /FALSE
	EQUAL?	GL-PRSO,TH-ORANGE-PAPER,TH-YELLOW-PAPER,TH-BROWN-PAPER /FALSE
	PRINTI	"Putting "
	ICALL1	RT-THEO-PRINT
	PRINTI	" in "
	ICALL1	RT-THEI-PRINT
	CALL1	RT-WASTE-OF-TIME-MSG
	RSTACK	


	.FUNCT	RT-AC-LG-RAVENS,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"The ravens stare at you with baleful eyes."
?CCL3:	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
	ICALL2	RT-CTHEO-PRINT,LG-RAVENS
	PRINTR	" caw raucously in response."
?CCL5:	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?TAKE \?CCL10
	ICALL2	RT-CTHEO-PRINT,LG-RAVENS
	PRINTR	" fly out of reach."
?CCL10:	EQUAL?	GL-PRSA,V?SHOOT \?CCL12
	ICALL	RT-SHOOT-BIRDS,LG-RAVENS,STR?825
	RTRUE	
?CCL12:	EQUAL?	GL-PRSA,V?LISTEN \FALSE
	PRINTR	"None of the ravens is quothing ""Nevermore."""


	.FUNCT	RT-DF-LG-BOATS,CONTEXT
	EQUAL?	CONTEXT,K-M-DESCFCN \FALSE
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL5
	ICALL2	RT-CTHEO-PRINT,LG-BOATS
	PRINTR	" are shrouded in fog."
?CCL5:	ICALL2	RT-CTHEO-PRINT,LG-BOATS
	PRINTR	" bob merrily on the river."


	.FUNCT	RT-AC-LG-HOLMES-HOUSE
	EQUAL?	GL-PRSA,V?ENTER \?CCL3
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL,RM-PARLOUR,RM-VESTIBULE /?CTR5
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY,RM-HOLMES-BEDROOM \?CCL6
?CTR5:	ICALL1	RT-ALREADY-IN-ROOM-MSG
	RTRUE	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-221B-BAKER-ST \FALSE
	ICALL2	RT-DO-WALK,P?WEST
	RTRUE	
?CCL3:	EQUAL?	GL-PRSA,V?EXIT \FALSE
	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL \?CCL15
	ICALL2	RT-DO-WALK,P?EAST
	RTRUE	
?CCL15:	EQUAL?	GL-PLACE-CUR,RM-PARLOUR,RM-VESTIBULE,RM-HOLMES-STUDY /?CTR16
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-BEDROOM \?CCL17
?CTR16:	PRINT	K-SPECIFY-DIR-MSG
	CRLF	
	RTRUE	
?CCL17:	ICALL1	RT-NOT-IN-ROOM-MSG
	RTRUE	


	.FUNCT	RT-AC-LG-PEDESTAL,CONTEXT,CLASS
	EQUAL?	CONTEXT,K-M-SDESC \?CCL3
	ICALL	PRINT-SDESC,STR?826,CLASS,FALSE-VALUE,FALSE-VALUE
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-DESCFCN \FALSE
	EQUAL?	GL-PLACE-CUR,RM-TRAFALGAR-SQUARE \FALSE
	PRINTR	"On the pedestal you see a bronze relief."


	.FUNCT	RT-AC-LG-TOWER
	EQUAL?	GL-PRSA,V?ENTER \?CCL3
	EQUAL?	GL-PLACE-CUR,RM-BYWARD-TOWER,RM-BLOODY-TOWER,RM-WAKEFIELD-TOWER /?CTR5
	EQUAL?	GL-PLACE-CUR,RM-JEWEL-ROOM,RM-DUNGEON,RM-TORTURE-ROOM /?CTR5
	EQUAL?	GL-PLACE-CUR,RM-WHITE-TOWER,RM-BOWYER-TOWER \?CCL6
?CTR5:	CALL1	RT-ALREADY-IN-ROOM-MSG
	RSTACK	
?CCL6:	EQUAL?	GL-PLACE-CUR,RM-OUTER-WARD,RM-TOWER-GREEN \?CCL11
	PRINT	K-SPECIFY-DIR-MSG
	CRLF	
	RTRUE	
?CCL11:	EQUAL?	GL-PLACE-CUR,RM-OUTSIDE-TRAITORS-GATE \?CCL13
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	
?CCL13:	EQUAL?	GL-PLACE-CUR,RM-DRAWBRIDGE,RM-TOWER-ENTRANCE \FALSE
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	
?CCL3:	EQUAL?	GL-PRSA,V?EXIT \?CCL17
	EQUAL?	GL-PLACE-CUR,RM-BLOODY-TOWER,RM-WAKEFIELD-TOWER,RM-WHITE-TOWER /?CTR19
	EQUAL?	GL-PLACE-CUR,RM-BOWYER-TOWER,RM-BYWARD-TOWER \?CCL20
?CTR19:	CALL2	RT-DO-WALK,P?OUT
	RSTACK	
?CCL20:	EQUAL?	GL-PLACE-CUR,RM-DUNGEON,RM-TORTURE-ROOM \?CCL24
	CALL2	RT-DO-WALK,P?UP
	RSTACK	
?CCL24:	EQUAL?	GL-PLACE-CUR,RM-JEWEL-ROOM \?CCL26
	CALL2	RT-DO-WALK,P?DOWN
	RSTACK	
?CCL26:	EQUAL?	GL-PLACE-CUR,RM-INSIDE-TRAITORS-GATE \?CCL28
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL28:	EQUAL?	GL-PLACE-CUR,RM-OUTER-WARD,RM-TOWER-GREEN \?CCL30
	PRINT	K-SPECIFY-DIR-MSG
	CRLF	
	RTRUE	
?CCL30:	CALL1	RT-NOT-IN-ROOM-MSG
	RSTACK	
?CCL17:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	CALL1	RT-IMPOSSIBLE-MSG
	RSTACK	

	.ENDI
