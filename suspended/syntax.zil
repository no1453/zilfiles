"SEARCH <SYNTAX "

"SYNTAX for
			      SUSPENSION
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

"SUBTITLE VOCABULARY"

<BUZZ A AN THE IS ARE EQUALS ;= AND OF THEN ALL ONE BUT EXCEPT \. \, \" OUR 
 OF BOTH TOGETHER YOURSELF ROOM AREA YOU PLEASE>

<SYNONYM WITH USING THROUGH>
<SYNONYM IN INSIDE INTO>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM DOWN D>
<SYNONYM UP U>

"Game commands"

<SYNTAX INVENTORY = V-INVENTORY>
<SYNONYM INVENTORY I>

<SYNTAX QUIT = V-QUIT>
<SYNONYM QUIT Q>

<SYNTAX RESTART = V-RESTART>

<SYNTAX RESTORE = V-RESTORE>

<SYNTAX SAVE = V-SAVE>

<SYNTAX SCORE = V-SCORE>

<SYNTAX $VERIFY = V-$VERIFY>

<SYNTAX VERSION = V-VERSION>

<SYNTAX ADVANCED = V-ADVANCED>
<SYNONYM ADVANCED HARDER EXPERT>

\

"SUBTITLE REAL VERBS"

<SYNTAX ANSWER = V-ANSWER>
<SYNTAX ANSWER OBJECT = V-REPLY>
<SYNONYM ANSWER REPLY>

<SYNTAX APPLY OBJECT TO OBJECT = V-PUT PRE-PUT>

<SYNTAX ATTACH
	OBJECT (FIND WEARABLEBIT)
	TO
	OBJECT
	= V-WEAR>

<SYNTAX ATTACK
	OBJECT (FIND VILLAIN) (ON-GROUND IN-ROOM)
	WITH
	OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE)
	= V-ATTACK>
<SYNONYM ATTACK FIGHT HURT INJURE HIT>

<SYNTAX BOARD OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM)
	= V-BOARD PRE-BOARD>

<SYNTAX CLIMB ON OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB ONTO OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB UP OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX CLIMB DOWN OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX CLIMB OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-FOO>
<SYNTAX CLIMB IN OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNONYM CLIMB SIT RECLINE LIE LAY>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND UP OBJECT (FIND RMUNGBIT) = V-STAND>
<SYNTAX STAND ON OBJECT = V-STAND-ON>
<SYNONYM STAND>

<SYNTAX CLOSE
	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-CLOSE>
<SYNTAX CLOSE OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	ON OBJECT (FIND VICBIT) = V-CLOSE>

