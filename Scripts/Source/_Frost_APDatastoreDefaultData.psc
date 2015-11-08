scriptname _Frost_APDatastoreDefaultData extends Quest

import _FrostInternal

function SetDefaults_Body()
	processed_count = 0
	int TOTAL_COUNT = 612
	string PROGRESS = "Frost_BodyDatastoreUpdate"
	
	;####################
	;
	;      Skyrim
	;
	;####################

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80145___Skyrim.esm", 1, 60, 0) ; ArmorHideCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101736___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101737___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101738___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101739___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101740___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101741___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101742___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101743___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101744___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500027___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709777___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709778___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101745___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101746___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101747___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500028___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709780___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709781___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101748___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101749___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101750___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1071435___Skyrim.esm", 1, 30, 0) ; ArmorBanditCuirass1 		;Shirtless
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1071437___Skyrim.esm", 1, 40, 0) ; ArmorBanditCuirass2 		;Shirtless / shawl
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1071439___Skyrim.esm", 1, 125, 17) ; ArmorBanditCuirass3 	;Sleeveless
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "455571___Skyrim.esm", 1, 160, 35) ; ArmorBanditCuirass 		;Full
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111522___Skyrim.esm", 1, 75, 0) ; ArmorStuddedCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707731___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709843___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709844___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707732___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709845___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709846___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "221598___Skyrim.esm", 1, 125, 91) ; ArmorLeatherCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105605___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105606___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105607___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105608___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105609___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105610___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105611___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105612___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105613___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737844___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737845___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737846___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105614___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105615___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105616___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737847___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737848___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737849___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105617___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105618___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105619___Skyrim.esm", 1, 125, 91) ; EnchArmorLeatherCuirassRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "562851___Skyrim.esm", 1, 125, 72) ; ArmorElvenCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1072914___Skyrim.esm", 1, 125, 72) ; ArmorElvenLightCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80170___Skyrim.esm", 1, 125, 72) ; ArmorElvenGildedCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101690___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101691___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101692___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101693___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101694___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101695___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101696___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101697___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101698___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778180___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778181___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778301___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101699___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101700___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101701___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778182___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778183___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778302___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101702___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101703___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101704___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101705___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101706___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101715___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101707___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101708___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101716___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101709___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101710___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101717___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038874___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038875___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038876___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844205___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844206___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844207___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101711___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101712___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101718___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844208___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844209___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "844210___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassLightArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101713___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101714___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101719___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038877___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038878___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038879___Skyrim.esm", 1, 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111523___Skyrim.esm", 1, 110, 35) ; ArmorScaledCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111524___Skyrim.esm", 1, 110, 54) ; ArmorScaledCuirassB
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105635___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105636___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105637___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105638___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105639___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105640___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105641___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105642___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105643___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873461___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873462___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873463___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105644___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105645___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105646___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873464___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873465___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873466___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105647___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105648___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105649___Skyrim.esm", 1, 110, 35) ; EnchArmorScaledCuirassRestoration04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80185___Skyrim.esm", 1, 125, 72) ; ArmorGlassCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101720___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101721___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101722___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101723___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101724___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101725___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101726___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101728___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101729___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041111___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041112___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041113___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873345___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873346___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873347___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101730___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101731___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101732___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873348___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873349___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873350___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassLightArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101733___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101734___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101735___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041116___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassStaminaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041117___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041118___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassCuirassStaminaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101727___Skyrim.esm", 1, 125, 72) ; EnchArmorGlassVsDestruction04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80190___Skyrim.esm", 1, 140, 109) ; ArmorDragonscaleCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101646___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101647___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101648___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101649___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101650___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101651___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101652___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101653___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101654___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041120___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041121___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041122___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883130___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883131___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883132___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassHealth06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101655___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101656___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101657___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883133___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883134___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassLightArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883135___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassLightArmor06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101658___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101660___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101659___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041123___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041124___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041125___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "77385___Skyrim.esm", 1, 75, 35) ; ArmorIronCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101752___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101753___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101755___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101754___Skyrim.esm", 1, 75, 35) ; EnchArmorIronArmorAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101756___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101757___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101758___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101759___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101760___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101761___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "300302___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709987___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709988___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500008___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHeavyArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709989___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709990___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101762___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101763___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101764___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101765___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101766___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101767___Skyrim.esm", 1, 75, 35) ; EnchArmorIronCuirassRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80200___Skyrim.esm", 1, 90, 35) ; ArmorIronBandedCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101768___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101769___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101770___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101771___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101772___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101773___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101774___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101775___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101776___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707741___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709919___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709920___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707742___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709921___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709922___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101777___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101778___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101779___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101780___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101781___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101782___Skyrim.esm", 1, 90, 35) ; EnchArmorIronBandedCuirassRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80210___Skyrim.esm", 1, 125, 54) ; ArmorSteelCuirassA
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1011490___Skyrim.esm", 1, 125, 54) ; ArmorSteelCuirassB
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105650___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105651___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105652___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105653___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105654___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105655___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105656___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105657___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105658___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741541___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741542___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741543___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741544___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHeavyArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741545___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741546___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105659___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105660___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105661___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105662___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105663___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105664___Skyrim.esm", 1, 125, 54) ; EnchArmorSteelCuirassRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80205___Skyrim.esm", 1, 140, 72) ; ArmorDwarvenCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101661___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571002___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101662___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101663___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101664___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101665___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101666___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101667___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101668___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111576___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111577___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111578___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111579___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111631___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111680___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101669___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101670___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101671___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101672___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101673___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101674___Skyrim.esm", 1, 140, 72) ; EnchArmorDwarvenCuirassRestoration04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80220___Skyrim.esm", 1, 125, 72) ; ArmorSteelPlateCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105665___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105666___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105667___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105668___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105669___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105670___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105671___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105672___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105673___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111628___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111629___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111630___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111686___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111950___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111957___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105674___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105675___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105676___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105677___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105678___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105679___Skyrim.esm", 1, 125, 72) ; EnchArmorSteelPlateCuirassRestoration04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80215___Skyrim.esm", 1, 175, 54) ; ArmorOrcishCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105620___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105621___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105622___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105623___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105624___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105625___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105626___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105627___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105628___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849858___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849859___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849860___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849861___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849862___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849863___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105629___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105630___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105631___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105632___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105633___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105634___Skyrim.esm", 1, 175, 54) ; EnchArmorOrcishCuirassRestoration05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80225___Skyrim.esm", 1, 140, 54) ; ArmorEbonyCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101675___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101676___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101677___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101678___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101679___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101680___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101681___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101682___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101688___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849975___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849976___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849977___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041129___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealthRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041130___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealthRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041131___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHealthRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849978___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849979___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849980___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101683___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101684___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101689___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101685___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101686___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101687___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041132___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassStaminaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041133___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041134___Skyrim.esm", 1, 140, 54) ; EnchArmorEbonyCuirassStaminaRate05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80230___Skyrim.esm", 1, 140, 109) ; ArmorDragonplateCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101631___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101644___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101632___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101633___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101634___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101635___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101636___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101645___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101637___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883238___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883239___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883240___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealth06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041141___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealthRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041142___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealthRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041143___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHealthRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883241___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883242___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883243___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101638___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101639___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101640___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101641___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101642___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101643___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041144___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041145___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassStaminaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041146___Skyrim.esm", 1, 140, 109) ; EnchArmorDragonplateCuirassStaminaRate06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80235___Skyrim.esm", 1, 160, 91) ; ArmorDaedricCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101616___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101617___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101618___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101619___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101620___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101621___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101622___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101623___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101624___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041150___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041151___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041152___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883352___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883353___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883354___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHealth06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883355___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883356___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883357___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassHeavyArmor06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101625___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101626___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101627___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101628___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101629___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1101630___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041147___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041148___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassStaminaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041149___Skyrim.esm", 1, 160, 91) ; EnchArmorDaedricCuirassStaminaRate06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "586138___Skyrim.esm", 1, 30, 0) ; ClothesPrisonerRags
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "248318___Skyrim.esm", 1, 30, 0) ; ClothesPrisonerTunic
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "307851___Skyrim.esm", 1, 125, 54) ; ArmorBladesCuirass
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "830997___Skyrim.esm", 1, 175, 72) ; ArmorCompanionsCuirass
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1108827___Skyrim.esm", 1, 125, 109) ; DBArmorWornPlayable
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "99208___Skyrim.esm", 1, 110, 35) ; ArmorDraugrCuirass
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136478___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassFalkreath
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136480___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassHjaalmarch
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136456___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassMarkarth
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136455___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassRiften
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "819035___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassSolitude
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136485___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassThePale
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136461___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassWhiterun
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136482___Skyrim.esm", 1, 110, 54) ; ArmorGuardCuirassWinterhold
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "683387___Skyrim.esm", 1, 110, 54) ; ArmorStormcloakCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710048___Skyrim.esm", 1, 120, 72) ; ArmorStormcloakCuirassSleeves
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "79573___Skyrim.esm", 1, 125, 72) ; ArmorImperialCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81625___Skyrim.esm", 1, 125, 72) ; ArmorImperialLightCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81624___Skyrim.esm", 1, 125, 72) ; ArmorImperialStuddedCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707776___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709865___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709866___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707777___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHeavyArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709867___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709868___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709872___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialCuirassResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759580___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759581___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759582___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759583___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759584___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759585___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialLightCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289716___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289717___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289718___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289719___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289720___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289721___Skyrim.esm", 1, 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "551294___Skyrim.esm", 1, 140, 35) ; ArmorStormcloakBearCuirass 		@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1099416___Skyrim.esm", 1, 110, 35) ; ClothesThalmorRobesHooded 		@MULTI
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867011___Skyrim.esm", 1, 125, 109) ; ArmorThievesGuildCuirassPlayer
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1082692___Skyrim.esm", 1, 125, 109) ; ArmorLinweCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867020___Skyrim.esm", 1, 125, 109) ; ArmorThievesGuildCuirassPlayerImproved
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "931287___Skyrim.esm", 1, 125, 109) ; ArmorThievesGuildLeaderCuirass
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "862276___Skyrim.esm", 1, 125, 109) ; DBArmor
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "925461___Skyrim.esm", 1, 125, 109) ; DBArmorSP
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "383878___Skyrim.esm", 1, 128, 106) ; ArmorNightingaleCuirassPlayer01  @MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035278___Skyrim.esm", 1, 128, 106) ; ArmorNightingaleCuirassPlayer02 @MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035279___Skyrim.esm", 1, 128, 106) ; ArmorNightingaleCuirassPlayer03 @MULTI

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "962512___Skyrim.esm", 1, 60, 0) ; MS02ForswornArmor
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "888144___Skyrim.esm", 1, 60, 0) ; ForswornCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "379902___Skyrim.esm", 1, 140, 72) ; GeneralTulliusArmor
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "868000___Skyrim.esm", 1, 140, 72) ; ArmorPenitusCuirass
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "754635___Skyrim.esm", 1, 60, 0) ; ArmorFalmerCuirass

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62455___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorDawnguardCuirassHeavy1
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62458___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorDawnguardCuirassHeavy2
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62459___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorDawnguardCuirassLight1
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62466___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorDawnguardCuirassLight2
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62468___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorDawnguardCuirassLight3

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59614___Dawnguard.esm", 1, 125, 54) ; DLC1ArmorFalmerHardenedCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "9193___Dawnguard.esm", 1, 125, 54) ; DLC1ArmorFalmerHeavyCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "82631___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorVampireArmorGray
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "102898___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorVampireArmorGrayLight
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "102899___Dawnguard.esm", 1, 125, 91) ; DLC1ArmorVampireArmorRed

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "46555___Dawnguard.esm", 1, 125, 72) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "103621___Dawnguard.esm", 1, 125, 72) ; DLC1ArmorVampireArmorValerica	@MULTI

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "51222___Dawnguard.esm", 1, 140, 72) ; DLC1IvoryCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "51923___Dawnguard.esm", 1, 140, 72) ; DLC1IvoryCuirassAlternate

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "84997___Dawnguard.esm", 1, 125, 72) ; DLC1LD_ArmorKatria

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59883___Dawnguard.esm", 1, 30, 0) ; ClothesPrisonerRagsBloody

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118175___Dragonborn.esm", 1, 190, 91) ; DLC2ArmorStalhrimHeavyCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168460___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168461___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168462___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168463___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168464___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168465___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168466___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168467___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168468___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168469___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168470___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168472___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168473___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168474___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168471___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168475___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168476___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168477___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168478___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168479___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168480___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168481___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168482___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168483___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168484___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168485___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168486___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118178___Dragonborn.esm", 1, 190, 91) ; DLC2ArmorStalhrimLightCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168101___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168102___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168103___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168104___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168105___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168106___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168107___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168108___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168109___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168110___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168111___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168112___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168113___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168114___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168115___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168116___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168117___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168118___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168119___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168120___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168121___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168122___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168123___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168124___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168125___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168126___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168127___Dragonborn.esm", 1, 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate05

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118167___Dragonborn.esm", 1, 190, 72) ; DLC2ArmorNordicHeavyCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168368___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168369___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168370___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168371___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168372___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168373___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168374___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168375___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168376___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168377___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168378___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168379___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168380___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168381___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168382___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168383___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168384___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168385___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168386___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168387___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168388___Dragonborn.esm", 1, 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration05

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "226660___Dragonborn.esm", 1, 125, 54) ; DLC2ArmorBonemoldCuirassGuard
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "226659___Dragonborn.esm", 1, 125, 54) ; DLC2ArmorBonemoldCuirassVariant01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118163___Dragonborn.esm", 1, 125, 54) ; DLC2ArmorBonemoldCuirassVariant02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "240422___Dragonborn.esm", 1, 135, 72) ; DLC2ArmorBonemoldImprovedCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165077___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165078___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165079___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165080___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165081___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165082___Dragonborn.esm", 1, 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor03

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118154___Dragonborn.esm", 1, 110, 72) ; DLC2ArmorChitinHeavyCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168291___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168292___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168293___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168294___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168295___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168296___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168297___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168298___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168299___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168300___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168301___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168302___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168303___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168304___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168305___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168306___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168307___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168308___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168309___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168310___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168311___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration04

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118151___Dragonborn.esm", 1, 110, 72) ; DLC2ArmorChitinLightCuirass
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167920___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167921___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167922___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167923___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167924___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167925___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167926___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167927___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167928___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167929___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167934___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167930___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167931___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167932___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167935___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167936___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167937___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167938___Dragonborn.esm", 1, 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration04

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "233742___Dragonborn.esm", 1, 190, 54) ; DLC2ClothesSkaalCoat
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118185___Dragonborn.esm", 1, 190, 54) ; DLC2SkaalVillagerOutfit

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168620___Dragonborn.esm", 1, 110, 72) ; DLC2MoragTongCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "121751___Dragonborn.esm", 1, 110, 35) ; DLC2dunKolbjornCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147483___Dragonborn.esm", 1, 190, 91) ; DLC2dunHaknirArmorCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "175411___Dragonborn.esm", 1, 125, 109) ; DLC2TGArmorVariantCuirass

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118186___Dragonborn.esm", 1, 110, 35) ; DLC2DarkElfOutfit 		@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "225381___Dragonborn.esm", 1, 110, 35) ; DLC2DarkElfOutfitBlue	@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "225382___Dragonborn.esm", 1, 110, 35) ; DLC2DarkElfOutfitRed	@MULTI


	;##############################
	;
	;    Immersive Armor
	;
	;##############################

	SendEvent_ProgressUpdate(PROGRESS, TOTAL_COUNT, TOTAL_COUNT)
