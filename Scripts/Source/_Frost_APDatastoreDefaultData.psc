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
	SetArmorDataByKey("80146___Skyrim.esm", 3, 0) ; ArmorHideGauntlets
	SetArmorDataByKey("571007___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy01
	SetArmorDataByKey("571008___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy02
	SetArmorDataByKey("571009___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsAlchemy03
	SetArmorDataByKey("500041___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking01
	SetArmorDataByKey("709805___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking02
	SetArmorDataByKey("709806___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsLockpicking03
	SetArmorDataByKey("500042___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman01
	SetArmorDataByKey("709807___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman02
	SetArmorDataByKey("709808___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsMarksman03
	SetArmorDataByKey("500043___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded01
	SetArmorDataByKey("709809___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded02
	SetArmorDataByKey("709810___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsOneHanded03
	SetArmorDataByKey("500044___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket01
	SetArmorDataByKey("709811___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket02
	SetArmorDataByKey("709812___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsPickpocket03
	SetArmorDataByKey("500046___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing01
	SetArmorDataByKey("709815___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing02
	SetArmorDataByKey("709816___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsSmithing03
	SetArmorDataByKey("500047___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded01
	SetArmorDataByKey("709817___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded02
	SetArmorDataByKey("709818___Skyrim.esm", 3, 0) ; EnchArmorHideGauntletsTwoHanded03
	
	SetArmorDataByKey("455579___Skyrim.esm", 12, 6) ; ArmorBanditGauntlets
	
	SetArmorDataByKey("80161___Skyrim.esm", 5, 6) ; ArmorLeatherGauntlets
	SetArmorDataByKey("571019___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy01
	SetArmorDataByKey("571020___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy02
	SetArmorDataByKey("571021___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsAlchemy03
	SetArmorDataByKey("741453___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking01
	SetArmorDataByKey("741454___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking02
	SetArmorDataByKey("741455___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsLockpicking03
	SetArmorDataByKey("741456___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman01
	SetArmorDataByKey("741457___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman02
	SetArmorDataByKey("741458___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsMarksman03
	SetArmorDataByKey("741459___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded01
	SetArmorDataByKey("741460___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded02
	SetArmorDataByKey("741461___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsOneHanded03
	SetArmorDataByKey("741462___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket01
	SetArmorDataByKey("741463___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket02
	SetArmorDataByKey("741464___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsPickpocket03
	SetArmorDataByKey("741468___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing01
	SetArmorDataByKey("741469___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing02
	SetArmorDataByKey("741470___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsSmithing03
	SetArmorDataByKey("741471___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded01
	SetArmorDataByKey("741472___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded02
	SetArmorDataByKey("741473___Skyrim.esm", 5, 6) ; EnchArmorLeatherGauntletsTwoHanded03
	
	SetArmorDataByKey("80156___Skyrim.esm", 9, 14) ; ArmorElvenGauntlets
	SetArmorDataByKey("1072915___Skyrim.esm", 9, 14) ; ArmorElvenLightGauntlets
	SetArmorDataByKey("570998___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy02
	SetArmorDataByKey("570999___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy03
	SetArmorDataByKey("571000___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsAlchemy04
	SetArmorDataByKey("778202___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking02
	SetArmorDataByKey("778203___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking03
	SetArmorDataByKey("778312___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsLockpicking04
	SetArmorDataByKey("778204___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman02
	SetArmorDataByKey("778205___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman03
	SetArmorDataByKey("778313___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsMarksman04
	SetArmorDataByKey("778206___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded02
	SetArmorDataByKey("778207___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded03
	SetArmorDataByKey("778314___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsOneHanded04
	SetArmorDataByKey("778208___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket02
	SetArmorDataByKey("778209___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket03
	SetArmorDataByKey("778315___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsPickpocket04
	SetArmorDataByKey("778212___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing02
	SetArmorDataByKey("778213___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing03
	SetArmorDataByKey("778317___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsSmithing04
	SetArmorDataByKey("778214___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded02
	SetArmorDataByKey("778215___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded03
	SetArmorDataByKey("778318___Skyrim.esm", 9, 14) ; EnchArmorElvenGauntletsTwoHanded04
	
	SetArmorDataByKey("111520___Skyrim.esm", 12, 6) ; ArmorScaledGauntlets
	SetArmorDataByKey("289744___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy02
	SetArmorDataByKey("289745___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy03
	SetArmorDataByKey("289746___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsAlchemy04
	SetArmorDataByKey("289766___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking02
	SetArmorDataByKey("289767___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking03
	SetArmorDataByKey("289768___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsLockpicking04
	SetArmorDataByKey("289769___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman02
	SetArmorDataByKey("289770___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman03
	SetArmorDataByKey("289771___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsMarksman04
	SetArmorDataByKey("289913___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded02
	SetArmorDataByKey("289914___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded03
	SetArmorDataByKey("289916___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsOneHanded04
	SetArmorDataByKey("289917___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket02
	SetArmorDataByKey("289919___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket03
	SetArmorDataByKey("289920___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsPickpocket04
	SetArmorDataByKey("289950___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing02
	SetArmorDataByKey("290010___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing03
	SetArmorDataByKey("290026___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsSmithing04
	SetArmorDataByKey("290035___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded02
	SetArmorDataByKey("290036___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded03
	SetArmorDataByKey("290037___Skyrim.esm", 12, 6) ; EnchArmorScaledGauntletsTwoHanded04
	
	SetArmorDataByKey("80186___Skyrim.esm", 12, 14) ; ArmorGlassGauntlets
	SetArmorDataByKey("873367___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy03
	SetArmorDataByKey("873368___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy04
	SetArmorDataByKey("873369___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsAlchemy05
	SetArmorDataByKey("1036017___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking03
	SetArmorDataByKey("1036018___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking04
	SetArmorDataByKey("1036019___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsLockpicking05
	SetArmorDataByKey("873388___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman03
	SetArmorDataByKey("873389___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman04
	SetArmorDataByKey("873390___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsMarksman05
	SetArmorDataByKey("873391___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded03
	SetArmorDataByKey("873392___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded04
	SetArmorDataByKey("873393___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsOneHanded05
	SetArmorDataByKey("1036020___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket03
	SetArmorDataByKey("1036021___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket04
	SetArmorDataByKey("1036022___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsPickpocket05
	SetArmorDataByKey("873397___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing03
	SetArmorDataByKey("873398___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing04
	SetArmorDataByKey("873399___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsSmithing05
	SetArmorDataByKey("873403___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded03
	SetArmorDataByKey("873404___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded04
	SetArmorDataByKey("873405___Skyrim.esm", 12, 14) ; EnchArmorGlassGauntletsTwoHanded05
	
	SetArmorDataByKey("80191___Skyrim.esm", 15, 29) ; ArmorDragonscaleGauntlets
	SetArmorDataByKey("883152___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy04
	SetArmorDataByKey("883153___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy05
	SetArmorDataByKey("883154___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsAlchemy06
	SetArmorDataByKey("1105777___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking04
	SetArmorDataByKey("1105778___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking05
	SetArmorDataByKey("1105779___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsLockpicking06
	SetArmorDataByKey("883173___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman04
	SetArmorDataByKey("883174___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman05
	SetArmorDataByKey("883175___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsMarksman06
	SetArmorDataByKey("883176___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded04
	SetArmorDataByKey("883177___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded05
	SetArmorDataByKey("883178___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsOneHanded06
	SetArmorDataByKey("1105774___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket04
	SetArmorDataByKey("1105775___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket05
	SetArmorDataByKey("1105776___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsPickpocket06
	SetArmorDataByKey("883182___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing04
	SetArmorDataByKey("883183___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing05
	SetArmorDataByKey("883184___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsSmithing06
	SetArmorDataByKey("883185___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded04
	SetArmorDataByKey("883186___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded05
	SetArmorDataByKey("883187___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleGauntletsTwoHanded06
	
	SetArmorDataByKey("77382___Skyrim.esm", 7, 6) ; ArmorIronGauntlets
	SetArmorDataByKey("802022___Skyrim.esm", 7, 6) ; FavorOrcsGauntlets
	SetArmorDataByKey("571016___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy01
	SetArmorDataByKey("571017___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy02
	SetArmorDataByKey("571018___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsAlchemy03
	SetArmorDataByKey("500012___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman01
	SetArmorDataByKey("710011___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman02
	SetArmorDataByKey("710012___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsMarksman03
	SetArmorDataByKey("500014___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded01
	SetArmorDataByKey("710013___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded02
	SetArmorDataByKey("710014___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsOneHanded03
	SetArmorDataByKey("500018___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing01
	SetArmorDataByKey("710019___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing02
	SetArmorDataByKey("710020___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsSmithing03
	SetArmorDataByKey("500020___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded01
	SetArmorDataByKey("710021___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded02
	SetArmorDataByKey("710022___Skyrim.esm", 7, 6) ; EnchArmorIronGauntletsTwoHanded03
	
	SetArmorDataByKey("80211___Skyrim.esm", 12, 6) ; ArmorSteelGauntletsA
	SetArmorDataByKey("1011491___Skyrim.esm", 12, 6) ; ArmorSteelGauntletsB
	SetArmorDataByKey("571025___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy01
	SetArmorDataByKey("571026___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy02
	SetArmorDataByKey("571027___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsAlchemy03
	SetArmorDataByKey("741566___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman01
	SetArmorDataByKey("741579___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman02
	SetArmorDataByKey("741580___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsMarksman03
	SetArmorDataByKey("741567___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded01
	SetArmorDataByKey("741581___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded02
	SetArmorDataByKey("741582___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsOneHanded03
	SetArmorDataByKey("741569___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing01
	SetArmorDataByKey("571028___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing02
	SetArmorDataByKey("571029___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsSmithing03
	SetArmorDataByKey("741570___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded01
	SetArmorDataByKey("741585___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded02
	SetArmorDataByKey("741586___Skyrim.esm", 12, 6) ; EnchArmorSteelGauntletsTwoHanded03
	
	SetArmorDataByKey("80206___Skyrim.esm", 15, 21) ; ArmorDwarvenGauntlets
	SetArmorDataByKey("570995___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy02
	SetArmorDataByKey("570996___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy03
	SetArmorDataByKey("570997___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsAlchemy04
	SetArmorDataByKey("111611___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman02
	SetArmorDataByKey("111612___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman03
	SetArmorDataByKey("111613___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsMarksman04
	SetArmorDataByKey("112469___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded02
	SetArmorDataByKey("112470___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded03
	SetArmorDataByKey("112471___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsOneHanded04
	SetArmorDataByKey("112481___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing02
	SetArmorDataByKey("112482___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing03
	SetArmorDataByKey("112486___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsSmithing04
	SetArmorDataByKey("112487___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded02
	SetArmorDataByKey("112488___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded03
	SetArmorDataByKey("112490___Skyrim.esm", 15, 21) ; EnchArmorDwarvenGauntletsTwoHanded04
	
	SetArmorDataByKey("80221___Skyrim.esm", 15, 14) ; ArmorSteelPlateGauntlets
	SetArmorDataByKey("571033___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy02
	SetArmorDataByKey("571034___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy03
	SetArmorDataByKey("571035___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsAlchemy04
	SetArmorDataByKey("253739___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman02
	SetArmorDataByKey("253772___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman03
	SetArmorDataByKey("253794___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsMarksman04
	SetArmorDataByKey("253798___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded02
	SetArmorDataByKey("253799___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded03
	SetArmorDataByKey("253803___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsOneHanded04
	SetArmorDataByKey("253811___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing02
	SetArmorDataByKey("253812___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing03
	SetArmorDataByKey("253813___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsSmithing04
	SetArmorDataByKey("253814___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded02
	SetArmorDataByKey("253815___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded03
	SetArmorDataByKey("253816___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateGauntletsTwoHanded04
	
	SetArmorDataByKey("80216___Skyrim.esm", 21, 14) ; ArmorOrcishGauntlets
	SetArmorDataByKey("849880___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy03
	SetArmorDataByKey("849881___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy04
	SetArmorDataByKey("849882___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsAlchemy05
	SetArmorDataByKey("849901___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman03
	SetArmorDataByKey("849902___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman04
	SetArmorDataByKey("849903___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsMarksman05
	SetArmorDataByKey("849904___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded03
	SetArmorDataByKey("849905___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded04
	SetArmorDataByKey("849906___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsOneHanded05
	SetArmorDataByKey("849910___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing03
	SetArmorDataByKey("849911___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing04
	SetArmorDataByKey("849912___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsSmithing05
	SetArmorDataByKey("849913___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded03
	SetArmorDataByKey("849914___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded04
	SetArmorDataByKey("849915___Skyrim.esm", 21, 14) ; EnchArmorOrcishGauntletsTwoHanded05
	
	SetArmorDataByKey("80226___Skyrim.esm", 15, 14) ; ArmorEbonyGauntlets
	SetArmorDataByKey("849997___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy03
	SetArmorDataByKey("849998___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy04
	SetArmorDataByKey("849999___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsAlchemy05
	SetArmorDataByKey("850018___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman03
	SetArmorDataByKey("850019___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman04
	SetArmorDataByKey("850020___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsMarksman05
	SetArmorDataByKey("850021___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded03
	SetArmorDataByKey("850022___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded04
	SetArmorDataByKey("850023___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsOneHanded05
	SetArmorDataByKey("850027___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing03
	SetArmorDataByKey("850028___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing04
	SetArmorDataByKey("850029___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsSmithing05
	SetArmorDataByKey("850030___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded03
	SetArmorDataByKey("850031___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded04
	SetArmorDataByKey("850032___Skyrim.esm", 15, 14) ; EnchArmorEbonyGauntletsTwoHanded05
	
	SetArmorDataByKey("80231___Skyrim.esm", 15, 29) ; ArmorDragonplateGauntlets
	SetArmorDataByKey("883260___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy04
	SetArmorDataByKey("883261___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy05
	SetArmorDataByKey("883262___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsAlchemy06
	SetArmorDataByKey("883281___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman04
	SetArmorDataByKey("883282___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman05
	SetArmorDataByKey("883283___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsMarksman06
	SetArmorDataByKey("883284___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded04
	SetArmorDataByKey("883285___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded05
	SetArmorDataByKey("883286___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsOneHanded06
	SetArmorDataByKey("883290___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing04
	SetArmorDataByKey("883291___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing05
	SetArmorDataByKey("883292___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsSmithing06
	SetArmorDataByKey("883293___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded04
	SetArmorDataByKey("883294___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded05
	SetArmorDataByKey("883295___Skyrim.esm", 15, 29) ; EnchArmorDragonplateGauntletsTwoHanded06
	
	SetArmorDataByKey("80236___Skyrim.esm", 18, 21) ; ArmorDaedricGauntlets
	SetArmorDataByKey("883374___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy04
	SetArmorDataByKey("883375___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy05
	SetArmorDataByKey("883376___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsAlchemy06
	SetArmorDataByKey("883395___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman04
	SetArmorDataByKey("883396___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman05
	SetArmorDataByKey("883397___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsMarksman06
	SetArmorDataByKey("883398___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded04
	SetArmorDataByKey("883399___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded05
	SetArmorDataByKey("883400___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsOneHanded06
	SetArmorDataByKey("883404___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing04
	SetArmorDataByKey("883405___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing05
	SetArmorDataByKey("883406___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsSmithing06
	SetArmorDataByKey("883407___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded04
	SetArmorDataByKey("883408___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded05
	SetArmorDataByKey("883409___Skyrim.esm", 18, 21) ; EnchArmorDaedricGauntletsTwoHanded06
	
	SetArmorDataByKey("1105977___Skyrim.esm", 0, 0) ; PrisonerCuffsPlayer
	
	SetArmorDataByKey("307853___Skyrim.esm", 12, 14) ; ArmorBladesGauntlets
	
	SetArmorDataByKey("847486___Skyrim.esm", 21, 14) ; ArmorCompanionsGauntlets
	
	SetArmorDataByKey("862275___Skyrim.esm", 12, 29) ; DBArmorGloves
	SetArmorDataByKey("1005953___Skyrim.esm", 12, 29) ; DBArmorGlovesReward
	SetArmorDataByKey("925462___Skyrim.esm", 12, 29) ; DBArmorGlovesSP
	SetArmorDataByKey("1108830___Skyrim.esm", 12, 29) ; DBArmorGlovesWornPlayable
	
	SetArmorDataByKey("355095___Skyrim.esm", 9, 3) ; ArmorDraugrGauntlets
	
	SetArmorDataByKey("683389___Skyrim.esm", 21, 14) ; ArmorStormcloakGauntlets
	
	SetArmorDataByKey("79572___Skyrim.esm", 12, 14) ; ArmorImperialGauntlets
	SetArmorDataByKey("81626___Skyrim.esm", 12, 14) ; ArmorImperialLightGauntlets
	SetArmorDataByKey("571010___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy01
	SetArmorDataByKey("571011___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy02
	SetArmorDataByKey("571012___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlchemy03
	SetArmorDataByKey("707782___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration01
	SetArmorDataByKey("709877___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration02
	SetArmorDataByKey("709878___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsAlteration03
	SetArmorDataByKey("707784___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration01
	SetArmorDataByKey("709881___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration02
	SetArmorDataByKey("709882___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsConjuration03
	SetArmorDataByKey("707785___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction01
	SetArmorDataByKey("709883___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction02
	SetArmorDataByKey("709884___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsDestruction03
	SetArmorDataByKey("707789___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman01
	SetArmorDataByKey("709891___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman02
	SetArmorDataByKey("709892___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsMarksman03
	SetArmorDataByKey("707790___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded01
	SetArmorDataByKey("759623___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded02
	SetArmorDataByKey("709894___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsOneHanded03
	SetArmorDataByKey("707793___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing01
	SetArmorDataByKey("709899___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing02
	SetArmorDataByKey("709900___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsSmithing03
	SetArmorDataByKey("707794___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded01
	SetArmorDataByKey("709901___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded02
	SetArmorDataByKey("709902___Skyrim.esm", 12, 14) ; EnchArmorImperialGauntletsTwoHanded03
	SetArmorDataByKey("571013___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy01
	SetArmorDataByKey("571014___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy02
	SetArmorDataByKey("571015___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlchemy03
	SetArmorDataByKey("759598___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration01
	SetArmorDataByKey("759599___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration02
	SetArmorDataByKey("759600___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsAlteration03
	SetArmorDataByKey("759604___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration01
	SetArmorDataByKey("759605___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration02
	SetArmorDataByKey("759606___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsConjuration03
	SetArmorDataByKey("759607___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction01
	SetArmorDataByKey("759608___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction02
	SetArmorDataByKey("759609___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsDestruction03
	SetArmorDataByKey("759616___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking01
	SetArmorDataByKey("759617___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking02
	SetArmorDataByKey("759618___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsLockpicking03
	SetArmorDataByKey("759619___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman01
	SetArmorDataByKey("759620___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman02
	SetArmorDataByKey("759621___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsMarksman03
	SetArmorDataByKey("759622___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded01
	SetArmorDataByKey("709893___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded02
	SetArmorDataByKey("759624___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsOneHanded03
	SetArmorDataByKey("759625___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket01
	SetArmorDataByKey("759626___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket02
	SetArmorDataByKey("759627___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsPickpocket03
	SetArmorDataByKey("759631___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing01
	SetArmorDataByKey("759632___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing02
	SetArmorDataByKey("759633___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsSmithing03
	SetArmorDataByKey("759634___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded01
	SetArmorDataByKey("759635___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded02
	SetArmorDataByKey("759636___Skyrim.esm", 12, 14) ; EnchArmorImperialLightGauntletsTwoHanded03
	
	SetArmorDataByKey("551299___Skyrim.esm", 18, 14) ; ArmorStormcloakBearGauntlets

	SetArmorDataByKey("416691___Skyrim.esm", 9, 3) ; ClothesThalmorGloves
	
	SetArmorDataByKey("867012___Skyrim.esm", 12, 29) ; ArmorThievesGuildGauntletsPlayer
	SetArmorDataByKey("867021___Skyrim.esm", 12, 29) ; ArmorThievesGuildGauntletsPlayerImproved
	SetArmorDataByKey("931288___Skyrim.esm", 12, 29) ; ArmorThievesGuildLeaderGauntlets
	SetArmorDataByKey("1082693___Skyrim.esm", 12, 29) ; ArmorLinweGauntlets
	
	SetArmorDataByKey("383879___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer01
	SetArmorDataByKey("1035280___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer02
	SetArmorDataByKey("1035281___Skyrim.esm", 12, 35) ; ArmorNightingaleGauntletsPlayer03

	SetArmorDataByKey("962514___Skyrim.esm", 3, 6) ; MS02ForswornGauntlets
	SetArmorDataByKey("888149___Skyrim.esm", 3, 6) ; ForswornGauntlets

	SetArmorDataByKey("868011___Skyrim.esm", 15, 21) ; ArmorPenitusGauntlets

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	SetArmorDataByKey("83800___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardGauntletsHeavy
	SetArmorDataByKey("62462___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardGauntletsLight

	;@TODO: Is 'heavy' same as regular Falmer?
	SetArmorDataByKey("59615___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHardenedGauntlets
	SetArmorDataByKey("9197___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHeavyGauntlets

	SetArmorDataByKey("107807___Dawnguard.esm", 12, 21) ; DLC1ArmorVampireGauntlets

	SetArmorDataByKey("51223___Dawnguard.esm", 15, 21) ; DLC1IvoryGauntlets

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	SetArmorDataByKey("118176___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimHeavyGauntlets
	SetArmorDataByKey("168487___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	SetArmorDataByKey("168488___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	SetArmorDataByKey("168489___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	SetArmorDataByKey("168490___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	SetArmorDataByKey("168491___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	SetArmorDataByKey("168492___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	SetArmorDataByKey("168493___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	SetArmorDataByKey("168494___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	SetArmorDataByKey("168495___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	SetArmorDataByKey("168496___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	SetArmorDataByKey("168497___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	SetArmorDataByKey("168498___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	SetArmorDataByKey("168499___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	SetArmorDataByKey("168500___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	SetArmorDataByKey("168501___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	
	SetArmorDataByKey("118181___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimLightGauntlets
	SetArmorDataByKey("168128___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	SetArmorDataByKey("168129___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	SetArmorDataByKey("168130___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	SetArmorDataByKey("168131___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	SetArmorDataByKey("168132___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	SetArmorDataByKey("168133___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	SetArmorDataByKey("168134___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	SetArmorDataByKey("168135___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	SetArmorDataByKey("168136___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	SetArmorDataByKey("168137___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	SetArmorDataByKey("168138___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	SetArmorDataByKey("168139___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	SetArmorDataByKey("168140___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	SetArmorDataByKey("168141___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	SetArmorDataByKey("168142___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	SetArmorDataByKey("168143___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	SetArmorDataByKey("168144___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	SetArmorDataByKey("168145___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	SetArmorDataByKey("168146___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	SetArmorDataByKey("168147___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	SetArmorDataByKey("168148___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	
	SetArmorDataByKey("118168___Dragonborn.esm", 24, 21) ; DLC2ArmorNordicHeavyGauntlets
	SetArmorDataByKey("168389___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	SetArmorDataByKey("168390___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	SetArmorDataByKey("168391___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	SetArmorDataByKey("168392___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	SetArmorDataByKey("168393___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	SetArmorDataByKey("168394___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	SetArmorDataByKey("168395___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	SetArmorDataByKey("168396___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	SetArmorDataByKey("168397___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	SetArmorDataByKey("168398___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	SetArmorDataByKey("168399___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	SetArmorDataByKey("168400___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	SetArmorDataByKey("168401___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	SetArmorDataByKey("168402___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	SetArmorDataByKey("168403___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	
	SetArmorDataByKey("118164___Dragonborn.esm", 12, 14) ; DLC2ArmorBonemoldGauntlets
	SetArmorDataByKey("240418___Dragonborn.esm", 15, 21) ; DLC2ArmorBonemoldImprovedGauntlets
	SetArmorDataByKey("165083___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	SetArmorDataByKey("165084___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	SetArmorDataByKey("165085___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	SetArmorDataByKey("165086___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	SetArmorDataByKey("165087___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	SetArmorDataByKey("165088___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	SetArmorDataByKey("165089___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	SetArmorDataByKey("165090___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	SetArmorDataByKey("165091___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	SetArmorDataByKey("165092___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	SetArmorDataByKey("165093___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	SetArmorDataByKey("165094___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	SetArmorDataByKey("165095___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	SetArmorDataByKey("165096___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	SetArmorDataByKey("165097___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	SetArmorDataByKey("165098___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	SetArmorDataByKey("165099___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	SetArmorDataByKey("165100___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	SetArmorDataByKey("165101___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	SetArmorDataByKey("165102___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	SetArmorDataByKey("165103___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	SetArmorDataByKey("165104___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	SetArmorDataByKey("165105___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	SetArmorDataByKey("165106___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	SetArmorDataByKey("165107___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	SetArmorDataByKey("165108___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	SetArmorDataByKey("165109___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	SetArmorDataByKey("165110___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	SetArmorDataByKey("165111___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	SetArmorDataByKey("165112___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	
	SetArmorDataByKey("118155___Dragonborn.esm", 9, 14) ; DLC2ArmorChitinHeavyGauntlets
	SetArmorDataByKey("168312___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	SetArmorDataByKey("168313___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	SetArmorDataByKey("168314___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	SetArmorDataByKey("168315___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	SetArmorDataByKey("168316___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	SetArmorDataByKey("168317___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	SetArmorDataByKey("168318___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	SetArmorDataByKey("168319___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	SetArmorDataByKey("168320___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	SetArmorDataByKey("168321___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	SetArmorDataByKey("168322___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	SetArmorDataByKey("168323___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	SetArmorDataByKey("168324___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	SetArmorDataByKey("168325___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	SetArmorDataByKey("168326___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	
	SetArmorDataByKey("118152___Dragonborn.esm", 9, 14) ; DLC2ArmorChitinLightGauntlets
	SetArmorDataByKey("167939___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	SetArmorDataByKey("167940___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	SetArmorDataByKey("167941___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	SetArmorDataByKey("167942___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	SetArmorDataByKey("167943___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	SetArmorDataByKey("167944___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	SetArmorDataByKey("167945___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	SetArmorDataByKey("167946___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	SetArmorDataByKey("167947___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	SetArmorDataByKey("167948___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	SetArmorDataByKey("167949___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	SetArmorDataByKey("167950___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	SetArmorDataByKey("167951___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	SetArmorDataByKey("167952___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	SetArmorDataByKey("167953___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	SetArmorDataByKey("167954___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	SetArmorDataByKey("167955___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	SetArmorDataByKey("167956___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	SetArmorDataByKey("167957___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	SetArmorDataByKey("167958___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	SetArmorDataByKey("167959___Dragonborn.esm", 9, 14) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	
	SetArmorDataByKey("233744___Dragonborn.esm", 24, 14) ; DLC2ClothesSkaalGloves
	
	SetArmorDataByKey("168621___Dragonborn.esm", 9, 14) ; DLC2MoragTongGauntlets
	
	SetArmorDataByKey("121753___Dragonborn.esm", 9, 3) ; DLC2dunKolbjornGauntlets
	
	SetArmorDataByKey("147484___Dragonborn.esm", 24, 14) ; DLC2dunHaknirArmorGauntlets
	
	SetArmorDataByKey("175410___Dragonborn.esm", 12, 29) ; DLC2TGArmorVariantGloves

	;##############################
	;
	;    Campfire
	;
	;##############################
	SetArmorDataByKey("267721___Campfire.esm", 21, 14) ; _Camp_ArmorSonsGauntlets
endFunction

function SetDefaults_Head()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	SetArmorDataByKey("80147___Skyrim.esm", 10, 14) ; ArmorHideHelmet
	SetArmorDataByKey("570983___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy01
	SetArmorDataByKey("570984___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy02
	SetArmorDataByKey("570985___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlchemy03
	SetArmorDataByKey("500048___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration01
	SetArmorDataByKey("709819___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration02
	SetArmorDataByKey("709820___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetAlteration03
	SetArmorDataByKey("500049___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration01
	SetArmorDataByKey("709821___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration02
	SetArmorDataByKey("709822___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetConjuration03
	SetArmorDataByKey("500050___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction01
	SetArmorDataByKey("709823___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction02
	SetArmorDataByKey("709824___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetDestruction03
	SetArmorDataByKey("500052___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion01
	SetArmorDataByKey("709827___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion02
	SetArmorDataByKey("709828___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetIllusion03
	SetArmorDataByKey("500053___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka01
	SetArmorDataByKey("709829___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka02
	SetArmorDataByKey("709830___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMagicka03
	SetArmorDataByKey("500055___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman01
	SetArmorDataByKey("709831___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman02
	SetArmorDataByKey("709832___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetMarksman03
	SetArmorDataByKey("500056___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration01
	SetArmorDataByKey("709833___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration02
	SetArmorDataByKey("709834___Skyrim.esm", 10, 14) ; EnchArmorHideHelmetRestoration03
	
	SetArmorDataByKey("455582___Skyrim.esm", 45, 3) ; ArmorBanditHelmet
	
	SetArmorDataByKey("80162___Skyrim.esm", 35, 43) ; ArmorLeatherHelmet
	SetArmorDataByKey("570989___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy01
	SetArmorDataByKey("570990___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy02
	SetArmorDataByKey("570991___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlchemy03
	SetArmorDataByKey("741474___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration01
	SetArmorDataByKey("741475___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration02
	SetArmorDataByKey("741476___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetAlteration03
	SetArmorDataByKey("741477___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration01
	SetArmorDataByKey("741478___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration02
	SetArmorDataByKey("741479___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetConjuration03
	SetArmorDataByKey("741480___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction01
	SetArmorDataByKey("741481___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction02
	SetArmorDataByKey("741482___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetDestruction03
	SetArmorDataByKey("741495___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion01
	SetArmorDataByKey("741496___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion02
	SetArmorDataByKey("741497___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetIllusion03
	SetArmorDataByKey("741498___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka01
	SetArmorDataByKey("741499___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka02
	SetArmorDataByKey("741500___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMagicka03
	SetArmorDataByKey("741501___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman01
	SetArmorDataByKey("741502___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman02
	SetArmorDataByKey("741503___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetMarksman03
	SetArmorDataByKey("741483___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration01
	SetArmorDataByKey("741484___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration02
	SetArmorDataByKey("741485___Skyrim.esm", 35, 43) ; EnchArmorLeatherHelmetRestoration03
	
	SetArmorDataByKey("80157___Skyrim.esm", 30, 29) ; ArmorElvenHelmet
	SetArmorDataByKey("1072916___Skyrim.esm", 30, 29) ; ArmorElvenLightHelmet
	SetArmorDataByKey("570980___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy02
	SetArmorDataByKey("570981___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy03
	SetArmorDataByKey("570982___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlchemy04
	SetArmorDataByKey("778216___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration02
	SetArmorDataByKey("778217___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration03
	SetArmorDataByKey("778319___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetAlteration04
	SetArmorDataByKey("778218___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration02
	SetArmorDataByKey("778219___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration03
	SetArmorDataByKey("778320___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetConjuration04
	SetArmorDataByKey("778220___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction02
	SetArmorDataByKey("778221___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction03
	SetArmorDataByKey("778321___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetDestruction04
	SetArmorDataByKey("778224___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion02
	SetArmorDataByKey("778225___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion03
	SetArmorDataByKey("778323___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetIllusion04
	SetArmorDataByKey("778226___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka02
	SetArmorDataByKey("778227___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka03
	SetArmorDataByKey("778324___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMagicka04
	SetArmorDataByKey("778228___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman02
	SetArmorDataByKey("778229___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman03
	SetArmorDataByKey("778325___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetMarksman04
	SetArmorDataByKey("778230___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration02
	SetArmorDataByKey("778231___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration03
	SetArmorDataByKey("778326___Skyrim.esm", 30, 29) ; EnchArmorElvenHelmetRestoration04
	
	SetArmorDataByKey("111521___Skyrim.esm", 30, 29) ; ArmorScaledHelmet
	SetArmorDataByKey("290039___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy02
	SetArmorDataByKey("290038___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy03
	SetArmorDataByKey("290040___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlchemy04
	SetArmorDataByKey("290074___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration02
	SetArmorDataByKey("290079___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration03
	SetArmorDataByKey("290080___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetAlteration04
	SetArmorDataByKey("290081___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration02
	SetArmorDataByKey("290225___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration03
	SetArmorDataByKey("290226___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetConjuration04
	SetArmorDataByKey("290227___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction02
	SetArmorDataByKey("290228___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction03
	SetArmorDataByKey("290229___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetDestruction04
	SetArmorDataByKey("290242___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion02
	SetArmorDataByKey("290243___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion03
	SetArmorDataByKey("290244___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetIllusion04
	SetArmorDataByKey("290247___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka02
	SetArmorDataByKey("290250___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka03
	SetArmorDataByKey("290251___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMagicka04
	SetArmorDataByKey("290259___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman02
	SetArmorDataByKey("290265___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman03
	SetArmorDataByKey("290274___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetMarksman04
	SetArmorDataByKey("290285___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration02
	SetArmorDataByKey("290286___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration03
	SetArmorDataByKey("290287___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetRestoration04
	SetArmorDataByKey("290288___Skyrim.esm", 30, 29) ; EnchArmorScaledHelmetWaterbreathing
	
	SetArmorDataByKey("80187___Skyrim.esm", 30, 29) ; ArmorGlassHelmet
	SetArmorDataByKey("873406___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy03
	SetArmorDataByKey("873407___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy04
	SetArmorDataByKey("873408___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlchemy05
	SetArmorDataByKey("873409___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration03
	SetArmorDataByKey("873410___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration04
	SetArmorDataByKey("873411___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetAlteration05
	SetArmorDataByKey("873412___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration03
	SetArmorDataByKey("873413___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration04
	SetArmorDataByKey("873414___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetConjuration05
	SetArmorDataByKey("873415___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction03
	SetArmorDataByKey("873416___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction04
	SetArmorDataByKey("873417___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetDestruction05
	SetArmorDataByKey("873421___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion03
	SetArmorDataByKey("873422___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion04
	SetArmorDataByKey("873423___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetIllusion05
	SetArmorDataByKey("873424___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka03
	SetArmorDataByKey("873425___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka04
	SetArmorDataByKey("873426___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagicka05
	SetArmorDataByKey("1041114___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate03
	SetArmorDataByKey("1041115___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate04
	SetArmorDataByKey("1041119___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMagickaRate05
	SetArmorDataByKey("873427___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman03
	SetArmorDataByKey("873428___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman04
	SetArmorDataByKey("873429___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetMarksman05
	SetArmorDataByKey("873430___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration03
	SetArmorDataByKey("873431___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration04
	SetArmorDataByKey("873432___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetRestoration05
	SetArmorDataByKey("873433___Skyrim.esm", 30, 29) ; EnchArmorGlassHelmetWaterbreathing
	
	SetArmorDataByKey("80192___Skyrim.esm", 40, 58) ; ArmorDragonscaleHelmet
	SetArmorDataByKey("883188___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy04
	SetArmorDataByKey("883189___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy05
	SetArmorDataByKey("883190___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlchemy06
	SetArmorDataByKey("883191___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration04
	SetArmorDataByKey("883192___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration05
	SetArmorDataByKey("883193___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetAlteration06
	SetArmorDataByKey("883194___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration04
	SetArmorDataByKey("883195___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration05
	SetArmorDataByKey("883196___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetConjuration06
	SetArmorDataByKey("883197___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction04
	SetArmorDataByKey("883198___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction05
	SetArmorDataByKey("883199___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetDestruction06
	SetArmorDataByKey("883203___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion04
	SetArmorDataByKey("883204___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion05
	SetArmorDataByKey("883205___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetIllusion06
	SetArmorDataByKey("883206___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka04
	SetArmorDataByKey("883207___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka05
	SetArmorDataByKey("883208___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagicka06
	SetArmorDataByKey("1041126___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate04
	SetArmorDataByKey("1041127___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate05
	SetArmorDataByKey("1041128___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMagickaRate06
	SetArmorDataByKey("883209___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman04
	SetArmorDataByKey("883210___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman05
	SetArmorDataByKey("883211___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetMarksman06
	SetArmorDataByKey("883212___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration04
	SetArmorDataByKey("883213___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration05
	SetArmorDataByKey("883214___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetRestoration06
	SetArmorDataByKey("883215___Skyrim.esm", 40, 58) ; EnchArmorDragonscaleHelmetWaterbreathing
	
	SetArmorDataByKey("77389___Skyrim.esm", 15, 3) ; ArmorIronHelmet
	SetArmorDataByKey("570986___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy01
	SetArmorDataByKey("570987___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy02
	SetArmorDataByKey("570988___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlchemy03
	SetArmorDataByKey("499996___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration01
	SetArmorDataByKey("710023___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration02
	SetArmorDataByKey("710024___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetAlteration03
	SetArmorDataByKey("500003___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration01
	SetArmorDataByKey("710025___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration02
	SetArmorDataByKey("710026___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetConjuration03
	SetArmorDataByKey("500005___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction01
	SetArmorDataByKey("710027___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction02
	SetArmorDataByKey("710028___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetDestruction03
	SetArmorDataByKey("500009___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion01
	SetArmorDataByKey("710031___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion02
	SetArmorDataByKey("710032___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetIllusion03
	SetArmorDataByKey("303537___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka01
	SetArmorDataByKey("710033___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka02
	SetArmorDataByKey("710034___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMagicka03
	SetArmorDataByKey("500013___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman01
	SetArmorDataByKey("710035___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman02
	SetArmorDataByKey("710036___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetMarksman03
	SetArmorDataByKey("500017___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration01
	SetArmorDataByKey("710037___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration02
	SetArmorDataByKey("710039___Skyrim.esm", 15, 3) ; EnchArmorIronHelmetRestoration03
	
	SetArmorDataByKey("80212___Skyrim.esm", 35, 14) ; ArmorSteelHelmetA
	SetArmorDataByKey("1011492___Skyrim.esm", 35, 14) ; ArmorSteelHelmetB
	SetArmorDataByKey("571039___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy01
	SetArmorDataByKey("571040___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy02
	SetArmorDataByKey("571041___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlchemy03
	SetArmorDataByKey("741587___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration01
	SetArmorDataByKey("741595___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration02
	SetArmorDataByKey("741596___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetAlteration03
	SetArmorDataByKey("741588___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration01
	SetArmorDataByKey("741597___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration02
	SetArmorDataByKey("741598___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetConjuration03
	SetArmorDataByKey("741589___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction01
	SetArmorDataByKey("741599___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction02
	SetArmorDataByKey("741600___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetDestruction03
	SetArmorDataByKey("741591___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion01
	SetArmorDataByKey("741603___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion02
	SetArmorDataByKey("741604___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetIllusion03
	SetArmorDataByKey("741592___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka01
	SetArmorDataByKey("741605___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka02
	SetArmorDataByKey("741606___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMagicka03
	SetArmorDataByKey("741593___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman01
	SetArmorDataByKey("741609___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman02
	SetArmorDataByKey("741610___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetMarksman03
	SetArmorDataByKey("741594___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration01
	SetArmorDataByKey("741607___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration02
	SetArmorDataByKey("741608___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetRestoration03
	SetArmorDataByKey("600710___Skyrim.esm", 35, 14) ; EnchArmorSteelHelmetWaterbreathing
	
	SetArmorDataByKey("80207___Skyrim.esm", 40, 29) ; ArmorDwarvenHelmet
	SetArmorDataByKey("570970___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy02
	SetArmorDataByKey("570978___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy03
	SetArmorDataByKey("570979___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlchemy04
	SetArmorDataByKey("112491___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration02
	SetArmorDataByKey("112492___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration03
	SetArmorDataByKey("112493___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetAlteration04
	SetArmorDataByKey("112494___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration02
	SetArmorDataByKey("112495___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration03
	SetArmorDataByKey("112496___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetConjuration04
	SetArmorDataByKey("112497___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction02
	SetArmorDataByKey("112498___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction03
	SetArmorDataByKey("112522___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetDestruction04
	SetArmorDataByKey("113072___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion02
	SetArmorDataByKey("113079___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion03
	SetArmorDataByKey("113080___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetIllusion04
	SetArmorDataByKey("113083___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka02
	SetArmorDataByKey("113084___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka03
	SetArmorDataByKey("113086___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMagicka04
	SetArmorDataByKey("113088___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman02
	SetArmorDataByKey("113089___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman03
	SetArmorDataByKey("113091___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetMarksman04
	SetArmorDataByKey("113092___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration02
	SetArmorDataByKey("113093___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration03
	SetArmorDataByKey("113095___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetRestoration04
	SetArmorDataByKey("600717___Skyrim.esm", 40, 29) ; EnchArmorDwarvenHelmetWaterbreathing
	
	SetArmorDataByKey("80222___Skyrim.esm", 35, 14) ; ArmorSteelPlateHelmet
	SetArmorDataByKey("570992___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy02
	SetArmorDataByKey("570993___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy03
	SetArmorDataByKey("570994___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlchemy04
	SetArmorDataByKey("253817___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration02
	SetArmorDataByKey("253818___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration03
	SetArmorDataByKey("253819___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetAlteration04
	SetArmorDataByKey("253820___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration02
	SetArmorDataByKey("253821___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration03
	SetArmorDataByKey("253822___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetConjuration04
	SetArmorDataByKey("253823___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction02
	SetArmorDataByKey("253824___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction03
	SetArmorDataByKey("253825___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetDestruction04
	SetArmorDataByKey("253829___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion02
	SetArmorDataByKey("266270___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion03
	SetArmorDataByKey("266272___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetIllusion04
	SetArmorDataByKey("266273___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka02
	SetArmorDataByKey("266274___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka03
	SetArmorDataByKey("266279___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMagicka04
	SetArmorDataByKey("266284___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman02
	SetArmorDataByKey("266291___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman03
	SetArmorDataByKey("266292___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetMarksman04
	SetArmorDataByKey("266293___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration02
	SetArmorDataByKey("266294___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration03
	SetArmorDataByKey("266295___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetRestoration04
	SetArmorDataByKey("600778___Skyrim.esm", 35, 14) ; EnchArmorSteelPlateHelmetWaterbreathing
	
	SetArmorDataByKey("80217___Skyrim.esm", 50, 14) ; ArmorOrcishHelmet
	SetArmorDataByKey("849916___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy03
	SetArmorDataByKey("849917___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy04
	SetArmorDataByKey("849918___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlchemy05
	SetArmorDataByKey("849919___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration03
	SetArmorDataByKey("849920___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration04
	SetArmorDataByKey("849921___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetAlteration05
	SetArmorDataByKey("849922___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration03
	SetArmorDataByKey("849923___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration04
	SetArmorDataByKey("849924___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetConjuration05
	SetArmorDataByKey("849925___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction03
	SetArmorDataByKey("849926___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction04
	SetArmorDataByKey("849927___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetDestruction05
	SetArmorDataByKey("849931___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion03
	SetArmorDataByKey("849932___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion04
	SetArmorDataByKey("849933___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetIllusion05
	SetArmorDataByKey("849934___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka03
	SetArmorDataByKey("849935___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka04
	SetArmorDataByKey("849936___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMagicka05
	SetArmorDataByKey("849937___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman03
	SetArmorDataByKey("849938___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman04
	SetArmorDataByKey("849939___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetMarksman05
	SetArmorDataByKey("849940___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration03
	SetArmorDataByKey("849941___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration04
	SetArmorDataByKey("849942___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetRestoration05
	SetArmorDataByKey("849943___Skyrim.esm", 50, 14) ; EnchArmorOrcishHelmetWaterbreathing
	
	SetArmorDataByKey("80227___Skyrim.esm", 40, 29) ; ArmorEbonyHelmet
	SetArmorDataByKey("850033___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy03
	SetArmorDataByKey("850034___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy04
	SetArmorDataByKey("850035___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlchemy05
	SetArmorDataByKey("850036___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration03
	SetArmorDataByKey("850037___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration04
	SetArmorDataByKey("850038___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetAlteration05
	SetArmorDataByKey("850039___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration03
	SetArmorDataByKey("850040___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration04
	SetArmorDataByKey("850041___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetConjuration05
	SetArmorDataByKey("850042___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction03
	SetArmorDataByKey("850043___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction04
	SetArmorDataByKey("850044___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetDestruction05
	SetArmorDataByKey("850048___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion03
	SetArmorDataByKey("850049___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion04
	SetArmorDataByKey("850050___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetIllusion05
	SetArmorDataByKey("850051___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka03
	SetArmorDataByKey("850052___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka04
	SetArmorDataByKey("850053___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagicka05
	SetArmorDataByKey("1041135___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate03
	SetArmorDataByKey("1041136___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate04
	SetArmorDataByKey("1041137___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMagickaRate05
	SetArmorDataByKey("850054___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman03
	SetArmorDataByKey("850055___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman04
	SetArmorDataByKey("850056___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetMarksman05
	SetArmorDataByKey("850057___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration03
	SetArmorDataByKey("850058___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration04
	SetArmorDataByKey("850059___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetRestoration05
	SetArmorDataByKey("850060___Skyrim.esm", 40, 29) ; EnchArmorEbonyHelmetWaterbreathing
	
	SetArmorDataByKey("80233___Skyrim.esm", 40, 58) ; ArmorDragonplateHelmet
	SetArmorDataByKey("883296___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy04
	SetArmorDataByKey("883297___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy05
	SetArmorDataByKey("883298___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlchemy06
	SetArmorDataByKey("883299___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration04
	SetArmorDataByKey("883300___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration05
	SetArmorDataByKey("883301___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetAlteration06
	SetArmorDataByKey("883302___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration04
	SetArmorDataByKey("883303___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration05
	SetArmorDataByKey("883304___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetConjuration06
	SetArmorDataByKey("883305___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction04
	SetArmorDataByKey("883306___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction05
	SetArmorDataByKey("883307___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetDestruction06
	SetArmorDataByKey("883311___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion04
	SetArmorDataByKey("883312___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion05
	SetArmorDataByKey("883313___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetIllusion06
	SetArmorDataByKey("883314___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka04
	SetArmorDataByKey("883315___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka05
	SetArmorDataByKey("883316___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagicka06
	SetArmorDataByKey("1041138___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate04
	SetArmorDataByKey("1041139___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate05
	SetArmorDataByKey("1041140___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMagickaRate06
	SetArmorDataByKey("883317___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman04
	SetArmorDataByKey("883318___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman05
	SetArmorDataByKey("883319___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetMarksman06
	SetArmorDataByKey("883320___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration04
	SetArmorDataByKey("883321___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration05
	SetArmorDataByKey("883322___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetRestoration06
	SetArmorDataByKey("883323___Skyrim.esm", 40, 58) ; EnchArmorDragonplateHelmetWaterbreathing
	
	SetArmorDataByKey("80237___Skyrim.esm", 45, 43) ; ArmorDaedricHelmet
	SetArmorDataByKey("883410___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy04
	SetArmorDataByKey("883411___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy05
	SetArmorDataByKey("883412___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlchemy06
	SetArmorDataByKey("883413___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration04
	SetArmorDataByKey("883414___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration05
	SetArmorDataByKey("883415___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetAlteration06
	SetArmorDataByKey("883416___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration04
	SetArmorDataByKey("883417___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration05
	SetArmorDataByKey("883418___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetConjuration06
	SetArmorDataByKey("883419___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction04
	SetArmorDataByKey("883420___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction05
	SetArmorDataByKey("883421___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetDestruction06
	SetArmorDataByKey("883425___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion04
	SetArmorDataByKey("883426___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion05
	SetArmorDataByKey("883427___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetIllusion06
	SetArmorDataByKey("883428___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka04
	SetArmorDataByKey("883429___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka05
	SetArmorDataByKey("883430___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagicka06
	SetArmorDataByKey("1041153___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate04
	SetArmorDataByKey("1041154___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate05
	SetArmorDataByKey("1041155___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMagickaRate06
	SetArmorDataByKey("883431___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman04
	SetArmorDataByKey("883432___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman05
	SetArmorDataByKey("883433___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetMarksman06
	SetArmorDataByKey("883434___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration04
	SetArmorDataByKey("883435___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration05
	SetArmorDataByKey("883436___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetRestoration06
	SetArmorDataByKey("883437___Skyrim.esm", 45, 43) ; EnchArmorDaedricHelmetWaterbreathing
	
	SetArmorDataByKey("307855___Skyrim.esm", 35, 14) ; ArmorBladesHelmet
	
	SetArmorDataByKey("312272___Skyrim.esm", 50, 14) ; ArmorCompanionsHelmet
	
	SetArmorDataByKey("862274___Skyrim.esm", 35, 58) ; DBArmorHelmet
	SetArmorDataByKey("371652___Skyrim.esm", 35, 58) ; DBArmorHelmetMaskLess
	SetArmorDataByKey("925463___Skyrim.esm", 35, 58) ; DBArmorHelmetSP
	SetArmorDataByKey("1108829___Skyrim.esm", 35, 58) ; DBArmorHelmetWornPlayable
	
	SetArmorDataByKey("354974___Skyrim.esm", 30, 3) ; ArmorDraugrHelmet
	SetArmorDataByKey("1001806___Skyrim.esm", 30, 3) ; EnchArmorDraugrHelmetResistFire03
	
	SetArmorDataByKey("1070493___Skyrim.esm", 30, 14) ; ArmorEastmarchHelmetFull
	SetArmorDataByKey("136729___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullFalkreath
	SetArmorDataByKey("819036___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullHaafingar
	SetArmorDataByKey("136731___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullHjaalmarch
	SetArmorDataByKey("136735___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullPale
	SetArmorDataByKey("136723___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullReach
	SetArmorDataByKey("136738___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullRift
	SetArmorDataByKey("136725___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullWhiterun
	SetArmorDataByKey("136733___Skyrim.esm", 30, 14) ; ArmorGuardHelmetFullWinterhold
	
	SetArmorDataByKey("81628___Skyrim.esm", 35, 43) ; ArmorImperialHelmet
	SetArmorDataByKey("81627___Skyrim.esm", 35, 43) ; ArmorImperialLightHelmet
	SetArmorDataByKey("614669___Skyrim.esm", 35, 43) ; ArmorImperialHelmetFull
	SetArmorDataByKey("79567___Skyrim.esm", 35, 43) ; ArmorImperialHelmetOfficer
	SetArmorDataByKey("571042___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy01
	SetArmorDataByKey("571043___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy02
	SetArmorDataByKey("571044___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlchemy03
	SetArmorDataByKey("571045___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration01
	SetArmorDataByKey("571046___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration02
	SetArmorDataByKey("571047___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetAlteration03
	SetArmorDataByKey("571048___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration01
	SetArmorDataByKey("571049___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration02
	SetArmorDataByKey("571050___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetConjuration03
	SetArmorDataByKey("571051___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction01
	SetArmorDataByKey("571052___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction02
	SetArmorDataByKey("571053___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetDestruction03
	SetArmorDataByKey("571057___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion01
	SetArmorDataByKey("571058___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion02
	SetArmorDataByKey("571059___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetIllusion03
	SetArmorDataByKey("571060___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMagicka01
	SetArmorDataByKey("571061___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMagicka02
	SetArmorDataByKey("571063___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman01
	SetArmorDataByKey("571064___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman02
	SetArmorDataByKey("571065___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetMarksman03
	SetArmorDataByKey("571066___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration01
	SetArmorDataByKey("571067___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration02
	SetArmorDataByKey("571068___Skyrim.esm", 35, 43) ; EnchArmorImperialHelmetRestoration03
	SetArmorDataByKey("571069___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy01
	SetArmorDataByKey("571075___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy02
	SetArmorDataByKey("571070___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlchemy03
	SetArmorDataByKey("571071___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration01
	SetArmorDataByKey("571072___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration02
	SetArmorDataByKey("571073___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetAlteration03
	SetArmorDataByKey("571074___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration01
	SetArmorDataByKey("571076___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration02
	SetArmorDataByKey("571077___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetConjuration03
	SetArmorDataByKey("571078___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction01
	SetArmorDataByKey("571079___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction02
	SetArmorDataByKey("571080___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetDestruction03
	SetArmorDataByKey("571084___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion01
	SetArmorDataByKey("571085___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion02
	SetArmorDataByKey("571086___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetIllusion03
	SetArmorDataByKey("571087___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka01
	SetArmorDataByKey("571088___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka02
	SetArmorDataByKey("571062___Skyrim.esm", 35, 43) ; EnchArmorImperialLightHelmetMagicka03
	
	SetArmorDataByKey("551301___Skyrim.esm", 50, 14) ; ArmorStormcloakBearHelmet
	
	SetArmorDataByKey("683385___Skyrim.esm", 30, 14) ; ArmorStormcloakHelmetFull
	
	SetArmorDataByKey("867013___Skyrim.esm", 35, 58) ; ArmorThievesGuildHelmetPlayer
	SetArmorDataByKey("867022___Skyrim.esm", 35, 58) ; ArmorThievesGuildHelmetPlayerImproved
	SetArmorDataByKey("931289___Skyrim.esm", 35, 58) ; ArmorThievesGuildLeaderHelmet
	SetArmorDataByKey("1082694___Skyrim.esm", 35, 58) ; ArmorLinweHelmet
	
	SetArmorDataByKey("383880___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer01
	SetArmorDataByKey("1035283___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer02
	SetArmorDataByKey("1035282___Skyrim.esm", 40, 72) ; ArmorNightingaleHelmetPlayer03

	SetArmorDataByKey("962513___Skyrim.esm", 40, 3) ; MS02ForswornHelmet
	SetArmorDataByKey("888146___Skyrim.esm", 40, 3) ; ForswornHelmet

	SetArmorDataByKey("400569___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskBronzeHelmet
	SetArmorDataByKey("400555___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskCorondrumHelmet
	SetArmorDataByKey("400549___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskEbonyHelmet
	SetArmorDataByKey("400577___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskIronHelmet
	SetArmorDataByKey("400578___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskMarbleHelmet
	SetArmorDataByKey("400523___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskMoonstoneHelmet
	SetArmorDataByKey("400576___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskOrichalumHelmet
	SetArmorDataByKey("400585___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskSteelHelmet
	SetArmorDataByKey("400598___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskUltraHelmet
	SetArmorDataByKey("400586___Skyrim.esm", 10, 0) ; ArmorDragonPriestMaskWoodHelmet

	SetArmorDataByKey("868010___Skyrim.esm", 40, 29) ; ArmorPenitusHelmet


	;##############################
	;
	;    Dawnguard
	;
	;##############################
	SetArmorDataByKey("105182___Dawnguard.esm", 25, 51) ; DLC01ClothesVampireHood
	SetArmorDataByKey("20688___Dawnguard.esm", 35, 14) ; DLC1ArmorDawnguardHelmetHeavy
	SetArmorDataByKey("104606___Dawnguard.esm", 35, 14) ; DLC1ArmorDawnguardHelmetLight

	SetArmorDataByKey("59616___Dawnguard.esm", 35, 14) ; DLC1ArmorFAlmerHardenedHelmet
	SetArmorDataByKey("9195___Dawnguard.esm", 35, 14) ; DLC1ArmorFAlmerHeavyHelmet
	SetArmorDataByKey("77450___Dawnguard.esm", 35, 14) ; DLC1ArmorShellbugHelmet

	SetArmorDataByKey("51220___Dawnguard.esm", 40, 29) ; DLC1IvoryCrown


	;##############################
	;
	;    Dragonborn
	;
	;##############################

	SetArmorDataByKey("233748___Dragonborn.esm", 55, 14) ; DLC2ClothesSkaalHat
	SetArmorDataByKey("168622___Dragonborn.esm", 30, 14) ; DLC2MoragTongHood
	SetArmorDataByKey("121752___Dragonborn.esm", 30, 3) ; DLC2dunKolbjornHelm
	SetArmorDataByKey("147485___Dragonborn.esm", 55, 29) ; DLC2dunHaknirArmorHelm
	SetArmorDataByKey("232157___Dragonborn.esm", 40, 29) ; DLC2dunFahlbtharzDwarvenHelmet
	SetArmorDataByKey("175409___Dragonborn.esm", 35, 58) ; DLC2TGArmorVariantHood

	SetArmorDataByKey("118177___Dragonborn.esm", 55, 29) ; DLC2ArmorStalhrimHeavyHelmet
	SetArmorDataByKey("168502___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	SetArmorDataByKey("168503___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	SetArmorDataByKey("168504___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	SetArmorDataByKey("168505___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	SetArmorDataByKey("168506___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	SetArmorDataByKey("168507___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	SetArmorDataByKey("168508___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	SetArmorDataByKey("168509___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	SetArmorDataByKey("168510___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	SetArmorDataByKey("168511___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	SetArmorDataByKey("168512___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	SetArmorDataByKey("168513___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	SetArmorDataByKey("168514___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	SetArmorDataByKey("168515___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	SetArmorDataByKey("168516___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	SetArmorDataByKey("168517___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	SetArmorDataByKey("168518___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	SetArmorDataByKey("168519___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	SetArmorDataByKey("168520___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	SetArmorDataByKey("168521___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	SetArmorDataByKey("168522___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	SetArmorDataByKey("168523___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	SetArmorDataByKey("168524___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	SetArmorDataByKey("168525___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	SetArmorDataByKey("168526___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	SetArmorDataByKey("168527___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	SetArmorDataByKey("168528___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	SetArmorDataByKey("168529___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing

	SetArmorDataByKey("118179___Dragonborn.esm", 55, 29) ; DLC2ArmorStalhrimLightHelmet
	SetArmorDataByKey("168149___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	SetArmorDataByKey("168150___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	SetArmorDataByKey("168151___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	SetArmorDataByKey("168152___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	SetArmorDataByKey("168153___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	SetArmorDataByKey("168154___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	SetArmorDataByKey("168155___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	SetArmorDataByKey("168156___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	SetArmorDataByKey("168157___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	SetArmorDataByKey("168158___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	SetArmorDataByKey("168159___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	SetArmorDataByKey("168160___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	SetArmorDataByKey("168161___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	SetArmorDataByKey("168162___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	SetArmorDataByKey("168163___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	SetArmorDataByKey("168164___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	SetArmorDataByKey("168165___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	SetArmorDataByKey("168166___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	SetArmorDataByKey("168167___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	SetArmorDataByKey("168168___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	SetArmorDataByKey("168169___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	SetArmorDataByKey("168170___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	SetArmorDataByKey("168171___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	SetArmorDataByKey("168172___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	SetArmorDataByKey("168173___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	SetArmorDataByKey("168174___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	SetArmorDataByKey("168175___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	SetArmorDataByKey("168191___Dragonborn.esm", 55, 29) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing

	SetArmorDataByKey("118169___Dragonborn.esm", 55, 29) ; DLC2ArmorNordicHeavyHelmet
	SetArmorDataByKey("168404___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	SetArmorDataByKey("168405___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	SetArmorDataByKey("168406___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	SetArmorDataByKey("168407___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	SetArmorDataByKey("168408___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	SetArmorDataByKey("168409___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	SetArmorDataByKey("168410___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	SetArmorDataByKey("168411___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	SetArmorDataByKey("168412___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	SetArmorDataByKey("168413___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	SetArmorDataByKey("168414___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	SetArmorDataByKey("168415___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	SetArmorDataByKey("168416___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	SetArmorDataByKey("168417___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	SetArmorDataByKey("168418___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	SetArmorDataByKey("168419___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	SetArmorDataByKey("168420___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	SetArmorDataByKey("168421___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	SetArmorDataByKey("168422___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	SetArmorDataByKey("168423___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	SetArmorDataByKey("168424___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	SetArmorDataByKey("168425___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	SetArmorDataByKey("168426___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	SetArmorDataByKey("168427___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	SetArmorDataByKey("168428___Dragonborn.esm", 55, 29) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing

	SetArmorDataByKey("118165___Dragonborn.esm", 35, 14) ; DLC2ArmorBonemoldHelmet
	SetArmorDataByKey("240419___Dragonborn.esm", 40, 29) ; DLC2ArmorBonemoldImprovedHelmet
	SetArmorDataByKey("165113___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	SetArmorDataByKey("165114___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	SetArmorDataByKey("165115___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	SetArmorDataByKey("165116___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration01
	SetArmorDataByKey("165117___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration02
	SetArmorDataByKey("165118___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetAlteration03
	SetArmorDataByKey("165119___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration01
	SetArmorDataByKey("165120___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration02
	SetArmorDataByKey("165121___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetConjuration03
	SetArmorDataByKey("165122___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction01
	SetArmorDataByKey("165123___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction02
	SetArmorDataByKey("165124___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetDestruction03
	SetArmorDataByKey("165125___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion01
	SetArmorDataByKey("165126___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion02
	SetArmorDataByKey("165127___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetIllusion03
	SetArmorDataByKey("165128___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka01
	SetArmorDataByKey("165129___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka02
	SetArmorDataByKey("165130___Dragonborn.esm", 35, 14) ; DLC2EnchArmorBonemoldHelmetMagicka03

	SetArmorDataByKey("118156___Dragonborn.esm", 30, 14) ; DLC2ArmorChitinHeavyHelmet
	SetArmorDataByKey("168327___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	SetArmorDataByKey("168328___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	SetArmorDataByKey("168329___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	SetArmorDataByKey("168330___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	SetArmorDataByKey("168331___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	SetArmorDataByKey("168332___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	SetArmorDataByKey("168333___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	SetArmorDataByKey("168334___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	SetArmorDataByKey("168335___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	SetArmorDataByKey("168336___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	SetArmorDataByKey("168337___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	SetArmorDataByKey("168338___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	SetArmorDataByKey("168339___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	SetArmorDataByKey("168340___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	SetArmorDataByKey("168341___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	SetArmorDataByKey("168342___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	SetArmorDataByKey("168343___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	SetArmorDataByKey("168344___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	SetArmorDataByKey("168345___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	SetArmorDataByKey("168346___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	SetArmorDataByKey("168347___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	SetArmorDataByKey("168348___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	SetArmorDataByKey("168349___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	SetArmorDataByKey("168350___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	SetArmorDataByKey("168351___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing

	SetArmorDataByKey("118153___Dragonborn.esm", 30, 14) ; DLC2ArmorChitinLightHelmet
	SetArmorDataByKey("167960___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	SetArmorDataByKey("167961___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	SetArmorDataByKey("167962___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	SetArmorDataByKey("167963___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration02
	SetArmorDataByKey("167964___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration03
	SetArmorDataByKey("167965___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetAlteration04
	SetArmorDataByKey("167966___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration02
	SetArmorDataByKey("167967___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration03
	SetArmorDataByKey("167968___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetConjuration04
	SetArmorDataByKey("167969___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction02
	SetArmorDataByKey("167970___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction03
	SetArmorDataByKey("167972___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetDestruction04
	SetArmorDataByKey("167971___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion02
	SetArmorDataByKey("167973___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion03
	SetArmorDataByKey("167974___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetIllusion04
	SetArmorDataByKey("167975___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka02
	SetArmorDataByKey("167976___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka03
	SetArmorDataByKey("167977___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMagicka04
	SetArmorDataByKey("167978___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman02
	SetArmorDataByKey("167979___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman03
	SetArmorDataByKey("167980___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetMarksman04
	SetArmorDataByKey("167981___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration02
	SetArmorDataByKey("167982___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration03
	SetArmorDataByKey("167983___Dragonborn.esm", 30, 14) ; DLC2EnchArmorChitinLightHelmetRestoration04

	SetArmorDataByKey("147710___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskFire
	SetArmorDataByKey("147711___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskFrost
	SetArmorDataByKey("147511___Dragonborn.esm", 10, 0) ; DLC2ArmorAcolyteMaskShock
	SetArmorDataByKey("170594___Dragonborn.esm", 10, 0) ; DLC2MiraakMaskNew
	SetArmorDataByKey("237473___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask1H
	SetArmorDataByKey("236843___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask1L
	SetArmorDataByKey("237474___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask2H
	SetArmorDataByKey("236846___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask2L
	SetArmorDataByKey("237475___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask3H
	SetArmorDataByKey("236847___Dragonborn.esm", 10, 0) ; DLC2MKMiraakMask3L
endFunction

function SetDefaults_Feet()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	SetArmorDataByKey("80144___Skyrim.esm", 12, 6) ; ArmorHideBoots
	SetArmorDataByKey("500021___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry01
	SetArmorDataByKey("709713___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry02
	SetArmorDataByKey("709714___Skyrim.esm", 12, 6) ; EnchArmorHideBootsCarry03
	SetArmorDataByKey("500022___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire01
	SetArmorDataByKey("709769___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire02
	SetArmorDataByKey("709770___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFire03
	SetArmorDataByKey("500023___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost01
	SetArmorDataByKey("709771___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost02
	SetArmorDataByKey("709772___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistFrost03
	SetArmorDataByKey("500024___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock01
	SetArmorDataByKey("709773___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock02
	SetArmorDataByKey("709774___Skyrim.esm", 12, 6) ; EnchArmorHideBootsResistShock03
	SetArmorDataByKey("500025___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak01
	SetArmorDataByKey("709775___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak02
	SetArmorDataByKey("709776___Skyrim.esm", 12, 6) ; EnchArmorHideBootsSneak03
	SetArmorDataByKey("1105804___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina01
	SetArmorDataByKey("1105805___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina02
	SetArmorDataByKey("1105806___Skyrim.esm", 12, 6) ; EnchArmorHideBootsStamina03
	
	SetArmorDataByKey("455576___Skyrim.esm", 15, 6) ; ArmorBanditBoots
	
	SetArmorDataByKey("80160___Skyrim.esm", 12, 21) ; ArmorLeatherBoots
	SetArmorDataByKey("737829___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry01
	SetArmorDataByKey("737830___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry02
	SetArmorDataByKey("737831___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsCarry03
	SetArmorDataByKey("737832___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire01
	SetArmorDataByKey("737833___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire02
	SetArmorDataByKey("737834___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFire03
	SetArmorDataByKey("737835___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost01
	SetArmorDataByKey("737836___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost02
	SetArmorDataByKey("737837___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistFrost03
	SetArmorDataByKey("737838___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock01
	SetArmorDataByKey("737839___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock02
	SetArmorDataByKey("737840___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsResistShock03
	SetArmorDataByKey("737841___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak01
	SetArmorDataByKey("737842___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak02
	SetArmorDataByKey("737843___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsSneak03
	SetArmorDataByKey("1105810___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina01
	SetArmorDataByKey("1105811___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina02
	SetArmorDataByKey("1105812___Skyrim.esm", 12, 21) ; EnchArmorLeatherBootsStamina03
	
	SetArmorDataByKey("80154___Skyrim.esm", 9, 14) ; ArmorElvenBoots
	SetArmorDataByKey("1072913___Skyrim.esm", 9, 14) ; ArmorElvenLightBoots
	SetArmorDataByKey("778169___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry02
	SetArmorDataByKey("778170___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry03
	SetArmorDataByKey("778171___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsCarry04
	SetArmorDataByKey("778172___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire02
	SetArmorDataByKey("778173___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire03
	SetArmorDataByKey("778232___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFire04
	SetArmorDataByKey("778174___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost02
	SetArmorDataByKey("778175___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost03
	SetArmorDataByKey("778298___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistFrost04
	SetArmorDataByKey("778176___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock02
	SetArmorDataByKey("778177___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock03
	SetArmorDataByKey("778299___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsResistShock04
	SetArmorDataByKey("778178___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak02
	SetArmorDataByKey("778179___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak03
	SetArmorDataByKey("778300___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsSneak04
	SetArmorDataByKey("1105798___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina02
	SetArmorDataByKey("1105799___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina03
	SetArmorDataByKey("1105800___Skyrim.esm", 9, 14) ; EnchArmorElvenBootsStamina04
	
	SetArmorDataByKey("111519___Skyrim.esm", 12, 6) ; ArmorScaledBoots
	SetArmorDataByKey("873446___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry02
	SetArmorDataByKey("873447___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry03
	SetArmorDataByKey("873448___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsCarry04
	SetArmorDataByKey("873449___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire02
	SetArmorDataByKey("873450___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire03
	SetArmorDataByKey("873451___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFire04
	SetArmorDataByKey("873452___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost02
	SetArmorDataByKey("873453___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost03
	SetArmorDataByKey("873454___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistFrost04
	SetArmorDataByKey("873455___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock02
	SetArmorDataByKey("873456___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock03
	SetArmorDataByKey("873457___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsResistShock04
	SetArmorDataByKey("873458___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak02
	SetArmorDataByKey("873459___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak03
	SetArmorDataByKey("873460___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsSneak04
	SetArmorDataByKey("1105816___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina02
	SetArmorDataByKey("1105817___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina03
	SetArmorDataByKey("1105818___Skyrim.esm", 12, 6) ; EnchArmorScaledBootsStamina04
	
	SetArmorDataByKey("80184___Skyrim.esm", 12, 14) ; ArmorGlassBoots
	SetArmorDataByKey("873326___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry03
	SetArmorDataByKey("873327___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry04
	SetArmorDataByKey("873328___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsCarry05
	SetArmorDataByKey("873329___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsMuffle
	SetArmorDataByKey("873330___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire03
	SetArmorDataByKey("873331___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire04
	SetArmorDataByKey("873332___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFire05
	SetArmorDataByKey("873333___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost03
	SetArmorDataByKey("873334___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost04
	SetArmorDataByKey("873335___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistFrost05
	SetArmorDataByKey("873336___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock03
	SetArmorDataByKey("873337___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock04
	SetArmorDataByKey("873338___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsResistShock05
	SetArmorDataByKey("1105780___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak03
	SetArmorDataByKey("1105781___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak04
	SetArmorDataByKey("1105782___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsSneak05
	SetArmorDataByKey("1105801___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina03
	SetArmorDataByKey("1105802___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina04
	SetArmorDataByKey("1105803___Skyrim.esm", 12, 14) ; EnchArmorGlassBootsStamina05
	
	SetArmorDataByKey("80189___Skyrim.esm", 15, 29) ; ArmorDragonscaleBoots
	SetArmorDataByKey("883111___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry04
	SetArmorDataByKey("883112___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry05
	SetArmorDataByKey("883113___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsCarry06
	SetArmorDataByKey("883115___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire04
	SetArmorDataByKey("883116___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire05
	SetArmorDataByKey("883117___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFire06
	SetArmorDataByKey("883118___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost04
	SetArmorDataByKey("883119___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost05
	SetArmorDataByKey("883120___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistFrost06
	SetArmorDataByKey("883121___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock04
	SetArmorDataByKey("883122___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock05
	SetArmorDataByKey("883123___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsResistShock06
	SetArmorDataByKey("883114___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak04
	SetArmorDataByKey("1038853___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak05
	SetArmorDataByKey("1038854___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsSneak06
	SetArmorDataByKey("1105789___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina04
	SetArmorDataByKey("1105790___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina05
	SetArmorDataByKey("1105791___Skyrim.esm", 15, 29) ; EnchArmorDragonscaleBootsStamina06
	
	SetArmorDataByKey("77387___Skyrim.esm", 7, 6) ; ArmorIronBoots
	SetArmorDataByKey("500000___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry01
	SetArmorDataByKey("709979___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry02
	SetArmorDataByKey("709980___Skyrim.esm", 7, 6) ; EnchArmorIronBootsCarry03
	SetArmorDataByKey("499952___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire01
	SetArmorDataByKey("709981___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire02
	SetArmorDataByKey("709982___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFire03
	SetArmorDataByKey("499953___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost01
	SetArmorDataByKey("709983___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost02
	SetArmorDataByKey("709984___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistFrost03
	SetArmorDataByKey("301970___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock01
	SetArmorDataByKey("709985___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock02
	SetArmorDataByKey("709986___Skyrim.esm", 7, 6) ; EnchArmorIronBootsResistShock03
	SetArmorDataByKey("1105807___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina01
	SetArmorDataByKey("1105808___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina02
	SetArmorDataByKey("1105809___Skyrim.esm", 7, 6) ; EnchArmorIronBootsStamina03
	
	SetArmorDataByKey("80209___Skyrim.esm", 12, 14) ; ArmorSteelBootsA
	SetArmorDataByKey("1011489___Skyrim.esm", 12, 14) ; ArmorSteelBootsB
	SetArmorDataByKey("741530___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry01
	SetArmorDataByKey("741531___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry02
	SetArmorDataByKey("741532___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsCarry03
	SetArmorDataByKey("600693___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsMuffle
	SetArmorDataByKey("741533___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire01
	SetArmorDataByKey("741534___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire02
	SetArmorDataByKey("741535___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFire03
	SetArmorDataByKey("741536___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost01
	SetArmorDataByKey("741625___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost02
	SetArmorDataByKey("741537___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistFrost03
	SetArmorDataByKey("741538___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock01
	SetArmorDataByKey("741539___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock02
	SetArmorDataByKey("741540___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsResistShock03
	SetArmorDataByKey("1105819___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina01
	SetArmorDataByKey("1105820___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina02
	SetArmorDataByKey("1105821___Skyrim.esm", 12, 14) ; EnchArmorSteelBootsStamina03
	
	SetArmorDataByKey("80204___Skyrim.esm", 15, 21) ; ArmorDwarvenBoots
	SetArmorDataByKey("111413___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry02
	SetArmorDataByKey("111421___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry03
	SetArmorDataByKey("111563___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsCarry04
	SetArmorDataByKey("600713___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsMuffle
	SetArmorDataByKey("111564___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire02
	SetArmorDataByKey("111565___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire03
	SetArmorDataByKey("111566___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFire04
	SetArmorDataByKey("111567___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost02
	SetArmorDataByKey("111568___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost03
	SetArmorDataByKey("111569___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistFrost04
	SetArmorDataByKey("111570___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock02
	SetArmorDataByKey("111571___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock03
	SetArmorDataByKey("111572___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsResistShock04
	SetArmorDataByKey("1105792___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina02
	SetArmorDataByKey("1105793___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina03
	SetArmorDataByKey("1105794___Skyrim.esm", 15, 21) ; EnchArmorDwarvenBootsStamina04
	
	SetArmorDataByKey("80219___Skyrim.esm", 15, 14) ; ArmorSteelPlateBoots
	SetArmorDataByKey("111391___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry02
	SetArmorDataByKey("111614___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry03
	SetArmorDataByKey("111615___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsCarry04
	SetArmorDataByKey("600718___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsMuffle
	SetArmorDataByKey("111616___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire02
	SetArmorDataByKey("111617___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire03
	SetArmorDataByKey("111618___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFire04
	SetArmorDataByKey("111619___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost02
	SetArmorDataByKey("111620___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost03
	SetArmorDataByKey("111621___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistFrost04
	SetArmorDataByKey("111622___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock02
	SetArmorDataByKey("111623___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock03
	SetArmorDataByKey("111624___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsResistShock04
	SetArmorDataByKey("1105822___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina02
	SetArmorDataByKey("1105823___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina03
	SetArmorDataByKey("1105824___Skyrim.esm", 15, 14) ; EnchArmorSteelPlateBootsStamina04
	
	SetArmorDataByKey("80214___Skyrim.esm", 21, 14) ; ArmorOrcishBoots
	SetArmorDataByKey("849839___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry03
	SetArmorDataByKey("849840___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry04
	SetArmorDataByKey("849841___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsCarry05
	SetArmorDataByKey("849842___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsMuffle
	SetArmorDataByKey("849843___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire03
	SetArmorDataByKey("849844___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire04
	SetArmorDataByKey("849845___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFire05
	SetArmorDataByKey("849846___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost03
	SetArmorDataByKey("849847___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost04
	SetArmorDataByKey("849848___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistFrost05
	SetArmorDataByKey("849849___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock03
	SetArmorDataByKey("849850___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock04
	SetArmorDataByKey("849851___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsResistShock05
	SetArmorDataByKey("1105813___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina03
	SetArmorDataByKey("1105814___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina04
	SetArmorDataByKey("1105815___Skyrim.esm", 21, 14) ; EnchArmorOrcishBootsStamina05
	
	SetArmorDataByKey("80224___Skyrim.esm", 15, 14) ; ArmorEbonyBoots
	SetArmorDataByKey("849956___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry03
	SetArmorDataByKey("849957___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry04
	SetArmorDataByKey("849958___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsCarry05
	SetArmorDataByKey("849959___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsMuffle
	SetArmorDataByKey("849960___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire03
	SetArmorDataByKey("849961___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire04
	SetArmorDataByKey("849962___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFire05
	SetArmorDataByKey("849963___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost03
	SetArmorDataByKey("849964___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost04
	SetArmorDataByKey("849965___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistFrost05
	SetArmorDataByKey("849966___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock03
	SetArmorDataByKey("849967___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock04
	SetArmorDataByKey("849968___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsResistShock05
	SetArmorDataByKey("1105795___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina03
	SetArmorDataByKey("1105796___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina04
	SetArmorDataByKey("1105797___Skyrim.esm", 15, 14) ; EnchArmorEbonyBootsStamina05
	
	SetArmorDataByKey("80229___Skyrim.esm", 15, 29) ; ArmorDragonplateBoots
	SetArmorDataByKey("883228___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry04
	SetArmorDataByKey("883229___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry05
	SetArmorDataByKey("883230___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsCarry06
	SetArmorDataByKey("883231___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsMuffle
	SetArmorDataByKey("883232___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire04
	SetArmorDataByKey("883233___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire05
	SetArmorDataByKey("883234___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFire06
	SetArmorDataByKey("883235___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost04
	SetArmorDataByKey("883236___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost05
	SetArmorDataByKey("883237___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistFrost06
	SetArmorDataByKey("883349___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock04
	SetArmorDataByKey("883350___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock05
	SetArmorDataByKey("883351___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsResistShock06
	SetArmorDataByKey("1105786___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina04
	SetArmorDataByKey("1105787___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina05
	SetArmorDataByKey("1105788___Skyrim.esm", 15, 29) ; EnchArmorDragonplateBootsStamina06
	
	SetArmorDataByKey("80234___Skyrim.esm", 18, 21) ; ArmorDaedricBoots
	SetArmorDataByKey("883336___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry04
	SetArmorDataByKey("883337___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry05
	SetArmorDataByKey("883338___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsCarry06
	SetArmorDataByKey("883339___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsMuffle
	SetArmorDataByKey("883340___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire04
	SetArmorDataByKey("883341___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire05
	SetArmorDataByKey("883342___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFire06
	SetArmorDataByKey("883343___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost04
	SetArmorDataByKey("883344___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost05
	SetArmorDataByKey("883345___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistFrost06
	SetArmorDataByKey("883346___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock04
	SetArmorDataByKey("883347___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock05
	SetArmorDataByKey("883348___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsResistShock06
	SetArmorDataByKey("1105783___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina04
	SetArmorDataByKey("1105784___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina05
	SetArmorDataByKey("1105785___Skyrim.esm", 18, 21) ; EnchArmorDaedricBootsStamina06
	
	SetArmorDataByKey("307848___Skyrim.esm", 12, 14) ; ArmorBladesBoots
	
	SetArmorDataByKey("847484___Skyrim.esm", 21, 14) ; ArmorCompanionsBoots
	
	SetArmorDataByKey("862277___Skyrim.esm", 12, 29) ; DBArmorBoots
	SetArmorDataByKey("925460___Skyrim.esm", 12, 29) ; DBArmorBootsSP
	SetArmorDataByKey("1108828___Skyrim.esm", 12, 29) ; DBArmorBootsWornPlayable
	
	SetArmorDataByKey("354973___Skyrim.esm", 9, 3) ; ArmorDraugrBoots
	
	SetArmorDataByKey("683391___Skyrim.esm", 21, 14) ; ArmorStormcloakBoots
	
	SetArmorDataByKey("79574___Skyrim.esm", 12, 14) ; ArmorImperialBoots
	SetArmorDataByKey("81623___Skyrim.esm", 12, 14) ; ArmorImperialLightBoots
	SetArmorDataByKey("707771___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry01
	SetArmorDataByKey("709855___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry02
	SetArmorDataByKey("709856___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsCarry03
	SetArmorDataByKey("707772___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire01
	SetArmorDataByKey("709857___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire02
	SetArmorDataByKey("709858___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFire03
	SetArmorDataByKey("707773___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost01
	SetArmorDataByKey("709859___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost02
	SetArmorDataByKey("709860___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistFrost03
	SetArmorDataByKey("707774___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock01
	SetArmorDataByKey("709861___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock02
	SetArmorDataByKey("709862___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsResistShock03
	SetArmorDataByKey("707775___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak01
	SetArmorDataByKey("709863___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak02
	SetArmorDataByKey("709864___Skyrim.esm", 12, 14) ; EnchArmorImperialBootsSneak03
	SetArmorDataByKey("759565___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry01
	SetArmorDataByKey("759566___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry02
	SetArmorDataByKey("759567___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsCarry03
	SetArmorDataByKey("759568___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire01
	SetArmorDataByKey("759569___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire02
	SetArmorDataByKey("759570___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFire03
	SetArmorDataByKey("759571___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost01
	SetArmorDataByKey("759572___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost02
	SetArmorDataByKey("759573___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistFrost03
	SetArmorDataByKey("759574___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock01
	SetArmorDataByKey("759575___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock02
	SetArmorDataByKey("759576___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsResistShock03
	SetArmorDataByKey("759577___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak01
	SetArmorDataByKey("759578___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak02
	SetArmorDataByKey("759579___Skyrim.esm", 12, 14) ; EnchArmorImperialLightBootsSneak03
	
	SetArmorDataByKey("551297___Skyrim.esm", 18, 14) ; ArmorStormcloakBearBoots
	
	SetArmorDataByKey("416684___Skyrim.esm", 9, 3) ; ClothesThalmorBoots
	
	SetArmorDataByKey("867010___Skyrim.esm", 12, 29) ; ArmorThievesGuildBootsPlayer
	SetArmorDataByKey("867019___Skyrim.esm", 12, 29) ; ArmorThievesGuildBootsPlayerImproved
	SetArmorDataByKey("931286___Skyrim.esm", 12, 29) ; ArmorThievesGuildLeaderBoots
	SetArmorDataByKey("1082691___Skyrim.esm", 12, 29) ; ArmorLinweBoots
	
	SetArmorDataByKey("1035276___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer01
	SetArmorDataByKey("383877___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer02
	SetArmorDataByKey("1035277___Skyrim.esm", 12, 35) ; ArmorNightingaleBootsPlayer03
	
	SetArmorDataByKey("248320___Skyrim.esm", 3, 0) ; ClothesPrisonerShoes

	SetArmorDataByKey("962515___Skyrim.esm", 3, 0) ; MS02ForswornBoots
	SetArmorDataByKey("888142___Skyrim.esm", 3, 0) ; ForswornBoots

	SetArmorDataByKey("868007___Skyrim.esm", 15, 21) ; ArmorPenitusBoots

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	SetArmorDataByKey("59882___Dawnguard.esm", 3, 0) ; ClothesPrisonerBloodyShoes
	SetArmorDataByKey("18393___Dawnguard.esm", 3, 0) ; DLC1ClothesMothPriestSandals

	SetArmorDataByKey("83799___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardBootsHeavy
	SetArmorDataByKey("62464___Dawnguard.esm", 12, 14) ; DLC1ArmorDawnguardBootsLight

	SetArmorDataByKey("59613___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHardenedBoots
	SetArmorDataByKey("9199___Dawnguard.esm", 5, 3) ; DLC1ArmorFalmerHeavyBoots

	SetArmorDataByKey("46558___Dawnguard.esm", 12, 29) ; DLC1ArmorVampireBoots

	SetArmorDataByKey("51221___Dawnguard.esm", 15, 21) ; DLC1IvoryBoots

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	SetArmorDataByKey("118174___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimHeavyBoots
	SetArmorDataByKey("168444___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	SetArmorDataByKey("168445___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	SetArmorDataByKey("168446___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	SetArmorDataByKey("168447___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	SetArmorDataByKey("168448___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	SetArmorDataByKey("168449___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	SetArmorDataByKey("168450___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	SetArmorDataByKey("168451___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	SetArmorDataByKey("168452___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	SetArmorDataByKey("168453___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	SetArmorDataByKey("168454___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	SetArmorDataByKey("168455___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	SetArmorDataByKey("168456___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	SetArmorDataByKey("168457___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	SetArmorDataByKey("168458___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	SetArmorDataByKey("168459___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimHeavyBootsStamina06

	SetArmorDataByKey("118142___Dragonborn.esm", 24, 14) ; DLC2ArmorStalhrimLightBoots
	SetArmorDataByKey("168083___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry03
	SetArmorDataByKey("168084___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry04
	SetArmorDataByKey("168085___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsCarry05
	SetArmorDataByKey("168192___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsMuffle
	SetArmorDataByKey("168086___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	SetArmorDataByKey("168087___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	SetArmorDataByKey("168088___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	SetArmorDataByKey("168089___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	SetArmorDataByKey("168090___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	SetArmorDataByKey("168091___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	SetArmorDataByKey("168093___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	SetArmorDataByKey("168094___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	SetArmorDataByKey("168095___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	SetArmorDataByKey("168092___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak03
	SetArmorDataByKey("168096___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak04
	SetArmorDataByKey("168097___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsSneak05
	SetArmorDataByKey("168098___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina03
	SetArmorDataByKey("168099___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina04
	SetArmorDataByKey("168100___Dragonborn.esm", 24, 14) ; DLC2EnchArmorStalhrimLightBootsStamina05

	SetArmorDataByKey("118166___Dragonborn.esm", 24, 21) ; DLC2ArmorNordicHeavyBoots
	SetArmorDataByKey("168352___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry03
	SetArmorDataByKey("168353___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry04
	SetArmorDataByKey("168354___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsCarry05
	SetArmorDataByKey("168355___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsMuffle
	SetArmorDataByKey("168356___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	SetArmorDataByKey("168357___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	SetArmorDataByKey("168358___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	SetArmorDataByKey("168359___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	SetArmorDataByKey("168360___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	SetArmorDataByKey("168361___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	SetArmorDataByKey("168362___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	SetArmorDataByKey("168363___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	SetArmorDataByKey("168364___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	SetArmorDataByKey("168365___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina03
	SetArmorDataByKey("168366___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina04
	SetArmorDataByKey("168367___Dragonborn.esm", 24, 21) ; DLC2EnchArmorNordicHeavyBootsStamina05

	SetArmorDataByKey("118162___Dragonborn.esm", 12, 14) ; DLC2ArmorBonemoldBoots
	SetArmorDataByKey("240421___Dragonborn.esm", 15, 21) ; DLC2ArmorBonemoldImprovedBoots
	SetArmorDataByKey("165062___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry01
	SetArmorDataByKey("165063___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry02
	SetArmorDataByKey("165064___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsCarry03
	SetArmorDataByKey("165065___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire01
	SetArmorDataByKey("165066___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire02
	SetArmorDataByKey("165067___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFire03
	SetArmorDataByKey("165068___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost01
	SetArmorDataByKey("165069___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost02
	SetArmorDataByKey("165070___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistFrost03
	SetArmorDataByKey("165071___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock01
	SetArmorDataByKey("165072___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock02
	SetArmorDataByKey("165073___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsResistShock03
	SetArmorDataByKey("165074___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak01
	SetArmorDataByKey("165075___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak02
	SetArmorDataByKey("165076___Dragonborn.esm", 12, 14) ; DLC2EnchArmorBonemoldBootsSneak03

	SetArmorDataByKey("118150___Dragonborn.esm", 12, 14) ; DLC2ArmorChitinLightBoots
	SetArmorDataByKey("167903___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry02
	SetArmorDataByKey("167933___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry03
	SetArmorDataByKey("167904___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsCarry04
	SetArmorDataByKey("167905___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire02
	SetArmorDataByKey("167906___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire03
	SetArmorDataByKey("167907___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFire04
	SetArmorDataByKey("167908___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost02
	SetArmorDataByKey("167909___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost03
	SetArmorDataByKey("167910___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistFrost04
	SetArmorDataByKey("167911___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock02
	SetArmorDataByKey("167912___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock03
	SetArmorDataByKey("167913___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsResistShock04
	SetArmorDataByKey("167914___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak02
	SetArmorDataByKey("167915___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak03
	SetArmorDataByKey("167916___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsSneak04
	SetArmorDataByKey("167917___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina02
	SetArmorDataByKey("167918___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina03
	SetArmorDataByKey("167919___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinLightBootsStamina04

	SetArmorDataByKey("118146___Dragonborn.esm", 12, 14) ; DLC2ArmorChitinHeavyBoots
	SetArmorDataByKey("168275___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry02
	SetArmorDataByKey("168276___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry03
	SetArmorDataByKey("168277___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsCarry04
	SetArmorDataByKey("168278___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsMuffle
	SetArmorDataByKey("168279___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	SetArmorDataByKey("168280___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	SetArmorDataByKey("168281___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	SetArmorDataByKey("168282___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	SetArmorDataByKey("168283___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	SetArmorDataByKey("168284___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	SetArmorDataByKey("168285___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	SetArmorDataByKey("168286___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	SetArmorDataByKey("168287___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	SetArmorDataByKey("168288___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina02
	SetArmorDataByKey("168289___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina03
	SetArmorDataByKey("168290___Dragonborn.esm", 12, 14) ; DLC2EnchArmorChitinHeavyBootsStamina04

	SetArmorDataByKey("233746___Dragonborn.esm", 24, 14) ; DLC2ClothesSkaalBoots
	SetArmorDataByKey("168619___Dragonborn.esm", 12, 14) ; DLC2MoragTongBoots
	SetArmorDataByKey("116309___Dragonborn.esm", 9, 3) ; DLC2dunKolbjornBoots
	SetArmorDataByKey("147482___Dragonborn.esm", 24, 14) ; DLC2dunHaknirArmorBoots
	SetArmorDataByKey("175412___Dragonborn.esm", 12, 29) ; DLC2TGArmorVariantBoots

	;##############################
	;
	;    Campfire
	;
	;##############################
	SetArmorDataByKey("267720___Campfire.esm", 21, 14) ; _Camp_ArmorSonsBoots
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
	SetArmorDataByKey("260764___Campfire.esm", 5, 5) ; _Camp_Cloak_BasicBurlap
	SetArmorDataByKey("260765___Campfire.esm", 10, 10) ; _Camp_Cloak_BasicLinen
	SetArmorDataByKey("260766___Campfire.esm", 40, 12) ; _Camp_Cloak_BasicFur
	SetArmorDataByKey("260767___Campfire.esm", 12, 40) ; _Camp_Cloak_BasicHide

	;##############################
	;
	;    Frostfall
	;
	;##############################
	SetArmorDataByKey("356637___Frostfall.esp", 10, 10) ; _Frost_Cloak_BoundLesser
	SetArmorDataByKey("359400___Frostfall.esp", 25, 25) ; _Frost_Cloak_BoundGreater
endFunction

function SetDefaults_Shield()
	SetArmorDataByKey("151754___Campfire.esm", abIgnore = true) ; _Camp_WalkingStickShield
endFunction

; Stuff to add
;SetArmorDataByKey("9205___Dawnguard.esm", X, Y, Z) ; DLC1SkinNakedVampireLord

;@TODO: Add immersive armors
;@TODO: Add Cloaks of Skyrim (Compatibility)
;@TODO: Add Winter is Coming Cloaks (Compatibility)
;@TODO: Add 'hooded' clothes to multi-list
;@TODO: Add exception data store?