<SYNTAX COUNT OBJECT (FIND TOOLBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-COUNT>
<SYNTAX COUNT OBJECT (FIND TOOLBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	ON OBJECT (FIND VICBIT) = V-COUNT>
<SYNTAX COUNT OBJECT (FIND TOOLBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	IN OBJECT (FIND VICBIT) = V-COUNT>
<SYNONYM COUNT TOTAL> 

<SYNTAX CURSE = V-CURSES>
<SYNTAX CURSE OBJECT (FIND VILLAIN) = V-CURSES>
<SYNONYM CURSE DAMN>

<SYNTAX CUT OBJECT (FIND CUTABLEBIT) WITH OBJECT = V-CUT>
<SYNONYM CUT SNIP SLICE>

<SYNTAX DIG
	IN
	OBJECT ; (ON-GROUND IN-ROOM) 
	= V-DIG>
<SYNTAX DIG
	WITH ;"REALLY THROUGH?"
	OBJECT  (ON-GROUND IN-ROOM)
	= V-DIG>

<SYNTAX DISEMBARK OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM)
	= V-DISEMBARK>

<SYNTAX DRINK
	OBJECT (FIND DRINKBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-DRINK>
<SYNONYM DRINK IMBIBE SWALLOW>

<SYNTAX DROP OBJECT (HELD MANY HAVE) = V-DROP ;*>
<SYNTAX DROP OBJECT (HELD MANY HAVE) DOWN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY HAVE) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNONYM DROP RELEASE>

<SYNTAX EAT
	OBJECT (FIND FOODBIT) (HELD CARRIED ON-GROUND IN-ROOM MANY)
	= V-EAT>
<SYNONYM EAT BITE TASTE>

<SYNTAX ENTER = V-ENTER>
<SYNTAX ENTER OBJECT = V-THROUGH>
<SYNTAX EXIT = V-EXIT>
<SYNTAX EXIT OBJECT = V-EXIT>

<SYNTAX EXAMINE OBJECT = V-EXAMINE PRE-EXAMINE>
<SYNTAX EXAMINE IN OBJECT (HELD CARRIED IN-ROOM ON-GROUND MANY) 
		= V-LOOK-INSIDE>
<SYNTAX EXAMINE ON OBJECT (HELD CARRIED IN-ROOM ON-GROUND MANY)
		= V-LOOK-INSIDE>
<SYNTAX EXAMINE OBJECT ON OBJECT = V-EXAMINE PRE-EXAMINE>
<SYNONYM EXAMINE DESCRIBE ANALYZE>

<SYNTAX WHY = V-WHY>

<SYNTAX FIND OBJECT
	= V-FIND>
<SYNONYM FIND WHERE SEEK SEE>

<SYNTAX FIRE OBJECT WITH OBJECT (FIND WEAPONBIT) (HELD) = V-SZAP PRE-SZAP>
<SYNTAX FIRE OBJECT = V-ZAP PRE-ZAP>
<SYNTAX FIRE OBJECT (FIND WEAPONBIT) (HELD)
	AT OBJECT = V-ZAP>
<SYNONYM FIRE ZAP BLAST SHOOT BURN>

<SYNTAX FOLLOW OBJECT = V-FOLLOW>
<SYNONYM FOLLOW PURSUE CHASE>

<SYNTAX FLY = V-FLY>
<SYNTAX FLY OBJECT = V-FLY>

<SYNTAX GIVE
	OBJECT (MANY HELD HAVE ;CARRIED ;ON-GROUND ;IN-ROOM)
	TO
	OBJECT (FIND VICBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<SYNTAX GIVE
	OBJECT (FIND VICBIT) (ON-GROUND)
	OBJECT (MANY HELD HAVE)
	= V-SGIVE PRE-SGIVE>
<SYNONYM GIVE HAND DONATE OFFER FEED>

<SYNTAX HELLO = V-HELLO ;*>
<SYNTAX HELLO OBJECT = V-HELLO>
<SYNONYM HELLO HI>

<SYNTAX HINT = V-HINT>
<SYNONYM HINT HELP>

<SYNTAX BLOW OUT OBJECT = V-LAMP-OFF>

<SYNTAX IMPOSSIBLE = V-IMPOSSIBLE>

<SYNTAX CONFIGURE = V-CONFIGURE>
<SYNONYM CONFIGURE SETUP CUSTOM>

<SYNTAX JUMP = V-LEAP>
<SYNTAX JUMP OVER OBJECT = V-LEAP>
<SYNTAX JUMP ACROSS OBJECT = V-LEAP>
<SYNTAX JUMP IN OBJECT = V-LEAP>
<SYNTAX JUMP FROM OBJECT = V-LEAP>
<SYNTAX JUMP OFF OBJECT = V-LEAP>
<SYNONYM JUMP LEAP>

<SYNTAX KICK OBJECT = V-KICK>

<SYNTAX KILL OBJECT (FIND VILLAIN) (ON-GROUND IN-ROOM) = V-KILL>
<SYNTAX KILL
	OBJECT (FIND VILLAIN) (ON-GROUND IN-ROOM)
	WITH
	OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE)
	= V-KILL>
<SYNONYM KILL MURDER SLAY DISPATCH STAB>

<SYNTAX KISS OBJECT (FIND VILLAIN) (ON-GROUND IN-ROOM) = V-KISS>

<SYNTAX KNOCK AT OBJECT = V-KNOCK ;*>
<SYNTAX KNOCK ON OBJECT = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND VICBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNONYM KNOCK RAP>

<SYNTAX LEAVE = V-LEAVE>
<SYNTAX LEAVE OBJECT = V-DROP>

<SYNTAX LISTEN = V-LISTEN PRE-LISTEN>
<SYNTAX LISTEN TO OBJECT = V-LISTEN PRE-LISTEN>
<SYNTAX LISTEN FOR OBJECT = V-LISTEN PRE-LISTEN>
<SYNTAX LISTEN AT OBJECT = V-LISTEN PRE-LISTEN>

<SYNTAX LOCATION = V-REPORT-LOC>

<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK AROUND OBJECT (FIND RMUNGBIT) = V-LOOK>
<SYNTAX LOOK AT OBJECT (HELD CARRIED ON-GROUND IN-ROOM MANY) = V-EXAMINE PRE-EXAMINE>
<SYNTAX LOOK WITH OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK ON OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK UNDER OBJECT = V-LOOK-UNDER>
<SYNTAX LOOK BEHIND OBJECT = V-LOOK-BEHIND>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM MANY) = V-LOOK-INSIDE>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM MANY) WITH OBJECT = V-LOOK-SAFELY>
<SYNTAX LOOK AT OBJECT (HELD CARRIED ON-GROUND IN-ROOM MANY) WITH OBJECT = V-LOOK-SAFELY>
<SYNTAX LOOK FOR OBJECT = V-FIND>
<SYNONYM LOOK L STARE GAZE>