endFunction

function SetDefaults_Hands()
	processed_count = 0
	int TOTAL_COUNT = 477
	string PROGRESS = "Frost_HandsDatastoreUpdate"

	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80146___Skyrim.esm", 2, 3, 0) ; ArmorHideGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571007___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571008___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571009___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500041___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsLockpicking01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709805___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709806___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500042___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709807___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709808___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500043___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709809___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709810___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500044___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsPickpocket01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709811___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709812___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500046___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709815___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709816___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500047___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709817___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709818___Skyrim.esm", 2, 3, 0) ; EnchArmorHideGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "455579___Skyrim.esm", 2, 12, 6) ; ArmorBanditGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80161___Skyrim.esm", 2, 5, 6) ; ArmorLeatherGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571019___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571020___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571021___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741453___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsLockpicking01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741454___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741455___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741456___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741457___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741458___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741459___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741460___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741461___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741462___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsPickpocket01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741463___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741464___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741468___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741469___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741470___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741471___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741472___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741473___Skyrim.esm", 2, 5, 6) ; EnchArmorLeatherGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80156___Skyrim.esm", 2, 9, 14) ; ArmorElvenGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1072915___Skyrim.esm", 2, 9, 14) ; ArmorElvenLightGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570998___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570999___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571000___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778202___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778203___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778312___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778204___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778205___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778313___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778206___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778207___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778314___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778208___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778209___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778315___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778212___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778213___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778317___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778214___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778215___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778318___Skyrim.esm", 2, 9, 14) ; EnchArmorElvenGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111520___Skyrim.esm", 2, 12, 6) ; ArmorScaledGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289744___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289745___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289746___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289766___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289767___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289768___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289769___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289770___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289771___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289913___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289914___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289916___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289917___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289919___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289920___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "289950___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290010___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290026___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290035___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290036___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290037___Skyrim.esm", 2, 12, 6) ; EnchArmorScaledGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80186___Skyrim.esm", 2, 12, 14) ; ArmorGlassGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873367___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873368___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873369___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036017___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036018___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036019___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsLockpicking05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873388___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873389___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873390___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873391___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873392___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873393___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036020___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036021___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1036022___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsPickpocket05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873397___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873398___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873399___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873403___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873404___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873405___Skyrim.esm", 2, 12, 14) ; EnchArmorGlassGauntletsTwoHanded05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80191___Skyrim.esm", 2, 15, 29) ; ArmorDragonscaleGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883152___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883153___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883154___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105777___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105778___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105779___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883173___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883174___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883175___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883176___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883177___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883178___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105774___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105775___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105776___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883182___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883183___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883184___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsSmithing06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883185___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883186___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883187___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "77382___Skyrim.esm", 2, 7, 6) ; ArmorIronGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "802022___Skyrim.esm", 2, 7, 6) ; FavorOrcsGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571016___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571017___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571018___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500012___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710011___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710012___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500014___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710013___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710014___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500018___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710019___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710020___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500020___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710021___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710022___Skyrim.esm", 2, 7, 6) ; EnchArmorIronGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80211___Skyrim.esm", 2, 12, 6) ; ArmorSteelGauntletsA
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1011491___Skyrim.esm", 2, 12, 6) ; ArmorSteelGauntletsB
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571025___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571026___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571027___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741566___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741579___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741580___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741567___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741581___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741582___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741569___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571028___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571029___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741570___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741585___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741586___Skyrim.esm", 2, 12, 6) ; EnchArmorSteelGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80206___Skyrim.esm", 2, 15, 21) ; ArmorDwarvenGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570995___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570996___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570997___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111611___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111612___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111613___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112469___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112470___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112471___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112481___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112482___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112486___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112487___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112488___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112490___Skyrim.esm", 2, 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80221___Skyrim.esm", 2, 15, 14) ; ArmorSteelPlateGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571033___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571034___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571035___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253739___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253772___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253794___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253798___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253799___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253803___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253811___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253812___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253813___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253814___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253815___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253816___Skyrim.esm", 2, 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80216___Skyrim.esm", 2, 21, 14) ; ArmorOrcishGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849880___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849881___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849882___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849901___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849902___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849903___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849904___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849905___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849906___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849910___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849911___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849912___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849913___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849914___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849915___Skyrim.esm", 2, 21, 14) ; EnchArmorOrcishGauntletsTwoHanded05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80226___Skyrim.esm", 2, 15, 14) ; ArmorEbonyGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849997___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849998___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849999___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850018___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850019___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850020___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850021___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850022___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850023___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850027___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850028___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850029___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850030___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850031___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850032___Skyrim.esm", 2, 15, 14) ; EnchArmorEbonyGauntletsTwoHanded05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80231___Skyrim.esm", 2, 15, 29) ; ArmorDragonplateGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883260___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883261___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883262___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883281___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883282___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883283___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883284___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883285___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883286___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsOneHanded06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883290___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883291___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883292___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsSmithing06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883293___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883294___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883295___Skyrim.esm", 2, 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80236___Skyrim.esm", 2, 18, 21) ; ArmorDaedricGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883374___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883375___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883376___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883395___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883396___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883397___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883398___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883399___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883400___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsOneHanded06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883404___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883405___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883406___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsSmithing06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883407___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883408___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsTwoHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883409___Skyrim.esm", 2, 18, 21) ; EnchArmorDaedricGauntletsTwoHanded06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105977___Skyrim.esm", 2, 0, 0) ; PrisonerCuffsPlayer
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "307853___Skyrim.esm", 2, 12, 14) ; ArmorBladesGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "847486___Skyrim.esm", 2, 21, 14) ; ArmorCompanionsGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "862275___Skyrim.esm", 2, 12, 29) ; DBArmorGloves
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1005953___Skyrim.esm", 2, 12, 29) ; DBArmorGlovesReward
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "925462___Skyrim.esm", 2, 12, 29) ; DBArmorGlovesSP
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1108830___Skyrim.esm", 2, 12, 29) ; DBArmorGlovesWornPlayable
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "355095___Skyrim.esm", 2, 9, 3) ; ArmorDraugrGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "683389___Skyrim.esm", 2, 21, 14) ; ArmorStormcloakGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "79572___Skyrim.esm", 2, 12, 14) ; ArmorImperialGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81626___Skyrim.esm", 2, 12, 14) ; ArmorImperialLightGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571010___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571011___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571012___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707782___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709877___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709878___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707784___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709881___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709882___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707785___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709883___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709884___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707789___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709891___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709892___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707790___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759623___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709894___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707793___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709899___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709900___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707794___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709901___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709902___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571013___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571014___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571015___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759598___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759599___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759600___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759604___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759605___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759606___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759607___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759608___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759609___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759616___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsLockpicking01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759617___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759618___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759619___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759620___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759621___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759622___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709893___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759624___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759625___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsPickpocket01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759626___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759627___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759631___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759632___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759633___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759634___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759635___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759636___Skyrim.esm", 2, 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "551299___Skyrim.esm", 2, 18, 14) ; ArmorStormcloakBearGauntlets

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "416691___Skyrim.esm", 2, 9, 3) ; ClothesThalmorGloves
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867012___Skyrim.esm", 2, 12, 29) ; ArmorThievesGuildGauntletsPlayer
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867021___Skyrim.esm", 2, 12, 29) ; ArmorThievesGuildGauntletsPlayerImproved
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "931288___Skyrim.esm", 2, 12, 29) ; ArmorThievesGuildLeaderGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1082693___Skyrim.esm", 2, 12, 29) ; ArmorLinweGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "383879___Skyrim.esm", 2, 12, 35) ; ArmorNightingaleGauntletsPlayer01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035280___Skyrim.esm", 2, 12, 35) ; ArmorNightingaleGauntletsPlayer02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035281___Skyrim.esm", 2, 12, 35) ; ArmorNightingaleGauntletsPlayer03

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "962514___Skyrim.esm", 2, 3, 6) ; MS02ForswornGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "888149___Skyrim.esm", 2, 3, 6) ; ForswornGauntlets

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "868011___Skyrim.esm", 2, 15, 21) ; ArmorPenitusGauntlets

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "83800___Dawnguard.esm", 2, 12, 14) ; DLC1ArmorDawnguardGauntletsHeavy
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62462___Dawnguard.esm", 2, 12, 14) ; DLC1ArmorDawnguardGauntletsLight

	;@TODO: Is 'heavy' same as regular Falmer?
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59615___Dawnguard.esm", 2, 5, 3) ; DLC1ArmorFalmerHardenedGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "9197___Dawnguard.esm", 2, 5, 3) ; DLC1ArmorFalmerHeavyGauntlets

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "107807___Dawnguard.esm", 2, 12, 21) ; DLC1ArmorVampireGauntlets

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "51223___Dawnguard.esm", 2, 15, 21) ; DLC1IvoryGauntlets

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118176___Dragonborn.esm", 2, 24, 14) ; DLC2ArmorStalhrimHeavyGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168487___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168488___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168489___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168490___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168491___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168492___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168493___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168494___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168495___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168496___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168497___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168498___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168499___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168500___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168501___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118181___Dragonborn.esm", 2, 24, 14) ; DLC2ArmorStalhrimLightGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168128___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168129___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168130___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168131___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168132___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168133___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168134___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168135___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168136___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168137___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168138___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168139___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168140___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168141___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168142___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168143___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168144___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168145___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168146___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168147___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168148___Dragonborn.esm", 2, 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118168___Dragonborn.esm", 2, 24, 21) ; DLC2ArmorNordicHeavyGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168389___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168390___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168391___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168392___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168393___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168394___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168395___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168396___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168397___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168398___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168399___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168400___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168401___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168402___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168403___Dragonborn.esm", 2, 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118164___Dragonborn.esm", 2, 12, 14) ; DLC2ArmorBonemoldGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "240418___Dragonborn.esm", 2, 15, 21) ; DLC2ArmorBonemoldImprovedGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165083___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165084___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165085___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165086___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165087___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165088___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165089___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165090___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165091___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165092___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165093___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165094___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165095___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165096___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165097___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165098___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165099___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165100___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165101___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165102___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165103___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165104___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165105___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165106___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165107___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165108___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165109___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165110___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165111___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165112___Dragonborn.esm", 2, 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118155___Dragonborn.esm", 2, 9, 14) ; DLC2ArmorChitinHeavyGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168312___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168313___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168314___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168315___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168316___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168317___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168318___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168319___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168320___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168321___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168322___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168323___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168324___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168325___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168326___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118152___Dragonborn.esm", 2, 9, 14) ; DLC2ArmorChitinLightGauntlets
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167939___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167940___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167941___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167942___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167943___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167944___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167945___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167946___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167947___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167948___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167949___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167950___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167951___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167952___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167953___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167954___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167955___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167956___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167957___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167958___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167959___Dragonborn.esm", 2, 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "233744___Dragonborn.esm", 2, 24, 14) ; DLC2ClothesSkaalGloves
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168621___Dragonborn.esm", 2, 9, 14) ; DLC2MoragTongGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "121753___Dragonborn.esm", 2, 9, 3) ; DLC2dunKolbjornGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147484___Dragonborn.esm", 2, 24, 14) ; DLC2dunHaknirArmorGauntlets
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "175410___Dragonborn.esm", 2, 12, 29) ; DLC2TGArmorVariantGloves

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "267721___Campfire.esm", 2, 21, 14) ; _Camp_ArmorSonsGauntlets

	SendEvent_ProgressUpdate(PROGRESS, TOTAL_COUNT, TOTAL_COUNT)
