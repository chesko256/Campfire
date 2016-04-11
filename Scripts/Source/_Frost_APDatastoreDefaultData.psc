scriptname _Frost_APDatastoreDefaultData extends Quest

import _FrostInternal

GlobalVariable property _Frost_DS_Body_InitProgress auto
GlobalVariable property _Frost_DS_Head_InitProgress auto
GlobalVariable property _Frost_DS_Hands_InitProgress auto
GlobalVariable property _Frost_DS_Feet_InitProgress auto
GlobalVariable property _Frost_DS_Cloak_InitProgress auto

function SetDefaults_Body()
	;####################
	;
	;      Skyrim
	;
	;####################

	SetArmorDataByKey("80145___Skyrim.esm", 60, 0) ; ArmorHideCuirass
	SetArmorDataByKey("1101736___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassAlteration01
	SetArmorDataByKey("1101737___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassAlteration02
	SetArmorDataByKey("1101738___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassAlteration03
	SetArmorDataByKey("1101739___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassConjuration01
	SetArmorDataByKey("1101740___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassConjuration02
	SetArmorDataByKey("1101741___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassConjuration03
	SetArmorDataByKey("1101742___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassDestruction01
	SetArmorDataByKey("1101743___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassDestruction02
	SetArmorDataByKey("1101744___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassDestruction03
	SetArmorDataByKey("500027___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassHealth01
	SetArmorDataByKey("709777___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassHealth02
	SetArmorDataByKey("709778___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassHealth03
	SetArmorDataByKey("1101745___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassIllusion01
	SetArmorDataByKey("1101746___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassIllusion02
	SetArmorDataByKey("1101747___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassIllusion03
	SetArmorDataByKey("500028___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassLightArmor01
	SetArmorDataByKey("709780___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassLightArmor02
	SetArmorDataByKey("709781___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassLightArmor03
	SetArmorDataByKey("1101748___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassRestoration01
	SetArmorDataByKey("1101749___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassRestoration02
	SetArmorDataByKey("1101750___Skyrim.esm", 60, 0) ; EnchArmorHideCuirassRestoration03
	
	SetArmorDataByKey("1071435___Skyrim.esm", 30, 0) ; ArmorBanditCuirass1 		;Shirtless
	SetArmorDataByKey("1071437___Skyrim.esm", 40, 0) ; ArmorBanditCuirass2 		;Shirtless / shawl
	SetArmorDataByKey("1071439___Skyrim.esm", 125, 17) ; ArmorBanditCuirass3 	;Sleeveless
	SetArmorDataByKey("455571___Skyrim.esm", 160, 35) ; ArmorBanditCuirass 		;Full
	
	SetArmorDataByKey("111522___Skyrim.esm", 75, 35) ; ArmorStuddedCuirass
	SetArmorDataByKey("707731___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassHealth01
	SetArmorDataByKey("709843___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassHealth02
	SetArmorDataByKey("709844___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassHealth03
	SetArmorDataByKey("707732___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassLightArmor01
	SetArmorDataByKey("709845___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassLightArmor02
	SetArmorDataByKey("709846___Skyrim.esm", 75, 35) ; EnchArmorStuddedCuirassLightArmor03
	
	SetArmorDataByKey("221598___Skyrim.esm", 125, 91) ; ArmorLeatherCuirass
	SetArmorDataByKey("1105605___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassAlteration01
	SetArmorDataByKey("1105606___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassAlteration02
	SetArmorDataByKey("1105607___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassAlteration03
	SetArmorDataByKey("1105608___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassConjuration01
	SetArmorDataByKey("1105609___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassConjuration02
	SetArmorDataByKey("1105610___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassConjuration03
	SetArmorDataByKey("1105611___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassDestruction01
	SetArmorDataByKey("1105612___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassDestruction02
	SetArmorDataByKey("1105613___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassDestruction03
	SetArmorDataByKey("737844___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassHealth01
	SetArmorDataByKey("737845___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassHealth02
	SetArmorDataByKey("737846___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassHealth03
	SetArmorDataByKey("1105614___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassIllusion01
	SetArmorDataByKey("1105615___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassIllusion02
	SetArmorDataByKey("1105616___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassIllusion03
	SetArmorDataByKey("737847___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassLightArmor01
	SetArmorDataByKey("737848___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassLightArmor02
	SetArmorDataByKey("737849___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassLightArmor03
	SetArmorDataByKey("1105617___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassRestoration01
	SetArmorDataByKey("1105618___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassRestoration02
	SetArmorDataByKey("1105619___Skyrim.esm", 125, 91) ; EnchArmorLeatherCuirassRestoration03
	
	SetArmorDataByKey("562851___Skyrim.esm", 125, 72) ; ArmorElvenCuirass
	SetArmorDataByKey("1072914___Skyrim.esm", 125, 72) ; ArmorElvenLightCuirass
	SetArmorDataByKey("80170___Skyrim.esm", 125, 72) ; ArmorElvenGildedCuirass
	SetArmorDataByKey("1101690___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassAlteration02
	SetArmorDataByKey("1101691___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassAlteration03
	SetArmorDataByKey("1101692___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassAlteration04
	SetArmorDataByKey("1101693___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassConjuration02
	SetArmorDataByKey("1101694___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassConjuration03
	SetArmorDataByKey("1101695___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassConjuration04
	SetArmorDataByKey("1101696___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassDestruction02
	SetArmorDataByKey("1101697___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassDestruction03
	SetArmorDataByKey("1101698___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassDestruction04
	SetArmorDataByKey("778180___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassHealth02
	SetArmorDataByKey("778181___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassHealth03
	SetArmorDataByKey("778301___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassHealth04
	SetArmorDataByKey("1101699___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassIllusion02
	SetArmorDataByKey("1101700___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassIllusion03
	SetArmorDataByKey("1101701___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassIllusion04
	SetArmorDataByKey("778182___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassLightArmor02
	SetArmorDataByKey("778183___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassLightArmor03
	SetArmorDataByKey("778302___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassLightArmor04
	SetArmorDataByKey("1101702___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassRestoration02
	SetArmorDataByKey("1101703___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassRestoration03
	SetArmorDataByKey("1101704___Skyrim.esm", 125, 72) ; EnchArmorElvenCuirassRestoration04
	SetArmorDataByKey("1101705___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassAlteration03
	SetArmorDataByKey("1101706___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassAlteration04
	SetArmorDataByKey("1101715___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassAlteration05
	SetArmorDataByKey("1101707___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassConjuration03
	SetArmorDataByKey("1101708___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassConjuration04
	SetArmorDataByKey("1101716___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassConjuration05
	SetArmorDataByKey("1101709___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassDestruction03
	SetArmorDataByKey("1101710___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassDestruction04
	SetArmorDataByKey("1101717___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassDestruction05
	SetArmorDataByKey("1038874___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealRate03
	SetArmorDataByKey("1038875___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealRate04
	SetArmorDataByKey("1038876___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealRate05
	SetArmorDataByKey("844205___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealth03
	SetArmorDataByKey("844206___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealth04
	SetArmorDataByKey("844207___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassHealth05
	SetArmorDataByKey("1101711___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassIllusion03
	SetArmorDataByKey("1101712___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassIllusion04
	SetArmorDataByKey("1101718___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassIllusion05
	SetArmorDataByKey("844208___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassLightArmor03
	SetArmorDataByKey("844209___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassLightArmor04
	SetArmorDataByKey("844210___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassLightArmor05
	SetArmorDataByKey("1101713___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassRestoration03
	SetArmorDataByKey("1101714___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassRestoration04
	SetArmorDataByKey("1101719___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassRestoration05
	SetArmorDataByKey("1038877___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate03
	SetArmorDataByKey("1038878___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate04
	SetArmorDataByKey("1038879___Skyrim.esm", 125, 72) ; EnchArmorElvenGildedCuirassStaminaRate05
	
	SetArmorDataByKey("111523___Skyrim.esm", 110, 35) ; ArmorScaledCuirass
	SetArmorDataByKey("111524___Skyrim.esm", 110, 54) ; ArmorScaledCuirassB
	SetArmorDataByKey("1105635___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassAlteration02
	SetArmorDataByKey("1105636___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassAlteration03
	SetArmorDataByKey("1105637___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassAlteration04
	SetArmorDataByKey("1105638___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassConjuration02
	SetArmorDataByKey("1105639___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassConjuration03
	SetArmorDataByKey("1105640___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassConjuration04
	SetArmorDataByKey("1105641___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassDestruction02
	SetArmorDataByKey("1105642___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassDestruction03
	SetArmorDataByKey("1105643___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassDestruction04
	SetArmorDataByKey("873461___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassHealth02
	SetArmorDataByKey("873462___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassHealth03
	SetArmorDataByKey("873463___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassHealth04
	SetArmorDataByKey("1105644___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassIllusion02
	SetArmorDataByKey("1105645___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassIllusion03
	SetArmorDataByKey("1105646___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassIllusion04
	SetArmorDataByKey("873464___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassLightArmor02
	SetArmorDataByKey("873465___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassLightArmor03
	SetArmorDataByKey("873466___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassLightArmor04
	SetArmorDataByKey("1105647___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassRestoration02
	SetArmorDataByKey("1105648___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassRestoration03
	SetArmorDataByKey("1105649___Skyrim.esm", 110, 35) ; EnchArmorScaledCuirassRestoration04
	
	SetArmorDataByKey("80185___Skyrim.esm", 125, 72) ; ArmorGlassCuirass
	SetArmorDataByKey("1101720___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassAlteration03
	SetArmorDataByKey("1101721___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassAlteration04
	SetArmorDataByKey("1101722___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassAlteration05
	SetArmorDataByKey("1101723___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassConjuration03
	SetArmorDataByKey("1101724___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassConjuration04
	SetArmorDataByKey("1101725___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassConjuration05
	SetArmorDataByKey("1101726___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassDestruction03
	SetArmorDataByKey("1101728___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassDestruction04
	SetArmorDataByKey("1101729___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassDestruction05
	SetArmorDataByKey("1041111___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealRate03
	SetArmorDataByKey("1041112___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealRate04
	SetArmorDataByKey("1041113___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealRate05
	SetArmorDataByKey("873345___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealth03
	SetArmorDataByKey("873346___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealth04
	SetArmorDataByKey("873347___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassHealth05
	SetArmorDataByKey("1101730___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassIllusion03
	SetArmorDataByKey("1101731___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassIllusion04
	SetArmorDataByKey("1101732___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassIllusion05
	SetArmorDataByKey("873348___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassLightArmor03
	SetArmorDataByKey("873349___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassLightArmor04
	SetArmorDataByKey("873350___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassLightArmor05
	SetArmorDataByKey("1101733___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassRestoration03
	SetArmorDataByKey("1101734___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassRestoration04
	SetArmorDataByKey("1101735___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassRestoration05
	SetArmorDataByKey("1041116___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassStaminaRate03
	SetArmorDataByKey("1041117___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassStaminaRate04
	SetArmorDataByKey("1041118___Skyrim.esm", 125, 72) ; EnchArmorGlassCuirassStaminaRate05
	SetArmorDataByKey("1101727___Skyrim.esm", 125, 72) ; EnchArmorGlassVsDestruction04
	
	SetArmorDataByKey("80190___Skyrim.esm", 140, 109) ; ArmorDragonscaleCuirass
	SetArmorDataByKey("1101646___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassAlteration04
	SetArmorDataByKey("1101647___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassAlteration05
	SetArmorDataByKey("1101648___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassAlteration06
	SetArmorDataByKey("1101649___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassConjuration04
	SetArmorDataByKey("1101650___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassConjuration05
	SetArmorDataByKey("1101651___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassConjuration06
	SetArmorDataByKey("1101652___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassDestruction04
	SetArmorDataByKey("1101653___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassDestruction05
	SetArmorDataByKey("1101654___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassDestruction06
	SetArmorDataByKey("1041120___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealRate04
	SetArmorDataByKey("1041121___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealRate05
	SetArmorDataByKey("1041122___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealRate06
	SetArmorDataByKey("883130___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealth04
	SetArmorDataByKey("883131___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealth05
	SetArmorDataByKey("883132___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassHealth06
	SetArmorDataByKey("1101655___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassIllusion04
	SetArmorDataByKey("1101656___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassIllusion05
	SetArmorDataByKey("1101657___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassIllusion06
	SetArmorDataByKey("883133___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassLightArmor04
	SetArmorDataByKey("883134___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassLightArmor05
	SetArmorDataByKey("883135___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassLightArmor06
	SetArmorDataByKey("1101658___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassRestoration04
	SetArmorDataByKey("1101660___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassRestoration05
	SetArmorDataByKey("1101659___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassRestoration06
	SetArmorDataByKey("1041123___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate04
	SetArmorDataByKey("1041124___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate05
	SetArmorDataByKey("1041125___Skyrim.esm", 140, 109) ; EnchArmorDragonscaleCuirassStaminaRate06
	
	SetArmorDataByKey("77385___Skyrim.esm", 75, 35) ; ArmorIronCuirass
	SetArmorDataByKey("1101752___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassAlteration01
	SetArmorDataByKey("1101753___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassAlteration02
	SetArmorDataByKey("1101755___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassAlteration03
	SetArmorDataByKey("1101754___Skyrim.esm", 75, 35) ; EnchArmorIronArmorAlteration03
	SetArmorDataByKey("1101756___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassConjuration01
	SetArmorDataByKey("1101757___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassConjuration02
	SetArmorDataByKey("1101758___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassConjuration03
	SetArmorDataByKey("1101759___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassDestruction01
	SetArmorDataByKey("1101760___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassDestruction02
	SetArmorDataByKey("1101761___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassDestruction03
	SetArmorDataByKey("300302___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHealth01
	SetArmorDataByKey("709987___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHealth02
	SetArmorDataByKey("709988___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHealth03
	SetArmorDataByKey("500008___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHeavyArmor01
	SetArmorDataByKey("709989___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHeavyArmor02
	SetArmorDataByKey("709990___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassHeavyArmor03
	SetArmorDataByKey("1101762___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassIllusion01
	SetArmorDataByKey("1101763___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassIllusion02
	SetArmorDataByKey("1101764___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassIllusion03
	SetArmorDataByKey("1101765___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassRestoration01
	SetArmorDataByKey("1101766___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassRestoration02
	SetArmorDataByKey("1101767___Skyrim.esm", 75, 35) ; EnchArmorIronCuirassRestoration03
	
	SetArmorDataByKey("80200___Skyrim.esm", 90, 35) ; ArmorIronBandedCuirass
	SetArmorDataByKey("1101768___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassAlteration01
	SetArmorDataByKey("1101769___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassAlteration02
	SetArmorDataByKey("1101770___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassAlteration03
	SetArmorDataByKey("1101771___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassConjuration01
	SetArmorDataByKey("1101772___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassConjuration02
	SetArmorDataByKey("1101773___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassConjuration03
	SetArmorDataByKey("1101774___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassDestruction01
	SetArmorDataByKey("1101775___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassDestruction02
	SetArmorDataByKey("1101776___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassDestruction03
	SetArmorDataByKey("707741___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHealth01
	SetArmorDataByKey("709919___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHealth02
	SetArmorDataByKey("709920___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHealth03
	SetArmorDataByKey("707742___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor01
	SetArmorDataByKey("709921___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor02
	SetArmorDataByKey("709922___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassHeavyArmor03
	SetArmorDataByKey("1101777___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassIllusion01
	SetArmorDataByKey("1101778___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassIllusion02
	SetArmorDataByKey("1101779___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassIllusion03
	SetArmorDataByKey("1101780___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassRestoration01
	SetArmorDataByKey("1101781___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassRestoration02
	SetArmorDataByKey("1101782___Skyrim.esm", 90, 35) ; EnchArmorIronBandedCuirassRestoration03
	
	SetArmorDataByKey("80210___Skyrim.esm", 125, 54) ; ArmorSteelCuirassA
	SetArmorDataByKey("1011490___Skyrim.esm", 125, 54) ; ArmorSteelCuirassB
	SetArmorDataByKey("1105650___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassAlteration01
	SetArmorDataByKey("1105651___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassAlteration02
	SetArmorDataByKey("1105652___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassAlteration03
	SetArmorDataByKey("1105653___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassConjuration01
	SetArmorDataByKey("1105654___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassConjuration02
	SetArmorDataByKey("1105655___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassConjuration03
	SetArmorDataByKey("1105656___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassDestruction01
	SetArmorDataByKey("1105657___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassDestruction02
	SetArmorDataByKey("1105658___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassDestruction03
	SetArmorDataByKey("741541___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHealth01
	SetArmorDataByKey("741542___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHealth02
	SetArmorDataByKey("741543___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHealth03
	SetArmorDataByKey("741544___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHeavyArmor01
	SetArmorDataByKey("741545___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHeavyArmor02
	SetArmorDataByKey("741546___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassHeavyArmor03
	SetArmorDataByKey("1105659___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassIllusion01
	SetArmorDataByKey("1105660___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassIllusion02
	SetArmorDataByKey("1105661___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassIllusion03
	SetArmorDataByKey("1105662___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassRestoration01
	SetArmorDataByKey("1105663___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassRestoration02
	SetArmorDataByKey("1105664___Skyrim.esm", 125, 54) ; EnchArmorSteelCuirassRestoration03
	
	SetArmorDataByKey("80205___Skyrim.esm", 140, 72) ; ArmorDwarvenCuirass
	SetArmorDataByKey("1101661___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassAlteration02
	SetArmorDataByKey("571002___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassAlteration03
	SetArmorDataByKey("1101662___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassAlteration04
	SetArmorDataByKey("1101663___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassConjuration02
	SetArmorDataByKey("1101664___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassConjuration03
	SetArmorDataByKey("1101665___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassConjuration04
	SetArmorDataByKey("1101666___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassDestruction02
	SetArmorDataByKey("1101667___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassDestruction03
	SetArmorDataByKey("1101668___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassDestruction04
	SetArmorDataByKey("111576___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHealth02
	SetArmorDataByKey("111577___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHealth03
	SetArmorDataByKey("111578___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHealth04
	SetArmorDataByKey("111579___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor02
	SetArmorDataByKey("111631___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor03
	SetArmorDataByKey("111680___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassHeavyArmor04
	SetArmorDataByKey("1101669___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassIllusion02
	SetArmorDataByKey("1101670___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassIllusion03
	SetArmorDataByKey("1101671___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassIllusion04
	SetArmorDataByKey("1101672___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassRestoration02
	SetArmorDataByKey("1101673___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassRestoration03
	SetArmorDataByKey("1101674___Skyrim.esm", 140, 72) ; EnchArmorDwarvenCuirassRestoration04
	
	SetArmorDataByKey("80220___Skyrim.esm", 125, 72) ; ArmorSteelPlateCuirass
	SetArmorDataByKey("1105665___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassAlteration02
	SetArmorDataByKey("1105666___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassAlteration03
	SetArmorDataByKey("1105667___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassAlteration04
	SetArmorDataByKey("1105668___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassConjuration02
	SetArmorDataByKey("1105669___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassConjuration03
	SetArmorDataByKey("1105670___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassConjuration04
	SetArmorDataByKey("1105671___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassDestruction02
	SetArmorDataByKey("1105672___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassDestruction03
	SetArmorDataByKey("1105673___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassDestruction04
	SetArmorDataByKey("111628___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHealth02
	SetArmorDataByKey("111629___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHealth03
	SetArmorDataByKey("111630___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHealth04
	SetArmorDataByKey("111686___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor02
	SetArmorDataByKey("111950___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor03
	SetArmorDataByKey("111957___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassHeavyArmor04
	SetArmorDataByKey("1105674___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassIllusion02
	SetArmorDataByKey("1105675___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassIllusion03
	SetArmorDataByKey("1105676___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassIllusion04
	SetArmorDataByKey("1105677___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassRestoration02
	SetArmorDataByKey("1105678___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassRestoration03
	SetArmorDataByKey("1105679___Skyrim.esm", 125, 72) ; EnchArmorSteelPlateCuirassRestoration04
	
	SetArmorDataByKey("80215___Skyrim.esm", 175, 54) ; ArmorOrcishCuirass
	SetArmorDataByKey("1105620___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassAlteration03
	SetArmorDataByKey("1105621___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassAlteration04
	SetArmorDataByKey("1105622___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassAlteration05
	SetArmorDataByKey("1105623___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassConjuration03
	SetArmorDataByKey("1105624___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassConjuration04
	SetArmorDataByKey("1105625___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassConjuration05
	SetArmorDataByKey("1105626___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassDestruction03
	SetArmorDataByKey("1105627___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassDestruction04
	SetArmorDataByKey("1105628___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassDestruction05
	SetArmorDataByKey("849858___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHealth03
	SetArmorDataByKey("849859___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHealth04
	SetArmorDataByKey("849860___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHealth05
	SetArmorDataByKey("849861___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHeavyArmor03
	SetArmorDataByKey("849862___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHeavyArmor04
	SetArmorDataByKey("849863___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassHeavyArmor05
	SetArmorDataByKey("1105629___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassIllusion03
	SetArmorDataByKey("1105630___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassIllusion04
	SetArmorDataByKey("1105631___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassIllusion05
	SetArmorDataByKey("1105632___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassRestoration03
	SetArmorDataByKey("1105633___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassRestoration04
	SetArmorDataByKey("1105634___Skyrim.esm", 175, 54) ; EnchArmorOrcishCuirassRestoration05
	
	SetArmorDataByKey("80225___Skyrim.esm", 140, 54) ; ArmorEbonyCuirass
	SetArmorDataByKey("1101675___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassAlteration03
	SetArmorDataByKey("1101676___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassAlteration04
	SetArmorDataByKey("1101677___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassAlteration05
	SetArmorDataByKey("1101678___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassConjuration03
	SetArmorDataByKey("1101679___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassConjuration04
	SetArmorDataByKey("1101680___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassConjuration05
	SetArmorDataByKey("1101681___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassDestruction03
	SetArmorDataByKey("1101682___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassDestruction04
	SetArmorDataByKey("1101688___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassDestruction05
	SetArmorDataByKey("849975___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealth03
	SetArmorDataByKey("849976___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealth04
	SetArmorDataByKey("849977___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealth05
	SetArmorDataByKey("1041129___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealthRate03
	SetArmorDataByKey("1041130___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealthRate04
	SetArmorDataByKey("1041131___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHealthRate05
	SetArmorDataByKey("849978___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHeavyArmor03
	SetArmorDataByKey("849979___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHeavyArmor04
	SetArmorDataByKey("849980___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassHeavyArmor05
	SetArmorDataByKey("1101683___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassIllusion03
	SetArmorDataByKey("1101684___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassIllusion04
	SetArmorDataByKey("1101689___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassIllusion05
	SetArmorDataByKey("1101685___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassRestoration03
	SetArmorDataByKey("1101686___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassRestoration04
	SetArmorDataByKey("1101687___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassRestoration05
	SetArmorDataByKey("1041132___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassStaminaRate03
	SetArmorDataByKey("1041133___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassStaminaRate04
	SetArmorDataByKey("1041134___Skyrim.esm", 140, 54) ; EnchArmorEbonyCuirassStaminaRate05
	
	SetArmorDataByKey("80230___Skyrim.esm", 140, 109) ; ArmorDragonplateCuirass
	SetArmorDataByKey("1101631___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassAlteration04
	SetArmorDataByKey("1101644___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassAlteration05
	SetArmorDataByKey("1101632___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassAlteration06
	SetArmorDataByKey("1101633___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassConjuration04
	SetArmorDataByKey("1101634___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassConjuration05
	SetArmorDataByKey("1101635___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassConjuration06
	SetArmorDataByKey("1101636___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassDestruction04
	SetArmorDataByKey("1101645___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassDestruction05
	SetArmorDataByKey("1101637___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassDestruction06
	SetArmorDataByKey("883238___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealth04
	SetArmorDataByKey("883239___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealth05
	SetArmorDataByKey("883240___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealth06
	SetArmorDataByKey("1041141___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealthRate04
	SetArmorDataByKey("1041142___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealthRate05
	SetArmorDataByKey("1041143___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHealthRate06
	SetArmorDataByKey("883241___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor04
	SetArmorDataByKey("883242___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor05
	SetArmorDataByKey("883243___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassHeavyArmor06
	SetArmorDataByKey("1101638___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassIllusion04
	SetArmorDataByKey("1101639___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassIllusion05
	SetArmorDataByKey("1101640___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassIllusion06
	SetArmorDataByKey("1101641___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassRestoration04
	SetArmorDataByKey("1101642___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassRestoration05
	SetArmorDataByKey("1101643___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassRestoration06
	SetArmorDataByKey("1041144___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassStaminaRate04
	SetArmorDataByKey("1041145___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassStaminaRate05
	SetArmorDataByKey("1041146___Skyrim.esm", 140, 109) ; EnchArmorDragonplateCuirassStaminaRate06
	
	SetArmorDataByKey("80235___Skyrim.esm", 160, 91) ; ArmorDaedricCuirass
	SetArmorDataByKey("1101616___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassAlteration04
	SetArmorDataByKey("1101617___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassAlteration05
	SetArmorDataByKey("1101618___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassAlteration06
	SetArmorDataByKey("1101619___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassConjuration04
	SetArmorDataByKey("1101620___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassConjuration05
	SetArmorDataByKey("1101621___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassConjuration06
	SetArmorDataByKey("1101622___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassDestruction04
	SetArmorDataByKey("1101623___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassDestruction05
	SetArmorDataByKey("1101624___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassDestruction06
	SetArmorDataByKey("1041150___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealRate04
	SetArmorDataByKey("1041151___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealRate05
	SetArmorDataByKey("1041152___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealRate06
	SetArmorDataByKey("883352___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealth04
	SetArmorDataByKey("883353___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealth05
	SetArmorDataByKey("883354___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHealth06
	SetArmorDataByKey("883355___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHeavyArmor04
	SetArmorDataByKey("883356___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHeavyArmor05
	SetArmorDataByKey("883357___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassHeavyArmor06
	SetArmorDataByKey("1101625___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassIllusion04
	SetArmorDataByKey("1101626___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassIllusion05
	SetArmorDataByKey("1101627___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassIllusion06
	SetArmorDataByKey("1101628___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassRestoration04
	SetArmorDataByKey("1101629___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassRestoration05
	SetArmorDataByKey("1101630___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassRestoration06
	SetArmorDataByKey("1041147___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassStaminaRate04
	SetArmorDataByKey("1041148___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassStaminaRate05
	SetArmorDataByKey("1041149___Skyrim.esm", 160, 91) ; EnchArmorDaedricCuirassStaminaRate06
	
	SetArmorDataByKey("586138___Skyrim.esm", 30, 0) ; ClothesPrisonerRags
	SetArmorDataByKey("248318___Skyrim.esm", 30, 0) ; ClothesPrisonerTunic
	
	SetArmorDataByKey("307851___Skyrim.esm", 125, 54) ; ArmorBladesCuirass
	
	SetArmorDataByKey("830997___Skyrim.esm", 175, 72) ; ArmorCompanionsCuirass
	
	SetArmorDataByKey("1108827___Skyrim.esm", 125, 109) ; DBArmorWornPlayable
	
	SetArmorDataByKey("99208___Skyrim.esm", 110, 35) ; ArmorDraugrCuirass
	
	SetArmorDataByKey("136478___Skyrim.esm", 110, 54) ; ArmorGuardCuirassFalkreath
	SetArmorDataByKey("136480___Skyrim.esm", 110, 54) ; ArmorGuardCuirassHjaalmarch
	SetArmorDataByKey("136456___Skyrim.esm", 110, 54) ; ArmorGuardCuirassMarkarth
	SetArmorDataByKey("136455___Skyrim.esm", 110, 54) ; ArmorGuardCuirassRiften
	SetArmorDataByKey("819035___Skyrim.esm", 110, 54) ; ArmorGuardCuirassSolitude
	SetArmorDataByKey("136485___Skyrim.esm", 110, 54) ; ArmorGuardCuirassThePale
	SetArmorDataByKey("136461___Skyrim.esm", 110, 54) ; ArmorGuardCuirassWhiterun
	SetArmorDataByKey("136482___Skyrim.esm", 110, 54) ; ArmorGuardCuirassWinterhold
	SetArmorDataByKey("683387___Skyrim.esm", 110, 54) ; ArmorStormcloakCuirass
	SetArmorDataByKey("710048___Skyrim.esm", 120, 72) ; ArmorStormcloakCuirassSleeves
	
	SetArmorDataByKey("79573___Skyrim.esm", 125, 72) ; ArmorImperialCuirass
	SetArmorDataByKey("81625___Skyrim.esm", 125, 72) ; ArmorImperialLightCuirass
	SetArmorDataByKey("81624___Skyrim.esm", 125, 72) ; ArmorImperialStuddedCuirass
	SetArmorDataByKey("707776___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHealth01
	SetArmorDataByKey("709865___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHealth02
	SetArmorDataByKey("709866___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHealth03
	SetArmorDataByKey("707777___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHeavyArmor01
	SetArmorDataByKey("709867___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHeavyArmor02
	SetArmorDataByKey("709868___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassHeavyArmor03
	SetArmorDataByKey("709872___Skyrim.esm", 125, 72) ; EnchArmorImperialCuirassResistFrost03
	SetArmorDataByKey("759580___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassHealth01
	SetArmorDataByKey("759581___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassHealth02
	SetArmorDataByKey("759582___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassHealth03
	SetArmorDataByKey("759583___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassLightArmor01
	SetArmorDataByKey("759584___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassLightArmor02
	SetArmorDataByKey("759585___Skyrim.esm", 125, 72) ; EnchArmorImperialLightCuirassLightArmor03
	SetArmorDataByKey("289716___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassHealth01
	SetArmorDataByKey("289717___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassHealth02
	SetArmorDataByKey("289718___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassHealth03
	SetArmorDataByKey("289719___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor01
	SetArmorDataByKey("289720___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor02
	SetArmorDataByKey("289721___Skyrim.esm", 125, 72) ; EnchArmorImperialStuddedCuirassLightArmor03
	
	SetArmorDataByKey("551294___Skyrim.esm", 140, 35, aiExtraCloakWarmth = 40, aiExtraCloakCoverage = 12) ; ArmorStormcloakBearCuirass 		@MULTI
	SetArmorDataByKey("1099416___Skyrim.esm", 110, 35, aiExtraHeadWarmth = 30, aiExtraHeadCoverage = 29) ; ClothesThalmorRobesHooded 		@MULTI
	
	SetArmorDataByKey("867011___Skyrim.esm", 125, 109) ; ArmorThievesGuildCuirassPlayer
	SetArmorDataByKey("1082692___Skyrim.esm", 125, 109) ; ArmorLinweCuirass
	SetArmorDataByKey("867020___Skyrim.esm", 125, 109) ; ArmorThievesGuildCuirassPlayerImproved
	SetArmorDataByKey("931287___Skyrim.esm", 125, 109) ; ArmorThievesGuildLeaderCuirass
	
	SetArmorDataByKey("862276___Skyrim.esm", 125, 109) ; DBArmor
	SetArmorDataByKey("925461___Skyrim.esm", 125, 109) ; DBArmorSP
	
	SetArmorDataByKey("383878___Skyrim.esm", 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40) ; ArmorNightingaleCuirassPlayer01  @MULTI
	SetArmorDataByKey("1035278___Skyrim.esm", 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40) ; ArmorNightingaleCuirassPlayer02 @MULTI
	SetArmorDataByKey("1035279___Skyrim.esm", 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40) ; ArmorNightingaleCuirassPlayer03 @MULTI

	SetArmorDataByKey("962512___Skyrim.esm", 60, 0) ; MS02ForswornArmor
	SetArmorDataByKey("888144___Skyrim.esm", 60, 0) ; ForswornCuirass

	SetArmorDataByKey("379902___Skyrim.esm", 140, 72) ; GeneralTulliusArmor
	SetArmorDataByKey("868000___Skyrim.esm", 140, 72) ; ArmorPenitusCuirass
	
	SetArmorDataByKey("754635___Skyrim.esm", 60, 0) ; ArmorFalmerCuirass

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	SetArmorDataByKey("62455___Dawnguard.esm", 125, 91) ; DLC1ArmorDawnguardCuirassHeavy1
	SetArmorDataByKey("62458___Dawnguard.esm", 125, 91) ; DLC1ArmorDawnguardCuirassHeavy2
	SetArmorDataByKey("62459___Dawnguard.esm", 125, 91) ; DLC1ArmorDawnguardCuirassLight1
	SetArmorDataByKey("62466___Dawnguard.esm", 125, 91) ; DLC1ArmorDawnguardCuirassLight2
	SetArmorDataByKey("62468___Dawnguard.esm", 125, 91) ; DLC1ArmorDawnguardCuirassLight3

	SetArmorDataByKey("59614___Dawnguard.esm", 125, 54) ; DLC1ArmorFalmerHardenedCuirass

	SetArmorDataByKey("9193___Dawnguard.esm", 125, 54) ; DLC1ArmorFalmerHeavyCuirass

	SetArmorDataByKey("82631___Dawnguard.esm", 125, 91) ; DLC1ArmorVampireArmorGray
	SetArmorDataByKey("102898___Dawnguard.esm", 125, 91) ; DLC1ArmorVampireArmorGrayLight
	SetArmorDataByKey("102899___Dawnguard.esm", 125, 91) ; DLC1ArmorVampireArmorRed

	SetArmorDataByKey("46555___Dawnguard.esm", 125, 72, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	SetArmorDataByKey("103621___Dawnguard.esm", 125, 72, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40) ; DLC1ArmorVampireArmorValerica	@MULTI

	SetArmorDataByKey("51222___Dawnguard.esm", 140, 72) ; DLC1IvoryCuirass
	SetArmorDataByKey("51923___Dawnguard.esm", 140, 72) ; DLC1IvoryCuirassAlternate

	SetArmorDataByKey("84997___Dawnguard.esm", 125, 72) ; DLC1LD_ArmorKatria

	SetArmorDataByKey("59883___Dawnguard.esm", 30, 0) ; ClothesPrisonerRagsBloody

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	SetArmorDataByKey("118175___Dragonborn.esm", 190, 91) ; DLC2ArmorStalhrimHeavyCuirass
	SetArmorDataByKey("168460___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration04
	SetArmorDataByKey("168461___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration05
	SetArmorDataByKey("168462___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration06
	SetArmorDataByKey("168463___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration04
	SetArmorDataByKey("168464___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration05
	SetArmorDataByKey("168465___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration06
	SetArmorDataByKey("168466___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction04
	SetArmorDataByKey("168467___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction05
	SetArmorDataByKey("168468___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction06
	SetArmorDataByKey("168469___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth04
	SetArmorDataByKey("168470___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth05
	SetArmorDataByKey("168472___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealth06
	SetArmorDataByKey("168473___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate04
	SetArmorDataByKey("168474___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate05
	SetArmorDataByKey("168471___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate06
	SetArmorDataByKey("168475___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04
	SetArmorDataByKey("168476___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05
	SetArmorDataByKey("168477___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06
	SetArmorDataByKey("168478___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion04
	SetArmorDataByKey("168479___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion05
	SetArmorDataByKey("168480___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion06
	SetArmorDataByKey("168481___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration04
	SetArmorDataByKey("168482___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration05
	SetArmorDataByKey("168483___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration06
	SetArmorDataByKey("168484___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04
	SetArmorDataByKey("168485___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05
	SetArmorDataByKey("168486___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06

	SetArmorDataByKey("118178___Dragonborn.esm", 190, 91) ; DLC2ArmorStalhrimLightCuirass
	SetArmorDataByKey("168101___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration03
	SetArmorDataByKey("168102___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration04
	SetArmorDataByKey("168103___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassAlteration05
	SetArmorDataByKey("168104___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration03
	SetArmorDataByKey("168105___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration04
	SetArmorDataByKey("168106___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassConjuration05
	SetArmorDataByKey("168107___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction03
	SetArmorDataByKey("168108___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction04
	SetArmorDataByKey("168109___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassDestruction05
	SetArmorDataByKey("168110___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate03
	SetArmorDataByKey("168111___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate04
	SetArmorDataByKey("168112___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealRate05
	SetArmorDataByKey("168113___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth03
	SetArmorDataByKey("168114___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth04
	SetArmorDataByKey("168115___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassHealth05
	SetArmorDataByKey("168116___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion03
	SetArmorDataByKey("168117___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion04
	SetArmorDataByKey("168118___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassIllusion05
	SetArmorDataByKey("168119___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor03
	SetArmorDataByKey("168120___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor04
	SetArmorDataByKey("168121___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassLightArmor05
	SetArmorDataByKey("168122___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration03
	SetArmorDataByKey("168123___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration04
	SetArmorDataByKey("168124___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassRestoration05
	SetArmorDataByKey("168125___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate03
	SetArmorDataByKey("168126___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate04
	SetArmorDataByKey("168127___Dragonborn.esm", 190, 91) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate05

	SetArmorDataByKey("118167___Dragonborn.esm", 190, 72) ; DLC2ArmorNordicHeavyCuirass
	SetArmorDataByKey("168368___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration03
	SetArmorDataByKey("168369___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration04
	SetArmorDataByKey("168370___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassAlteration05
	SetArmorDataByKey("168371___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration03
	SetArmorDataByKey("168372___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration04
	SetArmorDataByKey("168373___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassConjuration05
	SetArmorDataByKey("168374___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction03
	SetArmorDataByKey("168375___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction04
	SetArmorDataByKey("168376___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassDestruction05
	SetArmorDataByKey("168377___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth03
	SetArmorDataByKey("168378___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth04
	SetArmorDataByKey("168379___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHealth05
	SetArmorDataByKey("168380___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor03
	SetArmorDataByKey("168381___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor04
	SetArmorDataByKey("168382___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor05
	SetArmorDataByKey("168383___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion03
	SetArmorDataByKey("168384___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion04
	SetArmorDataByKey("168385___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassIllusion05
	SetArmorDataByKey("168386___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration03
	SetArmorDataByKey("168387___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration04
	SetArmorDataByKey("168388___Dragonborn.esm", 190, 72) ; DLC2EnchArmorNordicHeavyCuirassRestoration05

	SetArmorDataByKey("226660___Dragonborn.esm", 125, 54) ; DLC2ArmorBonemoldCuirassGuard
	SetArmorDataByKey("226659___Dragonborn.esm", 125, 54) ; DLC2ArmorBonemoldCuirassVariant01
	SetArmorDataByKey("118163___Dragonborn.esm", 125, 54) ; DLC2ArmorBonemoldCuirassVariant02
	SetArmorDataByKey("240422___Dragonborn.esm", 135, 72) ; DLC2ArmorBonemoldImprovedCuirass
	SetArmorDataByKey("165077___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth01
	SetArmorDataByKey("165078___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth02
	SetArmorDataByKey("165079___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassHealth03
	SetArmorDataByKey("165080___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor01
	SetArmorDataByKey("165081___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor02
	SetArmorDataByKey("165082___Dragonborn.esm", 125, 54) ; DLC2EnchArmorBonemoldCuirassLightArmor03

	SetArmorDataByKey("118154___Dragonborn.esm", 110, 72) ; DLC2ArmorChitinHeavyCuirass
	SetArmorDataByKey("168291___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration02
	SetArmorDataByKey("168292___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration03
	SetArmorDataByKey("168293___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassAlteration04
	SetArmorDataByKey("168294___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration02
	SetArmorDataByKey("168295___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration03
	SetArmorDataByKey("168296___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassConjuration04
	SetArmorDataByKey("168297___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction02
	SetArmorDataByKey("168298___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction03
	SetArmorDataByKey("168299___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassDestruction04
	SetArmorDataByKey("168300___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth02
	SetArmorDataByKey("168301___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth03
	SetArmorDataByKey("168302___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHealth04
	SetArmorDataByKey("168303___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor02
	SetArmorDataByKey("168304___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor03
	SetArmorDataByKey("168305___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor04
	SetArmorDataByKey("168306___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion02
	SetArmorDataByKey("168307___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion03
	SetArmorDataByKey("168308___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassIllusion04
	SetArmorDataByKey("168309___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration02
	SetArmorDataByKey("168310___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration03
	SetArmorDataByKey("168311___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinHeavyCuirassRestoration04

	SetArmorDataByKey("118151___Dragonborn.esm", 110, 72) ; DLC2ArmorChitinLightCuirass
	SetArmorDataByKey("167920___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration02
	SetArmorDataByKey("167921___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration03
	SetArmorDataByKey("167922___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassAlteration04
	SetArmorDataByKey("167923___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration02
	SetArmorDataByKey("167924___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration03
	SetArmorDataByKey("167925___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassConjuration04
	SetArmorDataByKey("167926___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction02
	SetArmorDataByKey("167927___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction03
	SetArmorDataByKey("167928___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassDestruction04
	SetArmorDataByKey("167929___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth02
	SetArmorDataByKey("167934___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth03
	SetArmorDataByKey("167930___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassHealth04
	SetArmorDataByKey("167931___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor02
	SetArmorDataByKey("167932___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor03
	SetArmorDataByKey("167935___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassLightArmor04
	SetArmorDataByKey("167936___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration02
	SetArmorDataByKey("167937___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration03
	SetArmorDataByKey("167938___Dragonborn.esm", 110, 72) ; DLC2EnchArmorChitinLightCuirassRestoration04

	SetArmorDataByKey("233742___Dragonborn.esm", 190, 54) ; DLC2ClothesSkaalCoat
	SetArmorDataByKey("118185___Dragonborn.esm", 190, 54) ; DLC2SkaalVillagerOutfit

	SetArmorDataByKey("168620___Dragonborn.esm", 110, 72) ; DLC2MoragTongCuirass

	SetArmorDataByKey("121751___Dragonborn.esm", 110, 35) ; DLC2dunKolbjornCuirass

	SetArmorDataByKey("147483___Dragonborn.esm", 190, 91) ; DLC2dunHaknirArmorCuirass

	SetArmorDataByKey("175411___Dragonborn.esm", 125, 109) ; DLC2TGArmorVariantCuirass

	SetArmorDataByKey("118186___Dragonborn.esm", 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43) ; DLC2DarkElfOutfit 		@MULTI
	SetArmorDataByKey("225381___Dragonborn.esm", 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43) ; DLC2DarkElfOutfitBlue	@MULTI
	SetArmorDataByKey("225382___Dragonborn.esm", 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43) ; DLC2DarkElfOutfitRed	@MULTI
endFunction

function SetDefaults_Hands()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddArmorDataByKey("80146___Skyrim.esm", 3, 0) ; ArmorHideGauntlets
	AddArmorDataByKey("571007___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy01
	AddArmorDataByKey("571008___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy02
	AddArmorDataByKey("571009___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy03
	AddArmorDataByKey("500041___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking01
	AddArmorDataByKey("709805___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking02
	AddArmorDataByKey("709806___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking03
	AddArmorDataByKey("500042___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman01
	AddArmorDataByKey("709807___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman02
	AddArmorDataByKey("709808___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman03
	AddArmorDataByKey("500043___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded01
	AddArmorDataByKey("709809___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded02
	AddArmorDataByKey("709810___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded03
	AddArmorDataByKey("500044___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket01
	AddArmorDataByKey("709811___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket02
	AddArmorDataByKey("709812___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket03
	AddArmorDataByKey("500046___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing01
	AddArmorDataByKey("709815___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing02
	AddArmorDataByKey("709816___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing03
	AddArmorDataByKey("500047___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded01
	AddArmorDataByKey("709817___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded02
	AddArmorDataByKey("709818___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded03
	
	AddArmorDataByKey("455579___Skyrim.esm", 12, 6) ; ArmorBanditGauntlets
	
	AddArmorDataByKey("80161___Skyrim.esm", 5, 6) ; ArmorLeatherGauntlets
	AddArmorDataByKey("571019___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy01
	AddArmorDataByKey("571020___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy02
	AddArmorDataByKey("571021___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy03
	AddArmorDataByKey("741453___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking01
	AddArmorDataByKey("741454___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking02
	AddArmorDataByKey("741455___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking03
	AddArmorDataByKey("741456___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman01
	AddArmorDataByKey("741457___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman02
	AddArmorDataByKey("741458___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman03
	AddArmorDataByKey("741459___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded01
	AddArmorDataByKey("741460___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded02
	AddArmorDataByKey("741461___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded03
	AddArmorDataByKey("741462___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket01
	AddArmorDataByKey("741463___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket02
	AddArmorDataByKey("741464___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket03
	AddArmorDataByKey("741468___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing01
	AddArmorDataByKey("741469___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing02
	AddArmorDataByKey("741470___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing03
	AddArmorDataByKey("741471___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded01
	AddArmorDataByKey("741472___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded02
	AddArmorDataByKey("741473___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded03
	
	AddArmorDataByKey("80156___Skyrim.esm", 9, 14) ; ArmorElvenGauntlets
	AddArmorDataByKey("1072915___Skyrim.esm", 9, 14) ; ArmorElvenLightGauntlets
	AddArmorDataByKey("570998___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy02
	AddArmorDataByKey("570999___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy03
	AddArmorDataByKey("571000___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy04
	AddArmorDataByKey("778202___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking02
	AddArmorDataByKey("778203___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking03
	AddArmorDataByKey("778312___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking04
	AddArmorDataByKey("778204___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman02
	AddArmorDataByKey("778205___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman03
	AddArmorDataByKey("778313___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman04
	AddArmorDataByKey("778206___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded02
	AddArmorDataByKey("778207___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded03
	AddArmorDataByKey("778314___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded04
	AddArmorDataByKey("778208___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket02
	AddArmorDataByKey("778209___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket03
	AddArmorDataByKey("778315___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket04
	AddArmorDataByKey("778212___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing02
	AddArmorDataByKey("778213___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing03
	AddArmorDataByKey("778317___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing04
	AddArmorDataByKey("778214___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded02
	AddArmorDataByKey("778215___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded03
	AddArmorDataByKey("778318___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded04
	
	AddArmorDataByKey("111520___Skyrim.esm", 12, 6) ; ArmorScaledGauntlets
	AddArmorDataByKey("289744___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy02
	AddArmorDataByKey("289745___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy03
	AddArmorDataByKey("289746___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy04
	AddArmorDataByKey("289766___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking02
	AddArmorDataByKey("289767___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking03
	AddArmorDataByKey("289768___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking04
	AddArmorDataByKey("289769___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman02
	AddArmorDataByKey("289770___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman03
	AddArmorDataByKey("289771___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman04
	AddArmorDataByKey("289913___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded02
	AddArmorDataByKey("289914___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded03
	AddArmorDataByKey("289916___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded04
	AddArmorDataByKey("289917___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket02
	AddArmorDataByKey("289919___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket03
	AddArmorDataByKey("289920___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket04
	AddArmorDataByKey("289950___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing02
	AddArmorDataByKey("290010___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing03
	AddArmorDataByKey("290026___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing04
	AddArmorDataByKey("290035___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded02
	AddArmorDataByKey("290036___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded03
	AddArmorDataByKey("290037___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded04
	
	AddArmorDataByKey("80186___Skyrim.esm", 12, 14) ; ArmorGlassGauntlets
	AddArmorDataByKey("873367___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy03
	AddArmorDataByKey("873368___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy04
	AddArmorDataByKey("873369___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy05
	AddArmorDataByKey("1036017___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking03
	AddArmorDataByKey("1036018___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking04
	AddArmorDataByKey("1036019___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking05
	AddArmorDataByKey("873388___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman03
	AddArmorDataByKey("873389___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman04
	AddArmorDataByKey("873390___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman05
	AddArmorDataByKey("873391___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded03
	AddArmorDataByKey("873392___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded04
	AddArmorDataByKey("873393___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded05
	AddArmorDataByKey("1036020___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket03
	AddArmorDataByKey("1036021___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket04
	AddArmorDataByKey("1036022___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket05
	AddArmorDataByKey("873397___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing03
	AddArmorDataByKey("873398___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing04
	AddArmorDataByKey("873399___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing05
	AddArmorDataByKey("873403___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded03
	AddArmorDataByKey("873404___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded04
	AddArmorDataByKey("873405___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded05
	
	AddArmorDataByKey("80191___Skyrim.esm", 15, 29) ; ArmorDragonscaleGauntlets
	AddArmorDataByKey("883152___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy04
	AddArmorDataByKey("883153___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy05
	AddArmorDataByKey("883154___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy06
	AddArmorDataByKey("1105777___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking04
	AddArmorDataByKey("1105778___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking05
	AddArmorDataByKey("1105779___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking06
	AddArmorDataByKey("883173___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman04
	AddArmorDataByKey("883174___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman05
	AddArmorDataByKey("883175___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman06
	AddArmorDataByKey("883176___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded04
	AddArmorDataByKey("883177___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded05
	AddArmorDataByKey("883178___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded06
	AddArmorDataByKey("1105774___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket04
	AddArmorDataByKey("1105775___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket05
	AddArmorDataByKey("1105776___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket06
	AddArmorDataByKey("883182___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing04
	AddArmorDataByKey("883183___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing05
	AddArmorDataByKey("883184___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing06
	AddArmorDataByKey("883185___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded04
	AddArmorDataByKey("883186___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded05
	AddArmorDataByKey("883187___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded06
	
	AddArmorDataByKey("77382___Skyrim.esm", 7, 6) ; ArmorIronGauntlets
	AddArmorDataByKey("802022___Skyrim.esm", 7, 6) ; FavorOrcsGauntlets
	AddArmorDataByKey("571016___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy01
	AddArmorDataByKey("571017___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy02
	AddArmorDataByKey("571018___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy03
	AddArmorDataByKey("500012___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman01
	AddArmorDataByKey("710011___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman02
	AddArmorDataByKey("710012___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman03
	AddArmorDataByKey("500014___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded01
	AddArmorDataByKey("710013___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded02
	AddArmorDataByKey("710014___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded03
	AddArmorDataByKey("500018___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing01
	AddArmorDataByKey("710019___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing02
	AddArmorDataByKey("710020___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing03
	AddArmorDataByKey("500020___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded01
	AddArmorDataByKey("710021___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded02
	AddArmorDataByKey("710022___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded03
	
	AddArmorDataByKey("80211___Skyrim.esm", 12, 6) ; ArmorSteelGauntletsA
	AddArmorDataByKey("1011491___Skyrim.esm", 12, 6) ; ArmorSteelGauntletsB
	AddArmorDataByKey("571025___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy01
	AddArmorDataByKey("571026___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy02
	AddArmorDataByKey("571027___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy03
	AddArmorDataByKey("741566___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman01
	AddArmorDataByKey("741579___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman02
	AddArmorDataByKey("741580___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman03
	AddArmorDataByKey("741567___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded01
	AddArmorDataByKey("741581___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded02
	AddArmorDataByKey("741582___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded03
	AddArmorDataByKey("741569___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing01
	AddArmorDataByKey("571028___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing02
	AddArmorDataByKey("571029___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing03
	AddArmorDataByKey("741570___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded01
	AddArmorDataByKey("741585___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded02
	AddArmorDataByKey("741586___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded03
	
	AddArmorDataByKey("80206___Skyrim.esm", 15, 21) ; ArmorDwarvenGauntlets
	AddArmorDataByKey("570995___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy02
	AddArmorDataByKey("570996___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy03
	AddArmorDataByKey("570997___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy04
	AddArmorDataByKey("111611___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman02
	AddArmorDataByKey("111612___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman03
	AddArmorDataByKey("111613___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman04
	AddArmorDataByKey("112469___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded02
	AddArmorDataByKey("112470___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded03
	AddArmorDataByKey("112471___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded04
	AddArmorDataByKey("112481___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing02
	AddArmorDataByKey("112482___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing03
	AddArmorDataByKey("112486___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing04
	AddArmorDataByKey("112487___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded02
	AddArmorDataByKey("112488___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded03
	AddArmorDataByKey("112490___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded04
	
	AddArmorDataByKey("80221___Skyrim.esm", 15, 14) ; ArmorSteelPlateGauntlets
	AddArmorDataByKey("571033___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy02
	AddArmorDataByKey("571034___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy03
	AddArmorDataByKey("571035___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy04
	AddArmorDataByKey("253739___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman02
	AddArmorDataByKey("253772___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman03
	AddArmorDataByKey("253794___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman04
	AddArmorDataByKey("253798___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded02
	AddArmorDataByKey("253799___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded03
	AddArmorDataByKey("253803___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded04
	AddArmorDataByKey("253811___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing02
	AddArmorDataByKey("253812___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing03
	AddArmorDataByKey("253813___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing04
	AddArmorDataByKey("253814___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded02
	AddArmorDataByKey("253815___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded03
	AddArmorDataByKey("253816___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded04
	
	AddArmorDataByKey("80216___Skyrim.esm", 21, 14) ; ArmorOrcishGauntlets
	AddArmorDataByKey("849880___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy03
	AddArmorDataByKey("849881___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy04
	AddArmorDataByKey("849882___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy05
	AddArmorDataByKey("849901___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman03
	AddArmorDataByKey("849902___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman04
	AddArmorDataByKey("849903___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman05
	AddArmorDataByKey("849904___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded03
	AddArmorDataByKey("849905___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded04
	AddArmorDataByKey("849906___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded05
	AddArmorDataByKey("849910___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing03
	AddArmorDataByKey("849911___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing04
	AddArmorDataByKey("849912___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing05
	AddArmorDataByKey("849913___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded03
	AddArmorDataByKey("849914___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded04
	AddArmorDataByKey("849915___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded05
	
	AddArmorDataByKey("80226___Skyrim.esm", 15, 14) ; ArmorEbonyGauntlets
	AddArmorDataByKey("849997___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy03
	AddArmorDataByKey("849998___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy04
	AddArmorDataByKey("849999___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy05
	AddArmorDataByKey("850018___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman03
	AddArmorDataByKey("850019___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman04
	AddArmorDataByKey("850020___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman05
	AddArmorDataByKey("850021___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded03
	AddArmorDataByKey("850022___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded04
	AddArmorDataByKey("850023___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded05
	AddArmorDataByKey("850027___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing03
	AddArmorDataByKey("850028___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing04
	AddArmorDataByKey("850029___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing05
	AddArmorDataByKey("850030___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded03
	AddArmorDataByKey("850031___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded04
	AddArmorDataByKey("850032___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded05
	
	AddArmorDataByKey("80231___Skyrim.esm", 15, 29) ; ArmorDragonplateGauntlets
	AddArmorDataByKey("883260___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy04
	AddArmorDataByKey("883261___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy05
	AddArmorDataByKey("883262___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy06
	AddArmorDataByKey("883281___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman04
	AddArmorDataByKey("883282___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman05
	AddArmorDataByKey("883283___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman06
	AddArmorDataByKey("883284___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded04
	AddArmorDataByKey("883285___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded05
	AddArmorDataByKey("883286___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded06
	AddArmorDataByKey("883290___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing04
	AddArmorDataByKey("883291___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing05
	AddArmorDataByKey("883292___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing06
	AddArmorDataByKey("883293___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded04
	AddArmorDataByKey("883294___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded05
	AddArmorDataByKey("883295___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded06
	
	AddArmorDataByKey("80236___Skyrim.esm", 18, 21) ; ArmorDaedricGauntlets
	AddArmorDataByKey("883374___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy04
	AddArmorDataByKey("883375___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy05
	AddArmorDataByKey("883376___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy06
	AddArmorDataByKey("883395___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman04
	AddArmorDataByKey("883396___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman05
	AddArmorDataByKey("883397___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman06
	AddArmorDataByKey("883398___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded04
	AddArmorDataByKey("883399___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded05
	AddArmorDataByKey("883400___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded06
	AddArmorDataByKey("883404___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing04
	AddArmorDataByKey("883405___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing05
	AddArmorDataByKey("883406___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing06
	AddArmorDataByKey("883407___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded04
	AddArmorDataByKey("883408___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded05
	AddArmorDataByKey("883409___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded06
	
	AddArmorDataByKey("1105977___Skyrim.esm", 0, 0) ; PrisonerCuffsPlayer
	
	AddArmorDataByKey("307853___Skyrim.esm", 12, 14) ; ArmorBladesGauntlets
	
	AddArmorDataByKey("847486___Skyrim.esm", 21, 14) ; ArmorCompanionsGauntlets
	
	AddArmorDataByKey("862275___Skyrim.esm", 12, 29) ; DBArmorGloves
	AddArmorDataByKey("1005953___Skyrim.esm", 12, 29) ; DBArmorGlovesReward
	AddArmorDataByKey("925462___Skyrim.esm", 12, 29) ; DBArmorGlovesSP
	AddArmorDataByKey("1108830___Skyrim.esm", 12, 29) ; DBArmorGlovesWornPlayable
	
	AddArmorDataByKey("355095___Skyrim.esm", 9, 3) ; ArmorDraugrGauntlets
	
	AddArmorDataByKey("683389___Skyrim.esm", 21, 14) ; ArmorStormcloakGauntlets
	
	AddArmorDataByKey("79572___Skyrim.esm", 12, 14) ; ArmorImperialGauntlets
	AddArmorDataByKey("81626___Skyrim.esm", 12, 14) ; ArmorImperialLightGauntlets
	AddArmorDataByKey("571010___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy01
	AddArmorDataByKey("571011___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy02
	AddArmorDataByKey("571012___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy03
	AddArmorDataByKey("707782___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration01
	AddArmorDataByKey("709877___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration02
	AddArmorDataByKey("709878___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration03
	AddArmorDataByKey("707784___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration01
	AddArmorDataByKey("709881___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration02
	AddArmorDataByKey("709882___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration03
	AddArmorDataByKey("707785___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction01
	AddArmorDataByKey("709883___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction02
	AddArmorDataByKey("709884___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction03
	AddArmorDataByKey("707789___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman01
	AddArmorDataByKey("709891___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman02
	AddArmorDataByKey("709892___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman03
	AddArmorDataByKey("707790___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded01
	AddArmorDataByKey("759623___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded02
	AddArmorDataByKey("709894___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded03
	AddArmorDataByKey("707793___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing01
	AddArmorDataByKey("709899___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing02
	AddArmorDataByKey("709900___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing03
	AddArmorDataByKey("707794___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded01
	AddArmorDataByKey("709901___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded02
	AddArmorDataByKey("709902___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded03
	AddArmorDataByKey("571013___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy01
	AddArmorDataByKey("571014___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy02
	AddArmorDataByKey("571015___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy03
	AddArmorDataByKey("759598___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration01
	AddArmorDataByKey("759599___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration02
	AddArmorDataByKey("759600___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration03
	AddArmorDataByKey("759604___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration01
	AddArmorDataByKey("759605___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration02
	AddArmorDataByKey("759606___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration03
	AddArmorDataByKey("759607___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction01
	AddArmorDataByKey("759608___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction02
	AddArmorDataByKey("759609___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction03
	AddArmorDataByKey("759616___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking01
	AddArmorDataByKey("759617___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking02
	AddArmorDataByKey("759618___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking03
	AddArmorDataByKey("759619___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman01
	AddArmorDataByKey("759620___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman02
	AddArmorDataByKey("759621___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman03
	AddArmorDataByKey("759622___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded01
	AddArmorDataByKey("709893___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded02
	AddArmorDataByKey("759624___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded03
	AddArmorDataByKey("759625___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket01
	AddArmorDataByKey("759626___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket02
	AddArmorDataByKey("759627___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket03
	AddArmorDataByKey("759631___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing01
	AddArmorDataByKey("759632___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing02
	AddArmorDataByKey("759633___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing03
	AddArmorDataByKey("759634___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded01
	AddArmorDataByKey("759635___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded02
	AddArmorDataByKey("759636___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded03
	
	AddArmorDataByKey("551299___Skyrim.esm", 18, 14) ; ArmorStormcloakBearGauntlets

	AddArmorDataByKey("416691___Skyrim.esm", 9, 3) ; ClothesThalmorGloves
	
	AddArmorDataByKey("867012___Skyrim.esm", 12, 29) ; ArmorThievesGuildGauntletsPlayer
	AddArmorDataByKey("867021___Skyrim.esm", 12, 29) ; ArmorThievesGuildGauntletsPlayerImproved
	AddArmorDataByKey("931288___Skyrim.esm", 12, 29) ; ArmorThievesGuildLeaderGauntlets
	AddArmorDataByKey("1082693___Skyrim.esm", 12, 29) ; ArmorLinweGauntlets
	
	AddArmorDataByKey("383879___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer01
	AddArmorDataByKey("1035280___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer02
	AddArmorDataByKey("1035281___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer03

	AddArmorDataByKey("962514___Skyrim.esm", 3, 6) ; MS02ForswornGauntlets
	AddArmorDataByKey("888149___Skyrim.esm", 3, 6) ; ForswornGauntlets

	AddArmorDataByKey("868011___Skyrim.esm", 15, 21) ; ArmorPenitusGauntlets

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddArmorDataByKey("83800___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardGauntletsHeavy
	AddArmorDataByKey("62462___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardGauntletsLight

	;@TODO: Is 'heavy' same as regular Falmer?
	AddArmorDataByKey("59615___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHardenedGauntlets
	AddArmorDataByKey("9197___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHeavyGauntlets

	AddArmorDataByKey("107807___Dawnguard.esm", 12, 21) ; DLC1ArmorVampireGauntlets

	AddArmorDataByKey("51223___Dawnguard.esm", 15, 21) ; DLC1IvoryGauntlets

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddArmorDataByKey("118176___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimHeavyGauntlets
	AddArmorDataByKey("168487___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	AddArmorDataByKey("168488___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	AddArmorDataByKey("168489___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	AddArmorDataByKey("168490___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	AddArmorDataByKey("168491___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	AddArmorDataByKey("168492___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	AddArmorDataByKey("168493___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	AddArmorDataByKey("168494___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	AddArmorDataByKey("168495___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	AddArmorDataByKey("168496___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	AddArmorDataByKey("168497___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	AddArmorDataByKey("168498___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	AddArmorDataByKey("168499___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	AddArmorDataByKey("168500___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	AddArmorDataByKey("168501___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	
	AddArmorDataByKey("118181___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimLightGauntlets
	AddArmorDataByKey("168128___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	AddArmorDataByKey("168129___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	AddArmorDataByKey("168130___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	AddArmorDataByKey("168131___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	AddArmorDataByKey("168132___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	AddArmorDataByKey("168133___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	AddArmorDataByKey("168134___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	AddArmorDataByKey("168135___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	AddArmorDataByKey("168136___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	AddArmorDataByKey("168137___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	AddArmorDataByKey("168138___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	AddArmorDataByKey("168139___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	AddArmorDataByKey("168140___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	AddArmorDataByKey("168141___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	AddArmorDataByKey("168142___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	AddArmorDataByKey("168143___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	AddArmorDataByKey("168144___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	AddArmorDataByKey("168145___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	AddArmorDataByKey("168146___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	AddArmorDataByKey("168147___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	AddArmorDataByKey("168148___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	
	AddArmorDataByKey("118168___Dragonborn.esm", 24, 21) ; DLC2ArmorNordicHeavyGauntlets
	AddArmorDataByKey("168389___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	AddArmorDataByKey("168390___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	AddArmorDataByKey("168391___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	AddArmorDataByKey("168392___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	AddArmorDataByKey("168393___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	AddArmorDataByKey("168394___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	AddArmorDataByKey("168395___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	AddArmorDataByKey("168396___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	AddArmorDataByKey("168397___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	AddArmorDataByKey("168398___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	AddArmorDataByKey("168399___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	AddArmorDataByKey("168400___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	AddArmorDataByKey("168401___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	AddArmorDataByKey("168402___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	AddArmorDataByKey("168403___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	
	AddArmorDataByKey("118164___Dragonborn.esm", 12, 14) ; DLC2ArmorBonemoldGauntlets
	AddArmorDataByKey("240418___Dragonborn.esm", 15, 21) ; DLC2ArmorBonemoldImprovedGauntlets
	AddArmorDataByKey("165083___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	AddArmorDataByKey("165084___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	AddArmorDataByKey("165085___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	AddArmorDataByKey("165086___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	AddArmorDataByKey("165087___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	AddArmorDataByKey("165088___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	AddArmorDataByKey("165089___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	AddArmorDataByKey("165090___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	AddArmorDataByKey("165091___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	AddArmorDataByKey("165092___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	AddArmorDataByKey("165093___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	AddArmorDataByKey("165094___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	AddArmorDataByKey("165095___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	AddArmorDataByKey("165096___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	AddArmorDataByKey("165097___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	AddArmorDataByKey("165098___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	AddArmorDataByKey("165099___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	AddArmorDataByKey("165100___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	AddArmorDataByKey("165101___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	AddArmorDataByKey("165102___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	AddArmorDataByKey("165103___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	AddArmorDataByKey("165104___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	AddArmorDataByKey("165105___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	AddArmorDataByKey("165106___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	AddArmorDataByKey("165107___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	AddArmorDataByKey("165108___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	AddArmorDataByKey("165109___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	AddArmorDataByKey("165110___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	AddArmorDataByKey("165111___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	AddArmorDataByKey("165112___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	
	AddArmorDataByKey("118155___Dragonborn.esm", 9, 14) ; DLC2ArmorChitinHeavyGauntlets
	AddArmorDataByKey("168312___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	AddArmorDataByKey("168313___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	AddArmorDataByKey("168314___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	AddArmorDataByKey("168315___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	AddArmorDataByKey("168316___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	AddArmorDataByKey("168317___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	AddArmorDataByKey("168318___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	AddArmorDataByKey("168319___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	AddArmorDataByKey("168320___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	AddArmorDataByKey("168321___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	AddArmorDataByKey("168322___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	AddArmorDataByKey("168323___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	AddArmorDataByKey("168324___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	AddArmorDataByKey("168325___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	AddArmorDataByKey("168326___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	
	AddArmorDataByKey("118152___Dragonborn.esm", 9, 14) ; DLC2ArmorChitinLightGauntlets
	AddArmorDataByKey("167939___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	AddArmorDataByKey("167940___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	AddArmorDataByKey("167941___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	AddArmorDataByKey("167942___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	AddArmorDataByKey("167943___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	AddArmorDataByKey("167944___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	AddArmorDataByKey("167945___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	AddArmorDataByKey("167946___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	AddArmorDataByKey("167947___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	AddArmorDataByKey("167948___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	AddArmorDataByKey("167949___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	AddArmorDataByKey("167950___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	AddArmorDataByKey("167951___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	AddArmorDataByKey("167952___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	AddArmorDataByKey("167953___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	AddArmorDataByKey("167954___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	AddArmorDataByKey("167955___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	AddArmorDataByKey("167956___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	AddArmorDataByKey("167957___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	AddArmorDataByKey("167958___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	AddArmorDataByKey("167959___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	
	AddArmorDataByKey("233744___Dragonborn.esm", 24, 14) ; DLC2ClothesSkaalGloves
	
	AddArmorDataByKey("168621___Dragonborn.esm", 9, 14) ; DLC2MoragTongGauntlets
	
	AddArmorDataByKey("121753___Dragonborn.esm", 9, 3) ; DLC2dunKolbjornGauntlets
	
	AddArmorDataByKey("147484___Dragonborn.esm", 24, 14) ; DLC2dunHaknirArmorGauntlets
	
	AddArmorDataByKey("175410___Dragonborn.esm", 12, 29) ; DLC2TGArmorVariantGloves

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddArmorDataByKey("267721___Campfire.esm", 21, 14) ; _Camp_ArmorSonsGauntlets
endFunction

function SetDefaults_Head()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddArmorDataByKey("80147___Skyrim.esm", 10, 14) ; ArmorHideHelmet
	AddArmorDataByKey("570983___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy01
	AddArmorDataByKey("570984___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy02
	AddArmorDataByKey("570985___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy03
	AddArmorDataByKey("500048___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration01
	AddArmorDataByKey("709819___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration02
	AddArmorDataByKey("709820___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration03
	AddArmorDataByKey("500049___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration01
	AddArmorDataByKey("709821___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration02
	AddArmorDataByKey("709822___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration03
	AddArmorDataByKey("500050___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction01
	AddArmorDataByKey("709823___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction02
	AddArmorDataByKey("709824___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction03
	AddArmorDataByKey("500052___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion01
	AddArmorDataByKey("709827___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion02
	AddArmorDataByKey("709828___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion03
	AddArmorDataByKey("500053___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka01
	AddArmorDataByKey("709829___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka02
	AddArmorDataByKey("709830___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka03
	AddArmorDataByKey("500055___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman01
	AddArmorDataByKey("709831___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman02
	AddArmorDataByKey("709832___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman03
	AddArmorDataByKey("500056___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration01
	AddArmorDataByKey("709833___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration02
	AddArmorDataByKey("709834___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration03
	
	AddArmorDataByKey("455582___Skyrim.esm", 45, 3) ; ArmorBanditHelmet
	
	AddArmorDataByKey("80162___Skyrim.esm", 35, 43) ; ArmorLeatherHelmet
	AddArmorDataByKey("570989___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy01
	AddArmorDataByKey("570990___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy02
	AddArmorDataByKey("570991___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy03
	AddArmorDataByKey("741474___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration01
	AddArmorDataByKey("741475___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration02
	AddArmorDataByKey("741476___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration03
	AddArmorDataByKey("741477___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration01
	AddArmorDataByKey("741478___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration02
	AddArmorDataByKey("741479___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration03
	AddArmorDataByKey("741480___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction01
	AddArmorDataByKey("741481___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction02
	AddArmorDataByKey("741482___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction03
	AddArmorDataByKey("741495___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion01
	AddArmorDataByKey("741496___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion02
	AddArmorDataByKey("741497___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion03
	AddArmorDataByKey("741498___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka01
	AddArmorDataByKey("741499___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka02
	AddArmorDataByKey("741500___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka03
	AddArmorDataByKey("741501___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman01
	AddArmorDataByKey("741502___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman02
	AddArmorDataByKey("741503___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman03
	AddArmorDataByKey("741483___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration01
	AddArmorDataByKey("741484___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration02
	AddArmorDataByKey("741485___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration03
	
	AddArmorDataByKey("80157___Skyrim.esm", 30, 29) ; ArmorElvenHelmet
	AddArmorDataByKey("1072916___Skyrim.esm", 30, 29) ; ArmorElvenLightHelmet
	AddArmorDataByKey("570980___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy02
	AddArmorDataByKey("570981___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy03
	AddArmorDataByKey("570982___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy04
	AddArmorDataByKey("778216___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration02
	AddArmorDataByKey("778217___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration03
	AddArmorDataByKey("778319___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration04
	AddArmorDataByKey("778218___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration02
	AddArmorDataByKey("778219___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration03
	AddArmorDataByKey("778320___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration04
	AddArmorDataByKey("778220___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction02
	AddArmorDataByKey("778221___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction03
	AddArmorDataByKey("778321___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction04
	AddArmorDataByKey("778224___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion02
	AddArmorDataByKey("778225___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion03
	AddArmorDataByKey("778323___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion04
	AddArmorDataByKey("778226___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka02
	AddArmorDataByKey("778227___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka03
	AddArmorDataByKey("778324___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka04
	AddArmorDataByKey("778228___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman02
	AddArmorDataByKey("778229___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman03
	AddArmorDataByKey("778325___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman04
	AddArmorDataByKey("778230___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration02
	AddArmorDataByKey("778231___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration03
	AddArmorDataByKey("778326___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration04
	
	AddArmorDataByKey("111521___Skyrim.esm", 30, 29) ; ArmorScaledHelmet
	AddArmorDataByKey("290039___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy02
	AddArmorDataByKey("290038___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy03
	AddArmorDataByKey("290040___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy04
	AddArmorDataByKey("290074___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration02
	AddArmorDataByKey("290079___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration03
	AddArmorDataByKey("290080___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration04
	AddArmorDataByKey("290081___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration02
	AddArmorDataByKey("290225___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration03
	AddArmorDataByKey("290226___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration04
	AddArmorDataByKey("290227___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction02
	AddArmorDataByKey("290228___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction03
	AddArmorDataByKey("290229___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction04
	AddArmorDataByKey("290242___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion02
	AddArmorDataByKey("290243___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion03
	AddArmorDataByKey("290244___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion04
	AddArmorDataByKey("290247___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka02
	AddArmorDataByKey("290250___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka03
	AddArmorDataByKey("290251___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka04
	AddArmorDataByKey("290259___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman02
	AddArmorDataByKey("290265___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman03
	AddArmorDataByKey("290274___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman04
	AddArmorDataByKey("290285___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration02
	AddArmorDataByKey("290286___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration03
	AddArmorDataByKey("290287___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration04
	AddArmorDataByKey("290288___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetWaterbreathing
	
	AddArmorDataByKey("80187___Skyrim.esm", 30, 29) ; ArmorGlassHelmet
	AddArmorDataByKey("873406___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy03
	AddArmorDataByKey("873407___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy04
	AddArmorDataByKey("873408___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy05
	AddArmorDataByKey("873409___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration03
	AddArmorDataByKey("873410___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration04
	AddArmorDataByKey("873411___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration05
	AddArmorDataByKey("873412___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration03
	AddArmorDataByKey("873413___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration04
	AddArmorDataByKey("873414___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration05
	AddArmorDataByKey("873415___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction03
	AddArmorDataByKey("873416___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction04
	AddArmorDataByKey("873417___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction05
	AddArmorDataByKey("873421___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion03
	AddArmorDataByKey("873422___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion04
	AddArmorDataByKey("873423___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion05
	AddArmorDataByKey("873424___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka03
	AddArmorDataByKey("873425___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka04
	AddArmorDataByKey("873426___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka05
	AddArmorDataByKey("1041114___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate03
	AddArmorDataByKey("1041115___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate04
	AddArmorDataByKey("1041119___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate05
	AddArmorDataByKey("873427___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman03
	AddArmorDataByKey("873428___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman04
	AddArmorDataByKey("873429___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman05
	AddArmorDataByKey("873430___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration03
	AddArmorDataByKey("873431___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration04
	AddArmorDataByKey("873432___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration05
	AddArmorDataByKey("873433___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetWaterbreathing
	
	AddArmorDataByKey("80192___Skyrim.esm", 40, 58) ; ArmorDragonscaleHelmet
	AddArmorDataByKey("883188___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy04
	AddArmorDataByKey("883189___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy05
	AddArmorDataByKey("883190___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy06
	AddArmorDataByKey("883191___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration04
	AddArmorDataByKey("883192___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration05
	AddArmorDataByKey("883193___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration06
	AddArmorDataByKey("883194___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration04
	AddArmorDataByKey("883195___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration05
	AddArmorDataByKey("883196___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration06
	AddArmorDataByKey("883197___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction04
	AddArmorDataByKey("883198___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction05
	AddArmorDataByKey("883199___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction06
	AddArmorDataByKey("883203___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion04
	AddArmorDataByKey("883204___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion05
	AddArmorDataByKey("883205___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion06
	AddArmorDataByKey("883206___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka04
	AddArmorDataByKey("883207___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka05
	AddArmorDataByKey("883208___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka06
	AddArmorDataByKey("1041126___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate04
	AddArmorDataByKey("1041127___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate05
	AddArmorDataByKey("1041128___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate06
	AddArmorDataByKey("883209___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman04
	AddArmorDataByKey("883210___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman05
	AddArmorDataByKey("883211___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman06
	AddArmorDataByKey("883212___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration04
	AddArmorDataByKey("883213___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration05
	AddArmorDataByKey("883214___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration06
	AddArmorDataByKey("883215___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetWaterbreathing
	
	AddArmorDataByKey("77389___Skyrim.esm", 15, 3) ; ArmorIronHelmet
	AddArmorDataByKey("570986___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy01
	AddArmorDataByKey("570987___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy02
	AddArmorDataByKey("570988___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy03
	AddArmorDataByKey("499996___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration01
	AddArmorDataByKey("710023___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration02
	AddArmorDataByKey("710024___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration03
	AddArmorDataByKey("500003___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration01
	AddArmorDataByKey("710025___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration02
	AddArmorDataByKey("710026___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration03
	AddArmorDataByKey("500005___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction01
	AddArmorDataByKey("710027___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction02
	AddArmorDataByKey("710028___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction03
	AddArmorDataByKey("500009___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion01
	AddArmorDataByKey("710031___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion02
	AddArmorDataByKey("710032___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion03
	AddArmorDataByKey("303537___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka01
	AddArmorDataByKey("710033___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka02
	AddArmorDataByKey("710034___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka03
	AddArmorDataByKey("500013___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman01
	AddArmorDataByKey("710035___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman02
	AddArmorDataByKey("710036___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman03
	AddArmorDataByKey("500017___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration01
	AddArmorDataByKey("710037___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration02
	AddArmorDataByKey("710039___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration03
	
	AddArmorDataByKey("80212___Skyrim.esm", 35, 14) ; ArmorSteelHelmetA
	AddArmorDataByKey("1011492___Skyrim.esm", 35, 14) ; ArmorSteelHelmetB
	AddArmorDataByKey("571039___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy01
	AddArmorDataByKey("571040___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy02
	AddArmorDataByKey("571041___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy03
	AddArmorDataByKey("741587___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration01
	AddArmorDataByKey("741595___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration02
	AddArmorDataByKey("741596___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration03
	AddArmorDataByKey("741588___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration01
	AddArmorDataByKey("741597___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration02
	AddArmorDataByKey("741598___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration03
	AddArmorDataByKey("741589___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction01
	AddArmorDataByKey("741599___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction02
	AddArmorDataByKey("741600___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction03
	AddArmorDataByKey("741591___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion01
	AddArmorDataByKey("741603___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion02
	AddArmorDataByKey("741604___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion03
	AddArmorDataByKey("741592___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka01
	AddArmorDataByKey("741605___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka02
	AddArmorDataByKey("741606___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka03
	AddArmorDataByKey("741593___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman01
	AddArmorDataByKey("741609___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman02
	AddArmorDataByKey("741610___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman03
	AddArmorDataByKey("741594___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration01
	AddArmorDataByKey("741607___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration02
	AddArmorDataByKey("741608___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration03
	AddArmorDataByKey("600710___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetWaterbreathing
	
	AddArmorDataByKey("80207___Skyrim.esm", 40, 29) ; ArmorDwarvenHelmet
	AddArmorDataByKey("570970___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy02
	AddArmorDataByKey("570978___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy03
	AddArmorDataByKey("570979___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy04
	AddArmorDataByKey("112491___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration02
	AddArmorDataByKey("112492___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration03
	AddArmorDataByKey("112493___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration04
	AddArmorDataByKey("112494___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration02
	AddArmorDataByKey("112495___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration03
	AddArmorDataByKey("112496___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration04
	AddArmorDataByKey("112497___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction02
	AddArmorDataByKey("112498___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction03
	AddArmorDataByKey("112522___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction04
	AddArmorDataByKey("113072___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion02
	AddArmorDataByKey("113079___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion03
	AddArmorDataByKey("113080___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion04
	AddArmorDataByKey("113083___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka02
	AddArmorDataByKey("113084___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka03
	AddArmorDataByKey("113086___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka04
	AddArmorDataByKey("113088___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman02
	AddArmorDataByKey("113089___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman03
	AddArmorDataByKey("113091___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman04
	AddArmorDataByKey("113092___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration02
	AddArmorDataByKey("113093___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration03
	AddArmorDataByKey("113095___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration04
	AddArmorDataByKey("600717___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetWaterbreathing
	
	AddArmorDataByKey("80222___Skyrim.esm", 35, 14) ; ArmorSteelPlateHelmet
	AddArmorDataByKey("570992___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy02
	AddArmorDataByKey("570993___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy03
	AddArmorDataByKey("570994___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy04
	AddArmorDataByKey("253817___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration02
	AddArmorDataByKey("253818___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration03
	AddArmorDataByKey("253819___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration04
	AddArmorDataByKey("253820___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration02
	AddArmorDataByKey("253821___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration03
	AddArmorDataByKey("253822___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration04
	AddArmorDataByKey("253823___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction02
	AddArmorDataByKey("253824___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction03
	AddArmorDataByKey("253825___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction04
	AddArmorDataByKey("253829___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion02
	AddArmorDataByKey("266270___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion03
	AddArmorDataByKey("266272___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion04
	AddArmorDataByKey("266273___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka02
	AddArmorDataByKey("266274___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka03
	AddArmorDataByKey("266279___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka04
	AddArmorDataByKey("266284___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman02
	AddArmorDataByKey("266291___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman03
	AddArmorDataByKey("266292___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman04
	AddArmorDataByKey("266293___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration02
	AddArmorDataByKey("266294___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration03
	AddArmorDataByKey("266295___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration04
	AddArmorDataByKey("600778___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetWaterbreathing
	
	AddArmorDataByKey("80217___Skyrim.esm", 50, 14) ; ArmorOrcishHelmet
	AddArmorDataByKey("849916___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy03
	AddArmorDataByKey("849917___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy04
	AddArmorDataByKey("849918___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy05
	AddArmorDataByKey("849919___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration03
	AddArmorDataByKey("849920___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration04
	AddArmorDataByKey("849921___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration05
	AddArmorDataByKey("849922___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration03
	AddArmorDataByKey("849923___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration04
	AddArmorDataByKey("849924___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration05
	AddArmorDataByKey("849925___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction03
	AddArmorDataByKey("849926___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction04
	AddArmorDataByKey("849927___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction05
	AddArmorDataByKey("849931___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion03
	AddArmorDataByKey("849932___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion04
	AddArmorDataByKey("849933___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion05
	AddArmorDataByKey("849934___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka03
	AddArmorDataByKey("849935___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka04
	AddArmorDataByKey("849936___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka05
	AddArmorDataByKey("849937___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman03
	AddArmorDataByKey("849938___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman04
	AddArmorDataByKey("849939___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman05
	AddArmorDataByKey("849940___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration03
	AddArmorDataByKey("849941___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration04
	AddArmorDataByKey("849942___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration05
	AddArmorDataByKey("849943___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetWaterbreathing
	
	AddArmorDataByKey("80227___Skyrim.esm", 40, 29) ; ArmorEbonyHelmet
	AddArmorDataByKey("850033___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy03
	AddArmorDataByKey("850034___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy04
	AddArmorDataByKey("850035___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy05
	AddArmorDataByKey("850036___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration03
	AddArmorDataByKey("850037___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration04
	AddArmorDataByKey("850038___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration05
	AddArmorDataByKey("850039___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration03
	AddArmorDataByKey("850040___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration04
	AddArmorDataByKey("850041___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration05
	AddArmorDataByKey("850042___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction03
	AddArmorDataByKey("850043___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction04
	AddArmorDataByKey("850044___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction05
	AddArmorDataByKey("850048___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion03
	AddArmorDataByKey("850049___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion04
	AddArmorDataByKey("850050___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion05
	AddArmorDataByKey("850051___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka03
	AddArmorDataByKey("850052___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka04
	AddArmorDataByKey("850053___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka05
	AddArmorDataByKey("1041135___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate03
	AddArmorDataByKey("1041136___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate04
	AddArmorDataByKey("1041137___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate05
	AddArmorDataByKey("850054___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman03
	AddArmorDataByKey("850055___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman04
	AddArmorDataByKey("850056___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman05
	AddArmorDataByKey("850057___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration03
	AddArmorDataByKey("850058___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration04
	AddArmorDataByKey("850059___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration05
	AddArmorDataByKey("850060___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetWaterbreathing
	
	AddArmorDataByKey("80233___Skyrim.esm", 40, 58) ; ArmorDragonplateHelmet
	AddArmorDataByKey("883296___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy04
	AddArmorDataByKey("883297___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy05
	AddArmorDataByKey("883298___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy06
	AddArmorDataByKey("883299___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration04
	AddArmorDataByKey("883300___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration05
	AddArmorDataByKey("883301___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration06
	AddArmorDataByKey("883302___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration04
	AddArmorDataByKey("883303___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration05
	AddArmorDataByKey("883304___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration06
	AddArmorDataByKey("883305___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction04
	AddArmorDataByKey("883306___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction05
	AddArmorDataByKey("883307___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction06
	AddArmorDataByKey("883311___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion04
	AddArmorDataByKey("883312___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion05
	AddArmorDataByKey("883313___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion06
	AddArmorDataByKey("883314___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka04
	AddArmorDataByKey("883315___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka05
	AddArmorDataByKey("883316___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka06
	AddArmorDataByKey("1041138___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate04
	AddArmorDataByKey("1041139___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate05
	AddArmorDataByKey("1041140___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate06
	AddArmorDataByKey("883317___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman04
	AddArmorDataByKey("883318___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman05
	AddArmorDataByKey("883319___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman06
	AddArmorDataByKey("883320___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration04
	AddArmorDataByKey("883321___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration05
	AddArmorDataByKey("883322___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration06
	AddArmorDataByKey("883323___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetWaterbreathing
	
	AddArmorDataByKey("80237___Skyrim.esm", 45, 43) ; ArmorDaedricHelmet
	AddArmorDataByKey("883410___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy04
	AddArmorDataByKey("883411___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy05
	AddArmorDataByKey("883412___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy06
	AddArmorDataByKey("883413___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration04
	AddArmorDataByKey("883414___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration05
	AddArmorDataByKey("883415___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration06
	AddArmorDataByKey("883416___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration04
	AddArmorDataByKey("883417___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration05
	AddArmorDataByKey("883418___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration06
	AddArmorDataByKey("883419___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction04
	AddArmorDataByKey("883420___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction05
	AddArmorDataByKey("883421___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction06
	AddArmorDataByKey("883425___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion04
	AddArmorDataByKey("883426___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion05
	AddArmorDataByKey("883427___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion06
	AddArmorDataByKey("883428___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka04
	AddArmorDataByKey("883429___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka05
	AddArmorDataByKey("883430___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka06
	AddArmorDataByKey("1041153___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate04
	AddArmorDataByKey("1041154___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate05
	AddArmorDataByKey("1041155___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate06
	AddArmorDataByKey("883431___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman04
	AddArmorDataByKey("883432___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman05
	AddArmorDataByKey("883433___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman06
	AddArmorDataByKey("883434___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration04
	AddArmorDataByKey("883435___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration05
	AddArmorDataByKey("883436___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration06
	AddArmorDataByKey("883437___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetWaterbreathing
	
	AddArmorDataByKey("307855___Skyrim.esm", 35, 14) ; ArmorBladesHelmet
	
	AddArmorDataByKey("312272___Skyrim.esm", 50, 14) ; ArmorCompanionsHelmet
	
	AddArmorDataByKey("862274___Skyrim.esm", 35, 58) ; DBArmorHelmet
	AddArmorDataByKey("371652___Skyrim.esm", 35, 58) ; DBArmorHelmetMaskLess
	AddArmorDataByKey("925463___Skyrim.esm", 35, 58) ; DBArmorHelmetSP
	AddArmorDataByKey("1108829___Skyrim.esm", 35, 58) ; DBArmorHelmetWornPlayable
	
	AddArmorDataByKey("354974___Skyrim.esm", 30, 3) ; ArmorDraugrHelmet
	AddArmorDataByKey("1001806___Skyrim.esm", 30, 3) ; EnchArmorDraugrHelmetResistFire03
	
	AddArmorDataByKey("1070493___Skyrim.esm", 30, 14) ; ArmorEastmarchHelmetFull
	AddArmorDataByKey("136729___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullFalkreath
	AddArmorDataByKey("819036___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullHaafingar
	AddArmorDataByKey("136731___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullHjaalmarch
	AddArmorDataByKey("136735___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullPale
	AddArmorDataByKey("136723___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullReach
	AddArmorDataByKey("136738___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullRift
	AddArmorDataByKey("136725___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullWhiterun
	AddArmorDataByKey("136733___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullWinterhold
	
	AddArmorDataByKey("81628___Skyrim.esm", 35, 43) ; ArmorImperialHelmet
	AddArmorDataByKey("81627___Skyrim.esm", 35, 43) ; ArmorImperialLightHelmet
	AddArmorDataByKey("614669___Skyrim.esm", 35, 43) ; ArmorImperialHelmetFull
	AddArmorDataByKey("79567___Skyrim.esm", 35, 43) ; ArmorImperialHelmetOfficer
	AddArmorDataByKey("571042___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy01
	AddArmorDataByKey("571043___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy02
	AddArmorDataByKey("571044___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy03
	AddArmorDataByKey("571045___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration01
	AddArmorDataByKey("571046___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration02
	AddArmorDataByKey("571047___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration03
	AddArmorDataByKey("571048___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration01
	AddArmorDataByKey("571049___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration02
	AddArmorDataByKey("571050___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration03
	AddArmorDataByKey("571051___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction01
	AddArmorDataByKey("571052___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction02
	AddArmorDataByKey("571053___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction03
	AddArmorDataByKey("571057___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion01
	AddArmorDataByKey("571058___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion02
	AddArmorDataByKey("571059___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion03
	AddArmorDataByKey("571060___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMagicka01
	AddArmorDataByKey("571061___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMagicka02
	AddArmorDataByKey("571063___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman01
	AddArmorDataByKey("571064___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman02
	AddArmorDataByKey("571065___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman03
	AddArmorDataByKey("571066___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration01
	AddArmorDataByKey("571067___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration02
	AddArmorDataByKey("571068___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration03
	AddArmorDataByKey("571069___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy01
	AddArmorDataByKey("571075___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy02
	AddArmorDataByKey("571070___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy03
	AddArmorDataByKey("571071___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration01
	AddArmorDataByKey("571072___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration02
	AddArmorDataByKey("571073___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration03
	AddArmorDataByKey("571074___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration01
	AddArmorDataByKey("571076___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration02
	AddArmorDataByKey("571077___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration03
	AddArmorDataByKey("571078___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction01
	AddArmorDataByKey("571079___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction02
	AddArmorDataByKey("571080___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction03
	AddArmorDataByKey("571084___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion01
	AddArmorDataByKey("571085___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion02
	AddArmorDataByKey("571086___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion03
	AddArmorDataByKey("571087___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka01
	AddArmorDataByKey("571088___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka02
	AddArmorDataByKey("571062___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka03
	
	AddArmorDataByKey("551301___Skyrim.esm", 50, 14) ; ArmorStormcloakBearHelmet
	
	AddArmorDataByKey("683385___Skyrim.esm", 30, 14) ; ArmorStormcloakHelmetFull
	
	AddArmorDataByKey("867013___Skyrim.esm", 35, 58) ; ArmorThievesGuildHelmetPlayer
	AddArmorDataByKey("867022___Skyrim.esm", 35, 58) ; ArmorThievesGuildHelmetPlayerImproved
	AddArmorDataByKey("931289___Skyrim.esm", 35, 58) ; ArmorThievesGuildLeaderHelmet
	AddArmorDataByKey("1082694___Skyrim.esm", 35, 58) ; ArmorLinweHelmet
	
	AddArmorDataByKey("383880___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer01
	AddArmorDataByKey("1035283___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer02
	AddArmorDataByKey("1035282___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer03

	AddArmorDataByKey("962513___Skyrim.esm", 40, 3) ; MS02ForswornHelmet
	AddArmorDataByKey("888146___Skyrim.esm", 40, 3) ; ForswornHelmet

	AddArmorDataByKey("400569___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskBronzeHelmet
	AddArmorDataByKey("400555___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskCorondrumHelmet
	AddArmorDataByKey("400549___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskEbonyHelmet
	AddArmorDataByKey("400577___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskIronHelmet
	AddArmorDataByKey("400578___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskMarbleHelmet
	AddArmorDataByKey("400523___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskMoonstoneHelmet
	AddArmorDataByKey("400576___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskOrichalumHelmet
	AddArmorDataByKey("400585___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskSteelHelmet
	AddArmorDataByKey("400598___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskUltraHelmet
	AddArmorDataByKey("400586___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskWoodHelmet

	AddArmorDataByKey("868010___Skyrim.esm", 40, 29) ; ArmorPenitusHelmet


	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddArmorDataByKey("105182___Dawnguard.esm", 25, 51) ; DLC01ClothesVampireHood
	AddArmorDataByKey("20688___Dawnguard.esm", 35, 14) ; DLC1ArmorDawnguardHelmetHeavy
	AddArmorDataByKey("104606___Dawnguard.esm", 35, 14) ; DLC1ArmorDawnguardHelmetLight

	AddArmorDataByKey("59616___Dawnguard.esm", 35, 14) ; DLC1ArmorFAlmerHardenedHelmet
	AddArmorDataByKey("9195___Dawnguard.esm", 35, 14) ; DLC1ArmorFAlmerHeavyHelmet
	AddArmorDataByKey("77450___Dawnguard.esm", 35, 14) ; DLC1ArmorShellbugHelmet

	AddArmorDataByKey("51220___Dawnguard.esm", 40, 29) ; DLC1IvoryCrown


	;##############################
	;
	;    Dragonborn
	;
	;##############################

	AddArmorDataByKey("233748___Dragonborn.esm", 55, 14) ; DLC2ClothesSkaalHat
	AddArmorDataByKey("168622___Dragonborn.esm", 30, 14) ; DLC2MoragTongHood
	AddArmorDataByKey("121752___Dragonborn.esm", 30, 3) ; DLC2dunKolbjornHelm
	AddArmorDataByKey("147485___Dragonborn.esm", 55, 29) ; DLC2dunHaknirArmorHelm
	AddArmorDataByKey("232157___Dragonborn.esm", 40, 29) ; DLC2dunFahlbtharzDwarvenHelmet
	AddArmorDataByKey("175409___Dragonborn.esm", 35, 58) ; DLC2TGArmorVariantHood

	AddArmorDataByKey("118177___Dragonborn.esm", 55, 29) ; DLC2ArmorStalhrimHeavyHelmet
	AddArmorDataByKey("168502___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	AddArmorDataByKey("168503___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	AddArmorDataByKey("168504___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	AddArmorDataByKey("168505___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	AddArmorDataByKey("168506___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	AddArmorDataByKey("168507___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	AddArmorDataByKey("168508___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	AddArmorDataByKey("168509___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	AddArmorDataByKey("168510___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	AddArmorDataByKey("168511___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	AddArmorDataByKey("168512___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	AddArmorDataByKey("168513___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	AddArmorDataByKey("168514___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	AddArmorDataByKey("168515___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	AddArmorDataByKey("168516___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	AddArmorDataByKey("168517___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	AddArmorDataByKey("168518___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	AddArmorDataByKey("168519___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	AddArmorDataByKey("168520___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	AddArmorDataByKey("168521___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	AddArmorDataByKey("168522___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	AddArmorDataByKey("168523___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	AddArmorDataByKey("168524___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	AddArmorDataByKey("168525___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	AddArmorDataByKey("168526___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	AddArmorDataByKey("168527___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	AddArmorDataByKey("168528___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	AddArmorDataByKey("168529___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing

	AddArmorDataByKey("118179___Dragonborn.esm", 55, 29) ; DLC2ArmorStalhrimLightHelmet
	AddArmorDataByKey("168149___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	AddArmorDataByKey("168150___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	AddArmorDataByKey("168151___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	AddArmorDataByKey("168152___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	AddArmorDataByKey("168153___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	AddArmorDataByKey("168154___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	AddArmorDataByKey("168155___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	AddArmorDataByKey("168156___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	AddArmorDataByKey("168157___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	AddArmorDataByKey("168158___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	AddArmorDataByKey("168159___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	AddArmorDataByKey("168160___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	AddArmorDataByKey("168161___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	AddArmorDataByKey("168162___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	AddArmorDataByKey("168163___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	AddArmorDataByKey("168164___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	AddArmorDataByKey("168165___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	AddArmorDataByKey("168166___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	AddArmorDataByKey("168167___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	AddArmorDataByKey("168168___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	AddArmorDataByKey("168169___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	AddArmorDataByKey("168170___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	AddArmorDataByKey("168171___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	AddArmorDataByKey("168172___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	AddArmorDataByKey("168173___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	AddArmorDataByKey("168174___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	AddArmorDataByKey("168175___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	AddArmorDataByKey("168191___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing

	AddArmorDataByKey("118169___Dragonborn.esm", 55, 29) ; DLC2ArmorNordicHeavyHelmet
	AddArmorDataByKey("168404___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	AddArmorDataByKey("168405___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	AddArmorDataByKey("168406___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	AddArmorDataByKey("168407___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	AddArmorDataByKey("168408___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	AddArmorDataByKey("168409___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	AddArmorDataByKey("168410___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	AddArmorDataByKey("168411___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	AddArmorDataByKey("168412___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	AddArmorDataByKey("168413___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	AddArmorDataByKey("168414___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	AddArmorDataByKey("168415___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	AddArmorDataByKey("168416___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	AddArmorDataByKey("168417___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	AddArmorDataByKey("168418___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	AddArmorDataByKey("168419___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	AddArmorDataByKey("168420___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	AddArmorDataByKey("168421___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	AddArmorDataByKey("168422___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	AddArmorDataByKey("168423___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	AddArmorDataByKey("168424___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	AddArmorDataByKey("168425___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	AddArmorDataByKey("168426___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	AddArmorDataByKey("168427___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	AddArmorDataByKey("168428___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing

	AddArmorDataByKey("118165___Dragonborn.esm", 35, 14) ; DLC2ArmorBonemoldHelmet
	AddArmorDataByKey("240419___Dragonborn.esm", 40, 29) ; DLC2ArmorBonemoldImprovedHelmet
	AddArmorDataByKey("165113___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	AddArmorDataByKey("165114___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	AddArmorDataByKey("165115___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	AddArmorDataByKey("165116___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration01
	AddArmorDataByKey("165117___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration02
	AddArmorDataByKey("165118___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration03
	AddArmorDataByKey("165119___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration01
	AddArmorDataByKey("165120___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration02
	AddArmorDataByKey("165121___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration03
	AddArmorDataByKey("165122___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction01
	AddArmorDataByKey("165123___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction02
	AddArmorDataByKey("165124___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction03
	AddArmorDataByKey("165125___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion01
	AddArmorDataByKey("165126___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion02
	AddArmorDataByKey("165127___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion03
	AddArmorDataByKey("165128___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka01
	AddArmorDataByKey("165129___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka02
	AddArmorDataByKey("165130___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka03

	AddArmorDataByKey("118156___Dragonborn.esm", 30, 14) ; DLC2ArmorChitinHeavyHelmet
	AddArmorDataByKey("168327___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	AddArmorDataByKey("168328___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	AddArmorDataByKey("168329___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	AddArmorDataByKey("168330___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	AddArmorDataByKey("168331___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	AddArmorDataByKey("168332___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	AddArmorDataByKey("168333___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	AddArmorDataByKey("168334___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	AddArmorDataByKey("168335___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	AddArmorDataByKey("168336___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	AddArmorDataByKey("168337___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	AddArmorDataByKey("168338___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	AddArmorDataByKey("168339___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	AddArmorDataByKey("168340___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	AddArmorDataByKey("168341___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	AddArmorDataByKey("168342___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	AddArmorDataByKey("168343___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	AddArmorDataByKey("168344___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	AddArmorDataByKey("168345___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	AddArmorDataByKey("168346___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	AddArmorDataByKey("168347___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	AddArmorDataByKey("168348___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	AddArmorDataByKey("168349___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	AddArmorDataByKey("168350___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	AddArmorDataByKey("168351___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing

	AddArmorDataByKey("118153___Dragonborn.esm", 30, 14) ; DLC2ArmorChitinLightHelmet
	AddArmorDataByKey("167960___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	AddArmorDataByKey("167961___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	AddArmorDataByKey("167962___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	AddArmorDataByKey("167963___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration02
	AddArmorDataByKey("167964___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration03
	AddArmorDataByKey("167965___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration04
	AddArmorDataByKey("167966___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration02
	AddArmorDataByKey("167967___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration03
	AddArmorDataByKey("167968___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration04
	AddArmorDataByKey("167969___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction02
	AddArmorDataByKey("167970___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction03
	AddArmorDataByKey("167972___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction04
	AddArmorDataByKey("167971___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion02
	AddArmorDataByKey("167973___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion03
	AddArmorDataByKey("167974___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion04
	AddArmorDataByKey("167975___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka02
	AddArmorDataByKey("167976___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka03
	AddArmorDataByKey("167977___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka04
	AddArmorDataByKey("167978___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman02
	AddArmorDataByKey("167979___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman03
	AddArmorDataByKey("167980___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman04
	AddArmorDataByKey("167981___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration02
	AddArmorDataByKey("167982___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration03
	AddArmorDataByKey("167983___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration04

	AddArmorDataByKey("147710___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskFire
	AddArmorDataByKey("147711___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskFrost
	AddArmorDataByKey("147511___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskShock
	AddArmorDataByKey("170594___Dragonborn.esm", 10, 0) ; DLC2MiraakMaskNew
	AddArmorDataByKey("237473___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask1H
	AddArmorDataByKey("236843___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask1L
	AddArmorDataByKey("237474___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask2H
	AddArmorDataByKey("236846___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask2L
	AddArmorDataByKey("237475___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask3H
	AddArmorDataByKey("236847___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask3L
endFunction

function SetDefaults_Feet()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	AddArmorDataByKey("80144___Skyrim.esm", 12, 6) ; ArmorHideBoots
	AddArmorDataByKey("500021___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry01
	AddArmorDataByKey("709713___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry02
	AddArmorDataByKey("709714___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry03
	AddArmorDataByKey("500022___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire01
	AddArmorDataByKey("709769___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire02
	AddArmorDataByKey("709770___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire03
	AddArmorDataByKey("500023___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost01
	AddArmorDataByKey("709771___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost02
	AddArmorDataByKey("709772___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost03
	AddArmorDataByKey("500024___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock01
	AddArmorDataByKey("709773___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock02
	AddArmorDataByKey("709774___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock03
	AddArmorDataByKey("500025___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak01
	AddArmorDataByKey("709775___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak02
	AddArmorDataByKey("709776___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak03
	AddArmorDataByKey("1105804___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina01
	AddArmorDataByKey("1105805___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina02
	AddArmorDataByKey("1105806___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina03
	
	AddArmorDataByKey("455576___Skyrim.esm", 15, 6) ; ArmorBanditBoots
	
	AddArmorDataByKey("80160___Skyrim.esm", 12, 21) ; ArmorLeatherBoots
	AddArmorDataByKey("737829___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry01
	AddArmorDataByKey("737830___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry02
	AddArmorDataByKey("737831___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry03
	AddArmorDataByKey("737832___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire01
	AddArmorDataByKey("737833___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire02
	AddArmorDataByKey("737834___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire03
	AddArmorDataByKey("737835___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost01
	AddArmorDataByKey("737836___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost02
	AddArmorDataByKey("737837___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost03
	AddArmorDataByKey("737838___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock01
	AddArmorDataByKey("737839___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock02
	AddArmorDataByKey("737840___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock03
	AddArmorDataByKey("737841___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak01
	AddArmorDataByKey("737842___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak02
	AddArmorDataByKey("737843___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak03
	AddArmorDataByKey("1105810___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina01
	AddArmorDataByKey("1105811___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina02
	AddArmorDataByKey("1105812___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina03
	
	AddArmorDataByKey("80154___Skyrim.esm", 9, 14) ; ArmorElvenBoots
	AddArmorDataByKey("1072913___Skyrim.esm", 9, 14) ; ArmorElvenLightBoots
	AddArmorDataByKey("778169___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry02
	AddArmorDataByKey("778170___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry03
	AddArmorDataByKey("778171___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry04
	AddArmorDataByKey("778172___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire02
	AddArmorDataByKey("778173___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire03
	AddArmorDataByKey("778232___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire04
	AddArmorDataByKey("778174___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost02
	AddArmorDataByKey("778175___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost03
	AddArmorDataByKey("778298___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost04
	AddArmorDataByKey("778176___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock02
	AddArmorDataByKey("778177___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock03
	AddArmorDataByKey("778299___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock04
	AddArmorDataByKey("778178___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak02
	AddArmorDataByKey("778179___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak03
	AddArmorDataByKey("778300___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak04
	AddArmorDataByKey("1105798___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina02
	AddArmorDataByKey("1105799___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina03
	AddArmorDataByKey("1105800___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina04
	
	AddArmorDataByKey("111519___Skyrim.esm", 12, 6) ; ArmorScaledBoots
	AddArmorDataByKey("873446___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry02
	AddArmorDataByKey("873447___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry03
	AddArmorDataByKey("873448___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry04
	AddArmorDataByKey("873449___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire02
	AddArmorDataByKey("873450___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire03
	AddArmorDataByKey("873451___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire04
	AddArmorDataByKey("873452___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost02
	AddArmorDataByKey("873453___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost03
	AddArmorDataByKey("873454___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost04
	AddArmorDataByKey("873455___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock02
	AddArmorDataByKey("873456___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock03
	AddArmorDataByKey("873457___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock04
	AddArmorDataByKey("873458___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak02
	AddArmorDataByKey("873459___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak03
	AddArmorDataByKey("873460___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak04
	AddArmorDataByKey("1105816___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina02
	AddArmorDataByKey("1105817___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina03
	AddArmorDataByKey("1105818___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina04
	
	AddArmorDataByKey("80184___Skyrim.esm", 12, 14) ; ArmorGlassBoots
	AddArmorDataByKey("873326___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry03
	AddArmorDataByKey("873327___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry04
	AddArmorDataByKey("873328___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry05
	AddArmorDataByKey("873329___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsMuffle
	AddArmorDataByKey("873330___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire03
	AddArmorDataByKey("873331___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire04
	AddArmorDataByKey("873332___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire05
	AddArmorDataByKey("873333___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost03
	AddArmorDataByKey("873334___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost04
	AddArmorDataByKey("873335___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost05
	AddArmorDataByKey("873336___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock03
	AddArmorDataByKey("873337___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock04
	AddArmorDataByKey("873338___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock05
	AddArmorDataByKey("1105780___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak03
	AddArmorDataByKey("1105781___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak04
	AddArmorDataByKey("1105782___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak05
	AddArmorDataByKey("1105801___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina03
	AddArmorDataByKey("1105802___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina04
	AddArmorDataByKey("1105803___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina05
	
	AddArmorDataByKey("80189___Skyrim.esm", 15, 29) ; ArmorDragonscaleBoots
	AddArmorDataByKey("883111___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry04
	AddArmorDataByKey("883112___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry05
	AddArmorDataByKey("883113___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry06
	AddArmorDataByKey("883115___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire04
	AddArmorDataByKey("883116___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire05
	AddArmorDataByKey("883117___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire06
	AddArmorDataByKey("883118___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost04
	AddArmorDataByKey("883119___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost05
	AddArmorDataByKey("883120___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost06
	AddArmorDataByKey("883121___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock04
	AddArmorDataByKey("883122___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock05
	AddArmorDataByKey("883123___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock06
	AddArmorDataByKey("883114___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak04
	AddArmorDataByKey("1038853___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak05
	AddArmorDataByKey("1038854___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak06
	AddArmorDataByKey("1105789___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina04
	AddArmorDataByKey("1105790___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina05
	AddArmorDataByKey("1105791___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina06
	
	AddArmorDataByKey("77387___Skyrim.esm", 7, 6) ; ArmorIronBoots
	AddArmorDataByKey("500000___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry01
	AddArmorDataByKey("709979___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry02
	AddArmorDataByKey("709980___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry03
	AddArmorDataByKey("499952___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire01
	AddArmorDataByKey("709981___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire02
	AddArmorDataByKey("709982___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire03
	AddArmorDataByKey("499953___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost01
	AddArmorDataByKey("709983___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost02
	AddArmorDataByKey("709984___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost03
	AddArmorDataByKey("301970___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock01
	AddArmorDataByKey("709985___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock02
	AddArmorDataByKey("709986___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock03
	AddArmorDataByKey("1105807___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina01
	AddArmorDataByKey("1105808___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina02
	AddArmorDataByKey("1105809___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina03
	
	AddArmorDataByKey("80209___Skyrim.esm", 12, 14) ; ArmorSteelBootsA
	AddArmorDataByKey("1011489___Skyrim.esm", 12, 14) ; ArmorSteelBootsB
	AddArmorDataByKey("741530___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry01
	AddArmorDataByKey("741531___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry02
	AddArmorDataByKey("741532___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry03
	AddArmorDataByKey("600693___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsMuffle
	AddArmorDataByKey("741533___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire01
	AddArmorDataByKey("741534___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire02
	AddArmorDataByKey("741535___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire03
	AddArmorDataByKey("741536___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost01
	AddArmorDataByKey("741625___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost02
	AddArmorDataByKey("741537___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost03
	AddArmorDataByKey("741538___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock01
	AddArmorDataByKey("741539___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock02
	AddArmorDataByKey("741540___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock03
	AddArmorDataByKey("1105819___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina01
	AddArmorDataByKey("1105820___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina02
	AddArmorDataByKey("1105821___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina03
	
	AddArmorDataByKey("80204___Skyrim.esm", 15, 21) ; ArmorDwarvenBoots
	AddArmorDataByKey("111413___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry02
	AddArmorDataByKey("111421___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry03
	AddArmorDataByKey("111563___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry04
	AddArmorDataByKey("600713___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsMuffle
	AddArmorDataByKey("111564___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire02
	AddArmorDataByKey("111565___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire03
	AddArmorDataByKey("111566___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire04
	AddArmorDataByKey("111567___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost02
	AddArmorDataByKey("111568___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost03
	AddArmorDataByKey("111569___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost04
	AddArmorDataByKey("111570___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock02
	AddArmorDataByKey("111571___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock03
	AddArmorDataByKey("111572___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock04
	AddArmorDataByKey("1105792___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina02
	AddArmorDataByKey("1105793___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina03
	AddArmorDataByKey("1105794___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina04
	
	AddArmorDataByKey("80219___Skyrim.esm", 15, 14) ; ArmorSteelPlateBoots
	AddArmorDataByKey("111391___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry02
	AddArmorDataByKey("111614___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry03
	AddArmorDataByKey("111615___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry04
	AddArmorDataByKey("600718___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsMuffle
	AddArmorDataByKey("111616___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire02
	AddArmorDataByKey("111617___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire03
	AddArmorDataByKey("111618___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire04
	AddArmorDataByKey("111619___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost02
	AddArmorDataByKey("111620___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost03
	AddArmorDataByKey("111621___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost04
	AddArmorDataByKey("111622___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock02
	AddArmorDataByKey("111623___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock03
	AddArmorDataByKey("111624___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock04
	AddArmorDataByKey("1105822___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina02
	AddArmorDataByKey("1105823___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina03
	AddArmorDataByKey("1105824___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina04
	
	AddArmorDataByKey("80214___Skyrim.esm", 21, 14) ; ArmorOrcishBoots
	AddArmorDataByKey("849839___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry03
	AddArmorDataByKey("849840___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry04
	AddArmorDataByKey("849841___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry05
	AddArmorDataByKey("849842___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsMuffle
	AddArmorDataByKey("849843___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire03
	AddArmorDataByKey("849844___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire04
	AddArmorDataByKey("849845___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire05
	AddArmorDataByKey("849846___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost03
	AddArmorDataByKey("849847___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost04
	AddArmorDataByKey("849848___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost05
	AddArmorDataByKey("849849___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock03
	AddArmorDataByKey("849850___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock04
	AddArmorDataByKey("849851___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock05
	AddArmorDataByKey("1105813___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina03
	AddArmorDataByKey("1105814___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina04
	AddArmorDataByKey("1105815___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina05
	
	AddArmorDataByKey("80224___Skyrim.esm", 15, 14) ; ArmorEbonyBoots
	AddArmorDataByKey("849956___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry03
	AddArmorDataByKey("849957___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry04
	AddArmorDataByKey("849958___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry05
	AddArmorDataByKey("849959___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsMuffle
	AddArmorDataByKey("849960___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire03
	AddArmorDataByKey("849961___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire04
	AddArmorDataByKey("849962___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire05
	AddArmorDataByKey("849963___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost03
	AddArmorDataByKey("849964___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost04
	AddArmorDataByKey("849965___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost05
	AddArmorDataByKey("849966___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock03
	AddArmorDataByKey("849967___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock04
	AddArmorDataByKey("849968___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock05
	AddArmorDataByKey("1105795___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina03
	AddArmorDataByKey("1105796___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina04
	AddArmorDataByKey("1105797___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina05
	
	AddArmorDataByKey("80229___Skyrim.esm", 15, 29) ; ArmorDragonplateBoots
	AddArmorDataByKey("883228___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry04
	AddArmorDataByKey("883229___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry05
	AddArmorDataByKey("883230___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry06
	AddArmorDataByKey("883231___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsMuffle
	AddArmorDataByKey("883232___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire04
	AddArmorDataByKey("883233___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire05
	AddArmorDataByKey("883234___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire06
	AddArmorDataByKey("883235___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost04
	AddArmorDataByKey("883236___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost05
	AddArmorDataByKey("883237___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost06
	AddArmorDataByKey("883349___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock04
	AddArmorDataByKey("883350___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock05
	AddArmorDataByKey("883351___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock06
	AddArmorDataByKey("1105786___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina04
	AddArmorDataByKey("1105787___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina05
	AddArmorDataByKey("1105788___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina06
	
	AddArmorDataByKey("80234___Skyrim.esm", 18, 21) ; ArmorDaedricBoots
	AddArmorDataByKey("883336___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry04
	AddArmorDataByKey("883337___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry05
	AddArmorDataByKey("883338___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry06
	AddArmorDataByKey("883339___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsMuffle
	AddArmorDataByKey("883340___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire04
	AddArmorDataByKey("883341___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire05
	AddArmorDataByKey("883342___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire06
	AddArmorDataByKey("883343___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost04
	AddArmorDataByKey("883344___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost05
	AddArmorDataByKey("883345___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost06
	AddArmorDataByKey("883346___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock04
	AddArmorDataByKey("883347___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock05
	AddArmorDataByKey("883348___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock06
	AddArmorDataByKey("1105783___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina04
	AddArmorDataByKey("1105784___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina05
	AddArmorDataByKey("1105785___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina06
	
	AddArmorDataByKey("307848___Skyrim.esm", 12, 14) ; ArmorBladesBoots
	
	AddArmorDataByKey("847484___Skyrim.esm", 21, 14) ; ArmorCompanionsBoots
	
	AddArmorDataByKey("862277___Skyrim.esm", 12, 29) ; DBArmorBoots
	AddArmorDataByKey("925460___Skyrim.esm", 12, 29) ; DBArmorBootsSP
	AddArmorDataByKey("1108828___Skyrim.esm", 12, 29) ; DBArmorBootsWornPlayable
	
	AddArmorDataByKey("354973___Skyrim.esm", 9, 3) ; ArmorDraugrBoots
	
	AddArmorDataByKey("683391___Skyrim.esm", 21, 14) ; ArmorStormcloakBoots
	
	AddArmorDataByKey("79574___Skyrim.esm", 12, 14) ; ArmorImperialBoots
	AddArmorDataByKey("81623___Skyrim.esm", 12, 14) ; ArmorImperialLightBoots
	AddArmorDataByKey("707771___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry01
	AddArmorDataByKey("709855___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry02
	AddArmorDataByKey("709856___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry03
	AddArmorDataByKey("707772___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire01
	AddArmorDataByKey("709857___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire02
	AddArmorDataByKey("709858___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire03
	AddArmorDataByKey("707773___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost01
	AddArmorDataByKey("709859___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost02
	AddArmorDataByKey("709860___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost03
	AddArmorDataByKey("707774___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock01
	AddArmorDataByKey("709861___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock02
	AddArmorDataByKey("709862___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock03
	AddArmorDataByKey("707775___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak01
	AddArmorDataByKey("709863___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak02
	AddArmorDataByKey("709864___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak03
	AddArmorDataByKey("759565___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry01
	AddArmorDataByKey("759566___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry02
	AddArmorDataByKey("759567___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry03
	AddArmorDataByKey("759568___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire01
	AddArmorDataByKey("759569___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire02
	AddArmorDataByKey("759570___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire03
	AddArmorDataByKey("759571___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost01
	AddArmorDataByKey("759572___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost02
	AddArmorDataByKey("759573___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost03
	AddArmorDataByKey("759574___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock01
	AddArmorDataByKey("759575___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock02
	AddArmorDataByKey("759576___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock03
	AddArmorDataByKey("759577___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak01
	AddArmorDataByKey("759578___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak02
	AddArmorDataByKey("759579___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak03
	
	AddArmorDataByKey("551297___Skyrim.esm", 18, 14) ; ArmorStormcloakBearBoots
	
	AddArmorDataByKey("416684___Skyrim.esm", 9, 3) ; ClothesThalmorBoots
	
	AddArmorDataByKey("867010___Skyrim.esm", 12, 29) ; ArmorThievesGuildBootsPlayer
	AddArmorDataByKey("867019___Skyrim.esm", 12, 29) ; ArmorThievesGuildBootsPlayerImproved
	AddArmorDataByKey("931286___Skyrim.esm", 12, 29) ; ArmorThievesGuildLeaderBoots
	AddArmorDataByKey("1082691___Skyrim.esm", 12, 29) ; ArmorLinweBoots
	
	AddArmorDataByKey("1035276___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer01
	AddArmorDataByKey("383877___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer02
	AddArmorDataByKey("1035277___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer03
	
	AddArmorDataByKey("248320___Skyrim.esm", 3, 0) ; ClothesPrisonerShoes

	AddArmorDataByKey("962515___Skyrim.esm", 3, 0) ; MS02ForswornBoots
	AddArmorDataByKey("888142___Skyrim.esm", 3, 0) ; ForswornBoots

	AddArmorDataByKey("868007___Skyrim.esm", 15, 21) ; ArmorPenitusBoots

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	AddArmorDataByKey("59882___Dawnguard.esm", 3, 0) ; ClothesPrisonerBloodyShoes
	AddArmorDataByKey("18393___Dawnguard.esm", 3, 0) ; DLC1ClothesMothPriestSandals

	AddArmorDataByKey("83799___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardBootsHeavy
	AddArmorDataByKey("62464___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardBootsLight

	AddArmorDataByKey("59613___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHardenedBoots
	AddArmorDataByKey("9199___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHeavyBoots

	AddArmorDataByKey("46558___Dawnguard.esm", 12, 29) ; DLC1ArmorVampireBoots

	AddArmorDataByKey("51221___Dawnguard.esm", 15, 21) ; DLC1IvoryBoots

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	AddArmorDataByKey("118174___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimHeavyBoots
	AddArmorDataByKey("168444___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	AddArmorDataByKey("168445___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	AddArmorDataByKey("168446___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	AddArmorDataByKey("168447___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	AddArmorDataByKey("168448___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	AddArmorDataByKey("168449___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	AddArmorDataByKey("168450___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	AddArmorDataByKey("168451___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	AddArmorDataByKey("168452___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	AddArmorDataByKey("168453___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	AddArmorDataByKey("168454___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	AddArmorDataByKey("168455___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	AddArmorDataByKey("168456___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	AddArmorDataByKey("168457___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	AddArmorDataByKey("168458___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	AddArmorDataByKey("168459___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina06

	AddArmorDataByKey("118142___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimLightBoots
	AddArmorDataByKey("168083___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry03
	AddArmorDataByKey("168084___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry04
	AddArmorDataByKey("168085___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry05
	AddArmorDataByKey("168192___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsMuffle
	AddArmorDataByKey("168086___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	AddArmorDataByKey("168087___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	AddArmorDataByKey("168088___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	AddArmorDataByKey("168089___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	AddArmorDataByKey("168090___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	AddArmorDataByKey("168091___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	AddArmorDataByKey("168093___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	AddArmorDataByKey("168094___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	AddArmorDataByKey("168095___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	AddArmorDataByKey("168092___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak03
	AddArmorDataByKey("168096___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak04
	AddArmorDataByKey("168097___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak05
	AddArmorDataByKey("168098___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina03
	AddArmorDataByKey("168099___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina04
	AddArmorDataByKey("168100___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina05

	AddArmorDataByKey("118166___Dragonborn.esm", 24, 21) ; DLC2ArmorNordicHeavyBoots
	AddArmorDataByKey("168352___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry03
	AddArmorDataByKey("168353___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry04
	AddArmorDataByKey("168354___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry05
	AddArmorDataByKey("168355___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsMuffle
	AddArmorDataByKey("168356___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	AddArmorDataByKey("168357___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	AddArmorDataByKey("168358___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	AddArmorDataByKey("168359___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	AddArmorDataByKey("168360___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	AddArmorDataByKey("168361___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	AddArmorDataByKey("168362___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	AddArmorDataByKey("168363___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	AddArmorDataByKey("168364___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	AddArmorDataByKey("168365___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina03
	AddArmorDataByKey("168366___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina04
	AddArmorDataByKey("168367___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina05

	AddArmorDataByKey("118162___Dragonborn.esm", 12, 14) ; DLC2ArmorBonemoldBoots
	AddArmorDataByKey("240421___Dragonborn.esm", 15, 21) ; DLC2ArmorBonemoldImprovedBoots
	AddArmorDataByKey("165062___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry01
	AddArmorDataByKey("165063___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry02
	AddArmorDataByKey("165064___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry03
	AddArmorDataByKey("165065___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire01
	AddArmorDataByKey("165066___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire02
	AddArmorDataByKey("165067___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire03
	AddArmorDataByKey("165068___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost01
	AddArmorDataByKey("165069___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost02
	AddArmorDataByKey("165070___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost03
	AddArmorDataByKey("165071___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock01
	AddArmorDataByKey("165072___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock02
	AddArmorDataByKey("165073___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock03
	AddArmorDataByKey("165074___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak01
	AddArmorDataByKey("165075___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak02
	AddArmorDataByKey("165076___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak03

	AddArmorDataByKey("118150___Dragonborn.esm", 12, 14) ; DLC2ArmorChitinLightBoots
	AddArmorDataByKey("167903___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry02
	AddArmorDataByKey("167933___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry03
	AddArmorDataByKey("167904___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry04
	AddArmorDataByKey("167905___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire02
	AddArmorDataByKey("167906___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire03
	AddArmorDataByKey("167907___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire04
	AddArmorDataByKey("167908___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost02
	AddArmorDataByKey("167909___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost03
	AddArmorDataByKey("167910___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost04
	AddArmorDataByKey("167911___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock02
	AddArmorDataByKey("167912___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock03
	AddArmorDataByKey("167913___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock04
	AddArmorDataByKey("167914___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak02
	AddArmorDataByKey("167915___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak03
	AddArmorDataByKey("167916___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak04
	AddArmorDataByKey("167917___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina02
	AddArmorDataByKey("167918___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina03
	AddArmorDataByKey("167919___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina04

	AddArmorDataByKey("118146___Dragonborn.esm", 12, 14) ; DLC2ArmorChitinHeavyBoots
	AddArmorDataByKey("168275___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry02
	AddArmorDataByKey("168276___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry03
	AddArmorDataByKey("168277___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry04
	AddArmorDataByKey("168278___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsMuffle
	AddArmorDataByKey("168279___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	AddArmorDataByKey("168280___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	AddArmorDataByKey("168281___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	AddArmorDataByKey("168282___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	AddArmorDataByKey("168283___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	AddArmorDataByKey("168284___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	AddArmorDataByKey("168285___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	AddArmorDataByKey("168286___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	AddArmorDataByKey("168287___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	AddArmorDataByKey("168288___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina02
	AddArmorDataByKey("168289___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina03
	AddArmorDataByKey("168290___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina04

	AddArmorDataByKey("233746___Dragonborn.esm", 24, 14) ; DLC2ClothesSkaalBoots
	AddArmorDataByKey("168619___Dragonborn.esm", 12, 14) ; DLC2MoragTongBoots
	AddArmorDataByKey("116309___Dragonborn.esm", 9, 3) ; DLC2dunKolbjornBoots
	AddArmorDataByKey("147482___Dragonborn.esm", 24, 14) ; DLC2dunHaknirArmorBoots
	AddArmorDataByKey("175412___Dragonborn.esm", 12, 29) ; DLC2TGArmorVariantBoots

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddArmorDataByKey("267720___Campfire.esm", 21, 14) ; _Camp_ArmorSonsBoots
endFunction

function SetDefaults_Cloak()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	; Now folded into "Extra" flags on base gear.

	;##############################
	;
	;    Campfire
	;
	;##############################
	AddArmorDataByKey("260764___Campfire.esm", 5, 5) ; _Camp_Cloak_BasicBurlap
	AddArmorDataByKey("260765___Campfire.esm", 10, 10) ; _Camp_Cloak_BasicLinen
	AddArmorDataByKey("260766___Campfire.esm", 40, 12) ; _Camp_Cloak_BasicFur
	AddArmorDataByKey("260767___Campfire.esm", 12, 40) ; _Camp_Cloak_BasicHide

	;##############################
	;
	;    Frostfall
	;
	;##############################
	AddArmorDataByKey("356637___Frostfall.esp", 10, 10) ; _Frost_Cloak_BoundLesser
	AddArmorDataByKey("359400___Frostfall.esp", 25, 25) ; _Frost_Cloak_BoundGreater
endFunction

function SetDefaults_Shield()
	AddArmorDataByKey("151754___Campfire.esm", abIgnore = true) ; _Camp_WalkingStickShield
endFunction

; Stuff to add
;AddArmorDataByKey("9205___Dawnguard.esm", X, Y, Z) ; DLC1SkinNakedVampireLord

;@TODO: Add immersive armors
;@TODO: Add Cloaks of Skyrim (Compatibility)
;@TODO: Add Winter is Coming Cloaks (Compatibility)
;@TODO: Add 'hooded' clothes to multi-list
;@TODO: Add exception data store?