<SYNTAX SEARCH OBJECT = V-SEARCH>
<SYNTAX SEARCH IN OBJECT = V-SEARCH>
<SYNTAX SEARCH FOR OBJECT = V-FIND>
<SYNTAX SEARCH WITH OBJECT = V-SEARCH> ;"THROUGH"

<SYNONYM SEARCH RUMMAGE SORT SIFT>

<SYNTAX LOWER OBJECT = V-LOWER>

<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-MOVE>
<SYNTAX MOVE OBJECT ONTO OBJECT = V-MOVE PRE-MOVE>
<SYNTAX MOVE OBJECT TO OBJECT = V-MOVE PRE-MOVE>
<SYNONYM MOVE>

<SYNTAX PLAY OBJECT = V-PLAY>

<SYNTAX POINT OBJECT (HELD CARRIED HAVE) AT OBJECT (ON-GROUND IN-ROOM)
	= V-POINT>
<SYNONYM POINT AIM>

<SYNTAX PULL OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-MOVE ; *>
<SYNTAX PULL ON OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-MOVE>
<SYNTAX PULL OBJECT OUT OBJECT (FIND CONTBIT) = V-TAKE PRE-TAKE>
<SYNTAX PULL OBJECT TO OBJECT = V-MOVE-ROBOT-TO-LOC>
<SYNONYM PULL TUG YANK DRAG>

<SYNTAX DESTROY
	OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH
	OBJECT (HELD CARRIED)
	= V-MUNG PRE-MUNG>
<SYNTAX DESTROY
	DOWN
	OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH
	OBJECT (HELD CARRIED)
	= V-MUNG PRE-MUNG>
<SYNONYM DESTROY DAMAGE BREAK BLOCK SMASH>

<SYNTAX OPEN
	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN ;*>
<SYNTAX OPEN
	UP
	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN ;*>
<SYNTAX OPEN
	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH
	OBJECT (FIND TOOLBIT) (ON-GROUND IN-ROOM HELD CARRIED)
	= V-OPEN>
<SYNTAX OPEN OBJECT (FIND CONTBIT DOORBIT) ON OBJECT (FIND VICBIT) = V-OPEN>
<SYNTAX OPEN OBJECT (FIND CONTBIT DOORBIT) IN OBJECT (FIND VICBIT) = V-OPEN>

<SYNTAX PICK OBJECT = V-PICK>
<SYNTAX PICK OBJECT WITH OBJECT = V-PICK>