endFunction

function SetDefaults_Head()
	processed_count = 0
	int TOTAL_COUNT = 644
	string PROGRESS = "Frost_HeadDatastoreUpdate"

	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80147___Skyrim.esm", 3, 10, 14) ; ArmorHideHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570983___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570984___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570985___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500048___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709819___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709820___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500049___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709821___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709822___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500050___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709823___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709824___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500052___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709827___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709828___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500053___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709829___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709830___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500055___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709831___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709832___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500056___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709833___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709834___Skyrim.esm", 3, 10, 14) ; EnchArmorHideHelmetRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "455582___Skyrim.esm", 3, 45, 3) ; ArmorBanditHelmet
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80162___Skyrim.esm", 3, 35, 43) ; ArmorLeatherHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570989___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570990___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570991___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741474___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741475___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741476___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741477___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741478___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741479___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741480___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741481___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741482___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741495___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741496___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741497___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741498___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741499___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741500___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741501___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741502___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741503___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741483___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741484___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741485___Skyrim.esm", 3, 35, 43) ; EnchArmorLeatherHelmetRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80157___Skyrim.esm", 3, 30, 29) ; ArmorElvenHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1072916___Skyrim.esm", 3, 30, 29) ; ArmorElvenLightHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570980___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570981___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570982___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778216___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778217___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778319___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778218___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778219___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778320___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778220___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778221___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778321___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778224___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778225___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778323___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778226___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778227___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778324___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778228___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778229___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778325___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778230___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778231___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778326___Skyrim.esm", 3, 30, 29) ; EnchArmorElvenHelmetRestoration04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111521___Skyrim.esm", 3, 30, 29) ; ArmorScaledHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290039___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290038___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290040___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290074___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290079___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290080___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290081___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290225___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290226___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290227___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290228___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290229___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290242___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290243___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290244___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290247___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290250___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290251___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290259___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290265___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290274___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290285___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290286___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290287___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "290288___Skyrim.esm", 3, 30, 29) ; EnchArmorScaledHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80187___Skyrim.esm", 3, 30, 29) ; ArmorGlassHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873406___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873407___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873408___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873409___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873410___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873411___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873412___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873413___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873414___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873415___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873416___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873417___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873421___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873422___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873423___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873424___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873425___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873426___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041114___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagickaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041115___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041119___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873427___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873428___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873429___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873430___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873431___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873432___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873433___Skyrim.esm", 3, 30, 29) ; EnchArmorGlassHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80192___Skyrim.esm", 3, 40, 58) ; ArmorDragonscaleHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883188___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883189___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883190___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883191___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883192___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883193___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883194___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883195___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883196___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883197___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883198___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883199___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883203___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883204___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883205___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883206___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883207___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883208___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagicka06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041126___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041127___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041128___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883209___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883210___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883211___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883212___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883213___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883214___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883215___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonscaleHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "77389___Skyrim.esm", 3, 15, 3) ; ArmorIronHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570986___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570987___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570988___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "499996___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710023___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710024___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500003___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710025___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710026___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500005___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710027___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710028___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500009___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710031___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710032___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "303537___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710033___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710034___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500013___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710035___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710036___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500017___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710037___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "710039___Skyrim.esm", 3, 15, 3) ; EnchArmorIronHelmetRestoration03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80212___Skyrim.esm", 3, 35, 14) ; ArmorSteelHelmetA
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1011492___Skyrim.esm", 3, 35, 14) ; ArmorSteelHelmetB
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571039___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571040___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571041___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741587___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741595___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741596___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741588___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741597___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741598___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741589___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741599___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741600___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741591___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741603___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741604___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741592___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741605___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741606___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741593___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741609___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741610___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741594___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741607___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741608___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600710___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80207___Skyrim.esm", 3, 40, 29) ; ArmorDwarvenHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570970___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570978___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570979___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112491___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112492___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112493___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112494___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112495___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112496___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112497___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112498___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "112522___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113072___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113079___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113080___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113083___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113084___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113086___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113088___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113089___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113091___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113092___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113093___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "113095___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600717___Skyrim.esm", 3, 40, 29) ; EnchArmorDwarvenHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80222___Skyrim.esm", 3, 35, 14) ; ArmorSteelPlateHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570992___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570993___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "570994___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253817___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253818___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253819___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253820___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253821___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253822___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253823___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253824___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253825___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "253829___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266270___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266272___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266273___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266274___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266279___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266284___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266291___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266292___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266293___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266294___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "266295___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600778___Skyrim.esm", 3, 35, 14) ; EnchArmorSteelPlateHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80217___Skyrim.esm", 3, 50, 14) ; ArmorOrcishHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849916___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849917___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849918___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849919___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849920___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849921___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849922___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849923___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849924___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849925___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849926___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849927___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849931___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849932___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849933___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849934___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849935___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849936___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849937___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849938___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849939___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849940___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849941___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849942___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849943___Skyrim.esm", 3, 50, 14) ; EnchArmorOrcishHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80227___Skyrim.esm", 3, 40, 29) ; ArmorEbonyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850033___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850034___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850035___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850036___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850037___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850038___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850039___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850040___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850041___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850042___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850043___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850044___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850048___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850049___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850050___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850051___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850052___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850053___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041135___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagickaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041136___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041137___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850054___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850055___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850056___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850057___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850058___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850059___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "850060___Skyrim.esm", 3, 40, 29) ; EnchArmorEbonyHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80233___Skyrim.esm", 3, 40, 58) ; ArmorDragonplateHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883296___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883297___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883298___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883299___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883300___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883301___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883302___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883303___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883304___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883305___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883306___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883307___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883311___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883312___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883313___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883314___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883315___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883316___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagicka06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041138___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041139___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041140___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMagickaRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883317___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883318___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883319___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883320___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883321___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883322___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883323___Skyrim.esm", 3, 40, 58) ; EnchArmorDragonplateHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80237___Skyrim.esm", 3, 45, 43) ; ArmorDaedricHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883410___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883411___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883412___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883413___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883414___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883415___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883416___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883417___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883418___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883419___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883420___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883421___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883425___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883426___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883427___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883428___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883429___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883430___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagicka06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041153___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041154___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1041155___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMagickaRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883431___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883432___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883433___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883434___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883435___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883436___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883437___Skyrim.esm", 3, 45, 43) ; EnchArmorDaedricHelmetWaterbreathing
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "307855___Skyrim.esm", 3, 35, 14) ; ArmorBladesHelmet
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "312272___Skyrim.esm", 3, 50, 14) ; ArmorCompanionsHelmet
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "862274___Skyrim.esm", 3, 35, 58) ; DBArmorHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "371652___Skyrim.esm", 3, 35, 58) ; DBArmorHelmetMaskLess
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "925463___Skyrim.esm", 3, 35, 58) ; DBArmorHelmetSP
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1108829___Skyrim.esm", 3, 35, 58) ; DBArmorHelmetWornPlayable
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "354974___Skyrim.esm", 3, 30, 3) ; ArmorDraugrHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1001806___Skyrim.esm", 3, 30, 3) ; EnchArmorDraugrHelmetResistFire03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1070493___Skyrim.esm", 3, 30, 14) ; ArmorEastmarchHelmetFull
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136729___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullFalkreath
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "819036___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullHaafingar
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136731___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullHjaalmarch
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136735___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullPale
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136723___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullReach
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136738___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullRift
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136725___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullWhiterun
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "136733___Skyrim.esm", 3, 30, 14) ; ArmorGuardHelmetFullWinterhold
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81628___Skyrim.esm", 3, 35, 43) ; ArmorImperialHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81627___Skyrim.esm", 3, 35, 43) ; ArmorImperialLightHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "614669___Skyrim.esm", 3, 35, 43) ; ArmorImperialHelmetFull
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "79567___Skyrim.esm", 3, 35, 43) ; ArmorImperialHelmetOfficer
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571042___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571043___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571044___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571045___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571046___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571047___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571048___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571049___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571050___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571051___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571052___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571053___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571057___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571058___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571059___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571060___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571061___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571063___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetMarksman01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571064___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571065___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571066___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetRestoration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571067___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571068___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571069___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571075___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571070___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571071___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571072___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571073___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571074___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571076___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571077___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571078___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571079___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571080___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571084___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571085___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571086___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571087___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571088___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "571062___Skyrim.esm", 3, 35, 43) ; EnchArmorImperialLightHelmetMagicka03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "551301___Skyrim.esm", 3, 50, 14) ; ArmorStormcloakBearHelmet
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "683385___Skyrim.esm", 3, 30, 14) ; ArmorStormcloakHelmetFull
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1099416___Skyrim.esm", 3, 30, 29) ; ClothesThalmorRobesHooded 		@MULTI
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867013___Skyrim.esm", 3, 35, 58) ; ArmorThievesGuildHelmetPlayer
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867022___Skyrim.esm", 3, 35, 58) ; ArmorThievesGuildHelmetPlayerImproved
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "931289___Skyrim.esm", 3, 35, 58) ; ArmorThievesGuildLeaderHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1082694___Skyrim.esm", 3, 35, 58) ; ArmorLinweHelmet
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "383880___Skyrim.esm", 3, 40, 72) ; ArmorNightingaleHelmetPlayer01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035283___Skyrim.esm", 3, 40, 72) ; ArmorNightingaleHelmetPlayer02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035282___Skyrim.esm", 3, 40, 72) ; ArmorNightingaleHelmetPlayer03

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "962513___Skyrim.esm", 3, 40, 3) ; MS02ForswornHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "888146___Skyrim.esm", 3, 40, 3) ; ForswornHelmet

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400569___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskBronzeHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400555___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskCorondrumHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400549___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskEbonyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400577___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskIronHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400578___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskMarbleHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400523___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskMoonstoneHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400576___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskOrichalumHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400585___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskSteelHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400598___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskUltraHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "400586___Skyrim.esm", 3, 10, 0) ; ArmorDragonPriestMaskWoodHelmet

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "868010___Skyrim.esm", 3, 40, 29) ; ArmorPenitusHelmet


	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "105182___Dawnguard.esm", 3, 25, 51) ; DLC01ClothesVampireHood
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "20688___Dawnguard.esm", 3, 35, 14) ; DLC1ArmorDawnguardHelmetHeavy
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "104606___Dawnguard.esm", 3, 35, 14) ; DLC1ArmorDawnguardHelmetLight

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59616___Dawnguard.esm", 3, 35, 14) ; DLC1ArmorFAlmerHardenedHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "9195___Dawnguard.esm", 3, 35, 14) ; DLC1ArmorFAlmerHeavyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "77450___Dawnguard.esm", 3, 35, 14) ; DLC1ArmorShellbugHelmet

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "51220___Dawnguard.esm", 3, 40, 29) ; DLC1IvoryCrown


	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118186___Dragonborn.esm", 3, 25, 43) ; DLC2DarkElfOutfit 		@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "225381___Dragonborn.esm", 3, 25, 43) ; DLC2DarkElfOutfitBlue	@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "225382___Dragonborn.esm", 3, 25, 43) ; DLC2DarkElfOutfitRed		@MULTI

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "233748___Dragonborn.esm", 3, 55, 14) ; DLC2ClothesSkaalHat
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168622___Dragonborn.esm", 3, 30, 14) ; DLC2MoragTongHood
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "121752___Dragonborn.esm", 3, 30, 3) ; DLC2dunKolbjornHelm
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147485___Dragonborn.esm", 3, 55, 29) ; DLC2dunHaknirArmorHelm
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "232157___Dragonborn.esm", 3, 40, 29) ; DLC2dunFahlbtharzDwarvenHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "175409___Dragonborn.esm", 3, 35, 58) ; DLC2TGArmorVariantHood

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118177___Dragonborn.esm", 3, 55, 29) ; DLC2ArmorStalhrimHeavyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168502___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168503___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168504___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168505___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168506___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168507___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168508___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168509___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168510___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168511___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168512___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168513___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168514___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168515___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168516___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168517___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168518___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168519___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168520___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168521___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168522___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168523___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168524___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168525___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168526___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168527___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168528___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168529___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118179___Dragonborn.esm", 3, 55, 29) ; DLC2ArmorStalhrimLightHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168149___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168150___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168151___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168152___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168153___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168154___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168155___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168156___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168157___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168158___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168159___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168160___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168161___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168162___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168163___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168164___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168165___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168166___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168167___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168168___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168169___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168170___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168171___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168172___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168173___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168174___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168175___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168191___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118169___Dragonborn.esm", 3, 55, 29) ; DLC2ArmorNordicHeavyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168404___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168405___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168406___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168407___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168408___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168409___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168410___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168411___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168412___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168413___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168414___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168415___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168416___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168417___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168418___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168419___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168420___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168421___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168422___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168423___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168424___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168425___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168426___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168427___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168428___Dragonborn.esm", 3, 55, 29) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118165___Dragonborn.esm", 3, 35, 14) ; DLC2ArmorBonemoldHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "240419___Dragonborn.esm", 3, 40, 29) ; DLC2ArmorBonemoldImprovedHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165113___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165114___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165115___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165116___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165117___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165118___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165119___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165120___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165121___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165122___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165123___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165124___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165125___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165126___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165127___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165128___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165129___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165130___Dragonborn.esm", 3, 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka03

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118156___Dragonborn.esm", 3, 30, 14) ; DLC2ArmorChitinHeavyHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168327___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168328___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168329___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168330___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168331___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168332___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168333___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168334___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168335___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168336___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168337___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168338___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168339___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168340___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168341___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168342___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168343___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168344___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168345___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168346___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168347___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168348___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168349___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168350___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168351___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118153___Dragonborn.esm", 3, 30, 14) ; DLC2ArmorChitinLightHelmet
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167960___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167961___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167962___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167963___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167964___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167965___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167966___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167967___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167968___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167969___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167970___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167972___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167971___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167973___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167974___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167975___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167976___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167977___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167978___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167979___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167980___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167981___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167982___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167983___Dragonborn.esm", 3, 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration04

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147710___Dragonborn.esm", 3, 10, 0) ; DLC2ArmorAcolyteMaskFire
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147711___Dragonborn.esm", 3, 10, 0) ; DLC2ArmorAcolyteMaskFrost
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147511___Dragonborn.esm", 3, 10, 0) ; DLC2ArmorAcolyteMaskShock
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "170594___Dragonborn.esm", 3, 10, 0) ; DLC2MiraakMaskNew
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "237473___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask1H
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "236843___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask1L
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "237474___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask2H
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "236846___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask2L
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "237475___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask3H
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "236847___Dragonborn.esm", 3, 10, 0) ; DLC2MKMiraakMask3L
	;##############################
	;
	;    Immersive Armor
	;
	;##############################

	;##############################
	;
	;    Campfire
	;
	;##############################

	SendEvent_ProgressUpdate(PROGRESS, TOTAL_COUNT, TOTAL_COUNT)
