scriptname _Frost_APDatastoreDefaultData extends Quest

import FrostUtil
import _FrostInternal

function SetDefaults_Body()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	;####################
	;
	;      Skyrim
	;
	;####################

	ap.SetArmorDataByKey("80145___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; ArmorHideCuirass
	ap.SetArmorDataByKey("1101736___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassAlteration01
	ap.SetArmorDataByKey("1101737___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassAlteration02
	ap.SetArmorDataByKey("1101738___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassAlteration03
	ap.SetArmorDataByKey("1101739___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassConjuration01
	ap.SetArmorDataByKey("1101740___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassConjuration02
	ap.SetArmorDataByKey("1101741___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassConjuration03
	ap.SetArmorDataByKey("1101742___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassDestruction01
	ap.SetArmorDataByKey("1101743___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassDestruction02
	ap.SetArmorDataByKey("1101744___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassDestruction03
	ap.SetArmorDataByKey("500027___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassHealth01
	ap.SetArmorDataByKey("709777___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassHealth02
	ap.SetArmorDataByKey("709778___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassHealth03
	ap.SetArmorDataByKey("1101745___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassIllusion01
	ap.SetArmorDataByKey("1101746___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassIllusion02
	ap.SetArmorDataByKey("1101747___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassIllusion03
	ap.SetArmorDataByKey("500028___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassLightArmor01
	ap.SetArmorDataByKey("709780___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassLightArmor02
	ap.SetArmorDataByKey("709781___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassLightArmor03
	ap.SetArmorDataByKey("1101748___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassRestoration01
	ap.SetArmorDataByKey("1101749___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassRestoration02
	ap.SetArmorDataByKey("1101750___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideCuirassRestoration03
	
	ap.SetArmorDataByKey("1071435___Skyrim.esm", ap.GEARTYPE_BODY, 30, 0, abExportToDefaults = true, abSave = false) ; ArmorBanditCuirass1 		;Shirtless
	ap.SetArmorDataByKey("1071437___Skyrim.esm", ap.GEARTYPE_BODY, 40, 0, abExportToDefaults = true, abSave = false) ; ArmorBanditCuirass2 		;Shirtless / shawl
	ap.SetArmorDataByKey("1071439___Skyrim.esm", ap.GEARTYPE_BODY, 125, 17, abExportToDefaults = true, abSave = false) ; ArmorBanditCuirass3 	;Sleeveless
	ap.SetArmorDataByKey("455571___Skyrim.esm", ap.GEARTYPE_BODY, 160, 35, abExportToDefaults = true, abSave = false) ; ArmorBanditCuirass 		;Full
	
	ap.SetArmorDataByKey("111522___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; ArmorStuddedCuirass
	ap.SetArmorDataByKey("707731___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassHealth01
	ap.SetArmorDataByKey("709843___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassHealth02
	ap.SetArmorDataByKey("709844___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassHealth03
	ap.SetArmorDataByKey("707732___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassLightArmor01
	ap.SetArmorDataByKey("709845___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassLightArmor02
	ap.SetArmorDataByKey("709846___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorStuddedCuirassLightArmor03
	
	ap.SetArmorDataByKey("221598___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; ArmorLeatherCuirass
	ap.SetArmorDataByKey("1105605___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassAlteration01
	ap.SetArmorDataByKey("1105606___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassAlteration02
	ap.SetArmorDataByKey("1105607___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassAlteration03
	ap.SetArmorDataByKey("1105608___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassConjuration01
	ap.SetArmorDataByKey("1105609___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassConjuration02
	ap.SetArmorDataByKey("1105610___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassConjuration03
	ap.SetArmorDataByKey("1105611___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassDestruction01
	ap.SetArmorDataByKey("1105612___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassDestruction02
	ap.SetArmorDataByKey("1105613___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassDestruction03
	ap.SetArmorDataByKey("737844___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassHealth01
	ap.SetArmorDataByKey("737845___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassHealth02
	ap.SetArmorDataByKey("737846___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassHealth03
	ap.SetArmorDataByKey("1105614___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassIllusion01
	ap.SetArmorDataByKey("1105615___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassIllusion02
	ap.SetArmorDataByKey("1105616___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassIllusion03
	ap.SetArmorDataByKey("737847___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassLightArmor01
	ap.SetArmorDataByKey("737848___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassLightArmor02
	ap.SetArmorDataByKey("737849___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassLightArmor03
	ap.SetArmorDataByKey("1105617___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassRestoration01
	ap.SetArmorDataByKey("1105618___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassRestoration02
	ap.SetArmorDataByKey("1105619___Skyrim.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherCuirassRestoration03
	
	ap.SetArmorDataByKey("562851___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorElvenCuirass
	ap.SetArmorDataByKey("1072914___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorElvenLightCuirass
	ap.SetArmorDataByKey("80170___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorElvenGildedCuirass
	ap.SetArmorDataByKey("1101690___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassAlteration02
	ap.SetArmorDataByKey("1101691___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassAlteration03
	ap.SetArmorDataByKey("1101692___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassAlteration04
	ap.SetArmorDataByKey("1101693___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassConjuration02
	ap.SetArmorDataByKey("1101694___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassConjuration03
	ap.SetArmorDataByKey("1101695___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassConjuration04
	ap.SetArmorDataByKey("1101696___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassDestruction02
	ap.SetArmorDataByKey("1101697___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassDestruction03
	ap.SetArmorDataByKey("1101698___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassDestruction04
	ap.SetArmorDataByKey("778180___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassHealth02
	ap.SetArmorDataByKey("778181___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassHealth03
	ap.SetArmorDataByKey("778301___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassHealth04
	ap.SetArmorDataByKey("1101699___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassIllusion02
	ap.SetArmorDataByKey("1101700___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassIllusion03
	ap.SetArmorDataByKey("1101701___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassIllusion04
	ap.SetArmorDataByKey("778182___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassLightArmor02
	ap.SetArmorDataByKey("778183___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassLightArmor03
	ap.SetArmorDataByKey("778302___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassLightArmor04
	ap.SetArmorDataByKey("1101702___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassRestoration02
	ap.SetArmorDataByKey("1101703___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassRestoration03
	ap.SetArmorDataByKey("1101704___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenCuirassRestoration04
	ap.SetArmorDataByKey("1101705___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassAlteration03
	ap.SetArmorDataByKey("1101706___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassAlteration04
	ap.SetArmorDataByKey("1101715___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassAlteration05
	ap.SetArmorDataByKey("1101707___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassConjuration03
	ap.SetArmorDataByKey("1101708___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassConjuration04
	ap.SetArmorDataByKey("1101716___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassConjuration05
	ap.SetArmorDataByKey("1101709___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassDestruction03
	ap.SetArmorDataByKey("1101710___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassDestruction04
	ap.SetArmorDataByKey("1101717___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassDestruction05
	ap.SetArmorDataByKey("1038874___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealRate03
	ap.SetArmorDataByKey("1038875___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealRate04
	ap.SetArmorDataByKey("1038876___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealRate05
	ap.SetArmorDataByKey("844205___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealth03
	ap.SetArmorDataByKey("844206___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealth04
	ap.SetArmorDataByKey("844207___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassHealth05
	ap.SetArmorDataByKey("1101711___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassIllusion03
	ap.SetArmorDataByKey("1101712___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassIllusion04
	ap.SetArmorDataByKey("1101718___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassIllusion05
	ap.SetArmorDataByKey("844208___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassLightArmor03
	ap.SetArmorDataByKey("844209___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassLightArmor04
	ap.SetArmorDataByKey("844210___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassLightArmor05
	ap.SetArmorDataByKey("1101713___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassRestoration03
	ap.SetArmorDataByKey("1101714___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassRestoration04
	ap.SetArmorDataByKey("1101719___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassRestoration05
	ap.SetArmorDataByKey("1038877___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassStaminaRate03
	ap.SetArmorDataByKey("1038878___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassStaminaRate04
	ap.SetArmorDataByKey("1038879___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGildedCuirassStaminaRate05
	
	ap.SetArmorDataByKey("111523___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; ArmorScaledCuirass
	ap.SetArmorDataByKey("111524___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorScaledCuirassB
	ap.SetArmorDataByKey("1105635___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassAlteration02
	ap.SetArmorDataByKey("1105636___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassAlteration03
	ap.SetArmorDataByKey("1105637___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassAlteration04
	ap.SetArmorDataByKey("1105638___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassConjuration02
	ap.SetArmorDataByKey("1105639___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassConjuration03
	ap.SetArmorDataByKey("1105640___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassConjuration04
	ap.SetArmorDataByKey("1105641___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassDestruction02
	ap.SetArmorDataByKey("1105642___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassDestruction03
	ap.SetArmorDataByKey("1105643___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassDestruction04
	ap.SetArmorDataByKey("873461___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassHealth02
	ap.SetArmorDataByKey("873462___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassHealth03
	ap.SetArmorDataByKey("873463___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassHealth04
	ap.SetArmorDataByKey("1105644___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassIllusion02
	ap.SetArmorDataByKey("1105645___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassIllusion03
	ap.SetArmorDataByKey("1105646___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassIllusion04
	ap.SetArmorDataByKey("873464___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassLightArmor02
	ap.SetArmorDataByKey("873465___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassLightArmor03
	ap.SetArmorDataByKey("873466___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassLightArmor04
	ap.SetArmorDataByKey("1105647___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassRestoration02
	ap.SetArmorDataByKey("1105648___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassRestoration03
	ap.SetArmorDataByKey("1105649___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; EnchArmorScaledCuirassRestoration04
	
	ap.SetArmorDataByKey("80185___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorGlassCuirass
	ap.SetArmorDataByKey("1101720___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassAlteration03
	ap.SetArmorDataByKey("1101721___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassAlteration04
	ap.SetArmorDataByKey("1101722___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassAlteration05
	ap.SetArmorDataByKey("1101723___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassConjuration03
	ap.SetArmorDataByKey("1101724___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassConjuration04
	ap.SetArmorDataByKey("1101725___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassConjuration05
	ap.SetArmorDataByKey("1101726___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassDestruction03
	ap.SetArmorDataByKey("1101728___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassDestruction04
	ap.SetArmorDataByKey("1101729___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassDestruction05
	ap.SetArmorDataByKey("1041111___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealRate03
	ap.SetArmorDataByKey("1041112___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealRate04
	ap.SetArmorDataByKey("1041113___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealRate05
	ap.SetArmorDataByKey("873345___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealth03
	ap.SetArmorDataByKey("873346___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealth04
	ap.SetArmorDataByKey("873347___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassHealth05
	ap.SetArmorDataByKey("1101730___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassIllusion03
	ap.SetArmorDataByKey("1101731___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassIllusion04
	ap.SetArmorDataByKey("1101732___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassIllusion05
	ap.SetArmorDataByKey("873348___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassLightArmor03
	ap.SetArmorDataByKey("873349___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassLightArmor04
	ap.SetArmorDataByKey("873350___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassLightArmor05
	ap.SetArmorDataByKey("1101733___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassRestoration03
	ap.SetArmorDataByKey("1101734___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassRestoration04
	ap.SetArmorDataByKey("1101735___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassRestoration05
	ap.SetArmorDataByKey("1041116___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassStaminaRate03
	ap.SetArmorDataByKey("1041117___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassStaminaRate04
	ap.SetArmorDataByKey("1041118___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassCuirassStaminaRate05
	ap.SetArmorDataByKey("1101727___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorGlassVsDestruction04
	
	ap.SetArmorDataByKey("80190___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; ArmorDragonscaleCuirass
	ap.SetArmorDataByKey("1101646___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassAlteration04
	ap.SetArmorDataByKey("1101647___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassAlteration05
	ap.SetArmorDataByKey("1101648___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassAlteration06
	ap.SetArmorDataByKey("1101649___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassConjuration04
	ap.SetArmorDataByKey("1101650___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassConjuration05
	ap.SetArmorDataByKey("1101651___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassConjuration06
	ap.SetArmorDataByKey("1101652___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassDestruction04
	ap.SetArmorDataByKey("1101653___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassDestruction05
	ap.SetArmorDataByKey("1101654___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassDestruction06
	ap.SetArmorDataByKey("1041120___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealRate04
	ap.SetArmorDataByKey("1041121___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealRate05
	ap.SetArmorDataByKey("1041122___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealRate06
	ap.SetArmorDataByKey("883130___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealth04
	ap.SetArmorDataByKey("883131___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealth05
	ap.SetArmorDataByKey("883132___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassHealth06
	ap.SetArmorDataByKey("1101655___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassIllusion04
	ap.SetArmorDataByKey("1101656___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassIllusion05
	ap.SetArmorDataByKey("1101657___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassIllusion06
	ap.SetArmorDataByKey("883133___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassLightArmor04
	ap.SetArmorDataByKey("883134___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassLightArmor05
	ap.SetArmorDataByKey("883135___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassLightArmor06
	ap.SetArmorDataByKey("1101658___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassRestoration04
	ap.SetArmorDataByKey("1101660___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassRestoration05
	ap.SetArmorDataByKey("1101659___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassRestoration06
	ap.SetArmorDataByKey("1041123___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassStaminaRate04
	ap.SetArmorDataByKey("1041124___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassStaminaRate05
	ap.SetArmorDataByKey("1041125___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleCuirassStaminaRate06
	
	ap.SetArmorDataByKey("77385___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; ArmorIronCuirass
	ap.SetArmorDataByKey("1101752___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassAlteration01
	ap.SetArmorDataByKey("1101753___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassAlteration02
	ap.SetArmorDataByKey("1101755___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassAlteration03
	ap.SetArmorDataByKey("1101754___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronArmorAlteration03
	ap.SetArmorDataByKey("1101756___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassConjuration01
	ap.SetArmorDataByKey("1101757___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassConjuration02
	ap.SetArmorDataByKey("1101758___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassConjuration03
	ap.SetArmorDataByKey("1101759___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassDestruction01
	ap.SetArmorDataByKey("1101760___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassDestruction02
	ap.SetArmorDataByKey("1101761___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassDestruction03
	ap.SetArmorDataByKey("300302___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHealth01
	ap.SetArmorDataByKey("709987___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHealth02
	ap.SetArmorDataByKey("709988___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHealth03
	ap.SetArmorDataByKey("500008___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHeavyArmor01
	ap.SetArmorDataByKey("709989___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHeavyArmor02
	ap.SetArmorDataByKey("709990___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassHeavyArmor03
	ap.SetArmorDataByKey("1101762___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassIllusion01
	ap.SetArmorDataByKey("1101763___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassIllusion02
	ap.SetArmorDataByKey("1101764___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassIllusion03
	ap.SetArmorDataByKey("1101765___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassRestoration01
	ap.SetArmorDataByKey("1101766___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassRestoration02
	ap.SetArmorDataByKey("1101767___Skyrim.esm", ap.GEARTYPE_BODY, 75, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronCuirassRestoration03
	
	ap.SetArmorDataByKey("80200___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; ArmorIronBandedCuirass
	ap.SetArmorDataByKey("1101768___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassAlteration01
	ap.SetArmorDataByKey("1101769___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassAlteration02
	ap.SetArmorDataByKey("1101770___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassAlteration03
	ap.SetArmorDataByKey("1101771___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassConjuration01
	ap.SetArmorDataByKey("1101772___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassConjuration02
	ap.SetArmorDataByKey("1101773___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassConjuration03
	ap.SetArmorDataByKey("1101774___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassDestruction01
	ap.SetArmorDataByKey("1101775___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassDestruction02
	ap.SetArmorDataByKey("1101776___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassDestruction03
	ap.SetArmorDataByKey("707741___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHealth01
	ap.SetArmorDataByKey("709919___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHealth02
	ap.SetArmorDataByKey("709920___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHealth03
	ap.SetArmorDataByKey("707742___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHeavyArmor01
	ap.SetArmorDataByKey("709921___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHeavyArmor02
	ap.SetArmorDataByKey("709922___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassHeavyArmor03
	ap.SetArmorDataByKey("1101777___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassIllusion01
	ap.SetArmorDataByKey("1101778___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassIllusion02
	ap.SetArmorDataByKey("1101779___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassIllusion03
	ap.SetArmorDataByKey("1101780___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassRestoration01
	ap.SetArmorDataByKey("1101781___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassRestoration02
	ap.SetArmorDataByKey("1101782___Skyrim.esm", ap.GEARTYPE_BODY, 90, 35, abExportToDefaults = true, abSave = false) ; EnchArmorIronBandedCuirassRestoration03
	
	ap.SetArmorDataByKey("80210___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; ArmorSteelCuirassA
	ap.SetArmorDataByKey("1011490___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; ArmorSteelCuirassB
	ap.SetArmorDataByKey("1105650___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassAlteration01
	ap.SetArmorDataByKey("1105651___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassAlteration02
	ap.SetArmorDataByKey("1105652___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassAlteration03
	ap.SetArmorDataByKey("1105653___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassConjuration01
	ap.SetArmorDataByKey("1105654___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassConjuration02
	ap.SetArmorDataByKey("1105655___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassConjuration03
	ap.SetArmorDataByKey("1105656___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassDestruction01
	ap.SetArmorDataByKey("1105657___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassDestruction02
	ap.SetArmorDataByKey("1105658___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassDestruction03
	ap.SetArmorDataByKey("741541___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHealth01
	ap.SetArmorDataByKey("741542___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHealth02
	ap.SetArmorDataByKey("741543___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHealth03
	ap.SetArmorDataByKey("741544___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHeavyArmor01
	ap.SetArmorDataByKey("741545___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHeavyArmor02
	ap.SetArmorDataByKey("741546___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassHeavyArmor03
	ap.SetArmorDataByKey("1105659___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassIllusion01
	ap.SetArmorDataByKey("1105660___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassIllusion02
	ap.SetArmorDataByKey("1105661___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassIllusion03
	ap.SetArmorDataByKey("1105662___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassRestoration01
	ap.SetArmorDataByKey("1105663___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassRestoration02
	ap.SetArmorDataByKey("1105664___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; EnchArmorSteelCuirassRestoration03
	
	ap.SetArmorDataByKey("80205___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; ArmorDwarvenCuirass
	ap.SetArmorDataByKey("1101661___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassAlteration02
	ap.SetArmorDataByKey("571002___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassAlteration03
	ap.SetArmorDataByKey("1101662___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassAlteration04
	ap.SetArmorDataByKey("1101663___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassConjuration02
	ap.SetArmorDataByKey("1101664___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassConjuration03
	ap.SetArmorDataByKey("1101665___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassConjuration04
	ap.SetArmorDataByKey("1101666___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassDestruction02
	ap.SetArmorDataByKey("1101667___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassDestruction03
	ap.SetArmorDataByKey("1101668___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassDestruction04
	ap.SetArmorDataByKey("111576___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHealth02
	ap.SetArmorDataByKey("111577___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHealth03
	ap.SetArmorDataByKey("111578___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHealth04
	ap.SetArmorDataByKey("111579___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHeavyArmor02
	ap.SetArmorDataByKey("111631___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHeavyArmor03
	ap.SetArmorDataByKey("111680___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassHeavyArmor04
	ap.SetArmorDataByKey("1101669___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassIllusion02
	ap.SetArmorDataByKey("1101670___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassIllusion03
	ap.SetArmorDataByKey("1101671___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassIllusion04
	ap.SetArmorDataByKey("1101672___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassRestoration02
	ap.SetArmorDataByKey("1101673___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassRestoration03
	ap.SetArmorDataByKey("1101674___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenCuirassRestoration04
	
	ap.SetArmorDataByKey("80220___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorSteelPlateCuirass
	ap.SetArmorDataByKey("1105665___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassAlteration02
	ap.SetArmorDataByKey("1105666___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassAlteration03
	ap.SetArmorDataByKey("1105667___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassAlteration04
	ap.SetArmorDataByKey("1105668___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassConjuration02
	ap.SetArmorDataByKey("1105669___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassConjuration03
	ap.SetArmorDataByKey("1105670___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassConjuration04
	ap.SetArmorDataByKey("1105671___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassDestruction02
	ap.SetArmorDataByKey("1105672___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassDestruction03
	ap.SetArmorDataByKey("1105673___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassDestruction04
	ap.SetArmorDataByKey("111628___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHealth02
	ap.SetArmorDataByKey("111629___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHealth03
	ap.SetArmorDataByKey("111630___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHealth04
	ap.SetArmorDataByKey("111686___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHeavyArmor02
	ap.SetArmorDataByKey("111950___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHeavyArmor03
	ap.SetArmorDataByKey("111957___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassHeavyArmor04
	ap.SetArmorDataByKey("1105674___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassIllusion02
	ap.SetArmorDataByKey("1105675___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassIllusion03
	ap.SetArmorDataByKey("1105676___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassIllusion04
	ap.SetArmorDataByKey("1105677___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassRestoration02
	ap.SetArmorDataByKey("1105678___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassRestoration03
	ap.SetArmorDataByKey("1105679___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateCuirassRestoration04
	
	ap.SetArmorDataByKey("80215___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; ArmorOrcishCuirass
	ap.SetArmorDataByKey("1105620___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassAlteration03
	ap.SetArmorDataByKey("1105621___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassAlteration04
	ap.SetArmorDataByKey("1105622___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassAlteration05
	ap.SetArmorDataByKey("1105623___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassConjuration03
	ap.SetArmorDataByKey("1105624___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassConjuration04
	ap.SetArmorDataByKey("1105625___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassConjuration05
	ap.SetArmorDataByKey("1105626___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassDestruction03
	ap.SetArmorDataByKey("1105627___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassDestruction04
	ap.SetArmorDataByKey("1105628___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassDestruction05
	ap.SetArmorDataByKey("849858___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHealth03
	ap.SetArmorDataByKey("849859___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHealth04
	ap.SetArmorDataByKey("849860___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHealth05
	ap.SetArmorDataByKey("849861___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHeavyArmor03
	ap.SetArmorDataByKey("849862___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHeavyArmor04
	ap.SetArmorDataByKey("849863___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassHeavyArmor05
	ap.SetArmorDataByKey("1105629___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassIllusion03
	ap.SetArmorDataByKey("1105630___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassIllusion04
	ap.SetArmorDataByKey("1105631___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassIllusion05
	ap.SetArmorDataByKey("1105632___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassRestoration03
	ap.SetArmorDataByKey("1105633___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassRestoration04
	ap.SetArmorDataByKey("1105634___Skyrim.esm", ap.GEARTYPE_BODY, 175, 54, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishCuirassRestoration05
	
	ap.SetArmorDataByKey("80225___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; ArmorEbonyCuirass
	ap.SetArmorDataByKey("1101675___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassAlteration03
	ap.SetArmorDataByKey("1101676___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassAlteration04
	ap.SetArmorDataByKey("1101677___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassAlteration05
	ap.SetArmorDataByKey("1101678___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassConjuration03
	ap.SetArmorDataByKey("1101679___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassConjuration04
	ap.SetArmorDataByKey("1101680___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassConjuration05
	ap.SetArmorDataByKey("1101681___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassDestruction03
	ap.SetArmorDataByKey("1101682___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassDestruction04
	ap.SetArmorDataByKey("1101688___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassDestruction05
	ap.SetArmorDataByKey("849975___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealth03
	ap.SetArmorDataByKey("849976___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealth04
	ap.SetArmorDataByKey("849977___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealth05
	ap.SetArmorDataByKey("1041129___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealthRate03
	ap.SetArmorDataByKey("1041130___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealthRate04
	ap.SetArmorDataByKey("1041131___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHealthRate05
	ap.SetArmorDataByKey("849978___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHeavyArmor03
	ap.SetArmorDataByKey("849979___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHeavyArmor04
	ap.SetArmorDataByKey("849980___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassHeavyArmor05
	ap.SetArmorDataByKey("1101683___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassIllusion03
	ap.SetArmorDataByKey("1101684___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassIllusion04
	ap.SetArmorDataByKey("1101689___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassIllusion05
	ap.SetArmorDataByKey("1101685___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassRestoration03
	ap.SetArmorDataByKey("1101686___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassRestoration04
	ap.SetArmorDataByKey("1101687___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassRestoration05
	ap.SetArmorDataByKey("1041132___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassStaminaRate03
	ap.SetArmorDataByKey("1041133___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassStaminaRate04
	ap.SetArmorDataByKey("1041134___Skyrim.esm", ap.GEARTYPE_BODY, 140, 54, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyCuirassStaminaRate05
	
	ap.SetArmorDataByKey("80230___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; ArmorDragonplateCuirass
	ap.SetArmorDataByKey("1101631___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassAlteration04
	ap.SetArmorDataByKey("1101644___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassAlteration05
	ap.SetArmorDataByKey("1101632___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassAlteration06
	ap.SetArmorDataByKey("1101633___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassConjuration04
	ap.SetArmorDataByKey("1101634___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassConjuration05
	ap.SetArmorDataByKey("1101635___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassConjuration06
	ap.SetArmorDataByKey("1101636___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassDestruction04
	ap.SetArmorDataByKey("1101645___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassDestruction05
	ap.SetArmorDataByKey("1101637___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassDestruction06
	ap.SetArmorDataByKey("883238___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealth04
	ap.SetArmorDataByKey("883239___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealth05
	ap.SetArmorDataByKey("883240___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealth06
	ap.SetArmorDataByKey("1041141___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealthRate04
	ap.SetArmorDataByKey("1041142___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealthRate05
	ap.SetArmorDataByKey("1041143___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHealthRate06
	ap.SetArmorDataByKey("883241___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHeavyArmor04
	ap.SetArmorDataByKey("883242___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHeavyArmor05
	ap.SetArmorDataByKey("883243___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassHeavyArmor06
	ap.SetArmorDataByKey("1101638___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassIllusion04
	ap.SetArmorDataByKey("1101639___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassIllusion05
	ap.SetArmorDataByKey("1101640___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassIllusion06
	ap.SetArmorDataByKey("1101641___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassRestoration04
	ap.SetArmorDataByKey("1101642___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassRestoration05
	ap.SetArmorDataByKey("1101643___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassRestoration06
	ap.SetArmorDataByKey("1041144___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassStaminaRate04
	ap.SetArmorDataByKey("1041145___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassStaminaRate05
	ap.SetArmorDataByKey("1041146___Skyrim.esm", ap.GEARTYPE_BODY, 140, 109, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateCuirassStaminaRate06
	
	ap.SetArmorDataByKey("80235___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; ArmorDaedricCuirass
	ap.SetArmorDataByKey("1101616___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassAlteration04
	ap.SetArmorDataByKey("1101617___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassAlteration05
	ap.SetArmorDataByKey("1101618___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassAlteration06
	ap.SetArmorDataByKey("1101619___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassConjuration04
	ap.SetArmorDataByKey("1101620___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassConjuration05
	ap.SetArmorDataByKey("1101621___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassConjuration06
	ap.SetArmorDataByKey("1101622___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassDestruction04
	ap.SetArmorDataByKey("1101623___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassDestruction05
	ap.SetArmorDataByKey("1101624___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassDestruction06
	ap.SetArmorDataByKey("1041150___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealRate04
	ap.SetArmorDataByKey("1041151___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealRate05
	ap.SetArmorDataByKey("1041152___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealRate06
	ap.SetArmorDataByKey("883352___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealth04
	ap.SetArmorDataByKey("883353___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealth05
	ap.SetArmorDataByKey("883354___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHealth06
	ap.SetArmorDataByKey("883355___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHeavyArmor04
	ap.SetArmorDataByKey("883356___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHeavyArmor05
	ap.SetArmorDataByKey("883357___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassHeavyArmor06
	ap.SetArmorDataByKey("1101625___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassIllusion04
	ap.SetArmorDataByKey("1101626___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassIllusion05
	ap.SetArmorDataByKey("1101627___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassIllusion06
	ap.SetArmorDataByKey("1101628___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassRestoration04
	ap.SetArmorDataByKey("1101629___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassRestoration05
	ap.SetArmorDataByKey("1101630___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassRestoration06
	ap.SetArmorDataByKey("1041147___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassStaminaRate04
	ap.SetArmorDataByKey("1041148___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassStaminaRate05
	ap.SetArmorDataByKey("1041149___Skyrim.esm", ap.GEARTYPE_BODY, 160, 91, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricCuirassStaminaRate06
	
	ap.SetArmorDataByKey("586138___Skyrim.esm", ap.GEARTYPE_BODY, 30, 0, abExportToDefaults = true, abSave = false) ; ClothesPrisonerRags
	ap.SetArmorDataByKey("248318___Skyrim.esm", ap.GEARTYPE_BODY, 30, 0, abExportToDefaults = true, abSave = false) ; ClothesPrisonerTunic
	
	ap.SetArmorDataByKey("307851___Skyrim.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; ArmorBladesCuirass
	
	ap.SetArmorDataByKey("830997___Skyrim.esm", ap.GEARTYPE_BODY, 175, 72, abExportToDefaults = true, abSave = false) ; ArmorCompanionsCuirass
	
	ap.SetArmorDataByKey("1108827___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; DBArmorWornPlayable
	
	ap.SetArmorDataByKey("99208___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; ArmorDraugrCuirass
	
	ap.SetArmorDataByKey("136478___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassFalkreath
	ap.SetArmorDataByKey("136480___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassHjaalmarch
	ap.SetArmorDataByKey("136456___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassMarkarth
	ap.SetArmorDataByKey("136455___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassRiften
	ap.SetArmorDataByKey("819035___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassSolitude
	ap.SetArmorDataByKey("136485___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassThePale
	ap.SetArmorDataByKey("136461___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassWhiterun
	ap.SetArmorDataByKey("136482___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorGuardCuirassWinterhold
	ap.SetArmorDataByKey("683387___Skyrim.esm", ap.GEARTYPE_BODY, 110, 54, abExportToDefaults = true, abSave = false) ; ArmorStormcloakCuirass
	ap.SetArmorDataByKey("710048___Skyrim.esm", ap.GEARTYPE_BODY, 120, 72, abExportToDefaults = true, abSave = false) ; ArmorStormcloakCuirassSleeves
	
	ap.SetArmorDataByKey("79573___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorImperialCuirass
	ap.SetArmorDataByKey("81625___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorImperialLightCuirass
	ap.SetArmorDataByKey("81624___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; ArmorImperialStuddedCuirass
	ap.SetArmorDataByKey("707776___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHealth01
	ap.SetArmorDataByKey("709865___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHealth02
	ap.SetArmorDataByKey("709866___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHealth03
	ap.SetArmorDataByKey("707777___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHeavyArmor01
	ap.SetArmorDataByKey("709867___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHeavyArmor02
	ap.SetArmorDataByKey("709868___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassHeavyArmor03
	ap.SetArmorDataByKey("709872___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialCuirassResistFrost03
	ap.SetArmorDataByKey("759580___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassHealth01
	ap.SetArmorDataByKey("759581___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassHealth02
	ap.SetArmorDataByKey("759582___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassHealth03
	ap.SetArmorDataByKey("759583___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassLightArmor01
	ap.SetArmorDataByKey("759584___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassLightArmor02
	ap.SetArmorDataByKey("759585___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightCuirassLightArmor03
	ap.SetArmorDataByKey("289716___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassHealth01
	ap.SetArmorDataByKey("289717___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassHealth02
	ap.SetArmorDataByKey("289718___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassHealth03
	ap.SetArmorDataByKey("289719___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassLightArmor01
	ap.SetArmorDataByKey("289720___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassLightArmor02
	ap.SetArmorDataByKey("289721___Skyrim.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; EnchArmorImperialStuddedCuirassLightArmor03
	
	ap.SetArmorDataByKey("551294___Skyrim.esm", ap.GEARTYPE_BODY, 140, 35, aiExtraCloakWarmth = 40, aiExtraCloakCoverage = 12, abExportToDefaults = true, abSave = false) ; ArmorStormcloakBearCuirass 		@MULTI
	ap.SetArmorDataByKey("1099416___Skyrim.esm", ap.GEARTYPE_BODY, 110, 35, aiExtraHeadWarmth = 30, aiExtraHeadCoverage = 29, abExportToDefaults = true, abSave = false) ; ClothesThalmorRobesHooded 		@MULTI
	
	ap.SetArmorDataByKey("867011___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildCuirassPlayer
	ap.SetArmorDataByKey("1082692___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; ArmorLinweCuirass
	ap.SetArmorDataByKey("867020___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildCuirassPlayerImproved
	ap.SetArmorDataByKey("931287___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildLeaderCuirass
	
	ap.SetArmorDataByKey("862276___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; DBArmor
	ap.SetArmorDataByKey("925461___Skyrim.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; DBArmorSP
	
	ap.SetArmorDataByKey("383878___Skyrim.esm", ap.GEARTYPE_BODY, 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40, abExportToDefaults = true, abSave = false) ; ArmorNightingaleCuirassPlayer01  @MULTI
	ap.SetArmorDataByKey("1035278___Skyrim.esm", ap.GEARTYPE_BODY, 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40, abExportToDefaults = true, abSave = false) ; ArmorNightingaleCuirassPlayer02 @MULTI
	ap.SetArmorDataByKey("1035279___Skyrim.esm", ap.GEARTYPE_BODY, 128, 106, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40, abExportToDefaults = true, abSave = false) ; ArmorNightingaleCuirassPlayer03 @MULTI

	ap.SetArmorDataByKey("962512___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; MS02ForswornArmor
	ap.SetArmorDataByKey("888144___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; ForswornCuirass

	ap.SetArmorDataByKey("379902___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; GeneralTulliusArmor
	ap.SetArmorDataByKey("868000___Skyrim.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; ArmorPenitusCuirass
	
	ap.SetArmorDataByKey("754635___Skyrim.esm", ap.GEARTYPE_BODY, 60, 0, abExportToDefaults = true, abSave = false) ; ArmorFalmerCuirass

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	ap.SetArmorDataByKey("62455___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardCuirassHeavy1
	ap.SetArmorDataByKey("62458___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardCuirassHeavy2
	ap.SetArmorDataByKey("62459___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardCuirassLight1
	ap.SetArmorDataByKey("62466___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardCuirassLight2
	ap.SetArmorDataByKey("62468___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardCuirassLight3

	ap.SetArmorDataByKey("59614___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHardenedCuirass

	ap.SetArmorDataByKey("9193___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHeavyCuirass

	ap.SetArmorDataByKey("82631___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireArmorGray
	ap.SetArmorDataByKey("102898___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireArmorGrayLight
	ap.SetArmorDataByKey("102899___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 91, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireArmorRed

	ap.SetArmorDataByKey("46555___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 72, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireArmorRoyalRed 	@MULTI
	ap.SetArmorDataByKey("103621___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 72, aiExtraCloakWarmth = 12, aiExtraCloakCoverage = 40, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireArmorValerica	@MULTI

	ap.SetArmorDataByKey("51222___Dawnguard.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; DLC1IvoryCuirass
	ap.SetArmorDataByKey("51923___Dawnguard.esm", ap.GEARTYPE_BODY, 140, 72, abExportToDefaults = true, abSave = false) ; DLC1IvoryCuirassAlternate

	ap.SetArmorDataByKey("84997___Dawnguard.esm", ap.GEARTYPE_BODY, 125, 72, abExportToDefaults = true, abSave = false) ; DLC1LD_ArmorKatria

	ap.SetArmorDataByKey("59883___Dawnguard.esm", ap.GEARTYPE_BODY, 30, 0, abExportToDefaults = true, abSave = false) ; ClothesPrisonerRagsBloody

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	ap.SetArmorDataByKey("118175___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimHeavyCuirass
	ap.SetArmorDataByKey("168460___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration04
	ap.SetArmorDataByKey("168461___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration05
	ap.SetArmorDataByKey("168462___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassAlteration06
	ap.SetArmorDataByKey("168463___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration04
	ap.SetArmorDataByKey("168464___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration05
	ap.SetArmorDataByKey("168465___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassConjuration06
	ap.SetArmorDataByKey("168466___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction04
	ap.SetArmorDataByKey("168467___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction05
	ap.SetArmorDataByKey("168468___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassDestruction06
	ap.SetArmorDataByKey("168469___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealth04
	ap.SetArmorDataByKey("168470___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealth05
	ap.SetArmorDataByKey("168472___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealth06
	ap.SetArmorDataByKey("168473___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate04
	ap.SetArmorDataByKey("168474___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate05
	ap.SetArmorDataByKey("168471___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHealthRate06
	ap.SetArmorDataByKey("168475___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor04
	ap.SetArmorDataByKey("168476___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor05
	ap.SetArmorDataByKey("168477___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassHeavyArmor06
	ap.SetArmorDataByKey("168478___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion04
	ap.SetArmorDataByKey("168479___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion05
	ap.SetArmorDataByKey("168480___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassIllusion06
	ap.SetArmorDataByKey("168481___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration04
	ap.SetArmorDataByKey("168482___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration05
	ap.SetArmorDataByKey("168483___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassRestoration06
	ap.SetArmorDataByKey("168484___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate04
	ap.SetArmorDataByKey("168485___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate05
	ap.SetArmorDataByKey("168486___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyCuirassStaminaRate06

	ap.SetArmorDataByKey("118178___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimLightCuirass
	ap.SetArmorDataByKey("168101___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassAlteration03
	ap.SetArmorDataByKey("168102___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassAlteration04
	ap.SetArmorDataByKey("168103___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassAlteration05
	ap.SetArmorDataByKey("168104___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassConjuration03
	ap.SetArmorDataByKey("168105___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassConjuration04
	ap.SetArmorDataByKey("168106___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassConjuration05
	ap.SetArmorDataByKey("168107___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassDestruction03
	ap.SetArmorDataByKey("168108___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassDestruction04
	ap.SetArmorDataByKey("168109___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassDestruction05
	ap.SetArmorDataByKey("168110___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealRate03
	ap.SetArmorDataByKey("168111___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealRate04
	ap.SetArmorDataByKey("168112___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealRate05
	ap.SetArmorDataByKey("168113___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealth03
	ap.SetArmorDataByKey("168114___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealth04
	ap.SetArmorDataByKey("168115___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassHealth05
	ap.SetArmorDataByKey("168116___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassIllusion03
	ap.SetArmorDataByKey("168117___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassIllusion04
	ap.SetArmorDataByKey("168118___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassIllusion05
	ap.SetArmorDataByKey("168119___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassLightArmor03
	ap.SetArmorDataByKey("168120___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassLightArmor04
	ap.SetArmorDataByKey("168121___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassLightArmor05
	ap.SetArmorDataByKey("168122___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassRestoration03
	ap.SetArmorDataByKey("168123___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassRestoration04
	ap.SetArmorDataByKey("168124___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassRestoration05
	ap.SetArmorDataByKey("168125___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate03
	ap.SetArmorDataByKey("168126___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate04
	ap.SetArmorDataByKey("168127___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightCuirassStaminaRate05

	ap.SetArmorDataByKey("118167___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2ArmorNordicHeavyCuirass
	ap.SetArmorDataByKey("168368___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassAlteration03
	ap.SetArmorDataByKey("168369___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassAlteration04
	ap.SetArmorDataByKey("168370___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassAlteration05
	ap.SetArmorDataByKey("168371___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassConjuration03
	ap.SetArmorDataByKey("168372___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassConjuration04
	ap.SetArmorDataByKey("168373___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassConjuration05
	ap.SetArmorDataByKey("168374___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassDestruction03
	ap.SetArmorDataByKey("168375___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassDestruction04
	ap.SetArmorDataByKey("168376___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassDestruction05
	ap.SetArmorDataByKey("168377___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHealth03
	ap.SetArmorDataByKey("168378___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHealth04
	ap.SetArmorDataByKey("168379___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHealth05
	ap.SetArmorDataByKey("168380___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor03
	ap.SetArmorDataByKey("168381___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor04
	ap.SetArmorDataByKey("168382___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassHeavyArmor05
	ap.SetArmorDataByKey("168383___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassIllusion03
	ap.SetArmorDataByKey("168384___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassIllusion04
	ap.SetArmorDataByKey("168385___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassIllusion05
	ap.SetArmorDataByKey("168386___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassRestoration03
	ap.SetArmorDataByKey("168387___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassRestoration04
	ap.SetArmorDataByKey("168388___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyCuirassRestoration05

	ap.SetArmorDataByKey("226660___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldCuirassGuard
	ap.SetArmorDataByKey("226659___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldCuirassVariant01
	ap.SetArmorDataByKey("118163___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldCuirassVariant02
	ap.SetArmorDataByKey("240422___Dragonborn.esm", ap.GEARTYPE_BODY, 135, 72, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldImprovedCuirass
	ap.SetArmorDataByKey("165077___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassHealth01
	ap.SetArmorDataByKey("165078___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassHealth02
	ap.SetArmorDataByKey("165079___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassHealth03
	ap.SetArmorDataByKey("165080___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassLightArmor01
	ap.SetArmorDataByKey("165081___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassLightArmor02
	ap.SetArmorDataByKey("165082___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 54, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldCuirassLightArmor03

	ap.SetArmorDataByKey("118154___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinHeavyCuirass
	ap.SetArmorDataByKey("168291___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassAlteration02
	ap.SetArmorDataByKey("168292___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassAlteration03
	ap.SetArmorDataByKey("168293___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassAlteration04
	ap.SetArmorDataByKey("168294___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassConjuration02
	ap.SetArmorDataByKey("168295___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassConjuration03
	ap.SetArmorDataByKey("168296___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassConjuration04
	ap.SetArmorDataByKey("168297___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassDestruction02
	ap.SetArmorDataByKey("168298___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassDestruction03
	ap.SetArmorDataByKey("168299___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassDestruction04
	ap.SetArmorDataByKey("168300___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHealth02
	ap.SetArmorDataByKey("168301___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHealth03
	ap.SetArmorDataByKey("168302___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHealth04
	ap.SetArmorDataByKey("168303___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor02
	ap.SetArmorDataByKey("168304___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor03
	ap.SetArmorDataByKey("168305___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassHeavyArmor04
	ap.SetArmorDataByKey("168306___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassIllusion02
	ap.SetArmorDataByKey("168307___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassIllusion03
	ap.SetArmorDataByKey("168308___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassIllusion04
	ap.SetArmorDataByKey("168309___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassRestoration02
	ap.SetArmorDataByKey("168310___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassRestoration03
	ap.SetArmorDataByKey("168311___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyCuirassRestoration04

	ap.SetArmorDataByKey("118151___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinLightCuirass
	ap.SetArmorDataByKey("167920___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassAlteration02
	ap.SetArmorDataByKey("167921___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassAlteration03
	ap.SetArmorDataByKey("167922___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassAlteration04
	ap.SetArmorDataByKey("167923___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassConjuration02
	ap.SetArmorDataByKey("167924___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassConjuration03
	ap.SetArmorDataByKey("167925___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassConjuration04
	ap.SetArmorDataByKey("167926___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassDestruction02
	ap.SetArmorDataByKey("167927___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassDestruction03
	ap.SetArmorDataByKey("167928___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassDestruction04
	ap.SetArmorDataByKey("167929___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassHealth02
	ap.SetArmorDataByKey("167934___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassHealth03
	ap.SetArmorDataByKey("167930___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassHealth04
	ap.SetArmorDataByKey("167931___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassLightArmor02
	ap.SetArmorDataByKey("167932___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassLightArmor03
	ap.SetArmorDataByKey("167935___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassLightArmor04
	ap.SetArmorDataByKey("167936___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassRestoration02
	ap.SetArmorDataByKey("167937___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassRestoration03
	ap.SetArmorDataByKey("167938___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightCuirassRestoration04

	ap.SetArmorDataByKey("233742___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 54, abExportToDefaults = true, abSave = false) ; DLC2ClothesSkaalCoat
	ap.SetArmorDataByKey("118185___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 54, abExportToDefaults = true, abSave = false) ; DLC2SkaalVillagerOutfit

	ap.SetArmorDataByKey("168620___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 72, abExportToDefaults = true, abSave = false) ; DLC2MoragTongCuirass

	ap.SetArmorDataByKey("121751___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 35, abExportToDefaults = true, abSave = false) ; DLC2dunKolbjornCuirass

	ap.SetArmorDataByKey("147483___Dragonborn.esm", ap.GEARTYPE_BODY, 190, 91, abExportToDefaults = true, abSave = false) ; DLC2dunHaknirArmorCuirass

	ap.SetArmorDataByKey("175411___Dragonborn.esm", ap.GEARTYPE_BODY, 125, 109, abExportToDefaults = true, abSave = false) ; DLC2TGArmorVariantCuirass

	ap.SetArmorDataByKey("118186___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43, abExportToDefaults = true, abSave = false) ; DLC2DarkElfOutfit 		@MULTI
	ap.SetArmorDataByKey("225381___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43, abExportToDefaults = true, abSave = false) ; DLC2DarkElfOutfitBlue	@MULTI
	ap.SetArmorDataByKey("225382___Dragonborn.esm", ap.GEARTYPE_BODY, 110, 35, aiExtraHeadWarmth = 25, aiExtraHeadCoverage = 43, abExportToDefaults = true, abSave = false) ; DLC2DarkElfOutfitRed	@MULTI
endFunction

function SetDefaults_Head()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	ap.SetArmorDataByKey("80147___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; ArmorHideHelmet
	ap.SetArmorDataByKey("570983___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlchemy01
	ap.SetArmorDataByKey("570984___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlchemy02
	ap.SetArmorDataByKey("570985___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlchemy03
	ap.SetArmorDataByKey("500048___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlteration01
	ap.SetArmorDataByKey("709819___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlteration02
	ap.SetArmorDataByKey("709820___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetAlteration03
	ap.SetArmorDataByKey("500049___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetConjuration01
	ap.SetArmorDataByKey("709821___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetConjuration02
	ap.SetArmorDataByKey("709822___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetConjuration03
	ap.SetArmorDataByKey("500050___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetDestruction01
	ap.SetArmorDataByKey("709823___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetDestruction02
	ap.SetArmorDataByKey("709824___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetDestruction03
	ap.SetArmorDataByKey("500052___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetIllusion01
	ap.SetArmorDataByKey("709827___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetIllusion02
	ap.SetArmorDataByKey("709828___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetIllusion03
	ap.SetArmorDataByKey("500053___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMagicka01
	ap.SetArmorDataByKey("709829___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMagicka02
	ap.SetArmorDataByKey("709830___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMagicka03
	ap.SetArmorDataByKey("500055___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMarksman01
	ap.SetArmorDataByKey("709831___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMarksman02
	ap.SetArmorDataByKey("709832___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetMarksman03
	ap.SetArmorDataByKey("500056___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetRestoration01
	ap.SetArmorDataByKey("709833___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetRestoration02
	ap.SetArmorDataByKey("709834___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 14, abExportToDefaults = true, abSave = false) ; EnchArmorHideHelmetRestoration03
	
	ap.SetArmorDataByKey("455582___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 3, abExportToDefaults = true, abSave = false) ; ArmorBanditHelmet
	
	ap.SetArmorDataByKey("80162___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; ArmorLeatherHelmet
	ap.SetArmorDataByKey("570989___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlchemy01
	ap.SetArmorDataByKey("570990___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlchemy02
	ap.SetArmorDataByKey("570991___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlchemy03
	ap.SetArmorDataByKey("741474___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlteration01
	ap.SetArmorDataByKey("741475___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlteration02
	ap.SetArmorDataByKey("741476___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetAlteration03
	ap.SetArmorDataByKey("741477___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetConjuration01
	ap.SetArmorDataByKey("741478___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetConjuration02
	ap.SetArmorDataByKey("741479___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetConjuration03
	ap.SetArmorDataByKey("741480___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetDestruction01
	ap.SetArmorDataByKey("741481___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetDestruction02
	ap.SetArmorDataByKey("741482___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetDestruction03
	ap.SetArmorDataByKey("741495___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetIllusion01
	ap.SetArmorDataByKey("741496___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetIllusion02
	ap.SetArmorDataByKey("741497___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetIllusion03
	ap.SetArmorDataByKey("741498___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMagicka01
	ap.SetArmorDataByKey("741499___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMagicka02
	ap.SetArmorDataByKey("741500___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMagicka03
	ap.SetArmorDataByKey("741501___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMarksman01
	ap.SetArmorDataByKey("741502___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMarksman02
	ap.SetArmorDataByKey("741503___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetMarksman03
	ap.SetArmorDataByKey("741483___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetRestoration01
	ap.SetArmorDataByKey("741484___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetRestoration02
	ap.SetArmorDataByKey("741485___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherHelmetRestoration03
	
	ap.SetArmorDataByKey("80157___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; ArmorElvenHelmet
	ap.SetArmorDataByKey("1072916___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; ArmorElvenLightHelmet
	ap.SetArmorDataByKey("570980___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlchemy02
	ap.SetArmorDataByKey("570981___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlchemy03
	ap.SetArmorDataByKey("570982___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlchemy04
	ap.SetArmorDataByKey("778216___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlteration02
	ap.SetArmorDataByKey("778217___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlteration03
	ap.SetArmorDataByKey("778319___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetAlteration04
	ap.SetArmorDataByKey("778218___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetConjuration02
	ap.SetArmorDataByKey("778219___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetConjuration03
	ap.SetArmorDataByKey("778320___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetConjuration04
	ap.SetArmorDataByKey("778220___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetDestruction02
	ap.SetArmorDataByKey("778221___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetDestruction03
	ap.SetArmorDataByKey("778321___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetDestruction04
	ap.SetArmorDataByKey("778224___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetIllusion02
	ap.SetArmorDataByKey("778225___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetIllusion03
	ap.SetArmorDataByKey("778323___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetIllusion04
	ap.SetArmorDataByKey("778226___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMagicka02
	ap.SetArmorDataByKey("778227___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMagicka03
	ap.SetArmorDataByKey("778324___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMagicka04
	ap.SetArmorDataByKey("778228___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMarksman02
	ap.SetArmorDataByKey("778229___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMarksman03
	ap.SetArmorDataByKey("778325___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetMarksman04
	ap.SetArmorDataByKey("778230___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetRestoration02
	ap.SetArmorDataByKey("778231___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetRestoration03
	ap.SetArmorDataByKey("778326___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorElvenHelmetRestoration04
	
	ap.SetArmorDataByKey("111521___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; ArmorScaledHelmet
	ap.SetArmorDataByKey("290039___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlchemy02
	ap.SetArmorDataByKey("290038___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlchemy03
	ap.SetArmorDataByKey("290040___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlchemy04
	ap.SetArmorDataByKey("290074___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlteration02
	ap.SetArmorDataByKey("290079___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlteration03
	ap.SetArmorDataByKey("290080___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetAlteration04
	ap.SetArmorDataByKey("290081___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetConjuration02
	ap.SetArmorDataByKey("290225___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetConjuration03
	ap.SetArmorDataByKey("290226___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetConjuration04
	ap.SetArmorDataByKey("290227___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetDestruction02
	ap.SetArmorDataByKey("290228___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetDestruction03
	ap.SetArmorDataByKey("290229___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetDestruction04
	ap.SetArmorDataByKey("290242___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetIllusion02
	ap.SetArmorDataByKey("290243___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetIllusion03
	ap.SetArmorDataByKey("290244___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetIllusion04
	ap.SetArmorDataByKey("290247___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMagicka02
	ap.SetArmorDataByKey("290250___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMagicka03
	ap.SetArmorDataByKey("290251___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMagicka04
	ap.SetArmorDataByKey("290259___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMarksman02
	ap.SetArmorDataByKey("290265___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMarksman03
	ap.SetArmorDataByKey("290274___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetMarksman04
	ap.SetArmorDataByKey("290285___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetRestoration02
	ap.SetArmorDataByKey("290286___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetRestoration03
	ap.SetArmorDataByKey("290287___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetRestoration04
	ap.SetArmorDataByKey("290288___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorScaledHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80187___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; ArmorGlassHelmet
	ap.SetArmorDataByKey("873406___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlchemy03
	ap.SetArmorDataByKey("873407___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlchemy04
	ap.SetArmorDataByKey("873408___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlchemy05
	ap.SetArmorDataByKey("873409___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlteration03
	ap.SetArmorDataByKey("873410___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlteration04
	ap.SetArmorDataByKey("873411___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetAlteration05
	ap.SetArmorDataByKey("873412___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetConjuration03
	ap.SetArmorDataByKey("873413___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetConjuration04
	ap.SetArmorDataByKey("873414___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetConjuration05
	ap.SetArmorDataByKey("873415___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetDestruction03
	ap.SetArmorDataByKey("873416___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetDestruction04
	ap.SetArmorDataByKey("873417___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetDestruction05
	ap.SetArmorDataByKey("873421___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetIllusion03
	ap.SetArmorDataByKey("873422___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetIllusion04
	ap.SetArmorDataByKey("873423___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetIllusion05
	ap.SetArmorDataByKey("873424___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagicka03
	ap.SetArmorDataByKey("873425___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagicka04
	ap.SetArmorDataByKey("873426___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagicka05
	ap.SetArmorDataByKey("1041114___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagickaRate03
	ap.SetArmorDataByKey("1041115___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagickaRate04
	ap.SetArmorDataByKey("1041119___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMagickaRate05
	ap.SetArmorDataByKey("873427___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMarksman03
	ap.SetArmorDataByKey("873428___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMarksman04
	ap.SetArmorDataByKey("873429___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetMarksman05
	ap.SetArmorDataByKey("873430___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetRestoration03
	ap.SetArmorDataByKey("873431___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetRestoration04
	ap.SetArmorDataByKey("873432___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetRestoration05
	ap.SetArmorDataByKey("873433___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 29, abExportToDefaults = true, abSave = false) ; EnchArmorGlassHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80192___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; ArmorDragonscaleHelmet
	ap.SetArmorDataByKey("883188___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlchemy04
	ap.SetArmorDataByKey("883189___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlchemy05
	ap.SetArmorDataByKey("883190___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlchemy06
	ap.SetArmorDataByKey("883191___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlteration04
	ap.SetArmorDataByKey("883192___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlteration05
	ap.SetArmorDataByKey("883193___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetAlteration06
	ap.SetArmorDataByKey("883194___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetConjuration04
	ap.SetArmorDataByKey("883195___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetConjuration05
	ap.SetArmorDataByKey("883196___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetConjuration06
	ap.SetArmorDataByKey("883197___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetDestruction04
	ap.SetArmorDataByKey("883198___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetDestruction05
	ap.SetArmorDataByKey("883199___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetDestruction06
	ap.SetArmorDataByKey("883203___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetIllusion04
	ap.SetArmorDataByKey("883204___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetIllusion05
	ap.SetArmorDataByKey("883205___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetIllusion06
	ap.SetArmorDataByKey("883206___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagicka04
	ap.SetArmorDataByKey("883207___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagicka05
	ap.SetArmorDataByKey("883208___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagicka06
	ap.SetArmorDataByKey("1041126___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagickaRate04
	ap.SetArmorDataByKey("1041127___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagickaRate05
	ap.SetArmorDataByKey("1041128___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMagickaRate06
	ap.SetArmorDataByKey("883209___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMarksman04
	ap.SetArmorDataByKey("883210___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMarksman05
	ap.SetArmorDataByKey("883211___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetMarksman06
	ap.SetArmorDataByKey("883212___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetRestoration04
	ap.SetArmorDataByKey("883213___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetRestoration05
	ap.SetArmorDataByKey("883214___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetRestoration06
	ap.SetArmorDataByKey("883215___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleHelmetWaterbreathing
	
	ap.SetArmorDataByKey("77389___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; ArmorIronHelmet
	ap.SetArmorDataByKey("570986___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlchemy01
	ap.SetArmorDataByKey("570987___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlchemy02
	ap.SetArmorDataByKey("570988___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlchemy03
	ap.SetArmorDataByKey("499996___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlteration01
	ap.SetArmorDataByKey("710023___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlteration02
	ap.SetArmorDataByKey("710024___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetAlteration03
	ap.SetArmorDataByKey("500003___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetConjuration01
	ap.SetArmorDataByKey("710025___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetConjuration02
	ap.SetArmorDataByKey("710026___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetConjuration03
	ap.SetArmorDataByKey("500005___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetDestruction01
	ap.SetArmorDataByKey("710027___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetDestruction02
	ap.SetArmorDataByKey("710028___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetDestruction03
	ap.SetArmorDataByKey("500009___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetIllusion01
	ap.SetArmorDataByKey("710031___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetIllusion02
	ap.SetArmorDataByKey("710032___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetIllusion03
	ap.SetArmorDataByKey("303537___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMagicka01
	ap.SetArmorDataByKey("710033___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMagicka02
	ap.SetArmorDataByKey("710034___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMagicka03
	ap.SetArmorDataByKey("500013___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMarksman01
	ap.SetArmorDataByKey("710035___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMarksman02
	ap.SetArmorDataByKey("710036___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetMarksman03
	ap.SetArmorDataByKey("500017___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetRestoration01
	ap.SetArmorDataByKey("710037___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetRestoration02
	ap.SetArmorDataByKey("710039___Skyrim.esm", ap.GEARTYPE_HEAD, 15, 3, abExportToDefaults = true, abSave = false) ; EnchArmorIronHelmetRestoration03
	
	ap.SetArmorDataByKey("80212___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelHelmetA
	ap.SetArmorDataByKey("1011492___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelHelmetB
	ap.SetArmorDataByKey("571039___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlchemy01
	ap.SetArmorDataByKey("571040___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlchemy02
	ap.SetArmorDataByKey("571041___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlchemy03
	ap.SetArmorDataByKey("741587___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlteration01
	ap.SetArmorDataByKey("741595___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlteration02
	ap.SetArmorDataByKey("741596___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetAlteration03
	ap.SetArmorDataByKey("741588___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetConjuration01
	ap.SetArmorDataByKey("741597___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetConjuration02
	ap.SetArmorDataByKey("741598___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetConjuration03
	ap.SetArmorDataByKey("741589___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetDestruction01
	ap.SetArmorDataByKey("741599___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetDestruction02
	ap.SetArmorDataByKey("741600___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetDestruction03
	ap.SetArmorDataByKey("741591___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetIllusion01
	ap.SetArmorDataByKey("741603___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetIllusion02
	ap.SetArmorDataByKey("741604___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetIllusion03
	ap.SetArmorDataByKey("741592___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMagicka01
	ap.SetArmorDataByKey("741605___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMagicka02
	ap.SetArmorDataByKey("741606___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMagicka03
	ap.SetArmorDataByKey("741593___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMarksman01
	ap.SetArmorDataByKey("741609___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMarksman02
	ap.SetArmorDataByKey("741610___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetMarksman03
	ap.SetArmorDataByKey("741594___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetRestoration01
	ap.SetArmorDataByKey("741607___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetRestoration02
	ap.SetArmorDataByKey("741608___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetRestoration03
	ap.SetArmorDataByKey("600710___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80207___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; ArmorDwarvenHelmet
	ap.SetArmorDataByKey("570970___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlchemy02
	ap.SetArmorDataByKey("570978___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlchemy03
	ap.SetArmorDataByKey("570979___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlchemy04
	ap.SetArmorDataByKey("112491___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlteration02
	ap.SetArmorDataByKey("112492___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlteration03
	ap.SetArmorDataByKey("112493___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetAlteration04
	ap.SetArmorDataByKey("112494___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetConjuration02
	ap.SetArmorDataByKey("112495___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetConjuration03
	ap.SetArmorDataByKey("112496___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetConjuration04
	ap.SetArmorDataByKey("112497___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetDestruction02
	ap.SetArmorDataByKey("112498___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetDestruction03
	ap.SetArmorDataByKey("112522___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetDestruction04
	ap.SetArmorDataByKey("113072___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetIllusion02
	ap.SetArmorDataByKey("113079___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetIllusion03
	ap.SetArmorDataByKey("113080___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetIllusion04
	ap.SetArmorDataByKey("113083___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMagicka02
	ap.SetArmorDataByKey("113084___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMagicka03
	ap.SetArmorDataByKey("113086___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMagicka04
	ap.SetArmorDataByKey("113088___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMarksman02
	ap.SetArmorDataByKey("113089___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMarksman03
	ap.SetArmorDataByKey("113091___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetMarksman04
	ap.SetArmorDataByKey("113092___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetRestoration02
	ap.SetArmorDataByKey("113093___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetRestoration03
	ap.SetArmorDataByKey("113095___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetRestoration04
	ap.SetArmorDataByKey("600717___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80222___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelPlateHelmet
	ap.SetArmorDataByKey("570992___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlchemy02
	ap.SetArmorDataByKey("570993___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlchemy03
	ap.SetArmorDataByKey("570994___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlchemy04
	ap.SetArmorDataByKey("253817___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlteration02
	ap.SetArmorDataByKey("253818___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlteration03
	ap.SetArmorDataByKey("253819___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetAlteration04
	ap.SetArmorDataByKey("253820___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetConjuration02
	ap.SetArmorDataByKey("253821___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetConjuration03
	ap.SetArmorDataByKey("253822___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetConjuration04
	ap.SetArmorDataByKey("253823___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetDestruction02
	ap.SetArmorDataByKey("253824___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetDestruction03
	ap.SetArmorDataByKey("253825___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetDestruction04
	ap.SetArmorDataByKey("253829___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetIllusion02
	ap.SetArmorDataByKey("266270___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetIllusion03
	ap.SetArmorDataByKey("266272___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetIllusion04
	ap.SetArmorDataByKey("266273___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMagicka02
	ap.SetArmorDataByKey("266274___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMagicka03
	ap.SetArmorDataByKey("266279___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMagicka04
	ap.SetArmorDataByKey("266284___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMarksman02
	ap.SetArmorDataByKey("266291___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMarksman03
	ap.SetArmorDataByKey("266292___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetMarksman04
	ap.SetArmorDataByKey("266293___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetRestoration02
	ap.SetArmorDataByKey("266294___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetRestoration03
	ap.SetArmorDataByKey("266295___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetRestoration04
	ap.SetArmorDataByKey("600778___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80217___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; ArmorOrcishHelmet
	ap.SetArmorDataByKey("849916___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlchemy03
	ap.SetArmorDataByKey("849917___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlchemy04
	ap.SetArmorDataByKey("849918___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlchemy05
	ap.SetArmorDataByKey("849919___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlteration03
	ap.SetArmorDataByKey("849920___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlteration04
	ap.SetArmorDataByKey("849921___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetAlteration05
	ap.SetArmorDataByKey("849922___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetConjuration03
	ap.SetArmorDataByKey("849923___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetConjuration04
	ap.SetArmorDataByKey("849924___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetConjuration05
	ap.SetArmorDataByKey("849925___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetDestruction03
	ap.SetArmorDataByKey("849926___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetDestruction04
	ap.SetArmorDataByKey("849927___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetDestruction05
	ap.SetArmorDataByKey("849931___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetIllusion03
	ap.SetArmorDataByKey("849932___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetIllusion04
	ap.SetArmorDataByKey("849933___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetIllusion05
	ap.SetArmorDataByKey("849934___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMagicka03
	ap.SetArmorDataByKey("849935___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMagicka04
	ap.SetArmorDataByKey("849936___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMagicka05
	ap.SetArmorDataByKey("849937___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMarksman03
	ap.SetArmorDataByKey("849938___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMarksman04
	ap.SetArmorDataByKey("849939___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetMarksman05
	ap.SetArmorDataByKey("849940___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetRestoration03
	ap.SetArmorDataByKey("849941___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetRestoration04
	ap.SetArmorDataByKey("849942___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetRestoration05
	ap.SetArmorDataByKey("849943___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80227___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; ArmorEbonyHelmet
	ap.SetArmorDataByKey("850033___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlchemy03
	ap.SetArmorDataByKey("850034___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlchemy04
	ap.SetArmorDataByKey("850035___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlchemy05
	ap.SetArmorDataByKey("850036___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlteration03
	ap.SetArmorDataByKey("850037___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlteration04
	ap.SetArmorDataByKey("850038___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetAlteration05
	ap.SetArmorDataByKey("850039___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetConjuration03
	ap.SetArmorDataByKey("850040___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetConjuration04
	ap.SetArmorDataByKey("850041___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetConjuration05
	ap.SetArmorDataByKey("850042___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetDestruction03
	ap.SetArmorDataByKey("850043___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetDestruction04
	ap.SetArmorDataByKey("850044___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetDestruction05
	ap.SetArmorDataByKey("850048___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetIllusion03
	ap.SetArmorDataByKey("850049___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetIllusion04
	ap.SetArmorDataByKey("850050___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetIllusion05
	ap.SetArmorDataByKey("850051___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagicka03
	ap.SetArmorDataByKey("850052___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagicka04
	ap.SetArmorDataByKey("850053___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagicka05
	ap.SetArmorDataByKey("1041135___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagickaRate03
	ap.SetArmorDataByKey("1041136___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagickaRate04
	ap.SetArmorDataByKey("1041137___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMagickaRate05
	ap.SetArmorDataByKey("850054___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMarksman03
	ap.SetArmorDataByKey("850055___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMarksman04
	ap.SetArmorDataByKey("850056___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetMarksman05
	ap.SetArmorDataByKey("850057___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetRestoration03
	ap.SetArmorDataByKey("850058___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetRestoration04
	ap.SetArmorDataByKey("850059___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetRestoration05
	ap.SetArmorDataByKey("850060___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80233___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; ArmorDragonplateHelmet
	ap.SetArmorDataByKey("883296___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlchemy04
	ap.SetArmorDataByKey("883297___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlchemy05
	ap.SetArmorDataByKey("883298___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlchemy06
	ap.SetArmorDataByKey("883299___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlteration04
	ap.SetArmorDataByKey("883300___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlteration05
	ap.SetArmorDataByKey("883301___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetAlteration06
	ap.SetArmorDataByKey("883302___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetConjuration04
	ap.SetArmorDataByKey("883303___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetConjuration05
	ap.SetArmorDataByKey("883304___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetConjuration06
	ap.SetArmorDataByKey("883305___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetDestruction04
	ap.SetArmorDataByKey("883306___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetDestruction05
	ap.SetArmorDataByKey("883307___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetDestruction06
	ap.SetArmorDataByKey("883311___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetIllusion04
	ap.SetArmorDataByKey("883312___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetIllusion05
	ap.SetArmorDataByKey("883313___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetIllusion06
	ap.SetArmorDataByKey("883314___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagicka04
	ap.SetArmorDataByKey("883315___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagicka05
	ap.SetArmorDataByKey("883316___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagicka06
	ap.SetArmorDataByKey("1041138___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagickaRate04
	ap.SetArmorDataByKey("1041139___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagickaRate05
	ap.SetArmorDataByKey("1041140___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMagickaRate06
	ap.SetArmorDataByKey("883317___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMarksman04
	ap.SetArmorDataByKey("883318___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMarksman05
	ap.SetArmorDataByKey("883319___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetMarksman06
	ap.SetArmorDataByKey("883320___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetRestoration04
	ap.SetArmorDataByKey("883321___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetRestoration05
	ap.SetArmorDataByKey("883322___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetRestoration06
	ap.SetArmorDataByKey("883323___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 58, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateHelmetWaterbreathing
	
	ap.SetArmorDataByKey("80237___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; ArmorDaedricHelmet
	ap.SetArmorDataByKey("883410___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlchemy04
	ap.SetArmorDataByKey("883411___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlchemy05
	ap.SetArmorDataByKey("883412___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlchemy06
	ap.SetArmorDataByKey("883413___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlteration04
	ap.SetArmorDataByKey("883414___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlteration05
	ap.SetArmorDataByKey("883415___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetAlteration06
	ap.SetArmorDataByKey("883416___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetConjuration04
	ap.SetArmorDataByKey("883417___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetConjuration05
	ap.SetArmorDataByKey("883418___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetConjuration06
	ap.SetArmorDataByKey("883419___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetDestruction04
	ap.SetArmorDataByKey("883420___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetDestruction05
	ap.SetArmorDataByKey("883421___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetDestruction06
	ap.SetArmorDataByKey("883425___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetIllusion04
	ap.SetArmorDataByKey("883426___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetIllusion05
	ap.SetArmorDataByKey("883427___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetIllusion06
	ap.SetArmorDataByKey("883428___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagicka04
	ap.SetArmorDataByKey("883429___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagicka05
	ap.SetArmorDataByKey("883430___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagicka06
	ap.SetArmorDataByKey("1041153___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagickaRate04
	ap.SetArmorDataByKey("1041154___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagickaRate05
	ap.SetArmorDataByKey("1041155___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMagickaRate06
	ap.SetArmorDataByKey("883431___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMarksman04
	ap.SetArmorDataByKey("883432___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMarksman05
	ap.SetArmorDataByKey("883433___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetMarksman06
	ap.SetArmorDataByKey("883434___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetRestoration04
	ap.SetArmorDataByKey("883435___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetRestoration05
	ap.SetArmorDataByKey("883436___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetRestoration06
	ap.SetArmorDataByKey("883437___Skyrim.esm", ap.GEARTYPE_HEAD, 45, 43, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricHelmetWaterbreathing
	
	ap.SetArmorDataByKey("307855___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; ArmorBladesHelmet
	
	ap.SetArmorDataByKey("312272___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; ArmorCompanionsHelmet
	
	ap.SetArmorDataByKey("862274___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; DBArmorHelmet
	ap.SetArmorDataByKey("371652___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; DBArmorHelmetMaskLess
	ap.SetArmorDataByKey("925463___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; DBArmorHelmetSP
	ap.SetArmorDataByKey("1108829___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; DBArmorHelmetWornPlayable
	
	ap.SetArmorDataByKey("354974___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 3, abExportToDefaults = true, abSave = false) ; ArmorDraugrHelmet
	ap.SetArmorDataByKey("1001806___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 3, abExportToDefaults = true, abSave = false) ; EnchArmorDraugrHelmetResistFire03
	
	ap.SetArmorDataByKey("1070493___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorEastmarchHelmetFull
	ap.SetArmorDataByKey("136729___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullFalkreath
	ap.SetArmorDataByKey("819036___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullHaafingar
	ap.SetArmorDataByKey("136731___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullHjaalmarch
	ap.SetArmorDataByKey("136735___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullPale
	ap.SetArmorDataByKey("136723___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullReach
	ap.SetArmorDataByKey("136738___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullRift
	ap.SetArmorDataByKey("136725___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullWhiterun
	ap.SetArmorDataByKey("136733___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorGuardHelmetFullWinterhold
	
	ap.SetArmorDataByKey("81628___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; ArmorImperialHelmet
	ap.SetArmorDataByKey("81627___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; ArmorImperialLightHelmet
	ap.SetArmorDataByKey("614669___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; ArmorImperialHelmetFull
	ap.SetArmorDataByKey("79567___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; ArmorImperialHelmetOfficer
	ap.SetArmorDataByKey("571042___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlchemy01
	ap.SetArmorDataByKey("571043___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlchemy02
	ap.SetArmorDataByKey("571044___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlchemy03
	ap.SetArmorDataByKey("571045___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlteration01
	ap.SetArmorDataByKey("571046___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlteration02
	ap.SetArmorDataByKey("571047___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetAlteration03
	ap.SetArmorDataByKey("571048___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetConjuration01
	ap.SetArmorDataByKey("571049___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetConjuration02
	ap.SetArmorDataByKey("571050___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetConjuration03
	ap.SetArmorDataByKey("571051___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetDestruction01
	ap.SetArmorDataByKey("571052___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetDestruction02
	ap.SetArmorDataByKey("571053___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetDestruction03
	ap.SetArmorDataByKey("571057___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetIllusion01
	ap.SetArmorDataByKey("571058___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetIllusion02
	ap.SetArmorDataByKey("571059___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetIllusion03
	ap.SetArmorDataByKey("571060___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetMagicka01
	ap.SetArmorDataByKey("571061___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetMagicka02
	ap.SetArmorDataByKey("571063___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetMarksman01
	ap.SetArmorDataByKey("571064___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetMarksman02
	ap.SetArmorDataByKey("571065___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetMarksman03
	ap.SetArmorDataByKey("571066___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetRestoration01
	ap.SetArmorDataByKey("571067___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetRestoration02
	ap.SetArmorDataByKey("571068___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialHelmetRestoration03
	ap.SetArmorDataByKey("571069___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlchemy01
	ap.SetArmorDataByKey("571075___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlchemy02
	ap.SetArmorDataByKey("571070___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlchemy03
	ap.SetArmorDataByKey("571071___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlteration01
	ap.SetArmorDataByKey("571072___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlteration02
	ap.SetArmorDataByKey("571073___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetAlteration03
	ap.SetArmorDataByKey("571074___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetConjuration01
	ap.SetArmorDataByKey("571076___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetConjuration02
	ap.SetArmorDataByKey("571077___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetConjuration03
	ap.SetArmorDataByKey("571078___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetDestruction01
	ap.SetArmorDataByKey("571079___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetDestruction02
	ap.SetArmorDataByKey("571080___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetDestruction03
	ap.SetArmorDataByKey("571084___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetIllusion01
	ap.SetArmorDataByKey("571085___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetIllusion02
	ap.SetArmorDataByKey("571086___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetIllusion03
	ap.SetArmorDataByKey("571087___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetMagicka01
	ap.SetArmorDataByKey("571088___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetMagicka02
	ap.SetArmorDataByKey("571062___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 43, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightHelmetMagicka03
	
	ap.SetArmorDataByKey("551301___Skyrim.esm", ap.GEARTYPE_HEAD, 50, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakBearHelmet
	
	ap.SetArmorDataByKey("683385___Skyrim.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakHelmetFull
	
	ap.SetArmorDataByKey("867013___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildHelmetPlayer
	ap.SetArmorDataByKey("867022___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildHelmetPlayerImproved
	ap.SetArmorDataByKey("931289___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildLeaderHelmet
	ap.SetArmorDataByKey("1082694___Skyrim.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; ArmorLinweHelmet
	
	ap.SetArmorDataByKey("383880___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 72, abExportToDefaults = true, abSave = false) ; ArmorNightingaleHelmetPlayer01
	ap.SetArmorDataByKey("1035283___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 72, abExportToDefaults = true, abSave = false) ; ArmorNightingaleHelmetPlayer02
	ap.SetArmorDataByKey("1035282___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 72, abExportToDefaults = true, abSave = false) ; ArmorNightingaleHelmetPlayer03

	ap.SetArmorDataByKey("962513___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 3, abExportToDefaults = true, abSave = false) ; MS02ForswornHelmet
	ap.SetArmorDataByKey("888146___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 3, abExportToDefaults = true, abSave = false) ; ForswornHelmet

	ap.SetArmorDataByKey("400569___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskBronzeHelmet
	ap.SetArmorDataByKey("400555___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskCorondrumHelmet
	ap.SetArmorDataByKey("400549___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskEbonyHelmet
	ap.SetArmorDataByKey("400577___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskIronHelmet
	ap.SetArmorDataByKey("400578___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskMarbleHelmet
	ap.SetArmorDataByKey("400523___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskMoonstoneHelmet
	ap.SetArmorDataByKey("400576___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskOrichalumHelmet
	ap.SetArmorDataByKey("400585___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskSteelHelmet
	ap.SetArmorDataByKey("400598___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskUltraHelmet
	ap.SetArmorDataByKey("400586___Skyrim.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; ArmorDragonPriestMaskWoodHelmet

	ap.SetArmorDataByKey("868010___Skyrim.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; ArmorPenitusHelmet


	;##############################
	;
	;    Dawnguard
	;
	;##############################
	ap.SetArmorDataByKey("105182___Dawnguard.esm", ap.GEARTYPE_HEAD, 25, 51, abExportToDefaults = true, abSave = false) ; DLC01ClothesVampireHood
	ap.SetArmorDataByKey("20688___Dawnguard.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardHelmetHeavy
	ap.SetArmorDataByKey("104606___Dawnguard.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardHelmetLight

	ap.SetArmorDataByKey("59616___Dawnguard.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorFAlmerHardenedHelmet
	ap.SetArmorDataByKey("9195___Dawnguard.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorFAlmerHeavyHelmet
	ap.SetArmorDataByKey("77450___Dawnguard.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorShellbugHelmet

	ap.SetArmorDataByKey("51220___Dawnguard.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; DLC1IvoryCrown


	;##############################
	;
	;    Dragonborn
	;
	;##############################

	ap.SetArmorDataByKey("233748___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 14, abExportToDefaults = true, abSave = false) ; DLC2ClothesSkaalHat
	ap.SetArmorDataByKey("168622___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2MoragTongHood
	ap.SetArmorDataByKey("121752___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 3, abExportToDefaults = true, abSave = false) ; DLC2dunKolbjornHelm
	ap.SetArmorDataByKey("147485___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2dunHaknirArmorHelm
	ap.SetArmorDataByKey("232157___Dragonborn.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; DLC2dunFahlbtharzDwarvenHelmet
	ap.SetArmorDataByKey("175409___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 58, abExportToDefaults = true, abSave = false) ; DLC2TGArmorVariantHood

	ap.SetArmorDataByKey("118177___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimHeavyHelmet
	ap.SetArmorDataByKey("168502___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy04
	ap.SetArmorDataByKey("168503___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy05
	ap.SetArmorDataByKey("168504___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlchemy06
	ap.SetArmorDataByKey("168505___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration04
	ap.SetArmorDataByKey("168506___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration05
	ap.SetArmorDataByKey("168507___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetAlteration06
	ap.SetArmorDataByKey("168508___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration04
	ap.SetArmorDataByKey("168509___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration05
	ap.SetArmorDataByKey("168510___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetConjuration06
	ap.SetArmorDataByKey("168511___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction04
	ap.SetArmorDataByKey("168512___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction05
	ap.SetArmorDataByKey("168513___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetDestruction06
	ap.SetArmorDataByKey("168514___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion04
	ap.SetArmorDataByKey("168515___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion05
	ap.SetArmorDataByKey("168516___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetIllusion06
	ap.SetArmorDataByKey("168517___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka04
	ap.SetArmorDataByKey("168518___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka05
	ap.SetArmorDataByKey("168519___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagicka06
	ap.SetArmorDataByKey("168520___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate04
	ap.SetArmorDataByKey("168521___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate05
	ap.SetArmorDataByKey("168522___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMagickaRate06
	ap.SetArmorDataByKey("168523___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman04
	ap.SetArmorDataByKey("168524___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman05
	ap.SetArmorDataByKey("168525___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetMarksman06
	ap.SetArmorDataByKey("168526___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration04
	ap.SetArmorDataByKey("168527___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration05
	ap.SetArmorDataByKey("168528___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetRestoration06
	ap.SetArmorDataByKey("168529___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyHelmetWaterbreathing

	ap.SetArmorDataByKey("118179___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimLightHelmet
	ap.SetArmorDataByKey("168149___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlchemy03
	ap.SetArmorDataByKey("168150___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlchemy04
	ap.SetArmorDataByKey("168151___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlchemy05
	ap.SetArmorDataByKey("168152___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlteration03
	ap.SetArmorDataByKey("168153___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlteration04
	ap.SetArmorDataByKey("168154___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetAlteration05
	ap.SetArmorDataByKey("168155___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetConjuration03
	ap.SetArmorDataByKey("168156___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetConjuration04
	ap.SetArmorDataByKey("168157___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetConjuration05
	ap.SetArmorDataByKey("168158___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetDestruction03
	ap.SetArmorDataByKey("168159___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetDestruction04
	ap.SetArmorDataByKey("168160___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetDestruction05
	ap.SetArmorDataByKey("168161___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetIllusion03
	ap.SetArmorDataByKey("168162___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetIllusion04
	ap.SetArmorDataByKey("168163___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetIllusion05
	ap.SetArmorDataByKey("168164___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagicka03
	ap.SetArmorDataByKey("168165___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagicka04
	ap.SetArmorDataByKey("168166___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagicka05
	ap.SetArmorDataByKey("168167___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate03
	ap.SetArmorDataByKey("168168___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate04
	ap.SetArmorDataByKey("168169___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMagickaRate05
	ap.SetArmorDataByKey("168170___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMarksman03
	ap.SetArmorDataByKey("168171___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMarksman04
	ap.SetArmorDataByKey("168172___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetMarksman05
	ap.SetArmorDataByKey("168173___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetRestoration03
	ap.SetArmorDataByKey("168174___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetRestoration04
	ap.SetArmorDataByKey("168175___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetRestoration05
	ap.SetArmorDataByKey("168191___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightHelmetWaterbreathing

	ap.SetArmorDataByKey("118169___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2ArmorNordicHeavyHelmet
	ap.SetArmorDataByKey("168404___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlchemy03
	ap.SetArmorDataByKey("168405___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlchemy04
	ap.SetArmorDataByKey("168406___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlchemy05
	ap.SetArmorDataByKey("168407___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlteration03
	ap.SetArmorDataByKey("168408___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlteration04
	ap.SetArmorDataByKey("168409___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetAlteration05
	ap.SetArmorDataByKey("168410___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetConjuration03
	ap.SetArmorDataByKey("168411___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetConjuration04
	ap.SetArmorDataByKey("168412___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetConjuration05
	ap.SetArmorDataByKey("168413___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetDestruction03
	ap.SetArmorDataByKey("168414___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetDestruction04
	ap.SetArmorDataByKey("168415___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetDestruction05
	ap.SetArmorDataByKey("168416___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetIllusion03
	ap.SetArmorDataByKey("168417___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetIllusion04
	ap.SetArmorDataByKey("168418___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetIllusion05
	ap.SetArmorDataByKey("168419___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMagicka03
	ap.SetArmorDataByKey("168420___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMagicka04
	ap.SetArmorDataByKey("168421___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMagicka05
	ap.SetArmorDataByKey("168422___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMarksman03
	ap.SetArmorDataByKey("168423___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMarksman04
	ap.SetArmorDataByKey("168424___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetMarksman05
	ap.SetArmorDataByKey("168425___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetRestoration03
	ap.SetArmorDataByKey("168426___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetRestoration04
	ap.SetArmorDataByKey("168427___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetRestoration05
	ap.SetArmorDataByKey("168428___Dragonborn.esm", ap.GEARTYPE_HEAD, 55, 29, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyHelmetWaterbreathing

	ap.SetArmorDataByKey("118165___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldHelmet
	ap.SetArmorDataByKey("240419___Dragonborn.esm", ap.GEARTYPE_HEAD, 40, 29, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldImprovedHelmet
	ap.SetArmorDataByKey("165113___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlchemy01
	ap.SetArmorDataByKey("165114___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlchemy02
	ap.SetArmorDataByKey("165115___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlchemy03
	ap.SetArmorDataByKey("165116___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlteration01
	ap.SetArmorDataByKey("165117___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlteration02
	ap.SetArmorDataByKey("165118___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetAlteration03
	ap.SetArmorDataByKey("165119___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetConjuration01
	ap.SetArmorDataByKey("165120___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetConjuration02
	ap.SetArmorDataByKey("165121___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetConjuration03
	ap.SetArmorDataByKey("165122___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetDestruction01
	ap.SetArmorDataByKey("165123___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetDestruction02
	ap.SetArmorDataByKey("165124___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetDestruction03
	ap.SetArmorDataByKey("165125___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetIllusion01
	ap.SetArmorDataByKey("165126___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetIllusion02
	ap.SetArmorDataByKey("165127___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetIllusion03
	ap.SetArmorDataByKey("165128___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetMagicka01
	ap.SetArmorDataByKey("165129___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetMagicka02
	ap.SetArmorDataByKey("165130___Dragonborn.esm", ap.GEARTYPE_HEAD, 35, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldHelmetMagicka03

	ap.SetArmorDataByKey("118156___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinHeavyHelmet
	ap.SetArmorDataByKey("168327___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlchemy02
	ap.SetArmorDataByKey("168328___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlchemy03
	ap.SetArmorDataByKey("168329___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlchemy04
	ap.SetArmorDataByKey("168330___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlteration02
	ap.SetArmorDataByKey("168331___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlteration03
	ap.SetArmorDataByKey("168332___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetAlteration04
	ap.SetArmorDataByKey("168333___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetConjuration02
	ap.SetArmorDataByKey("168334___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetConjuration03
	ap.SetArmorDataByKey("168335___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetConjuration04
	ap.SetArmorDataByKey("168336___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetDestruction02
	ap.SetArmorDataByKey("168337___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetDestruction03
	ap.SetArmorDataByKey("168338___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetDestruction04
	ap.SetArmorDataByKey("168339___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetIllusion02
	ap.SetArmorDataByKey("168340___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetIllusion03
	ap.SetArmorDataByKey("168341___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetIllusion04
	ap.SetArmorDataByKey("168342___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMagicka02
	ap.SetArmorDataByKey("168343___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMagicka03
	ap.SetArmorDataByKey("168344___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMagicka04
	ap.SetArmorDataByKey("168345___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMarksman02
	ap.SetArmorDataByKey("168346___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMarksman03
	ap.SetArmorDataByKey("168347___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetMarksman04
	ap.SetArmorDataByKey("168348___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetRestoration02
	ap.SetArmorDataByKey("168349___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetRestoration03
	ap.SetArmorDataByKey("168350___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetRestoration04
	ap.SetArmorDataByKey("168351___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyHelmetWaterbreathing

	ap.SetArmorDataByKey("118153___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinLightHelmet
	ap.SetArmorDataByKey("167960___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlchemy02
	ap.SetArmorDataByKey("167961___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlchemy03
	ap.SetArmorDataByKey("167962___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlchemy04
	ap.SetArmorDataByKey("167963___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlteration02
	ap.SetArmorDataByKey("167964___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlteration03
	ap.SetArmorDataByKey("167965___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetAlteration04
	ap.SetArmorDataByKey("167966___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetConjuration02
	ap.SetArmorDataByKey("167967___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetConjuration03
	ap.SetArmorDataByKey("167968___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetConjuration04
	ap.SetArmorDataByKey("167969___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetDestruction02
	ap.SetArmorDataByKey("167970___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetDestruction03
	ap.SetArmorDataByKey("167972___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetDestruction04
	ap.SetArmorDataByKey("167971___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetIllusion02
	ap.SetArmorDataByKey("167973___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetIllusion03
	ap.SetArmorDataByKey("167974___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetIllusion04
	ap.SetArmorDataByKey("167975___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMagicka02
	ap.SetArmorDataByKey("167976___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMagicka03
	ap.SetArmorDataByKey("167977___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMagicka04
	ap.SetArmorDataByKey("167978___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMarksman02
	ap.SetArmorDataByKey("167979___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMarksman03
	ap.SetArmorDataByKey("167980___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetMarksman04
	ap.SetArmorDataByKey("167981___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetRestoration02
	ap.SetArmorDataByKey("167982___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetRestoration03
	ap.SetArmorDataByKey("167983___Dragonborn.esm", ap.GEARTYPE_HEAD, 30, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightHelmetRestoration04

	ap.SetArmorDataByKey("147710___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2ArmorAcolyteMaskFire
	ap.SetArmorDataByKey("147711___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2ArmorAcolyteMaskFrost
	ap.SetArmorDataByKey("147511___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2ArmorAcolyteMaskShock
	ap.SetArmorDataByKey("170594___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MiraakMaskNew
	ap.SetArmorDataByKey("237473___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask1H
	ap.SetArmorDataByKey("236843___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask1L
	ap.SetArmorDataByKey("237474___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask2H
	ap.SetArmorDataByKey("236846___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask2L
	ap.SetArmorDataByKey("237475___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask3H
	ap.SetArmorDataByKey("236847___Dragonborn.esm", ap.GEARTYPE_HEAD, 10, 0, abExportToDefaults = true, abSave = false) ; DLC2MKMiraakMask3L
endFunction

function SetDefaults_Hands()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	ap.SetArmorDataByKey("80146___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; ArmorHideGauntlets
	ap.SetArmorDataByKey("571007___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsAlchemy01
	ap.SetArmorDataByKey("571008___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsAlchemy02
	ap.SetArmorDataByKey("571009___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsAlchemy03
	ap.SetArmorDataByKey("500041___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsLockpicking01
	ap.SetArmorDataByKey("709805___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsLockpicking02
	ap.SetArmorDataByKey("709806___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsLockpicking03
	ap.SetArmorDataByKey("500042___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsMarksman01
	ap.SetArmorDataByKey("709807___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsMarksman02
	ap.SetArmorDataByKey("709808___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsMarksman03
	ap.SetArmorDataByKey("500043___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsOneHanded01
	ap.SetArmorDataByKey("709809___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsOneHanded02
	ap.SetArmorDataByKey("709810___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsOneHanded03
	ap.SetArmorDataByKey("500044___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsPickpocket01
	ap.SetArmorDataByKey("709811___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsPickpocket02
	ap.SetArmorDataByKey("709812___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsPickpocket03
	ap.SetArmorDataByKey("500046___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsSmithing01
	ap.SetArmorDataByKey("709815___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsSmithing02
	ap.SetArmorDataByKey("709816___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsSmithing03
	ap.SetArmorDataByKey("500047___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsTwoHanded01
	ap.SetArmorDataByKey("709817___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsTwoHanded02
	ap.SetArmorDataByKey("709818___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 0, abExportToDefaults = true, abSave = false) ; EnchArmorHideGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("455579___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorBanditGauntlets
	
	ap.SetArmorDataByKey("80161___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; ArmorLeatherGauntlets
	ap.SetArmorDataByKey("571019___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsAlchemy01
	ap.SetArmorDataByKey("571020___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsAlchemy02
	ap.SetArmorDataByKey("571021___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsAlchemy03
	ap.SetArmorDataByKey("741453___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsLockpicking01
	ap.SetArmorDataByKey("741454___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsLockpicking02
	ap.SetArmorDataByKey("741455___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsLockpicking03
	ap.SetArmorDataByKey("741456___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsMarksman01
	ap.SetArmorDataByKey("741457___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsMarksman02
	ap.SetArmorDataByKey("741458___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsMarksman03
	ap.SetArmorDataByKey("741459___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsOneHanded01
	ap.SetArmorDataByKey("741460___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsOneHanded02
	ap.SetArmorDataByKey("741461___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsOneHanded03
	ap.SetArmorDataByKey("741462___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsPickpocket01
	ap.SetArmorDataByKey("741463___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsPickpocket02
	ap.SetArmorDataByKey("741464___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsPickpocket03
	ap.SetArmorDataByKey("741468___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsSmithing01
	ap.SetArmorDataByKey("741469___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsSmithing02
	ap.SetArmorDataByKey("741470___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsSmithing03
	ap.SetArmorDataByKey("741471___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsTwoHanded01
	ap.SetArmorDataByKey("741472___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsTwoHanded02
	ap.SetArmorDataByKey("741473___Skyrim.esm", ap.GEARTYPE_HANDS, 5, 6, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("80156___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; ArmorElvenGauntlets
	ap.SetArmorDataByKey("1072915___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; ArmorElvenLightGauntlets
	ap.SetArmorDataByKey("570998___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsAlchemy02
	ap.SetArmorDataByKey("570999___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsAlchemy03
	ap.SetArmorDataByKey("571000___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsAlchemy04
	ap.SetArmorDataByKey("778202___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsLockpicking02
	ap.SetArmorDataByKey("778203___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsLockpicking03
	ap.SetArmorDataByKey("778312___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsLockpicking04
	ap.SetArmorDataByKey("778204___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsMarksman02
	ap.SetArmorDataByKey("778205___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsMarksman03
	ap.SetArmorDataByKey("778313___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsMarksman04
	ap.SetArmorDataByKey("778206___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsOneHanded02
	ap.SetArmorDataByKey("778207___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsOneHanded03
	ap.SetArmorDataByKey("778314___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsOneHanded04
	ap.SetArmorDataByKey("778208___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsPickpocket02
	ap.SetArmorDataByKey("778209___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsPickpocket03
	ap.SetArmorDataByKey("778315___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsPickpocket04
	ap.SetArmorDataByKey("778212___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsSmithing02
	ap.SetArmorDataByKey("778213___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsSmithing03
	ap.SetArmorDataByKey("778317___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsSmithing04
	ap.SetArmorDataByKey("778214___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsTwoHanded02
	ap.SetArmorDataByKey("778215___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsTwoHanded03
	ap.SetArmorDataByKey("778318___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("111520___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorScaledGauntlets
	ap.SetArmorDataByKey("289744___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsAlchemy02
	ap.SetArmorDataByKey("289745___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsAlchemy03
	ap.SetArmorDataByKey("289746___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsAlchemy04
	ap.SetArmorDataByKey("289766___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsLockpicking02
	ap.SetArmorDataByKey("289767___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsLockpicking03
	ap.SetArmorDataByKey("289768___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsLockpicking04
	ap.SetArmorDataByKey("289769___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsMarksman02
	ap.SetArmorDataByKey("289770___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsMarksman03
	ap.SetArmorDataByKey("289771___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsMarksman04
	ap.SetArmorDataByKey("289913___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsOneHanded02
	ap.SetArmorDataByKey("289914___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsOneHanded03
	ap.SetArmorDataByKey("289916___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsOneHanded04
	ap.SetArmorDataByKey("289917___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsPickpocket02
	ap.SetArmorDataByKey("289919___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsPickpocket03
	ap.SetArmorDataByKey("289920___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsPickpocket04
	ap.SetArmorDataByKey("289950___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsSmithing02
	ap.SetArmorDataByKey("290010___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsSmithing03
	ap.SetArmorDataByKey("290026___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsSmithing04
	ap.SetArmorDataByKey("290035___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsTwoHanded02
	ap.SetArmorDataByKey("290036___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsTwoHanded03
	ap.SetArmorDataByKey("290037___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("80186___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorGlassGauntlets
	ap.SetArmorDataByKey("873367___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsAlchemy03
	ap.SetArmorDataByKey("873368___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsAlchemy04
	ap.SetArmorDataByKey("873369___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsAlchemy05
	ap.SetArmorDataByKey("1036017___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsLockpicking03
	ap.SetArmorDataByKey("1036018___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsLockpicking04
	ap.SetArmorDataByKey("1036019___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsLockpicking05
	ap.SetArmorDataByKey("873388___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsMarksman03
	ap.SetArmorDataByKey("873389___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsMarksman04
	ap.SetArmorDataByKey("873390___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsMarksman05
	ap.SetArmorDataByKey("873391___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsOneHanded03
	ap.SetArmorDataByKey("873392___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsOneHanded04
	ap.SetArmorDataByKey("873393___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsOneHanded05
	ap.SetArmorDataByKey("1036020___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsPickpocket03
	ap.SetArmorDataByKey("1036021___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsPickpocket04
	ap.SetArmorDataByKey("1036022___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsPickpocket05
	ap.SetArmorDataByKey("873397___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsSmithing03
	ap.SetArmorDataByKey("873398___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsSmithing04
	ap.SetArmorDataByKey("873399___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsSmithing05
	ap.SetArmorDataByKey("873403___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsTwoHanded03
	ap.SetArmorDataByKey("873404___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsTwoHanded04
	ap.SetArmorDataByKey("873405___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassGauntletsTwoHanded05
	
	ap.SetArmorDataByKey("80191___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; ArmorDragonscaleGauntlets
	ap.SetArmorDataByKey("883152___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsAlchemy04
	ap.SetArmorDataByKey("883153___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsAlchemy05
	ap.SetArmorDataByKey("883154___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsAlchemy06
	ap.SetArmorDataByKey("1105777___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsLockpicking04
	ap.SetArmorDataByKey("1105778___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsLockpicking05
	ap.SetArmorDataByKey("1105779___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsLockpicking06
	ap.SetArmorDataByKey("883173___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsMarksman04
	ap.SetArmorDataByKey("883174___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsMarksman05
	ap.SetArmorDataByKey("883175___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsMarksman06
	ap.SetArmorDataByKey("883176___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsOneHanded04
	ap.SetArmorDataByKey("883177___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsOneHanded05
	ap.SetArmorDataByKey("883178___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsOneHanded06
	ap.SetArmorDataByKey("1105774___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsPickpocket04
	ap.SetArmorDataByKey("1105775___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsPickpocket05
	ap.SetArmorDataByKey("1105776___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsPickpocket06
	ap.SetArmorDataByKey("883182___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsSmithing04
	ap.SetArmorDataByKey("883183___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsSmithing05
	ap.SetArmorDataByKey("883184___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsSmithing06
	ap.SetArmorDataByKey("883185___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsTwoHanded04
	ap.SetArmorDataByKey("883186___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsTwoHanded05
	ap.SetArmorDataByKey("883187___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleGauntletsTwoHanded06
	
	ap.SetArmorDataByKey("77382___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; ArmorIronGauntlets
	ap.SetArmorDataByKey("802022___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; FavorOrcsGauntlets
	ap.SetArmorDataByKey("571016___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsAlchemy01
	ap.SetArmorDataByKey("571017___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsAlchemy02
	ap.SetArmorDataByKey("571018___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsAlchemy03
	ap.SetArmorDataByKey("500012___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsMarksman01
	ap.SetArmorDataByKey("710011___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsMarksman02
	ap.SetArmorDataByKey("710012___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsMarksman03
	ap.SetArmorDataByKey("500014___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsOneHanded01
	ap.SetArmorDataByKey("710013___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsOneHanded02
	ap.SetArmorDataByKey("710014___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsOneHanded03
	ap.SetArmorDataByKey("500018___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsSmithing01
	ap.SetArmorDataByKey("710019___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsSmithing02
	ap.SetArmorDataByKey("710020___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsSmithing03
	ap.SetArmorDataByKey("500020___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsTwoHanded01
	ap.SetArmorDataByKey("710021___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsTwoHanded02
	ap.SetArmorDataByKey("710022___Skyrim.esm", ap.GEARTYPE_HANDS, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("80211___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorSteelGauntletsA
	ap.SetArmorDataByKey("1011491___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorSteelGauntletsB
	ap.SetArmorDataByKey("571025___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsAlchemy01
	ap.SetArmorDataByKey("571026___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsAlchemy02
	ap.SetArmorDataByKey("571027___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsAlchemy03
	ap.SetArmorDataByKey("741566___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsMarksman01
	ap.SetArmorDataByKey("741579___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsMarksman02
	ap.SetArmorDataByKey("741580___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsMarksman03
	ap.SetArmorDataByKey("741567___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsOneHanded01
	ap.SetArmorDataByKey("741581___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsOneHanded02
	ap.SetArmorDataByKey("741582___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsOneHanded03
	ap.SetArmorDataByKey("741569___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsSmithing01
	ap.SetArmorDataByKey("571028___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsSmithing02
	ap.SetArmorDataByKey("571029___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsSmithing03
	ap.SetArmorDataByKey("741570___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsTwoHanded01
	ap.SetArmorDataByKey("741585___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsTwoHanded02
	ap.SetArmorDataByKey("741586___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorSteelGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("80206___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; ArmorDwarvenGauntlets
	ap.SetArmorDataByKey("570995___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsAlchemy02
	ap.SetArmorDataByKey("570996___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsAlchemy03
	ap.SetArmorDataByKey("570997___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsAlchemy04
	ap.SetArmorDataByKey("111611___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsMarksman02
	ap.SetArmorDataByKey("111612___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsMarksman03
	ap.SetArmorDataByKey("111613___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsMarksman04
	ap.SetArmorDataByKey("112469___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsOneHanded02
	ap.SetArmorDataByKey("112470___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsOneHanded03
	ap.SetArmorDataByKey("112471___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsOneHanded04
	ap.SetArmorDataByKey("112481___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsSmithing02
	ap.SetArmorDataByKey("112482___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsSmithing03
	ap.SetArmorDataByKey("112486___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsSmithing04
	ap.SetArmorDataByKey("112487___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsTwoHanded02
	ap.SetArmorDataByKey("112488___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsTwoHanded03
	ap.SetArmorDataByKey("112490___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("80221___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelPlateGauntlets
	ap.SetArmorDataByKey("571033___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsAlchemy02
	ap.SetArmorDataByKey("571034___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsAlchemy03
	ap.SetArmorDataByKey("571035___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsAlchemy04
	ap.SetArmorDataByKey("253739___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsMarksman02
	ap.SetArmorDataByKey("253772___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsMarksman03
	ap.SetArmorDataByKey("253794___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsMarksman04
	ap.SetArmorDataByKey("253798___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsOneHanded02
	ap.SetArmorDataByKey("253799___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsOneHanded03
	ap.SetArmorDataByKey("253803___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsOneHanded04
	ap.SetArmorDataByKey("253811___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsSmithing02
	ap.SetArmorDataByKey("253812___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsSmithing03
	ap.SetArmorDataByKey("253813___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsSmithing04
	ap.SetArmorDataByKey("253814___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsTwoHanded02
	ap.SetArmorDataByKey("253815___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsTwoHanded03
	ap.SetArmorDataByKey("253816___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("80216___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorOrcishGauntlets
	ap.SetArmorDataByKey("849880___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsAlchemy03
	ap.SetArmorDataByKey("849881___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsAlchemy04
	ap.SetArmorDataByKey("849882___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsAlchemy05
	ap.SetArmorDataByKey("849901___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsMarksman03
	ap.SetArmorDataByKey("849902___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsMarksman04
	ap.SetArmorDataByKey("849903___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsMarksman05
	ap.SetArmorDataByKey("849904___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsOneHanded03
	ap.SetArmorDataByKey("849905___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsOneHanded04
	ap.SetArmorDataByKey("849906___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsOneHanded05
	ap.SetArmorDataByKey("849910___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsSmithing03
	ap.SetArmorDataByKey("849911___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsSmithing04
	ap.SetArmorDataByKey("849912___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsSmithing05
	ap.SetArmorDataByKey("849913___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsTwoHanded03
	ap.SetArmorDataByKey("849914___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsTwoHanded04
	ap.SetArmorDataByKey("849915___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishGauntletsTwoHanded05
	
	ap.SetArmorDataByKey("80226___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; ArmorEbonyGauntlets
	ap.SetArmorDataByKey("849997___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsAlchemy03
	ap.SetArmorDataByKey("849998___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsAlchemy04
	ap.SetArmorDataByKey("849999___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsAlchemy05
	ap.SetArmorDataByKey("850018___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsMarksman03
	ap.SetArmorDataByKey("850019___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsMarksman04
	ap.SetArmorDataByKey("850020___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsMarksman05
	ap.SetArmorDataByKey("850021___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsOneHanded03
	ap.SetArmorDataByKey("850022___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsOneHanded04
	ap.SetArmorDataByKey("850023___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsOneHanded05
	ap.SetArmorDataByKey("850027___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsSmithing03
	ap.SetArmorDataByKey("850028___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsSmithing04
	ap.SetArmorDataByKey("850029___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsSmithing05
	ap.SetArmorDataByKey("850030___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsTwoHanded03
	ap.SetArmorDataByKey("850031___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsTwoHanded04
	ap.SetArmorDataByKey("850032___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyGauntletsTwoHanded05
	
	ap.SetArmorDataByKey("80231___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; ArmorDragonplateGauntlets
	ap.SetArmorDataByKey("883260___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsAlchemy04
	ap.SetArmorDataByKey("883261___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsAlchemy05
	ap.SetArmorDataByKey("883262___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsAlchemy06
	ap.SetArmorDataByKey("883281___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsMarksman04
	ap.SetArmorDataByKey("883282___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsMarksman05
	ap.SetArmorDataByKey("883283___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsMarksman06
	ap.SetArmorDataByKey("883284___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsOneHanded04
	ap.SetArmorDataByKey("883285___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsOneHanded05
	ap.SetArmorDataByKey("883286___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsOneHanded06
	ap.SetArmorDataByKey("883290___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsSmithing04
	ap.SetArmorDataByKey("883291___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsSmithing05
	ap.SetArmorDataByKey("883292___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsSmithing06
	ap.SetArmorDataByKey("883293___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsTwoHanded04
	ap.SetArmorDataByKey("883294___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsTwoHanded05
	ap.SetArmorDataByKey("883295___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateGauntletsTwoHanded06
	
	ap.SetArmorDataByKey("80236___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; ArmorDaedricGauntlets
	ap.SetArmorDataByKey("883374___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsAlchemy04
	ap.SetArmorDataByKey("883375___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsAlchemy05
	ap.SetArmorDataByKey("883376___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsAlchemy06
	ap.SetArmorDataByKey("883395___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsMarksman04
	ap.SetArmorDataByKey("883396___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsMarksman05
	ap.SetArmorDataByKey("883397___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsMarksman06
	ap.SetArmorDataByKey("883398___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsOneHanded04
	ap.SetArmorDataByKey("883399___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsOneHanded05
	ap.SetArmorDataByKey("883400___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsOneHanded06
	ap.SetArmorDataByKey("883404___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsSmithing04
	ap.SetArmorDataByKey("883405___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsSmithing05
	ap.SetArmorDataByKey("883406___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsSmithing06
	ap.SetArmorDataByKey("883407___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsTwoHanded04
	ap.SetArmorDataByKey("883408___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsTwoHanded05
	ap.SetArmorDataByKey("883409___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricGauntletsTwoHanded06
	
	ap.SetArmorDataByKey("1105977___Skyrim.esm", ap.GEARTYPE_HANDS, 0, 0, abExportToDefaults = true, abSave = false) ; PrisonerCuffsPlayer
	
	ap.SetArmorDataByKey("307853___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorBladesGauntlets
	
	ap.SetArmorDataByKey("847486___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorCompanionsGauntlets
	
	ap.SetArmorDataByKey("862275___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorGloves
	ap.SetArmorDataByKey("1005953___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorGlovesReward
	ap.SetArmorDataByKey("925462___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorGlovesSP
	ap.SetArmorDataByKey("1108830___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorGlovesWornPlayable
	
	ap.SetArmorDataByKey("355095___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 3, abExportToDefaults = true, abSave = false) ; ArmorDraugrGauntlets
	
	ap.SetArmorDataByKey("683389___Skyrim.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakGauntlets
	
	ap.SetArmorDataByKey("79572___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorImperialGauntlets
	ap.SetArmorDataByKey("81626___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorImperialLightGauntlets
	ap.SetArmorDataByKey("571010___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlchemy01
	ap.SetArmorDataByKey("571011___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlchemy02
	ap.SetArmorDataByKey("571012___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlchemy03
	ap.SetArmorDataByKey("707782___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlteration01
	ap.SetArmorDataByKey("709877___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlteration02
	ap.SetArmorDataByKey("709878___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsAlteration03
	ap.SetArmorDataByKey("707784___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsConjuration01
	ap.SetArmorDataByKey("709881___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsConjuration02
	ap.SetArmorDataByKey("709882___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsConjuration03
	ap.SetArmorDataByKey("707785___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsDestruction01
	ap.SetArmorDataByKey("709883___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsDestruction02
	ap.SetArmorDataByKey("709884___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsDestruction03
	ap.SetArmorDataByKey("707789___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsMarksman01
	ap.SetArmorDataByKey("709891___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsMarksman02
	ap.SetArmorDataByKey("709892___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsMarksman03
	ap.SetArmorDataByKey("707790___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsOneHanded01
	ap.SetArmorDataByKey("759623___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsOneHanded02
	ap.SetArmorDataByKey("709894___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsOneHanded03
	ap.SetArmorDataByKey("707793___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsSmithing01
	ap.SetArmorDataByKey("709899___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsSmithing02
	ap.SetArmorDataByKey("709900___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsSmithing03
	ap.SetArmorDataByKey("707794___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsTwoHanded01
	ap.SetArmorDataByKey("709901___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsTwoHanded02
	ap.SetArmorDataByKey("709902___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialGauntletsTwoHanded03
	ap.SetArmorDataByKey("571013___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlchemy01
	ap.SetArmorDataByKey("571014___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlchemy02
	ap.SetArmorDataByKey("571015___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlchemy03
	ap.SetArmorDataByKey("759598___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlteration01
	ap.SetArmorDataByKey("759599___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlteration02
	ap.SetArmorDataByKey("759600___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsAlteration03
	ap.SetArmorDataByKey("759604___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsConjuration01
	ap.SetArmorDataByKey("759605___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsConjuration02
	ap.SetArmorDataByKey("759606___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsConjuration03
	ap.SetArmorDataByKey("759607___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsDestruction01
	ap.SetArmorDataByKey("759608___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsDestruction02
	ap.SetArmorDataByKey("759609___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsDestruction03
	ap.SetArmorDataByKey("759616___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsLockpicking01
	ap.SetArmorDataByKey("759617___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsLockpicking02
	ap.SetArmorDataByKey("759618___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsLockpicking03
	ap.SetArmorDataByKey("759619___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsMarksman01
	ap.SetArmorDataByKey("759620___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsMarksman02
	ap.SetArmorDataByKey("759621___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsMarksman03
	ap.SetArmorDataByKey("759622___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsOneHanded01
	ap.SetArmorDataByKey("709893___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsOneHanded02
	ap.SetArmorDataByKey("759624___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsOneHanded03
	ap.SetArmorDataByKey("759625___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsPickpocket01
	ap.SetArmorDataByKey("759626___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsPickpocket02
	ap.SetArmorDataByKey("759627___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsPickpocket03
	ap.SetArmorDataByKey("759631___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsSmithing01
	ap.SetArmorDataByKey("759632___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsSmithing02
	ap.SetArmorDataByKey("759633___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsSmithing03
	ap.SetArmorDataByKey("759634___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsTwoHanded01
	ap.SetArmorDataByKey("759635___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsTwoHanded02
	ap.SetArmorDataByKey("759636___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("551299___Skyrim.esm", ap.GEARTYPE_HANDS, 18, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakBearGauntlets

	ap.SetArmorDataByKey("416691___Skyrim.esm", ap.GEARTYPE_HANDS, 9, 3, abExportToDefaults = true, abSave = false) ; ClothesThalmorGloves
	
	ap.SetArmorDataByKey("867012___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildGauntletsPlayer
	ap.SetArmorDataByKey("867021___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildGauntletsPlayerImproved
	ap.SetArmorDataByKey("931288___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildLeaderGauntlets
	ap.SetArmorDataByKey("1082693___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorLinweGauntlets
	
	ap.SetArmorDataByKey("383879___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleGauntletsPlayer01
	ap.SetArmorDataByKey("1035280___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleGauntletsPlayer02
	ap.SetArmorDataByKey("1035281___Skyrim.esm", ap.GEARTYPE_HANDS, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleGauntletsPlayer03

	ap.SetArmorDataByKey("962514___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 6, abExportToDefaults = true, abSave = false) ; MS02ForswornGauntlets
	ap.SetArmorDataByKey("888149___Skyrim.esm", ap.GEARTYPE_HANDS, 3, 6, abExportToDefaults = true, abSave = false) ; ForswornGauntlets

	ap.SetArmorDataByKey("868011___Skyrim.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; ArmorPenitusGauntlets

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	ap.SetArmorDataByKey("83800___Dawnguard.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardGauntletsHeavy
	ap.SetArmorDataByKey("62462___Dawnguard.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardGauntletsLight

	;@TODO: Is 'heavy' same as regular Falmer?
	ap.SetArmorDataByKey("59615___Dawnguard.esm", ap.GEARTYPE_HANDS, 5, 3, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHardenedGauntlets
	ap.SetArmorDataByKey("9197___Dawnguard.esm", ap.GEARTYPE_HANDS, 5, 3, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHeavyGauntlets

	ap.SetArmorDataByKey("107807___Dawnguard.esm", ap.GEARTYPE_HANDS, 12, 21, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireGauntlets

	ap.SetArmorDataByKey("51223___Dawnguard.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; DLC1IvoryGauntlets

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	ap.SetArmorDataByKey("118176___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimHeavyGauntlets
	ap.SetArmorDataByKey("168487___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy04
	ap.SetArmorDataByKey("168488___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy05
	ap.SetArmorDataByKey("168489___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsAlchemy06
	ap.SetArmorDataByKey("168490___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman04
	ap.SetArmorDataByKey("168491___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman05
	ap.SetArmorDataByKey("168492___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsMarksman06
	ap.SetArmorDataByKey("168493___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded04
	ap.SetArmorDataByKey("168494___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded05
	ap.SetArmorDataByKey("168495___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsOneHanded06
	ap.SetArmorDataByKey("168496___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing04
	ap.SetArmorDataByKey("168497___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing05
	ap.SetArmorDataByKey("168498___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsSmithing06
	ap.SetArmorDataByKey("168499___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded04
	ap.SetArmorDataByKey("168500___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded05
	ap.SetArmorDataByKey("168501___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyGauntletsTwoHanded06
	
	ap.SetArmorDataByKey("118181___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimLightGauntlets
	ap.SetArmorDataByKey("168128___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy03
	ap.SetArmorDataByKey("168129___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy04
	ap.SetArmorDataByKey("168130___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsAlchemy05
	ap.SetArmorDataByKey("168131___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking03
	ap.SetArmorDataByKey("168132___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking04
	ap.SetArmorDataByKey("168133___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsLockpicking05
	ap.SetArmorDataByKey("168134___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsMarksman03
	ap.SetArmorDataByKey("168135___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsMarksman04
	ap.SetArmorDataByKey("168136___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsMarksman05
	ap.SetArmorDataByKey("168137___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded03
	ap.SetArmorDataByKey("168138___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded04
	ap.SetArmorDataByKey("168139___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsOneHanded05
	ap.SetArmorDataByKey("168140___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket03
	ap.SetArmorDataByKey("168141___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket04
	ap.SetArmorDataByKey("168142___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsPickpocket05
	ap.SetArmorDataByKey("168143___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsSmithing03
	ap.SetArmorDataByKey("168144___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsSmithing04
	ap.SetArmorDataByKey("168145___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsSmithing05
	ap.SetArmorDataByKey("168146___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded03
	ap.SetArmorDataByKey("168147___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded04
	ap.SetArmorDataByKey("168148___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightGauntletsTwoHanded05
	
	ap.SetArmorDataByKey("118168___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2ArmorNordicHeavyGauntlets
	ap.SetArmorDataByKey("168389___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy03
	ap.SetArmorDataByKey("168390___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy04
	ap.SetArmorDataByKey("168391___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsAlchemy05
	ap.SetArmorDataByKey("168392___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsMarksman03
	ap.SetArmorDataByKey("168393___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsMarksman04
	ap.SetArmorDataByKey("168394___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsMarksman05
	ap.SetArmorDataByKey("168395___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded03
	ap.SetArmorDataByKey("168396___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded04
	ap.SetArmorDataByKey("168397___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsOneHanded05
	ap.SetArmorDataByKey("168398___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsSmithing03
	ap.SetArmorDataByKey("168399___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsSmithing04
	ap.SetArmorDataByKey("168400___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsSmithing05
	ap.SetArmorDataByKey("168401___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded03
	ap.SetArmorDataByKey("168402___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded04
	ap.SetArmorDataByKey("168403___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyGauntletsTwoHanded05
	
	ap.SetArmorDataByKey("118164___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldGauntlets
	ap.SetArmorDataByKey("240418___Dragonborn.esm", ap.GEARTYPE_HANDS, 15, 21, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldImprovedGauntlets
	ap.SetArmorDataByKey("165083___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlchemy01
	ap.SetArmorDataByKey("165084___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlchemy02
	ap.SetArmorDataByKey("165085___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlchemy03
	ap.SetArmorDataByKey("165086___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlteration01
	ap.SetArmorDataByKey("165087___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlteration02
	ap.SetArmorDataByKey("165088___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsAlteration03
	ap.SetArmorDataByKey("165089___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsConjuration01
	ap.SetArmorDataByKey("165090___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsConjuration02
	ap.SetArmorDataByKey("165091___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsConjuration03
	ap.SetArmorDataByKey("165092___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsDestruction01
	ap.SetArmorDataByKey("165093___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsDestruction02
	ap.SetArmorDataByKey("165094___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsDestruction03
	ap.SetArmorDataByKey("165095___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsLockpicking01
	ap.SetArmorDataByKey("165096___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsLockpicking02
	ap.SetArmorDataByKey("165097___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsLockpicking03
	ap.SetArmorDataByKey("165098___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsMarksman01
	ap.SetArmorDataByKey("165099___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsMarksman02
	ap.SetArmorDataByKey("165100___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsMarksman03
	ap.SetArmorDataByKey("165101___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsOneHanded01
	ap.SetArmorDataByKey("165102___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsOneHanded02
	ap.SetArmorDataByKey("165103___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsOneHanded03
	ap.SetArmorDataByKey("165104___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsPickpocket01
	ap.SetArmorDataByKey("165105___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsPickpocket02
	ap.SetArmorDataByKey("165106___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsPickpocket03
	ap.SetArmorDataByKey("165107___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsSmithing01
	ap.SetArmorDataByKey("165108___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsSmithing02
	ap.SetArmorDataByKey("165109___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsSmithing03
	ap.SetArmorDataByKey("165110___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsTwoHanded01
	ap.SetArmorDataByKey("165111___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsTwoHanded02
	ap.SetArmorDataByKey("165112___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldGauntletsTwoHanded03
	
	ap.SetArmorDataByKey("118155___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinHeavyGauntlets
	ap.SetArmorDataByKey("168312___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy02
	ap.SetArmorDataByKey("168313___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy03
	ap.SetArmorDataByKey("168314___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsAlchemy04
	ap.SetArmorDataByKey("168315___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsMarksman02
	ap.SetArmorDataByKey("168316___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsMarksman03
	ap.SetArmorDataByKey("168317___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsMarksman04
	ap.SetArmorDataByKey("168318___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded02
	ap.SetArmorDataByKey("168319___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded03
	ap.SetArmorDataByKey("168320___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsOneHanded04
	ap.SetArmorDataByKey("168321___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsSmithing02
	ap.SetArmorDataByKey("168322___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsSmithing03
	ap.SetArmorDataByKey("168323___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsSmithing04
	ap.SetArmorDataByKey("168324___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded02
	ap.SetArmorDataByKey("168325___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded03
	ap.SetArmorDataByKey("168326___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("118152___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinLightGauntlets
	ap.SetArmorDataByKey("167939___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsAlchemy02
	ap.SetArmorDataByKey("167940___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsAlchemy03
	ap.SetArmorDataByKey("167941___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsAlchemy04
	ap.SetArmorDataByKey("167942___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsLockpicking02
	ap.SetArmorDataByKey("167943___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsLockpicking03
	ap.SetArmorDataByKey("167944___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsLockpicking04
	ap.SetArmorDataByKey("167945___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsMarksman02
	ap.SetArmorDataByKey("167946___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsMarksman03
	ap.SetArmorDataByKey("167947___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsMarksman04
	ap.SetArmorDataByKey("167948___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsOneHanded02
	ap.SetArmorDataByKey("167949___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsOneHanded03
	ap.SetArmorDataByKey("167950___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsOneHanded04
	ap.SetArmorDataByKey("167951___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsPickpocket02
	ap.SetArmorDataByKey("167952___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsPickpocket03
	ap.SetArmorDataByKey("167953___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsPickpocket04
	ap.SetArmorDataByKey("167954___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsSmithing02
	ap.SetArmorDataByKey("167955___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsSmithing03
	ap.SetArmorDataByKey("167956___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsSmithing04
	ap.SetArmorDataByKey("167957___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsTwoHanded02
	ap.SetArmorDataByKey("167958___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsTwoHanded03
	ap.SetArmorDataByKey("167959___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightGauntletsTwoHanded04
	
	ap.SetArmorDataByKey("233744___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ClothesSkaalGloves
	
	ap.SetArmorDataByKey("168621___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 14, abExportToDefaults = true, abSave = false) ; DLC2MoragTongGauntlets
	
	ap.SetArmorDataByKey("121753___Dragonborn.esm", ap.GEARTYPE_HANDS, 9, 3, abExportToDefaults = true, abSave = false) ; DLC2dunKolbjornGauntlets
	
	ap.SetArmorDataByKey("147484___Dragonborn.esm", ap.GEARTYPE_HANDS, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2dunHaknirArmorGauntlets
	
	ap.SetArmorDataByKey("175410___Dragonborn.esm", ap.GEARTYPE_HANDS, 12, 29, abExportToDefaults = true, abSave = false) ; DLC2TGArmorVariantGloves

	;##############################
	;
	;    Campfire
	;
	;##############################
	ap.SetArmorDataByKey("267721___Campfire.esm", ap.GEARTYPE_HANDS, 21, 14, abExportToDefaults = true, abSave = false) ; _Camp_ArmorSonsGauntlets
endFunction

function SetDefaults_Feet()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	ap.SetArmorDataByKey("80144___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorHideBoots
	ap.SetArmorDataByKey("500021___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsCarry01
	ap.SetArmorDataByKey("709713___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsCarry02
	ap.SetArmorDataByKey("709714___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsCarry03
	ap.SetArmorDataByKey("500022___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFire01
	ap.SetArmorDataByKey("709769___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFire02
	ap.SetArmorDataByKey("709770___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFire03
	ap.SetArmorDataByKey("500023___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFrost01
	ap.SetArmorDataByKey("709771___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFrost02
	ap.SetArmorDataByKey("709772___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistFrost03
	ap.SetArmorDataByKey("500024___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistShock01
	ap.SetArmorDataByKey("709773___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistShock02
	ap.SetArmorDataByKey("709774___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsResistShock03
	ap.SetArmorDataByKey("500025___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsSneak01
	ap.SetArmorDataByKey("709775___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsSneak02
	ap.SetArmorDataByKey("709776___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsSneak03
	ap.SetArmorDataByKey("1105804___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsStamina01
	ap.SetArmorDataByKey("1105805___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsStamina02
	ap.SetArmorDataByKey("1105806___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorHideBootsStamina03
	
	ap.SetArmorDataByKey("455576___Skyrim.esm", ap.GEARTYPE_FEET, 15, 6, abExportToDefaults = true, abSave = false) ; ArmorBanditBoots
	
	ap.SetArmorDataByKey("80160___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; ArmorLeatherBoots
	ap.SetArmorDataByKey("737829___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsCarry01
	ap.SetArmorDataByKey("737830___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsCarry02
	ap.SetArmorDataByKey("737831___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsCarry03
	ap.SetArmorDataByKey("737832___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFire01
	ap.SetArmorDataByKey("737833___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFire02
	ap.SetArmorDataByKey("737834___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFire03
	ap.SetArmorDataByKey("737835___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFrost01
	ap.SetArmorDataByKey("737836___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFrost02
	ap.SetArmorDataByKey("737837___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistFrost03
	ap.SetArmorDataByKey("737838___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistShock01
	ap.SetArmorDataByKey("737839___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistShock02
	ap.SetArmorDataByKey("737840___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsResistShock03
	ap.SetArmorDataByKey("737841___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsSneak01
	ap.SetArmorDataByKey("737842___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsSneak02
	ap.SetArmorDataByKey("737843___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsSneak03
	ap.SetArmorDataByKey("1105810___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsStamina01
	ap.SetArmorDataByKey("1105811___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsStamina02
	ap.SetArmorDataByKey("1105812___Skyrim.esm", ap.GEARTYPE_FEET, 12, 21, abExportToDefaults = true, abSave = false) ; EnchArmorLeatherBootsStamina03
	
	ap.SetArmorDataByKey("80154___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; ArmorElvenBoots
	ap.SetArmorDataByKey("1072913___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; ArmorElvenLightBoots
	ap.SetArmorDataByKey("778169___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsCarry02
	ap.SetArmorDataByKey("778170___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsCarry03
	ap.SetArmorDataByKey("778171___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsCarry04
	ap.SetArmorDataByKey("778172___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFire02
	ap.SetArmorDataByKey("778173___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFire03
	ap.SetArmorDataByKey("778232___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFire04
	ap.SetArmorDataByKey("778174___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFrost02
	ap.SetArmorDataByKey("778175___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFrost03
	ap.SetArmorDataByKey("778298___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistFrost04
	ap.SetArmorDataByKey("778176___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistShock02
	ap.SetArmorDataByKey("778177___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistShock03
	ap.SetArmorDataByKey("778299___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsResistShock04
	ap.SetArmorDataByKey("778178___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsSneak02
	ap.SetArmorDataByKey("778179___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsSneak03
	ap.SetArmorDataByKey("778300___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsSneak04
	ap.SetArmorDataByKey("1105798___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsStamina02
	ap.SetArmorDataByKey("1105799___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsStamina03
	ap.SetArmorDataByKey("1105800___Skyrim.esm", ap.GEARTYPE_FEET, 9, 14, abExportToDefaults = true, abSave = false) ; EnchArmorElvenBootsStamina04
	
	ap.SetArmorDataByKey("111519___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; ArmorScaledBoots
	ap.SetArmorDataByKey("873446___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsCarry02
	ap.SetArmorDataByKey("873447___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsCarry03
	ap.SetArmorDataByKey("873448___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsCarry04
	ap.SetArmorDataByKey("873449___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFire02
	ap.SetArmorDataByKey("873450___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFire03
	ap.SetArmorDataByKey("873451___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFire04
	ap.SetArmorDataByKey("873452___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFrost02
	ap.SetArmorDataByKey("873453___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFrost03
	ap.SetArmorDataByKey("873454___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistFrost04
	ap.SetArmorDataByKey("873455___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistShock02
	ap.SetArmorDataByKey("873456___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistShock03
	ap.SetArmorDataByKey("873457___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsResistShock04
	ap.SetArmorDataByKey("873458___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsSneak02
	ap.SetArmorDataByKey("873459___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsSneak03
	ap.SetArmorDataByKey("873460___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsSneak04
	ap.SetArmorDataByKey("1105816___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsStamina02
	ap.SetArmorDataByKey("1105817___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsStamina03
	ap.SetArmorDataByKey("1105818___Skyrim.esm", ap.GEARTYPE_FEET, 12, 6, abExportToDefaults = true, abSave = false) ; EnchArmorScaledBootsStamina04
	
	ap.SetArmorDataByKey("80184___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorGlassBoots
	ap.SetArmorDataByKey("873326___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsCarry03
	ap.SetArmorDataByKey("873327___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsCarry04
	ap.SetArmorDataByKey("873328___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsCarry05
	ap.SetArmorDataByKey("873329___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsMuffle
	ap.SetArmorDataByKey("873330___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFire03
	ap.SetArmorDataByKey("873331___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFire04
	ap.SetArmorDataByKey("873332___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFire05
	ap.SetArmorDataByKey("873333___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFrost03
	ap.SetArmorDataByKey("873334___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFrost04
	ap.SetArmorDataByKey("873335___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistFrost05
	ap.SetArmorDataByKey("873336___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistShock03
	ap.SetArmorDataByKey("873337___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistShock04
	ap.SetArmorDataByKey("873338___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsResistShock05
	ap.SetArmorDataByKey("1105780___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsSneak03
	ap.SetArmorDataByKey("1105781___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsSneak04
	ap.SetArmorDataByKey("1105782___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsSneak05
	ap.SetArmorDataByKey("1105801___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsStamina03
	ap.SetArmorDataByKey("1105802___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsStamina04
	ap.SetArmorDataByKey("1105803___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorGlassBootsStamina05
	
	ap.SetArmorDataByKey("80189___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; ArmorDragonscaleBoots
	ap.SetArmorDataByKey("883111___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsCarry04
	ap.SetArmorDataByKey("883112___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsCarry05
	ap.SetArmorDataByKey("883113___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsCarry06
	ap.SetArmorDataByKey("883115___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFire04
	ap.SetArmorDataByKey("883116___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFire05
	ap.SetArmorDataByKey("883117___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFire06
	ap.SetArmorDataByKey("883118___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFrost04
	ap.SetArmorDataByKey("883119___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFrost05
	ap.SetArmorDataByKey("883120___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistFrost06
	ap.SetArmorDataByKey("883121___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistShock04
	ap.SetArmorDataByKey("883122___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistShock05
	ap.SetArmorDataByKey("883123___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsResistShock06
	ap.SetArmorDataByKey("883114___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsSneak04
	ap.SetArmorDataByKey("1038853___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsSneak05
	ap.SetArmorDataByKey("1038854___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsSneak06
	ap.SetArmorDataByKey("1105789___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsStamina04
	ap.SetArmorDataByKey("1105790___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsStamina05
	ap.SetArmorDataByKey("1105791___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonscaleBootsStamina06
	
	ap.SetArmorDataByKey("77387___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; ArmorIronBoots
	ap.SetArmorDataByKey("500000___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsCarry01
	ap.SetArmorDataByKey("709979___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsCarry02
	ap.SetArmorDataByKey("709980___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsCarry03
	ap.SetArmorDataByKey("499952___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFire01
	ap.SetArmorDataByKey("709981___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFire02
	ap.SetArmorDataByKey("709982___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFire03
	ap.SetArmorDataByKey("499953___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFrost01
	ap.SetArmorDataByKey("709983___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFrost02
	ap.SetArmorDataByKey("709984___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistFrost03
	ap.SetArmorDataByKey("301970___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistShock01
	ap.SetArmorDataByKey("709985___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistShock02
	ap.SetArmorDataByKey("709986___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsResistShock03
	ap.SetArmorDataByKey("1105807___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsStamina01
	ap.SetArmorDataByKey("1105808___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsStamina02
	ap.SetArmorDataByKey("1105809___Skyrim.esm", ap.GEARTYPE_FEET, 7, 6, abExportToDefaults = true, abSave = false) ; EnchArmorIronBootsStamina03
	
	ap.SetArmorDataByKey("80209___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelBootsA
	ap.SetArmorDataByKey("1011489___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelBootsB
	ap.SetArmorDataByKey("741530___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsCarry01
	ap.SetArmorDataByKey("741531___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsCarry02
	ap.SetArmorDataByKey("741532___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsCarry03
	ap.SetArmorDataByKey("600693___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsMuffle
	ap.SetArmorDataByKey("741533___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFire01
	ap.SetArmorDataByKey("741534___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFire02
	ap.SetArmorDataByKey("741535___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFire03
	ap.SetArmorDataByKey("741536___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFrost01
	ap.SetArmorDataByKey("741625___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFrost02
	ap.SetArmorDataByKey("741537___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistFrost03
	ap.SetArmorDataByKey("741538___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistShock01
	ap.SetArmorDataByKey("741539___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistShock02
	ap.SetArmorDataByKey("741540___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsResistShock03
	ap.SetArmorDataByKey("1105819___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsStamina01
	ap.SetArmorDataByKey("1105820___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsStamina02
	ap.SetArmorDataByKey("1105821___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelBootsStamina03
	
	ap.SetArmorDataByKey("80204___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; ArmorDwarvenBoots
	ap.SetArmorDataByKey("111413___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsCarry02
	ap.SetArmorDataByKey("111421___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsCarry03
	ap.SetArmorDataByKey("111563___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsCarry04
	ap.SetArmorDataByKey("600713___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsMuffle
	ap.SetArmorDataByKey("111564___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFire02
	ap.SetArmorDataByKey("111565___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFire03
	ap.SetArmorDataByKey("111566___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFire04
	ap.SetArmorDataByKey("111567___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFrost02
	ap.SetArmorDataByKey("111568___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFrost03
	ap.SetArmorDataByKey("111569___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistFrost04
	ap.SetArmorDataByKey("111570___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistShock02
	ap.SetArmorDataByKey("111571___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistShock03
	ap.SetArmorDataByKey("111572___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsResistShock04
	ap.SetArmorDataByKey("1105792___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsStamina02
	ap.SetArmorDataByKey("1105793___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsStamina03
	ap.SetArmorDataByKey("1105794___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDwarvenBootsStamina04
	
	ap.SetArmorDataByKey("80219___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; ArmorSteelPlateBoots
	ap.SetArmorDataByKey("111391___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsCarry02
	ap.SetArmorDataByKey("111614___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsCarry03
	ap.SetArmorDataByKey("111615___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsCarry04
	ap.SetArmorDataByKey("600718___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsMuffle
	ap.SetArmorDataByKey("111616___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFire02
	ap.SetArmorDataByKey("111617___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFire03
	ap.SetArmorDataByKey("111618___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFire04
	ap.SetArmorDataByKey("111619___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFrost02
	ap.SetArmorDataByKey("111620___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFrost03
	ap.SetArmorDataByKey("111621___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistFrost04
	ap.SetArmorDataByKey("111622___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistShock02
	ap.SetArmorDataByKey("111623___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistShock03
	ap.SetArmorDataByKey("111624___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsResistShock04
	ap.SetArmorDataByKey("1105822___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsStamina02
	ap.SetArmorDataByKey("1105823___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsStamina03
	ap.SetArmorDataByKey("1105824___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorSteelPlateBootsStamina04
	
	ap.SetArmorDataByKey("80214___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorOrcishBoots
	ap.SetArmorDataByKey("849839___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsCarry03
	ap.SetArmorDataByKey("849840___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsCarry04
	ap.SetArmorDataByKey("849841___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsCarry05
	ap.SetArmorDataByKey("849842___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsMuffle
	ap.SetArmorDataByKey("849843___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFire03
	ap.SetArmorDataByKey("849844___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFire04
	ap.SetArmorDataByKey("849845___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFire05
	ap.SetArmorDataByKey("849846___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFrost03
	ap.SetArmorDataByKey("849847___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFrost04
	ap.SetArmorDataByKey("849848___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistFrost05
	ap.SetArmorDataByKey("849849___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistShock03
	ap.SetArmorDataByKey("849850___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistShock04
	ap.SetArmorDataByKey("849851___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsResistShock05
	ap.SetArmorDataByKey("1105813___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsStamina03
	ap.SetArmorDataByKey("1105814___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsStamina04
	ap.SetArmorDataByKey("1105815___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; EnchArmorOrcishBootsStamina05
	
	ap.SetArmorDataByKey("80224___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; ArmorEbonyBoots
	ap.SetArmorDataByKey("849956___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsCarry03
	ap.SetArmorDataByKey("849957___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsCarry04
	ap.SetArmorDataByKey("849958___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsCarry05
	ap.SetArmorDataByKey("849959___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsMuffle
	ap.SetArmorDataByKey("849960___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFire03
	ap.SetArmorDataByKey("849961___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFire04
	ap.SetArmorDataByKey("849962___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFire05
	ap.SetArmorDataByKey("849963___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFrost03
	ap.SetArmorDataByKey("849964___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFrost04
	ap.SetArmorDataByKey("849965___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistFrost05
	ap.SetArmorDataByKey("849966___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistShock03
	ap.SetArmorDataByKey("849967___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistShock04
	ap.SetArmorDataByKey("849968___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsResistShock05
	ap.SetArmorDataByKey("1105795___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsStamina03
	ap.SetArmorDataByKey("1105796___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsStamina04
	ap.SetArmorDataByKey("1105797___Skyrim.esm", ap.GEARTYPE_FEET, 15, 14, abExportToDefaults = true, abSave = false) ; EnchArmorEbonyBootsStamina05
	
	ap.SetArmorDataByKey("80229___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; ArmorDragonplateBoots
	ap.SetArmorDataByKey("883228___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsCarry04
	ap.SetArmorDataByKey("883229___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsCarry05
	ap.SetArmorDataByKey("883230___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsCarry06
	ap.SetArmorDataByKey("883231___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsMuffle
	ap.SetArmorDataByKey("883232___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFire04
	ap.SetArmorDataByKey("883233___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFire05
	ap.SetArmorDataByKey("883234___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFire06
	ap.SetArmorDataByKey("883235___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFrost04
	ap.SetArmorDataByKey("883236___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFrost05
	ap.SetArmorDataByKey("883237___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistFrost06
	ap.SetArmorDataByKey("883349___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistShock04
	ap.SetArmorDataByKey("883350___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistShock05
	ap.SetArmorDataByKey("883351___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsResistShock06
	ap.SetArmorDataByKey("1105786___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsStamina04
	ap.SetArmorDataByKey("1105787___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsStamina05
	ap.SetArmorDataByKey("1105788___Skyrim.esm", ap.GEARTYPE_FEET, 15, 29, abExportToDefaults = true, abSave = false) ; EnchArmorDragonplateBootsStamina06
	
	ap.SetArmorDataByKey("80234___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; ArmorDaedricBoots
	ap.SetArmorDataByKey("883336___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsCarry04
	ap.SetArmorDataByKey("883337___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsCarry05
	ap.SetArmorDataByKey("883338___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsCarry06
	ap.SetArmorDataByKey("883339___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsMuffle
	ap.SetArmorDataByKey("883340___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFire04
	ap.SetArmorDataByKey("883341___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFire05
	ap.SetArmorDataByKey("883342___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFire06
	ap.SetArmorDataByKey("883343___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFrost04
	ap.SetArmorDataByKey("883344___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFrost05
	ap.SetArmorDataByKey("883345___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistFrost06
	ap.SetArmorDataByKey("883346___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistShock04
	ap.SetArmorDataByKey("883347___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistShock05
	ap.SetArmorDataByKey("883348___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsResistShock06
	ap.SetArmorDataByKey("1105783___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsStamina04
	ap.SetArmorDataByKey("1105784___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsStamina05
	ap.SetArmorDataByKey("1105785___Skyrim.esm", ap.GEARTYPE_FEET, 18, 21, abExportToDefaults = true, abSave = false) ; EnchArmorDaedricBootsStamina06
	
	ap.SetArmorDataByKey("307848___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorBladesBoots
	
	ap.SetArmorDataByKey("847484___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorCompanionsBoots
	
	ap.SetArmorDataByKey("862277___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorBoots
	ap.SetArmorDataByKey("925460___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorBootsSP
	ap.SetArmorDataByKey("1108828___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; DBArmorBootsWornPlayable
	
	ap.SetArmorDataByKey("354973___Skyrim.esm", ap.GEARTYPE_FEET, 9, 3, abExportToDefaults = true, abSave = false) ; ArmorDraugrBoots
	
	ap.SetArmorDataByKey("683391___Skyrim.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakBoots
	
	ap.SetArmorDataByKey("79574___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorImperialBoots
	ap.SetArmorDataByKey("81623___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; ArmorImperialLightBoots
	ap.SetArmorDataByKey("707771___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsCarry01
	ap.SetArmorDataByKey("709855___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsCarry02
	ap.SetArmorDataByKey("709856___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsCarry03
	ap.SetArmorDataByKey("707772___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFire01
	ap.SetArmorDataByKey("709857___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFire02
	ap.SetArmorDataByKey("709858___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFire03
	ap.SetArmorDataByKey("707773___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFrost01
	ap.SetArmorDataByKey("709859___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFrost02
	ap.SetArmorDataByKey("709860___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistFrost03
	ap.SetArmorDataByKey("707774___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistShock01
	ap.SetArmorDataByKey("709861___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistShock02
	ap.SetArmorDataByKey("709862___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsResistShock03
	ap.SetArmorDataByKey("707775___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsSneak01
	ap.SetArmorDataByKey("709863___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsSneak02
	ap.SetArmorDataByKey("709864___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialBootsSneak03
	ap.SetArmorDataByKey("759565___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsCarry01
	ap.SetArmorDataByKey("759566___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsCarry02
	ap.SetArmorDataByKey("759567___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsCarry03
	ap.SetArmorDataByKey("759568___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFire01
	ap.SetArmorDataByKey("759569___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFire02
	ap.SetArmorDataByKey("759570___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFire03
	ap.SetArmorDataByKey("759571___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFrost01
	ap.SetArmorDataByKey("759572___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFrost02
	ap.SetArmorDataByKey("759573___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistFrost03
	ap.SetArmorDataByKey("759574___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistShock01
	ap.SetArmorDataByKey("759575___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistShock02
	ap.SetArmorDataByKey("759576___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsResistShock03
	ap.SetArmorDataByKey("759577___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsSneak01
	ap.SetArmorDataByKey("759578___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsSneak02
	ap.SetArmorDataByKey("759579___Skyrim.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; EnchArmorImperialLightBootsSneak03
	
	ap.SetArmorDataByKey("551297___Skyrim.esm", ap.GEARTYPE_FEET, 18, 14, abExportToDefaults = true, abSave = false) ; ArmorStormcloakBearBoots
	
	ap.SetArmorDataByKey("416684___Skyrim.esm", ap.GEARTYPE_FEET, 9, 3, abExportToDefaults = true, abSave = false) ; ClothesThalmorBoots
	
	ap.SetArmorDataByKey("867010___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildBootsPlayer
	ap.SetArmorDataByKey("867019___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildBootsPlayerImproved
	ap.SetArmorDataByKey("931286___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorThievesGuildLeaderBoots
	ap.SetArmorDataByKey("1082691___Skyrim.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; ArmorLinweBoots
	
	ap.SetArmorDataByKey("1035276___Skyrim.esm", ap.GEARTYPE_FEET, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleBootsPlayer01
	ap.SetArmorDataByKey("383877___Skyrim.esm", ap.GEARTYPE_FEET, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleBootsPlayer02
	ap.SetArmorDataByKey("1035277___Skyrim.esm", ap.GEARTYPE_FEET, 12, 35, abExportToDefaults = true, abSave = false) ; ArmorNightingaleBootsPlayer03
	
	ap.SetArmorDataByKey("248320___Skyrim.esm", ap.GEARTYPE_FEET, 3, 0, abExportToDefaults = true, abSave = false) ; ClothesPrisonerShoes

	ap.SetArmorDataByKey("962515___Skyrim.esm", ap.GEARTYPE_FEET, 3, 0, abExportToDefaults = true, abSave = false) ; MS02ForswornBoots
	ap.SetArmorDataByKey("888142___Skyrim.esm", ap.GEARTYPE_FEET, 3, 0, abExportToDefaults = true, abSave = false) ; ForswornBoots

	ap.SetArmorDataByKey("868007___Skyrim.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; ArmorPenitusBoots

	;##############################
	;
	;    Dawnguard
	;
	;##############################
	ap.SetArmorDataByKey("59882___Dawnguard.esm", ap.GEARTYPE_FEET, 3, 0, abExportToDefaults = true, abSave = false) ; ClothesPrisonerBloodyShoes
	ap.SetArmorDataByKey("18393___Dawnguard.esm", ap.GEARTYPE_FEET, 3, 0, abExportToDefaults = true, abSave = false) ; DLC1ClothesMothPriestSandals

	ap.SetArmorDataByKey("83799___Dawnguard.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardBootsHeavy
	ap.SetArmorDataByKey("62464___Dawnguard.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC1ArmorDawnguardBootsLight

	ap.SetArmorDataByKey("59613___Dawnguard.esm", ap.GEARTYPE_FEET, 5, 3, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHardenedBoots
	ap.SetArmorDataByKey("9199___Dawnguard.esm", ap.GEARTYPE_FEET, 5, 3, abExportToDefaults = true, abSave = false) ; DLC1ArmorFalmerHeavyBoots

	ap.SetArmorDataByKey("46558___Dawnguard.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; DLC1ArmorVampireBoots

	ap.SetArmorDataByKey("51221___Dawnguard.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; DLC1IvoryBoots

	;##############################
	;
	;    Dragonborn
	;
	;##############################
	ap.SetArmorDataByKey("118174___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimHeavyBoots
	ap.SetArmorDataByKey("168444___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsCarry04
	ap.SetArmorDataByKey("168445___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsCarry05
	ap.SetArmorDataByKey("168446___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsCarry06
	ap.SetArmorDataByKey("168447___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsMuffle
	ap.SetArmorDataByKey("168448___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFire04
	ap.SetArmorDataByKey("168449___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFire05
	ap.SetArmorDataByKey("168450___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFire06
	ap.SetArmorDataByKey("168451___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost04
	ap.SetArmorDataByKey("168452___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost05
	ap.SetArmorDataByKey("168453___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistFrost06
	ap.SetArmorDataByKey("168454___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistShock04
	ap.SetArmorDataByKey("168455___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistShock05
	ap.SetArmorDataByKey("168456___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsResistShock06
	ap.SetArmorDataByKey("168457___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsStamina04
	ap.SetArmorDataByKey("168458___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsStamina05
	ap.SetArmorDataByKey("168459___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimHeavyBootsStamina06

	ap.SetArmorDataByKey("118142___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorStalhrimLightBoots
	ap.SetArmorDataByKey("168083___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsCarry03
	ap.SetArmorDataByKey("168084___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsCarry04
	ap.SetArmorDataByKey("168085___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsCarry05
	ap.SetArmorDataByKey("168192___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsMuffle
	ap.SetArmorDataByKey("168086___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFire03
	ap.SetArmorDataByKey("168087___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFire04
	ap.SetArmorDataByKey("168088___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFire05
	ap.SetArmorDataByKey("168089___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFrost03
	ap.SetArmorDataByKey("168090___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFrost04
	ap.SetArmorDataByKey("168091___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistFrost05
	ap.SetArmorDataByKey("168093___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistShock03
	ap.SetArmorDataByKey("168094___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistShock04
	ap.SetArmorDataByKey("168095___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsResistShock05
	ap.SetArmorDataByKey("168092___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsSneak03
	ap.SetArmorDataByKey("168096___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsSneak04
	ap.SetArmorDataByKey("168097___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsSneak05
	ap.SetArmorDataByKey("168098___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsStamina03
	ap.SetArmorDataByKey("168099___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsStamina04
	ap.SetArmorDataByKey("168100___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorStalhrimLightBootsStamina05

	ap.SetArmorDataByKey("118166___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2ArmorNordicHeavyBoots
	ap.SetArmorDataByKey("168352___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsCarry03
	ap.SetArmorDataByKey("168353___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsCarry04
	ap.SetArmorDataByKey("168354___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsCarry05
	ap.SetArmorDataByKey("168355___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsMuffle
	ap.SetArmorDataByKey("168356___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFire03
	ap.SetArmorDataByKey("168357___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFire04
	ap.SetArmorDataByKey("168358___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFire05
	ap.SetArmorDataByKey("168359___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFrost03
	ap.SetArmorDataByKey("168360___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFrost04
	ap.SetArmorDataByKey("168361___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistFrost05
	ap.SetArmorDataByKey("168362___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistShock03
	ap.SetArmorDataByKey("168363___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistShock04
	ap.SetArmorDataByKey("168364___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsResistShock05
	ap.SetArmorDataByKey("168365___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsStamina03
	ap.SetArmorDataByKey("168366___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsStamina04
	ap.SetArmorDataByKey("168367___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 21, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorNordicHeavyBootsStamina05

	ap.SetArmorDataByKey("118162___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldBoots
	ap.SetArmorDataByKey("240421___Dragonborn.esm", ap.GEARTYPE_FEET, 15, 21, abExportToDefaults = true, abSave = false) ; DLC2ArmorBonemoldImprovedBoots
	ap.SetArmorDataByKey("165062___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsCarry01
	ap.SetArmorDataByKey("165063___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsCarry02
	ap.SetArmorDataByKey("165064___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsCarry03
	ap.SetArmorDataByKey("165065___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFire01
	ap.SetArmorDataByKey("165066___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFire02
	ap.SetArmorDataByKey("165067___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFire03
	ap.SetArmorDataByKey("165068___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFrost01
	ap.SetArmorDataByKey("165069___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFrost02
	ap.SetArmorDataByKey("165070___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistFrost03
	ap.SetArmorDataByKey("165071___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistShock01
	ap.SetArmorDataByKey("165072___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistShock02
	ap.SetArmorDataByKey("165073___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsResistShock03
	ap.SetArmorDataByKey("165074___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsSneak01
	ap.SetArmorDataByKey("165075___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsSneak02
	ap.SetArmorDataByKey("165076___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorBonemoldBootsSneak03

	ap.SetArmorDataByKey("118150___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinLightBoots
	ap.SetArmorDataByKey("167903___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsCarry02
	ap.SetArmorDataByKey("167933___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsCarry03
	ap.SetArmorDataByKey("167904___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsCarry04
	ap.SetArmorDataByKey("167905___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFire02
	ap.SetArmorDataByKey("167906___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFire03
	ap.SetArmorDataByKey("167907___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFire04
	ap.SetArmorDataByKey("167908___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFrost02
	ap.SetArmorDataByKey("167909___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFrost03
	ap.SetArmorDataByKey("167910___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistFrost04
	ap.SetArmorDataByKey("167911___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistShock02
	ap.SetArmorDataByKey("167912___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistShock03
	ap.SetArmorDataByKey("167913___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsResistShock04
	ap.SetArmorDataByKey("167914___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsSneak02
	ap.SetArmorDataByKey("167915___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsSneak03
	ap.SetArmorDataByKey("167916___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsSneak04
	ap.SetArmorDataByKey("167917___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsStamina02
	ap.SetArmorDataByKey("167918___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsStamina03
	ap.SetArmorDataByKey("167919___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinLightBootsStamina04

	ap.SetArmorDataByKey("118146___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2ArmorChitinHeavyBoots
	ap.SetArmorDataByKey("168275___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsCarry02
	ap.SetArmorDataByKey("168276___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsCarry03
	ap.SetArmorDataByKey("168277___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsCarry04
	ap.SetArmorDataByKey("168278___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsMuffle
	ap.SetArmorDataByKey("168279___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFire02
	ap.SetArmorDataByKey("168280___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFire03
	ap.SetArmorDataByKey("168281___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFire04
	ap.SetArmorDataByKey("168282___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFrost02
	ap.SetArmorDataByKey("168283___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFrost03
	ap.SetArmorDataByKey("168284___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistFrost04
	ap.SetArmorDataByKey("168285___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistShock02
	ap.SetArmorDataByKey("168286___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistShock03
	ap.SetArmorDataByKey("168287___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsResistShock04
	ap.SetArmorDataByKey("168288___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsStamina02
	ap.SetArmorDataByKey("168289___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsStamina03
	ap.SetArmorDataByKey("168290___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2EnchArmorChitinHeavyBootsStamina04

	ap.SetArmorDataByKey("233746___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2ClothesSkaalBoots
	ap.SetArmorDataByKey("168619___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 14, abExportToDefaults = true, abSave = false) ; DLC2MoragTongBoots
	ap.SetArmorDataByKey("116309___Dragonborn.esm", ap.GEARTYPE_FEET, 9, 3, abExportToDefaults = true, abSave = false) ; DLC2dunKolbjornBoots
	ap.SetArmorDataByKey("147482___Dragonborn.esm", ap.GEARTYPE_FEET, 24, 14, abExportToDefaults = true, abSave = false) ; DLC2dunHaknirArmorBoots
	ap.SetArmorDataByKey("175412___Dragonborn.esm", ap.GEARTYPE_FEET, 12, 29, abExportToDefaults = true, abSave = false) ; DLC2TGArmorVariantBoots

	;##############################
	;
	;    Campfire
	;
	;##############################
	ap.SetArmorDataByKey("267720___Campfire.esm", ap.GEARTYPE_FEET, 21, 14, abExportToDefaults = true, abSave = false) ; _Camp_ArmorSonsBoots
endFunction

function SetDefaults_Cloak()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	;##############################
	;
	;    Skyrim
	;
	;##############################
	; Now folded into "Extra" fields on base gear.

	;##############################
	;
	;    Campfire
	;
	;##############################
	ap.SetArmorDataByKey("260764___Campfire.esm", ap.GEARTYPE_CLOAK, 12, 12, abExportToDefaults = true, abSave = false) ; _Camp_Cloak_BasicBurlap
	ap.SetArmorDataByKey("260765___Campfire.esm", ap.GEARTYPE_CLOAK, 20, 20, abExportToDefaults = true, abSave = false) ; _Camp_Cloak_BasicLinen
	ap.SetArmorDataByKey("260766___Campfire.esm", ap.GEARTYPE_CLOAK, 40, 12, abExportToDefaults = true, abSave = false) ; _Camp_Cloak_BasicFur
	ap.SetArmorDataByKey("260767___Campfire.esm", ap.GEARTYPE_CLOAK, 12, 40, abExportToDefaults = true, abSave = false) ; _Camp_Cloak_BasicHide

	;##############################
	;
	;    Frostfall
	;
	;##############################
	ap.SetArmorDataByKey("356637___Frostfall.esp", ap.GEARTYPE_CLOAK, 20, 20, abExportToDefaults = true, abSave = false) ; _Frost_Cloak_BoundLesser
	ap.SetArmorDataByKey("359400___Frostfall.esp", ap.GEARTYPE_CLOAK, 12, 40, abExportToDefaults = true, abSave = false) ; _Frost_Cloak_BoundGreater
endFunction

function SetDefaults_Shield()
	_Frost_ArmorProtectionDatastoreHandler ap = GetClothingDatastoreHandler()
	ap.SetArmorDataByKey("151754___Campfire.esm", ap.GEARTYPE_IGNORE, abExportToDefaults = true, abSave = false) ; _Camp_WalkingStickShield
endFunction

; Stuff to add
;ap.SetArmorDataByKey("9205___Dawnguard.esm", X, Y, abExportToDefaults = true, abSave = false, Z) ; DLC1SkinNakedVampireLord

;@TODO: Add immersive armors
;@TODO: Add Cloaks of Skyrim (Compatibility)
;@TODO: Add Winter is Coming Cloaks (Compatibility)
;@TODO: Add 'hooded' clothes to multi-list
;@TODO: Add exception data store?