<SYNTAX PICK UP
	OBJECT (FIND TAKEBIT)
	       (ON-GROUND MANY)
	= V-TAKE PRE-TAKE>

<SYNTAX PLUG IN OBJECT (FIND RMUNGBIT) = V-PLUGIN>
<SYNTAX PLUG TO OBJECT = V-PLUGIN>
<SYNTAX PLUG OBJECT IN OBJECT = V-PLUGIN>
<SYNTAX PLUG OBJECT INTO OBJECT = V-PLUGIN>
<SYNONYM PLUG LINK>
<SYNTAX UNPLUG = V-UNPLUG>
<SYNTAX UNPLUG FROM OBJECT = V-UNPLUG>


<SYNTAX POKE
	OBJECT (FIND VILLAIN) (ON-GROUND IN-ROOM)
	WITH
	OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE)
	= V-MUNG PRE-MUNG>
<SYNONYM POKE JAB BLIND>

<SYNTAX PUSH OBJECT = V-PUSH>
<SYNTAX PUSH ON OBJECT = V-PUSH>
<SYNTAX PUSH OFF OBJECT = V-PUSH>
<SYNTAX PUSH AGAINST OBJECT = V-PUSH>
<SYNTAX PUSH OBJECT UNDER OBJECT = V-PUT-UNDER>
<SYNTAX PUSH OBJECT UP OBJECT = V-PUSH-UP>
<SYNTAX PUSH OBJECT ONTO OBJECT = V-PUSH-UP>
<SYNONYM PUSH PRESS>

<SYNTAX PUT OBJECT (HELD MANY HAVE) IN OBJECT = V-PUT PRE-PUT ;*>
<SYNTAX PUT OBJECT (HELD MANY HAVE) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT DOWN OBJECT (HELD MANY HAVE) = V-DROP>
<SYNTAX PUT OBJECT (HELD MANY HAVE) UNDER OBJECT = V-PUT-UNDER> 
<SYNTAX PUT ON OBJECT (FIND WEARABLEBIT) (HAVE) = V-WEAR>
<SYNTAX PUT OBJECT (HELD HAVE) AGAINST OBJECT = V-PUT-AGAINST>
<SYNTAX PUT OBJECT (HELD HAVE) AT OBJECT = V-PUT-AGAINST>
<SYNTAX PUT OBJECT (HELD HAVE) BY OBJECT = V-PUT-AGAINST>
<SYNTAX PUT OBJECT (HELD HAVE) OVER OBJECT = V-PUT-AGAINST>
<SYNONYM PUT POSITION STUFF INSERT PLACE>

<SYNTAX QUERY OBJECT = V-QUERY>
<SYNTAX QUERY ABOUT OBJECT = V-QUERY>
<SYNTAX QUERY ON OBJECT = V-QUERY>
<SYNONYM QUERY ASK WHAT WHATS>

<SYNTAX RAISE OBJECT = V-RAISE ;*>
<SYNTAX RAISE UP OBJECT = V-RAISE>
<SYNTAX RAISE OBJECT ONTO OBJECT = V-RAISE>
<SYNONYM RAISE LIFT>

<SYNTAX RAPE OBJECT (FIND VICBIT) = V-RAPE>
<SYNONYM RAPE MOLEST>

<SYNTAX REACH IN OBJECT (FIND CONTBIT) = V-REACH>
<SYNTAX REACH FOR OBJECT = V-REACH-FOR>
<SYNTAX REACH UP OBJECT = V-REACH>
<SYNTAX REACH ON OBJECT = V-REACH>
<SYNTAX REACH ONTO OBJECT = V-REACH>

<SYNTAX READ
	OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-READ ; *>
<SYNTAX READ
	OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH
	OBJECT
	= V-READ>
<SYNONYM READ SKIM>

<SYNTAX REPAIR OBJECT = V-REPAIR>
<SYNONYM REPAIR FIX>