endFunction

function SetDefaults_Feet()
	processed_count = 0
	int TOTAL_COUNT = 426
	string PROGRESS = "Frost_FeetDatastoreUpdate"

	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80144___Skyrim.esm", 4, 12, 6) ; ArmorHideBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500021___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709713___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709714___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500022___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709769___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709770___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500023___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709771___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709772___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500024___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709773___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709774___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500025___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsSneak01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709775___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709776___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105804___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsStamina01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105805___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105806___Skyrim.esm", 4, 12, 6) ; EnchArmorHideBootsStamina03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "455576___Skyrim.esm", 4, 15, 6) ; ArmorBanditBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80160___Skyrim.esm", 4, 12, 21) ; ArmorLeatherBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737829___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737830___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737831___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737832___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737833___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737834___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737835___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737836___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737837___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737838___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737839___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737840___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737841___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsSneak01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737842___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "737843___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105810___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsStamina01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105811___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105812___Skyrim.esm", 4, 12, 21) ; EnchArmorLeatherBootsStamina03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80154___Skyrim.esm", 4, 9, 14) ; ArmorElvenBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1072913___Skyrim.esm", 4, 9, 14) ; ArmorElvenLightBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778169___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778170___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778171___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778172___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778173___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778232___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778174___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778175___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778298___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778176___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778177___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778299___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778178___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778179___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "778300___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105798___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105799___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105800___Skyrim.esm", 4, 9, 14) ; EnchArmorElvenBootsStamina04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111519___Skyrim.esm", 4, 12, 6) ; ArmorScaledBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873446___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873447___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873448___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873449___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873450___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873451___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873452___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873453___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873454___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873455___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873456___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873457___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873458___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873459___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873460___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105816___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105817___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105818___Skyrim.esm", 4, 12, 6) ; EnchArmorScaledBootsStamina04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80184___Skyrim.esm", 4, 12, 14) ; ArmorGlassBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873326___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873327___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873328___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873329___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873330___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873331___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873332___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873333___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873334___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873335___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873336___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873337___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "873338___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105780___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105781___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105782___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsSneak05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105801___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105802___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105803___Skyrim.esm", 4, 12, 14) ; EnchArmorGlassBootsStamina05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80189___Skyrim.esm", 4, 15, 29) ; ArmorDragonscaleBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883111___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883112___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883113___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsCarry06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883115___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883116___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883117___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFire06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883118___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883119___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883120___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistFrost06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883121___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883122___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883123___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsResistShock06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883114___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038853___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsSneak05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1038854___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsSneak06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105789___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105790___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsStamina05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105791___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonscaleBootsStamina06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "77387___Skyrim.esm", 4, 7, 6) ; ArmorIronBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "500000___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709979___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709980___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "499952___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709981___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709982___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "499953___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709983___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709984___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "301970___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709985___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709986___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105807___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsStamina01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105808___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105809___Skyrim.esm", 4, 7, 6) ; EnchArmorIronBootsStamina03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80209___Skyrim.esm", 4, 12, 14) ; ArmorSteelBootsA
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1011489___Skyrim.esm", 4, 12, 14) ; ArmorSteelBootsB
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741530___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741531___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741532___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600693___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741533___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741534___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741535___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741536___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741625___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741537___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741538___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741539___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "741540___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105819___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsStamina01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105820___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105821___Skyrim.esm", 4, 12, 14) ; EnchArmorSteelBootsStamina03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80204___Skyrim.esm", 4, 15, 21) ; ArmorDwarvenBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111413___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111421___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111563___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600713___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111564___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111565___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111566___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111567___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111568___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111569___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111570___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111571___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111572___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105792___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105793___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105794___Skyrim.esm", 4, 15, 21) ; EnchArmorDwarvenBootsStamina04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80219___Skyrim.esm", 4, 15, 14) ; ArmorSteelPlateBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111391___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111614___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111615___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "600718___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111616___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111617___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111618___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111619___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111620___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111621___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111622___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111623___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "111624___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105822___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105823___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105824___Skyrim.esm", 4, 15, 14) ; EnchArmorSteelPlateBootsStamina04
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80214___Skyrim.esm", 4, 21, 14) ; ArmorOrcishBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849839___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849840___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849841___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849842___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849843___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849844___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849845___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849846___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849847___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849848___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849849___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849850___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849851___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105813___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105814___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105815___Skyrim.esm", 4, 21, 14) ; EnchArmorOrcishBootsStamina05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80224___Skyrim.esm", 4, 15, 14) ; ArmorEbonyBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849956___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849957___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849958___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849959___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849960___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849961___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849962___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849963___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849964___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849965___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849966___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849967___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "849968___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105795___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105796___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105797___Skyrim.esm", 4, 15, 14) ; EnchArmorEbonyBootsStamina05
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80229___Skyrim.esm", 4, 15, 29) ; ArmorDragonplateBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883228___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883229___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883230___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsCarry06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883231___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883232___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883233___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883234___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFire06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883235___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883236___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883237___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistFrost06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883349___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883350___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883351___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsResistShock06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105786___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105787___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsStamina05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105788___Skyrim.esm", 4, 15, 29) ; EnchArmorDragonplateBootsStamina06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "80234___Skyrim.esm", 4, 18, 21) ; ArmorDaedricBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883336___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883337___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883338___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsCarry06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883339___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883340___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883341___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883342___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFire06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883343___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883344___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883345___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistFrost06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883346___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883347___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "883348___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsResistShock06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105783___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105784___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsStamina05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1105785___Skyrim.esm", 4, 18, 21) ; EnchArmorDaedricBootsStamina06
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "307848___Skyrim.esm", 4, 12, 14) ; ArmorBladesBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "847484___Skyrim.esm", 4, 21, 14) ; ArmorCompanionsBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "862277___Skyrim.esm", 4, 12, 29) ; DBArmorBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "925460___Skyrim.esm", 4, 12, 29) ; DBArmorBootsSP
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1108828___Skyrim.esm", 4, 12, 29) ; DBArmorBootsWornPlayable
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "354973___Skyrim.esm", 4, 9, 3) ; ArmorDraugrBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "683391___Skyrim.esm", 4, 21, 14) ; ArmorStormcloakBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "79574___Skyrim.esm", 4, 12, 14) ; ArmorImperialBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "81623___Skyrim.esm", 4, 12, 14) ; ArmorImperialLightBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707771___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709855___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709856___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707772___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709857___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709858___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707773___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709859___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709860___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707774___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709861___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709862___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "707775___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsSneak01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709863___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "709864___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759565___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759566___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759567___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759568___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759569___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759570___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759571___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759572___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759573___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759574___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759575___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759576___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759577___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsSneak01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759578___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "759579___Skyrim.esm", 4, 12, 14) ; EnchArmorImperialLightBootsSneak03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "551297___Skyrim.esm", 4, 18, 14) ; ArmorStormcloakBearBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "416684___Skyrim.esm", 4, 9, 3) ; ClothesThalmorBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867010___Skyrim.esm", 4, 12, 29) ; ArmorThievesGuildBootsPlayer
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "867019___Skyrim.esm", 4, 12, 29) ; ArmorThievesGuildBootsPlayerImproved
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "931286___Skyrim.esm", 4, 12, 29) ; ArmorThievesGuildLeaderBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1082691___Skyrim.esm", 4, 12, 29) ; ArmorLinweBoots
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035276___Skyrim.esm", 4, 12, 35) ; ArmorNightingaleBootsPlayer01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "383877___Skyrim.esm", 4, 12, 35) ; ArmorNightingaleBootsPlayer02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035277___Skyrim.esm", 4, 12, 35) ; ArmorNightingaleBootsPlayer03
	
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "248320___Skyrim.esm", 4, 3, 0) ; ClothesPrisonerShoes

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "962515___Skyrim.esm", 4, 3, 0) ; MS02ForswornBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "888142___Skyrim.esm", 4, 3, 0) ; ForswornBoots

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "868007___Skyrim.esm", 4, 15, 21) ; ArmorPenitusBoots

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59882___Dawnguard.esm", 4, 3, 0) ; ClothesPrisonerBloodyShoes
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "18393___Dawnguard.esm", 4, 3, 0) ; DLC1ClothesMothPriestSandals

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "83799___Dawnguard.esm", 4, 12, 14) ; DLC1ArmorDawnguardBootsHeavy
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "62464___Dawnguard.esm", 4, 12, 14) ; DLC1ArmorDawnguardBootsLight

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "59613___Dawnguard.esm", 4, 5, 3) ; DLC1ArmorFalmerHardenedBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "9199___Dawnguard.esm", 4, 5, 3) ; DLC1ArmorFalmerHeavyBoots

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "46558___Dawnguard.esm", 4, 12, 29) ; DLC1ArmorVampireBoots

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "51221___Dawnguard.esm", 4, 15, 21) ; DLC1IvoryBoots

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118174___Dragonborn.esm", 4, 24, 14) ; DLC2ArmorStalhrimHeavyBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168444___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168445___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168446___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168447___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168448___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168449___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168450___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168451___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168452___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168453___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168454___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168455___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168456___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168457___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168458___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168459___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina06

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118142___Dragonborn.esm", 4, 24, 14) ; DLC2ArmorStalhrimLightBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168083___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168084___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168085___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168192___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168086___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168087___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168088___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168089___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168090___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168091___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168093___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168094___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168095___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168092___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168096___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168097___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168098___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168099___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168100___Dragonborn.esm", 4, 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina05

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118166___Dragonborn.esm", 4, 24, 21) ; DLC2ArmorNordicHeavyBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168352___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168353___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168354___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168355___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168356___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168357___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168358___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168359___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168360___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168361___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168362___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168363___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168364___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168365___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168366___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168367___Dragonborn.esm", 4, 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina05

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118162___Dragonborn.esm", 4, 12, 14) ; DLC2ArmorBonemoldBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "240421___Dragonborn.esm", 4, 15, 21) ; DLC2ArmorBonemoldImprovedBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165062___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsCarry01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165063___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165064___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165065___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165066___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165067___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165068___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165069___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165070___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165071___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165072___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165073___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165074___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsSneak01
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165075___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "165076___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorBonemoldBootsSneak03

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118150___Dragonborn.esm", 4, 12, 14) ; DLC2ArmorChitinLightBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167903___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167933___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167904___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167905___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167906___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167907___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167908___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167909___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167910___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167911___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167912___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167913___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167914___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsSneak02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167915___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsSneak03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167916___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsSneak04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167917___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167918___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "167919___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinLightBootsStamina04

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "118146___Dragonborn.esm", 4, 12, 14) ; DLC2ArmorChitinHeavyBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168275___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168276___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168277___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168278___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsMuffle
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168279___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168280___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168281___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168282___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168283___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168284___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168285___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168286___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168287___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168288___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina02
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168289___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina03
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168290___Dragonborn.esm", 4, 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina04

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "233746___Dragonborn.esm", 4, 24, 14) ; DLC2ClothesSkaalBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "168619___Dragonborn.esm", 4, 12, 14) ; DLC2MoragTongBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "116309___Dragonborn.esm", 4, 9, 3) ; DLC2dunKolbjornBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "147482___Dragonborn.esm", 4, 24, 14) ; DLC2dunHaknirArmorBoots
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "175412___Dragonborn.esm", 4, 12, 29) ; DLC2TGArmorVariantBoots

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "267720___Campfire.esm", 4, 21, 14) ; _Camp_ArmorSonsBoots

	SendEvent_ProgressUpdate(PROGRESS, TOTAL_COUNT, TOTAL_COUNT)
