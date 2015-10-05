scriptname _Frost_APDatastoreDefaultData extends Quest

import _FrostInternal

function SetDefaults_Body()
	FrostDebug(1, "Setting default settings for body armor...")

	AddDatastoreEntryByKey("80145___Skyrim.esm", 1, 60, 0) ; ArmorHideCuirass
	AddDatastoreEntryByKey("1101736___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration01
	AddDatastoreEntryByKey("1101737___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration02
	AddDatastoreEntryByKey("1101738___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassAlteration03
	AddDatastoreEntryByKey("1101739___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration01
	AddDatastoreEntryByKey("1101740___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration02
	AddDatastoreEntryByKey("1101741___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassConjuration03
	AddDatastoreEntryByKey("1101742___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction01
	AddDatastoreEntryByKey("1101743___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction02
	AddDatastoreEntryByKey("1101744___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassDestruction03
	AddDatastoreEntryByKey("500027___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth01
	AddDatastoreEntryByKey("709777___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth02
	AddDatastoreEntryByKey("709778___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassHealth03
	AddDatastoreEntryByKey("1101745___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion01
	AddDatastoreEntryByKey("1101746___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion02
	AddDatastoreEntryByKey("1101747___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassIllusion03
	AddDatastoreEntryByKey("500028___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor01
	AddDatastoreEntryByKey("709780___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor02
	AddDatastoreEntryByKey("709781___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassLightArmor03
	AddDatastoreEntryByKey("1101748___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration01
	AddDatastoreEntryByKey("1101749___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration02
	AddDatastoreEntryByKey("1101750___Skyrim.esm", 1, 60, 0) ; EnchArmorHideCuirassRestoration03
	
	AddDatastoreEntryByKey("1071435___Skyrim.esm", 1, 30, 0) ; ArmorBanditCuirass1 		;Shirtless
	AddDatastoreEntryByKey("1071437___Skyrim.esm", 1, 40, 0) ; ArmorBanditCuirass2 		;Shirtless / shawl
	AddDatastoreEntryByKey("1071439___Skyrim.esm", 1, 125, 5) ; ArmorBanditCuirass3 	;Sleeveless
	AddDatastoreEntryByKey("455571___Skyrim.esm", 1, 160, 10) ; ArmorBanditCuirass 		;Full
	
	AddDatastoreEntryByKey("111522___Skyrim.esm", 1, 75, 0) ; ArmorStuddedCuirass
	AddDatastoreEntryByKey("707731___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth01
	AddDatastoreEntryByKey("709843___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth02
	AddDatastoreEntryByKey("709844___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassHealth03
	AddDatastoreEntryByKey("707732___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor01
	AddDatastoreEntryByKey("709845___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor02
	AddDatastoreEntryByKey("709846___Skyrim.esm", 1, 75, 0) ; EnchArmorStuddedCuirassLightArmor03
	
	AddDatastoreEntryByKey("221598___Skyrim.esm", 1, 125, 25) ; ArmorLeatherCuirass
	AddDatastoreEntryByKey("1105605___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassAlteration01
	AddDatastoreEntryByKey("1105606___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassAlteration02
	AddDatastoreEntryByKey("1105607___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassAlteration03
	AddDatastoreEntryByKey("1105608___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassConjuration01
	AddDatastoreEntryByKey("1105609___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassConjuration02
	AddDatastoreEntryByKey("1105610___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassConjuration03
	AddDatastoreEntryByKey("1105611___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassDestruction01
	AddDatastoreEntryByKey("1105612___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassDestruction02
	AddDatastoreEntryByKey("1105613___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassDestruction03
	AddDatastoreEntryByKey("737844___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassHealth01
	AddDatastoreEntryByKey("737845___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassHealth02
	AddDatastoreEntryByKey("737846___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassHealth03
	AddDatastoreEntryByKey("1105614___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassIllusion01
	AddDatastoreEntryByKey("1105615___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassIllusion02
	AddDatastoreEntryByKey("1105616___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassIllusion03
	AddDatastoreEntryByKey("737847___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassLightArmor01
	AddDatastoreEntryByKey("737848___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassLightArmor02
	AddDatastoreEntryByKey("737849___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassLightArmor03
	AddDatastoreEntryByKey("1105617___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassRestoration01
	AddDatastoreEntryByKey("1105618___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassRestoration02
	AddDatastoreEntryByKey("1105619___Skyrim.esm", 1, 125, 25) ; EnchArmorLeatherCuirassRestoration03
	
	AddDatastoreEntryByKey("562851___Skyrim.esm", 1, 125, 20) ; ArmorElvenCuirass
	AddDatastoreEntryByKey("1072914___Skyrim.esm", 1, 125, 20) ; ArmorElvenLightCuirass
	AddDatastoreEntryByKey("1101690___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassAlteration02
	AddDatastoreEntryByKey("1101691___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassAlteration03
	AddDatastoreEntryByKey("1101692___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassAlteration04
	AddDatastoreEntryByKey("1101693___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassConjuration02
	AddDatastoreEntryByKey("1101694___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassConjuration03
	AddDatastoreEntryByKey("1101695___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassConjuration04
	AddDatastoreEntryByKey("1101696___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassDestruction02
	AddDatastoreEntryByKey("1101697___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassDestruction03
	AddDatastoreEntryByKey("1101698___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassDestruction04
	AddDatastoreEntryByKey("778180___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassHealth02
	AddDatastoreEntryByKey("778181___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassHealth03
	AddDatastoreEntryByKey("778301___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassHealth04
	AddDatastoreEntryByKey("1101699___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassIllusion02
	AddDatastoreEntryByKey("1101700___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassIllusion03
	AddDatastoreEntryByKey("1101701___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassIllusion04
	AddDatastoreEntryByKey("778182___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassLightArmor02
	AddDatastoreEntryByKey("778183___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassLightArmor03
	AddDatastoreEntryByKey("778302___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassLightArmor04
	AddDatastoreEntryByKey("1101702___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassRestoration02
	AddDatastoreEntryByKey("1101703___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassRestoration03
	AddDatastoreEntryByKey("1101704___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenCuirassRestoration04
	AddDatastoreEntryByKey("1101705___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassAlteration03
	AddDatastoreEntryByKey("1101706___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassAlteration04
	AddDatastoreEntryByKey("1101715___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassAlteration05
	AddDatastoreEntryByKey("1101707___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassConjuration03
	AddDatastoreEntryByKey("1101708___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassConjuration04
	AddDatastoreEntryByKey("1101716___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassConjuration05
	AddDatastoreEntryByKey("1101709___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassDestruction03
	AddDatastoreEntryByKey("1101710___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassDestruction04
	AddDatastoreEntryByKey("1101717___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassDestruction05
	AddDatastoreEntryByKey("1038874___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealRate03
	AddDatastoreEntryByKey("1038875___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealRate04
	AddDatastoreEntryByKey("1038876___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealRate05
	AddDatastoreEntryByKey("844205___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealth03
	AddDatastoreEntryByKey("844206___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealth04
	AddDatastoreEntryByKey("844207___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassHealth05
	AddDatastoreEntryByKey("1101711___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassIllusion03
	AddDatastoreEntryByKey("1101712___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassIllusion04
	AddDatastoreEntryByKey("1101718___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassIllusion05
	AddDatastoreEntryByKey("844208___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassLightArmor03
	AddDatastoreEntryByKey("844209___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassLightArmor04
	AddDatastoreEntryByKey("844210___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassLightArmor05
	AddDatastoreEntryByKey("1101713___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassRestoration03
	AddDatastoreEntryByKey("1101714___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassRestoration04
	AddDatastoreEntryByKey("1101719___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassRestoration05
	AddDatastoreEntryByKey("1038877___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassStaminaRate03
	AddDatastoreEntryByKey("1038878___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassStaminaRate04
	AddDatastoreEntryByKey("1038879___Skyrim.esm", 1, 125, 20) ; EnchArmorElvenGildedCuirassStaminaRate05
	
	AddDatastoreEntryByKey("111523___Skyrim.esm", 1, 110, 10) ; ArmorScaledCuirass
	AddDatastoreEntryByKey("111524___Skyrim.esm", 1, 110, 15) ; ArmorScaledCuirassB
	AddDatastoreEntryByKey("1105635___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassAlteration02
	AddDatastoreEntryByKey("1105636___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassAlteration03
	AddDatastoreEntryByKey("1105637___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassAlteration04
	AddDatastoreEntryByKey("1105638___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassConjuration02
	AddDatastoreEntryByKey("1105639___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassConjuration03
	AddDatastoreEntryByKey("1105640___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassConjuration04
	AddDatastoreEntryByKey("1105641___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassDestruction02
	AddDatastoreEntryByKey("1105642___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassDestruction03
	AddDatastoreEntryByKey("1105643___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassDestruction04
	AddDatastoreEntryByKey("873461___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassHealth02
	AddDatastoreEntryByKey("873462___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassHealth03
	AddDatastoreEntryByKey("873463___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassHealth04
	AddDatastoreEntryByKey("1105644___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassIllusion02
	AddDatastoreEntryByKey("1105645___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassIllusion03
	AddDatastoreEntryByKey("1105646___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassIllusion04
	AddDatastoreEntryByKey("873464___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassLightArmor02
	AddDatastoreEntryByKey("873465___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassLightArmor03
	AddDatastoreEntryByKey("873466___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassLightArmor04
	AddDatastoreEntryByKey("1105647___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassRestoration02
	AddDatastoreEntryByKey("1105648___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassRestoration03
	AddDatastoreEntryByKey("1105649___Skyrim.esm", 1, 110, 10) ; EnchArmorScaledCuirassRestoration04
	
	AddDatastoreEntryByKey("80185___Skyrim.esm", 1, 125, 20) ; ArmorGlassCuirass
	AddDatastoreEntryByKey("1101720___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassAlteration03
	AddDatastoreEntryByKey("1101721___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassAlteration04
	AddDatastoreEntryByKey("1101722___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassAlteration05
	AddDatastoreEntryByKey("1101723___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassConjuration03
	AddDatastoreEntryByKey("1101724___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassConjuration04
	AddDatastoreEntryByKey("1101725___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassConjuration05
	AddDatastoreEntryByKey("1101726___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassDestruction03
	AddDatastoreEntryByKey("1101728___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassDestruction04
	AddDatastoreEntryByKey("1101729___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassDestruction05
	AddDatastoreEntryByKey("1041111___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealRate03
	AddDatastoreEntryByKey("1041112___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealRate04
	AddDatastoreEntryByKey("1041113___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealRate05
	AddDatastoreEntryByKey("873345___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealth03
	AddDatastoreEntryByKey("873346___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealth04
	AddDatastoreEntryByKey("873347___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassHealth05
	AddDatastoreEntryByKey("1101730___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassIllusion03
	AddDatastoreEntryByKey("1101731___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassIllusion04
	AddDatastoreEntryByKey("1101732___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassIllusion05
	AddDatastoreEntryByKey("873348___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassLightArmor03
	AddDatastoreEntryByKey("873349___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassLightArmor04
	AddDatastoreEntryByKey("873350___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassLightArmor05
	AddDatastoreEntryByKey("1101733___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassRestoration03
	AddDatastoreEntryByKey("1101734___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassRestoration04
	AddDatastoreEntryByKey("1101735___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassRestoration05
	AddDatastoreEntryByKey("1041116___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassStaminaRate03
	AddDatastoreEntryByKey("1041117___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassStaminaRate04
	AddDatastoreEntryByKey("1041118___Skyrim.esm", 1, 125, 20) ; EnchArmorGlassCuirassStaminaRate05
	
	AddDatastoreEntryByKey("80190___Skyrim.esm", 1, 140, 30) ; ArmorDragonscaleCuirass
	AddDatastoreEntryByKey("1101646___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassAlteration04
	AddDatastoreEntryByKey("1101647___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassAlteration05
	AddDatastoreEntryByKey("1101648___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassAlteration06
	AddDatastoreEntryByKey("1101649___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassConjuration04
	AddDatastoreEntryByKey("1101650___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassConjuration05
	AddDatastoreEntryByKey("1101651___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassConjuration06
	AddDatastoreEntryByKey("1101652___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassDestruction04
	AddDatastoreEntryByKey("1101653___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassDestruction05
	AddDatastoreEntryByKey("1101654___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassDestruction06
	AddDatastoreEntryByKey("1041120___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealRate04
	AddDatastoreEntryByKey("1041121___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealRate05
	AddDatastoreEntryByKey("1041122___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealRate06
	AddDatastoreEntryByKey("883130___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealth04
	AddDatastoreEntryByKey("883131___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealth05
	AddDatastoreEntryByKey("883132___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassHealth06
	AddDatastoreEntryByKey("1101655___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassIllusion04
	AddDatastoreEntryByKey("1101656___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassIllusion05
	AddDatastoreEntryByKey("1101657___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassIllusion06
	AddDatastoreEntryByKey("883133___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassLightArmor04
	AddDatastoreEntryByKey("883134___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassLightArmor05
	AddDatastoreEntryByKey("883135___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassLightArmor06
	AddDatastoreEntryByKey("1101658___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassRestoration04
	AddDatastoreEntryByKey("1101660___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassRestoration05
	AddDatastoreEntryByKey("1101659___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassRestoration06
	AddDatastoreEntryByKey("1041123___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassStaminaRate04
	AddDatastoreEntryByKey("1041124___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassStaminaRate05
	AddDatastoreEntryByKey("1041125___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonscaleCuirassStaminaRate06
	
	AddDatastoreEntryByKey("77385___Skyrim.esm", 1, 75, 10) ; ArmorIronCuirass
	AddDatastoreEntryByKey("1101752___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassAlteration01
	AddDatastoreEntryByKey("1101753___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassAlteration02
	AddDatastoreEntryByKey("1101755___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassAlteration03
	AddDatastoreEntryByKey("1101754___Skyrim.esm", 1, 75, 10) ; EnchArmorIronArmorAlteration03
	AddDatastoreEntryByKey("1101756___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassConjuration01
	AddDatastoreEntryByKey("1101757___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassConjuration02
	AddDatastoreEntryByKey("1101758___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassConjuration03
	AddDatastoreEntryByKey("1101759___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassDestruction01
	AddDatastoreEntryByKey("1101760___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassDestruction02
	AddDatastoreEntryByKey("1101761___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassDestruction03
	AddDatastoreEntryByKey("300302___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHealth01
	AddDatastoreEntryByKey("709987___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHealth02
	AddDatastoreEntryByKey("709988___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHealth03
	AddDatastoreEntryByKey("500008___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHeavyArmor01
	AddDatastoreEntryByKey("709989___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHeavyArmor02
	AddDatastoreEntryByKey("709990___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassHeavyArmor03
	AddDatastoreEntryByKey("1101762___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassIllusion01
	AddDatastoreEntryByKey("1101763___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassIllusion02
	AddDatastoreEntryByKey("1101764___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassIllusion03
	AddDatastoreEntryByKey("1101765___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassRestoration01
	AddDatastoreEntryByKey("1101766___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassRestoration02
	AddDatastoreEntryByKey("1101767___Skyrim.esm", 1, 75, 10) ; EnchArmorIronCuirassRestoration03
	
	AddDatastoreEntryByKey("80200___Skyrim.esm", 1, 90, 10) ; ArmorIronBandedCuirass
	AddDatastoreEntryByKey("1101768___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassAlteration01
	AddDatastoreEntryByKey("1101769___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassAlteration02
	AddDatastoreEntryByKey("1101770___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassAlteration03
	AddDatastoreEntryByKey("1101771___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassConjuration01
	AddDatastoreEntryByKey("1101772___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassConjuration02
	AddDatastoreEntryByKey("1101773___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassConjuration03
	AddDatastoreEntryByKey("1101774___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassDestruction01
	AddDatastoreEntryByKey("1101775___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassDestruction02
	AddDatastoreEntryByKey("1101776___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassDestruction03
	AddDatastoreEntryByKey("707741___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHealth01
	AddDatastoreEntryByKey("709919___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHealth02
	AddDatastoreEntryByKey("709920___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHealth03
	AddDatastoreEntryByKey("707742___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHeavyArmor01
	AddDatastoreEntryByKey("709921___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHeavyArmor02
	AddDatastoreEntryByKey("709922___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassHeavyArmor03
	AddDatastoreEntryByKey("1101777___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassIllusion01
	AddDatastoreEntryByKey("1101778___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassIllusion02
	AddDatastoreEntryByKey("1101779___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassIllusion03
	AddDatastoreEntryByKey("1101780___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassRestoration01
	AddDatastoreEntryByKey("1101781___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassRestoration02
	AddDatastoreEntryByKey("1101782___Skyrim.esm", 1, 90, 10) ; EnchArmorIronBandedCuirassRestoration03
	
	AddDatastoreEntryByKey("80210___Skyrim.esm", 1, 125, 15) ; ArmorSteelCuirassA
	AddDatastoreEntryByKey("1011490___Skyrim.esm", 1, 125, 15) ; ArmorSteelCuirassB
	AddDatastoreEntryByKey("1105650___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassAlteration01
	AddDatastoreEntryByKey("1105651___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassAlteration02
	AddDatastoreEntryByKey("1105652___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassAlteration03
	AddDatastoreEntryByKey("1105653___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassConjuration01
	AddDatastoreEntryByKey("1105654___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassConjuration02
	AddDatastoreEntryByKey("1105655___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassConjuration03
	AddDatastoreEntryByKey("1105656___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassDestruction01
	AddDatastoreEntryByKey("1105657___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassDestruction02
	AddDatastoreEntryByKey("1105658___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassDestruction03
	AddDatastoreEntryByKey("741541___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHealth01
	AddDatastoreEntryByKey("741542___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHealth02
	AddDatastoreEntryByKey("741543___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHealth03
	AddDatastoreEntryByKey("741544___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHeavyArmor01
	AddDatastoreEntryByKey("741545___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHeavyArmor02
	AddDatastoreEntryByKey("741546___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassHeavyArmor03
	AddDatastoreEntryByKey("1105659___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassIllusion01
	AddDatastoreEntryByKey("1105660___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassIllusion02
	AddDatastoreEntryByKey("1105661___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassIllusion03
	AddDatastoreEntryByKey("1105662___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassRestoration01
	AddDatastoreEntryByKey("1105663___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassRestoration02
	AddDatastoreEntryByKey("1105664___Skyrim.esm", 1, 125, 15) ; EnchArmorSteelCuirassRestoration03
	
	AddDatastoreEntryByKey("80205___Skyrim.esm", 1, 140, 20) ; ArmorDwarvenCuirass
	AddDatastoreEntryByKey("1101661___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassAlteration02
	AddDatastoreEntryByKey("571002___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassAlteration03
	AddDatastoreEntryByKey("1101662___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassAlteration04
	AddDatastoreEntryByKey("1101663___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassConjuration02
	AddDatastoreEntryByKey("1101664___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassConjuration03
	AddDatastoreEntryByKey("1101665___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassConjuration04
	AddDatastoreEntryByKey("1101666___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassDestruction02
	AddDatastoreEntryByKey("1101667___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassDestruction03
	AddDatastoreEntryByKey("1101668___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassDestruction04
	AddDatastoreEntryByKey("111576___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHealth02
	AddDatastoreEntryByKey("111577___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHealth03
	AddDatastoreEntryByKey("111578___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHealth04
	AddDatastoreEntryByKey("111579___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHeavyArmor02
	AddDatastoreEntryByKey("111631___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHeavyArmor03
	AddDatastoreEntryByKey("111680___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassHeavyArmor04
	AddDatastoreEntryByKey("1101669___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassIllusion02
	AddDatastoreEntryByKey("1101670___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassIllusion03
	AddDatastoreEntryByKey("1101671___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassIllusion04
	AddDatastoreEntryByKey("1101672___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassRestoration02
	AddDatastoreEntryByKey("1101673___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassRestoration03
	AddDatastoreEntryByKey("1101674___Skyrim.esm", 1, 140, 20) ; EnchArmorDwarvenCuirassRestoration04
	
	AddDatastoreEntryByKey("80220___Skyrim.esm", 1, 125, 20) ; ArmorSteelPlateCuirass
	AddDatastoreEntryByKey("1105665___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassAlteration02
	AddDatastoreEntryByKey("1105666___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassAlteration03
	AddDatastoreEntryByKey("1105667___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassAlteration04
	AddDatastoreEntryByKey("1105668___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassConjuration02
	AddDatastoreEntryByKey("1105669___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassConjuration03
	AddDatastoreEntryByKey("1105670___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassConjuration04
	AddDatastoreEntryByKey("1105671___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassDestruction02
	AddDatastoreEntryByKey("1105672___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassDestruction03
	AddDatastoreEntryByKey("1105673___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassDestruction04
	AddDatastoreEntryByKey("111628___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHealth02
	AddDatastoreEntryByKey("111629___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHealth03
	AddDatastoreEntryByKey("111630___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHealth04
	AddDatastoreEntryByKey("111686___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHeavyArmor02
	AddDatastoreEntryByKey("111950___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHeavyArmor03
	AddDatastoreEntryByKey("111957___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassHeavyArmor04
	AddDatastoreEntryByKey("1105674___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassIllusion02
	AddDatastoreEntryByKey("1105675___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassIllusion03
	AddDatastoreEntryByKey("1105676___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassIllusion04
	AddDatastoreEntryByKey("1105677___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassRestoration02
	AddDatastoreEntryByKey("1105678___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassRestoration03
	AddDatastoreEntryByKey("1105679___Skyrim.esm", 1, 125, 20) ; EnchArmorSteelPlateCuirassRestoration04
	
	AddDatastoreEntryByKey("80215___Skyrim.esm", 1, 175, 15) ; ArmorOrcishCuirass
	AddDatastoreEntryByKey("1105620___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassAlteration03
	AddDatastoreEntryByKey("1105621___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassAlteration04
	AddDatastoreEntryByKey("1105622___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassAlteration05
	AddDatastoreEntryByKey("1105623___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassConjuration03
	AddDatastoreEntryByKey("1105624___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassConjuration04
	AddDatastoreEntryByKey("1105625___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassConjuration05
	AddDatastoreEntryByKey("1105626___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassDestruction03
	AddDatastoreEntryByKey("1105627___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassDestruction04
	AddDatastoreEntryByKey("1105628___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassDestruction05
	AddDatastoreEntryByKey("849858___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHealth03
	AddDatastoreEntryByKey("849859___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHealth04
	AddDatastoreEntryByKey("849860___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHealth05
	AddDatastoreEntryByKey("849861___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHeavyArmor03
	AddDatastoreEntryByKey("849862___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHeavyArmor04
	AddDatastoreEntryByKey("849863___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassHeavyArmor05
	AddDatastoreEntryByKey("1105629___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassIllusion03
	AddDatastoreEntryByKey("1105630___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassIllusion04
	AddDatastoreEntryByKey("1105631___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassIllusion05
	AddDatastoreEntryByKey("1105632___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassRestoration03
	AddDatastoreEntryByKey("1105633___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassRestoration04
	AddDatastoreEntryByKey("1105634___Skyrim.esm", 1, 175, 15) ; EnchArmorOrcishCuirassRestoration05
	
	AddDatastoreEntryByKey("80225___Skyrim.esm", 1, 140, 15) ; ArmorEbonyCuirass
	AddDatastoreEntryByKey("1101675___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassAlteration03
	AddDatastoreEntryByKey("1101676___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassAlteration04
	AddDatastoreEntryByKey("1101677___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassAlteration05
	AddDatastoreEntryByKey("1101678___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassConjuration03
	AddDatastoreEntryByKey("1101679___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassConjuration04
	AddDatastoreEntryByKey("1101680___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassConjuration05
	AddDatastoreEntryByKey("1101681___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassDestruction03
	AddDatastoreEntryByKey("1101682___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassDestruction04
	AddDatastoreEntryByKey("1101688___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassDestruction05
	AddDatastoreEntryByKey("849975___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealth03
	AddDatastoreEntryByKey("849976___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealth04
	AddDatastoreEntryByKey("849977___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealth05
	AddDatastoreEntryByKey("1041129___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealthRate03
	AddDatastoreEntryByKey("1041130___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealthRate04
	AddDatastoreEntryByKey("1041131___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHealthRate05
	AddDatastoreEntryByKey("849978___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHeavyArmor03
	AddDatastoreEntryByKey("849979___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHeavyArmor04
	AddDatastoreEntryByKey("849980___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassHeavyArmor05
	AddDatastoreEntryByKey("1101683___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassIllusion03
	AddDatastoreEntryByKey("1101684___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassIllusion04
	AddDatastoreEntryByKey("1101689___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassIllusion05
	AddDatastoreEntryByKey("1101685___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassRestoration03
	AddDatastoreEntryByKey("1101686___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassRestoration04
	AddDatastoreEntryByKey("1101687___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassRestoration05
	AddDatastoreEntryByKey("1041132___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassStaminaRate03
	AddDatastoreEntryByKey("1041133___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassStaminaRate04
	AddDatastoreEntryByKey("1041134___Skyrim.esm", 1, 140, 15) ; EnchArmorEbonyCuirassStaminaRate05
	
	AddDatastoreEntryByKey("80230___Skyrim.esm", 1, 140, 30) ; ArmorDragonplateCuirass
	AddDatastoreEntryByKey("1101631___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassAlteration04
	AddDatastoreEntryByKey("1101644___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassAlteration05
	AddDatastoreEntryByKey("1101632___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassAlteration06
	AddDatastoreEntryByKey("1101633___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassConjuration04
	AddDatastoreEntryByKey("1101634___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassConjuration05
	AddDatastoreEntryByKey("1101635___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassConjuration06
	AddDatastoreEntryByKey("1101636___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassDestruction04
	AddDatastoreEntryByKey("1101645___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassDestruction05
	AddDatastoreEntryByKey("1101637___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassDestruction06
	AddDatastoreEntryByKey("883238___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealth04
	AddDatastoreEntryByKey("883239___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealth05
	AddDatastoreEntryByKey("883240___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealth06
	AddDatastoreEntryByKey("1041141___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealthRate04
	AddDatastoreEntryByKey("1041142___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealthRate05
	AddDatastoreEntryByKey("1041143___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHealthRate06
	AddDatastoreEntryByKey("883241___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHeavyArmor04
	AddDatastoreEntryByKey("883242___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHeavyArmor05
	AddDatastoreEntryByKey("883243___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassHeavyArmor06
	AddDatastoreEntryByKey("1101638___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassIllusion04
	AddDatastoreEntryByKey("1101639___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassIllusion05
	AddDatastoreEntryByKey("1101640___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassIllusion06
	AddDatastoreEntryByKey("1101641___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassRestoration04
	AddDatastoreEntryByKey("1101642___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassRestoration05
	AddDatastoreEntryByKey("1101643___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassRestoration06
	AddDatastoreEntryByKey("1041144___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassStaminaRate04
	AddDatastoreEntryByKey("1041145___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassStaminaRate05
	AddDatastoreEntryByKey("1041146___Skyrim.esm", 1, 140, 30) ; EnchArmorDragonplateCuirassStaminaRate06
	
	AddDatastoreEntryByKey("80235___Skyrim.esm", 1, 160, 25) ; ArmorDaedricCuirass
	AddDatastoreEntryByKey("1101616___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassAlteration04
	AddDatastoreEntryByKey("1101617___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassAlteration05
	AddDatastoreEntryByKey("1101618___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassAlteration06
	AddDatastoreEntryByKey("1101619___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassConjuration04
	AddDatastoreEntryByKey("1101620___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassConjuration05
	AddDatastoreEntryByKey("1101621___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassConjuration06
	AddDatastoreEntryByKey("1101622___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassDestruction04
	AddDatastoreEntryByKey("1101623___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassDestruction05
	AddDatastoreEntryByKey("1101624___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassDestruction06
	AddDatastoreEntryByKey("1041150___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealRate04
	AddDatastoreEntryByKey("1041151___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealRate05
	AddDatastoreEntryByKey("1041152___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealRate06
	AddDatastoreEntryByKey("883352___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealth04
	AddDatastoreEntryByKey("883353___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealth05
	AddDatastoreEntryByKey("883354___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHealth06
	AddDatastoreEntryByKey("883355___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHeavyArmor04
	AddDatastoreEntryByKey("883356___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHeavyArmor05
	AddDatastoreEntryByKey("883357___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassHeavyArmor06
	AddDatastoreEntryByKey("1101625___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassIllusion04
	AddDatastoreEntryByKey("1101626___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassIllusion05
	AddDatastoreEntryByKey("1101627___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassIllusion06
	AddDatastoreEntryByKey("1101628___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassRestoration04
	AddDatastoreEntryByKey("1101629___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassRestoration05
	AddDatastoreEntryByKey("1101630___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassRestoration06
	AddDatastoreEntryByKey("1041147___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassStaminaRate04
	AddDatastoreEntryByKey("1041148___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassStaminaRate05
	AddDatastoreEntryByKey("1041149___Skyrim.esm", 1, 160, 25) ; EnchArmorDaedricCuirassStaminaRate06
	
	AddDatastoreEntryByKey("586138___Skyrim.esm", 1, 30, 0) ; ClothesPrisonerRags
	AddDatastoreEntryByKey("248318___Skyrim.esm", 1, 30, 0) ; ClothesPrisonerTunic
	
	AddDatastoreEntryByKey("307851___Skyrim.esm", 1, 125, 15) ; ArmorBladesCuirass
	
	AddDatastoreEntryByKey("830997___Skyrim.esm", 1, 175, 20) ; ArmorCompanionsCuirass
	
	AddDatastoreEntryByKey("1108827___Skyrim.esm", 1, 125, 35) ; DBArmorWornPlayable
	
	AddDatastoreEntryByKey("99208___Skyrim.esm", 1, 110, 10) ; ArmorDraugrCuirass
	
	AddDatastoreEntryByKey("136478___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassFalkreath
	AddDatastoreEntryByKey("136480___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassHjaalmarch
	AddDatastoreEntryByKey("136456___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassMarkarth
	AddDatastoreEntryByKey("136455___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassRiften
	AddDatastoreEntryByKey("819035___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassSolitude
	AddDatastoreEntryByKey("136485___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassThePale
	AddDatastoreEntryByKey("136461___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassWhiterun
	AddDatastoreEntryByKey("136482___Skyrim.esm", 1, 110, 15) ; ArmorGuardCuirassWinterhold
	AddDatastoreEntryByKey("683387___Skyrim.esm", 1, 110, 15) ; ArmorStormcloakCuirass
	AddDatastoreEntryByKey("710048___Skyrim.esm", 1, 120, 20) ; ArmorStormcloakCuirassSleeves
	
	AddDatastoreEntryByKey("79573___Skyrim.esm", 1, 125, 20) ; ArmorImperialCuirass
	AddDatastoreEntryByKey("81625___Skyrim.esm", 1, 125, 20) ; ArmorImperialLightCuirass
	AddDatastoreEntryByKey("81624___Skyrim.esm", 1, 125, 20) ; ArmorImperialStuddedCuirass
	AddDatastoreEntryByKey("707776___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHealth01
	AddDatastoreEntryByKey("709865___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHealth02
	AddDatastoreEntryByKey("709866___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHealth03
	AddDatastoreEntryByKey("707777___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHeavyArmor01
	AddDatastoreEntryByKey("709867___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHeavyArmor02
	AddDatastoreEntryByKey("709868___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassHeavyArmor03
	AddDatastoreEntryByKey("709872___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialCuirassResistFrost03
	AddDatastoreEntryByKey("759580___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassHealth01
	AddDatastoreEntryByKey("759581___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassHealth02
	AddDatastoreEntryByKey("759582___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassHealth03
	AddDatastoreEntryByKey("759583___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassLightArmor01
	AddDatastoreEntryByKey("759584___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassLightArmor02
	AddDatastoreEntryByKey("759585___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialLightCuirassLightArmor03
	AddDatastoreEntryByKey("289716___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassHealth01
	AddDatastoreEntryByKey("289717___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassHealth02
	AddDatastoreEntryByKey("289718___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassHealth03
	AddDatastoreEntryByKey("289719___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassLightArmor01
	AddDatastoreEntryByKey("289720___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassLightArmor02
	AddDatastoreEntryByKey("289721___Skyrim.esm", 1, 125, 20) ; EnchArmorImperialStuddedCuirassLightArmor03
	
	AddDatastoreEntryByKey("551294___Skyrim.esm", 1, 140, 10) ; ArmorStormcloakBearCuirass 		@MULTI
	
	AddDatastoreEntryByKey("416703___Skyrim.esm", 1, 110, 10) ; ClothesThalmorrobes
	AddDatastoreEntryByKey("1099416___Skyrim.esm", 1, 110, 10) ; ClothesThalmorRobesHooded 		@MULTI
	
	AddDatastoreEntryByKey("867011___Skyrim.esm", 1, 125, 30) ; ArmorThievesGuildCuirassPlayer
	AddDatastoreEntryByKey("867020___Skyrim.esm", 1, 125, 30) ; ArmorThievesGuildCuirassPlayerImproved
	AddDatastoreEntryByKey("931287___Skyrim.esm", 1, 125, 30) ; ArmorThievesGuildLeaderCuirass
	
	AddDatastoreEntryByKey("862276___Skyrim.esm", 1, 125, 30) ; DBArmor
	AddDatastoreEntryByKey("925461___Skyrim.esm", 1, 125, 30) ; DBArmorSP
	
	AddDatastoreEntryByKey("383878___Skyrim.esm", 1, 140, 20) ; ArmorNightingaleCuirassPlayer01  @MULTI
	AddDatastoreEntryByKey("1035278___Skyrim.esm", 1, 140, 20) ; ArmorNightingaleCuirassPlayer02 @MULTI
	AddDatastoreEntryByKey("1035279___Skyrim.esm", 1, 140, 20) ; ArmorNightingaleCuirassPlayer03 @MULTI
	
	FrostDebug(1, "...done.")
endFunction

; @Overridden by _Frost_ArmorProtectionDatastoreHandler
function AddDatastoreEntryByKey(string asKey, int aiGearType, int aiExposureProtection, int aiRainProtection)
endFunction