<SYNTAX REPLACE OBJECT WITH OBJECT (HAVE) = V-REPLACE PRE-REPLACE>
<SYNTAX REPLACE OBJECT (HAVE) FOR OBJECT = V-REPLACE PRE-REPLACE>
<SYNONYM REPLACE SWAP EXCHANGE TRADE>
       
<SYNTAX RUB OBJECT = V-RUB>
<SYNTAX RUB OBJECT WITH OBJECT = V-RUB>
<SYNONYM RUB PAT PET>

<SYNTAX SCRIPT = V-SCRIPT>
<SYNTAX UNSCRIPT = V-UNSCRIPT>

<SYNTAX SHAKE OBJECT (HAVE) = V-SHAKE>

<SYNTAX SLIDE ON OBJECT = V-LAMP-ON>
<SYNTAX SLIDE OFF OBJECT = V-LAMP-OFF>
<SYNTAX SLIDE OBJECT UNDER OBJECT = V-PUT-UNDER>

<SYNTAX SKIP = V-SKIP>
<SYNONYM SKIP HOP>

<SYNTAX SMELL OBJECT = V-SMELL>
<SYNONYM SMELL SNIFF>

<SYNTAX STEP ON OBJECT = V-STEP-ON>
<SYNTAX STEP ONTO OBJECT = V-STEP-ON>

<SYNTAX STRIKE
	OBJECT (FIND VICBIT) (ON-GROUND IN-ROOM)
	WITH
	OBJECT (FIND WEAPONBIT) (HELD CARRIED ON-GROUND IN-ROOM HAVE)
	= V-ATTACK>
<SYNTAX STRIKE
	OBJECT (FIND VICBIT) (ON-GROUND IN-ROOM)
	= V-ATTACK ;*>

<SYNTAX SWIM = V-SWIM>
<SYNTAX SWIM IN OBJECT = V-SWIM>
<SYNONYM SWIM BATHE WADE>

<SYNTAX TAKE
	OBJECT (FIND TAKEBIT) (ON-GROUND MANY)
	= V-TAKE PRE-TAKE ;*>
<SYNTAX TAKE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<SYNTAX TAKE OUT OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX TAKE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX TAKE
	OBJECT (FIND TAKEBIT) (CARRIED IN-ROOM)
	OUT
	OBJECT
	= V-TAKEOUT>
<SYNTAX TAKE
	OBJECT (FIND TAKEBIT) (CARRIED IN-ROOM)
	OFF
	OBJECT
	= V-TAKE PRE-TAKE>
<SYNTAX TAKE
	OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED)
	FROM
	OBJECT
	= V-TAKEOUT>
<SYNTAX TAKE OFF OBJECT (HELD CARRIED) = V-TAKE-OFF>
<SYNTAX TAKE UP OBJECT (FIND RMUNGBIT) = V-STAND>	;"GET UP"
<SYNTAX TAKE DOWN OBJECT (FIND FURNITURE) = V-GET-OFF>
<SYNONYM TAKE STEAL GET HOLD CARRY GRASP>

<SYNTAX DETACH OBJECT (FIND WEARBIT) (HELD CARRIED) = V-TAKE-OFF>

<SYNTAX REMOVE OBJECT = V-REMOVE>
<SYNTAX REMOVE OBJECT FROM OBJECT = V-TAKE PRE-TAKEOUT>
<SYNTAX REMOVE OBJECT WITH OBJECT = V-REMOVE>


<SYNTAX $TELL OBJECT (MANY ON-GROUND) (FIND VICBIT) = V-$TELL>

<SYNTAX SMILE AT OBJECT (FIND VILLAIN) = V-SMILE>
<SYNTAX SMILE = V-SMILE>
<SYNONYM SMILE GRIN>

<SYNTAX THROW
	OBJECT (HELD CARRIED HAVE)
	AT
	OBJECT (ON-GROUND IN-ROOM)
	= V-THROW ;*>
<SYNTAX THROW
	OBJECT (HELD CARRIED HAVE)
	WITH
	OBJECT (ON-GROUND IN-ROOM)
	= V-THROW>