endFunction

function SetDefaults_Cloak()
	processed_count = 0
	int TOTAL_COUNT = 12
	string PROGRESS = "Frost_CloakDatastoreUpdate"

	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "551294___Skyrim.esm", 7, 40, 12) ; ArmorStormcloakBearCuirass 		@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "383878___Skyrim.esm", 7, 12, 40) ; ArmorNightingaleCuirassPlayer01  @MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035278___Skyrim.esm", 7, 12, 40) ; ArmorNightingaleCuirassPlayer02 @MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "1035279___Skyrim.esm", 7, 12, 40) ; ArmorNightingaleCuirassPlayer03 @MULTI

	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "46555___Dawnguard.esm", 7, 12, 40) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "103621___Dawnguard.esm", 7, 12, 40) ; DLC1ArmorVampireArmorValerica	@MULTI

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "260764___Campfire.esm", 7, 5, 5) ; _Camp_Cloak_BasicBurlap
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "260765___Campfire.esm", 7, 10, 10) ; _Camp_Cloak_BasicLinen
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "260766___Campfire.esm", 7, 40, 12) ; _Camp_Cloak_BasicFur
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "260767___Campfire.esm", 7, 12, 40) ; _Camp_Cloak_BasicHide

	;##############################
	;
	;    Frostfall
	;
	;##############################
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "356637___Frostfall.esp", 7, 10, 10) ; _Frost_Cloak_BoundLesser
	AddAndShowProgress(TOTAL_COUNT, PROGRESS, "359400___Frostfall.esp", 7, 25, 25) ; _Frost_Cloak_BoundGreater

	SendEvent_ProgressUpdate(PROGRESS, TOTAL_COUNT, TOTAL_COUNT)