<SYNTAX THROW OBJECT (HELD CARRIED HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) ON OBJECT = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) OVER OBJECT = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) = V-THROW>
<SYNONYM THROW HURL CHUCK TOSS>

<SYNTAX TOUCH OBJECT (ON-GROUND IN-ROOM MANY) = V-TOUCH>
<SYNONYM TOUCH FEEL>

<SYNTAX TURN OBJECT (FIND TURNBIT) = V-TURN>
<SYNTAX TURN ON
	OBJECT  (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LAMP-ON>
<SYNTAX TURN OFF
	OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LAMP-OFF>
<SYNTAX TURN
	OBJECT (ON-GROUND IN-ROOM)
	TO
	OBJECT
	= V-SET>
<SYNONYM TURN FLIP SHUT>

<SYNTAX ACTIVATE OBJECT = V-LAMP-ON>

<SYNTAX SET OBJECT (ON-GROUND IN-ROOM) TO OBJECT = V-SET>
<SYNTAX SET OBJECT (ON-GROUND IN-ROOM) AT OBJECT = V-SET>
<SYNTAX SET OBJECT (ON-GROUND IN-ROOM) FOR OBJECT = V-SET> 
<SYNONYM SET>

<SYNTAX WAIT = V-WAIT>

<SYNTAX WAKE OBJECT (FIND VICBIT) (ON-GROUND IN-ROOM) = V-ALARM ;*>
<SYNTAX WAKE UP OBJECT (FIND VICBIT) (ON-GROUND IN-ROOM) = V-ALARM>
<SYNONYM WAKE AWAKE SURPRISE STARTLE>

<SYNTAX WALK OBJECT = V-WALK>
<SYNTAX WALK IN OBJECT = V-THROUGH>
<SYNTAX WALK WITH OBJECT = V-THROUGH>
<SYNTAX WALK AROUND OBJECT = V-WALK-AROUND>
<SYNTAX WALK UP OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX WALK DOWN OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX WALK TO OBJECT = V-WALK-TO>
<SYNONYM WALK GO RUN PROCEED TRAVEL>

<SYNTAX STOP = V-STOP>
<SYNTAX STOP OBJECT = V-STOP>
<SYNONYM STOP HALT>

<SYNTAX WAVE OBJECT (HELD CARRIED) = V-WAVE>
<SYNTAX WAVE OBJECT (HELD CARRIED) AT OBJECT = V-WAVE>
<SYNONYM WAVE BRANDISH>

<SYNTAX WEAR
	OBJECT (FIND WEARABLEBIT) (HAVE)
	= V-WEAR>
<SYNONYM WEAR DON INSTALL>

<SYNTAX YELL = V-YELL>
<SYNONYM YELL SCREAM SHOUT>

<SYNTAX ZORK = V-ZORK>

<SYNTAX YES = V-YES>
<SYNTAX YES OBJECT = V-YES>
<SYNONYM YES Y CONFIRM AFFIRMATIVE>

<SYNTAX NO = V-NO>
<SYNONYM NO>

;"Simple questions"

;"<SYNTAX WHAT ...> WHAT is a synonym of EXAMINE"

;"<SYNTAX WHERE ...> WHERE is a synonym of FIND"

<SYNTAX IS OBJECT IN OBJECT = V-IS-IN>
<SYNTAX IS OBJECT ON OBJECT = V-IS-IN>

<SYNTAX ARR = V-ALL-REPORT>
<SYNTAX ARL = V-ALL-REPORT-LOC>

<SYNTAX REPORT = V-REPORT>
<SYNTAX REPORT OBJECT = V-REPORT-LOC>
<SYNTAX REPORT ON OBJECT = V-REPORT-LOC>
<SYNTAX RL = V-REPORT-LOC>
<SYNONYM REPORT R>

%<COND (<GASSIGNED? ZILCH> T) (T '<SYNTAX Z = V-ESCAPE>)>