endFunction

function SetDefaults_Shield()
	AddDatastoreEntryByKey("151754___Campfire.esm", 8, 0, 0) ; _Camp_WalkingStickShield
endFunction

int running_count
int processed_count
function AddAndShowProgress(int total_count, string progress_event, string asKey, int aiGearType, int aiWarmth, int aiCoverage)
	AddDatastoreEntryByKey(asKey, aiGearType, aiWarmth, aiCoverage)
	
	; Every 10 items, report the current progress.
	running_count += 1
	processed_count += 1
	if running_count >= 10
		running_count = 0
		SendEvent_ProgressUpdate(progress_event, processed_count, total_count)
	endif
endFunction

; @Overridden by _Frost_ArmorProtectionDatastoreHandler
function AddDatastoreEntryByKey(string asKey, int aiGearType, int aiWarmth, int aiCoverage)
endFunction

function SendEvent_ProgressUpdate(string progress_event, int processed, int total_count)
    float percentage = (processed as Float)/(total_count as Float)
    int handle = ModEvent.Create(progress_event)
    if handle
    	ModEvent.PushFloat(handle, percentage)
        ModEvent.Send(handle)
    endif
endFunction

; Stuff to add
;AddDatastoreEntryByKey("9205___Dawnguard.esm", X, Y, Z) ; DLC1SkinNakedVampireLord

;@TODO: Add immersive armors
;@TODO: Add Cloaks of Skyrim (Compatibility)
;@TODO: Add Winter is Coming Cloaks (Compatibility)
;@TODO: Add 'hooded' clothes to multi-list
;@TODO: Add exception data store?