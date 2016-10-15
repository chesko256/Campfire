// Based on the SkyUI FOMOD installer script, with permission.

using System;
using fomm.Scripting;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Windows.Forms;
using System.Globalization;
using System.Collections.Generic;

class Script : SkyrimBaseScript {

	static Version SKSE_MIN_VERSION = new Version("0.1.7.3");

	// Main dialog
	static Form mainInstallForm;
	static TextBox textArea;
	static Button refreshButton;
	static Button installButton;
	static Button cancelButton;
	static RadioButton frostfallOnlyRadio;
	static RadioButton frostfallAndUIRadio;
	static Label installDescription;
	static Label titleLabel;
	static Label subTitleLabel;
	static Label artwork;
	static Label artCredit;

	static string[] checkedLooseMenuFiles = {
		"Interface/bartermenu.swf",
		"Interface/containermenu.swf",
		"Interface/inventorymenu.swf",
		"Interface/magicmenu.swf",
		"Interface/skyui/bottombar.swf",
		"Interface/skyui/itemcard.swf"
	};

	static string[] checkedLooseScriptFiles = {
		"Scripts/FrostfallAPI.pex",
		"Scripts/FrostUtil.pex",
		"Scripts/qf__de_trackingquest_010177d7.pex",
		"Scripts/_FrostInternal.pex",
		"Scripts/_Frost_APDatastoreDefaultData.pex",
		"Scripts/_Frost_APDatastoreHandler_test.pex",
		"Scripts/_Frost_ArmorProtectionDatastoreHandler.pex",
		"Scripts/_Frost_ArmorSpellScript.pex",
		"Scripts/_Frost_ArmorSpellUpdateWarmth.pex",
		"Scripts/_Frost_BaseSystem.pex",
		"Scripts/_Frost_BoundCloakRemoveScript.pex",
		"Scripts/_Frost_BoundCloakScript.pex",
		"Scripts/_Frost_BranchAliasScript.pex",
		"Scripts/_Frost_BranchHarvestNodeController.pex",
		"Scripts/_Frost_BranchTreeHarvestNodeController.pex",
		"Scripts/_Frost_ClimateSystem.pex",
		"Scripts/_Frost_ClothingSystem.pex",
		"Scripts/_Frost_ClothingSystem_test.pex",
		"Scripts/_Frost_ColdWaterEffect0.pex",
		"Scripts/_Frost_ColdWaterEffect1.pex",
		"Scripts/_Frost_ColdWaterEffect2.pex",
		"Scripts/_Frost_ColdWaterEffect3.pex",
		"Scripts/_Frost_ColdWaterEffect4.pex",
		"Scripts/_Frost_Compatibility.pex",
		"Scripts/_Frost_ConditionValues.pex",
		"Scripts/_Frost_CoverageSystem.pex",
		"Scripts/_Frost_ExposureMeterInterfaceHandler.pex",
		"Scripts/_Frost_ExposureSystem.pex",
		"Scripts/_Frost_FortifyWarmthSoupScript.pex",
		"Scripts/_Frost_Frag_WarmHandsFollowerPackage.pex",
		"Scripts/_Frost_FrostbiteMovementUpdateScript.pex",
		"Scripts/_Frost_FrostResistSystem.pex",
		"Scripts/_Frost_HarvestTreeBranchGenerator.pex",
		"Scripts/_Frost_HeatSourceSystem.pex",
		"Scripts/_Frost_InnerFireMonitorScript.pex",
		"Scripts/_Frost_InnerFire_EffectScript.pex",
		"Scripts/_Frost_InterfaceHandler.pex",
		"Scripts/_Frost_KindleEffectScript.pex",
		"Scripts/_Frost_KindleEffectScrollScript.pex",
		"Scripts/_Frost_Main.pex",
		"Scripts/_Frost_Meter.pex",
		"Scripts/_Frost_PlayerDialogueMonitor.pex",
		"Scripts/_Frost_PlayerEquipMonitor.pex",
		"Scripts/_Frost_PlayerFoodMonitor.pex",
		"Scripts/_Frost_PlayerSpellMonitor.pex",
		"Scripts/_Frost_RegionDetectScript.pex",
		"Scripts/_Frost_RescueSystem.pex",
		"Scripts/_Frost_ShelterSystem.pex",
		"Scripts/_Frost_SKI_MeterWidget.pex",
		"Scripts/_Frost_SkyUIConfigPanelScript.pex",
		"Scripts/_Frost_Strings.pex",
		"Scripts/_Frost_SwimEvent.pex",
		"Scripts/_Frost_TempRestoreExposureScript.pex",
		"Scripts/_Frost_Test_e2e_ClothingScript.pex",
		"Scripts/_Frost_TreeAliasScript.pex",
		"Scripts/_Frost_VaporBlastScript.pex",
		"Scripts/_Frost_VaporBlastScrollScript.pex",
		"Scripts/_Frost_VendorStock.pex",
		"Scripts/_Frost_WarmHandsScript.pex",
		"Scripts/_Frost_WarmthSystem.pex",
		"Scripts/_Frost_WeatherMeterInterfaceHandler.pex",
		"Scripts/_Frost_WeathersenseScript.pex",
		"Scripts/_Frost_WellInsulatedEffectScript.pex",
		"Scripts/_Frost_WetnessMeterInterfaceHandler.pex",
		"Scripts/_Frost_WetnessSystem.pex",
		"Scripts/_Frost_WindbreakerEffectScript.pex",
		"Scripts/_Frost_WoodActivatorScript.pex",
		"Scripts/_Frost_WoodAliasScript.pex",
		"Scripts/_Frost_WoodHarvestingQuestScript.pex",
		"Scripts/_Frost_WoodHarvestNodeController.pex",
		"Scripts/_Frost_WoodpileAliasScript.pex",
		"Scripts/_Frost_WoodpileNodeController.pex",
		"Scripts/_Frost_FallbackReceiverClimateSystem.pex",
		"Scripts/_Frost_FallbackReceiverWarmthSystem.pex",
		"Scripts/_Frost_PlayerSpeedEffectScript.pex",
		"Scripts/_Frost_ShelterDetectScriptFar.pex",
		"Scripts/_Frost_ShelterDetectScriptNear.pex",
		"Scripts/_Frost_SneakEventScript.pex",
		"Scripts/_Frost_WeathersenseMessages.pex"
	};

	static bool install = false;
	static int installtype = 1;

	static int problemCount = 0;

	static List<string> foundLooseScripts = new List<string>();
	static List<string> foundLooseMenus = new List<string>();

	static bool noSKSE = false;
	static bool noSKSEScripts = false;
	static bool oldFrostfallInstalled = false;
	static bool noCampfire = false;
	static Version skseVersion;
	static bool installAnyway = false;

	static void frostfallInstall()
	{
		InstallFileFromMod("Frostfall 3.2/Frostfall.esp", "Frostfall.esp");
		InstallFileFromMod("Frostfall 3.2/Frostfall.bsa", "Frostfall.bsa");
		InstallFileFromMod("Frostfall 3.2/readmes/Frostfall_readme.txt", "readmes/Frostfall_readme.txt");
		InstallFileFromMod("Frostfall 3.2/readmes/Frostfall_changelog.txt", "readmes/Frostfall_changelog.txt");
		InstallFileFromMod("Frostfall 3.2/readmes/Frostfall_license.txt", "readmes/Frostfall_license.txt");
		InstallFileFromMod("Frostfall 3.2/SKSE/Plugins/FrostfallData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt", "SKSE/Plugins/FrostfallData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt");
	}

	static void frostfallAndUIInstall()
	{
		frostfallInstall();
		InstallFileFromMod("SkyUI51AddOn/Interface/bartermenu.swf", "Interface/bartermenu.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/containermenu.swf", "Interface/containermenu.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/craftingmenu.swf", "Interface/craftingmenu.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/inventorymenu.swf", "Interface/inventorymenu.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/skyui/bottombar.swf", "Interface/skyui/bottombar.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/skyui/itemcard.swf", "Interface/skyui/itemcard.swf");
		InstallFileFromMod("SkyUI51AddOn/Interface/Translations/skyui_english.txt", "Interface/Translations/skyui_english.txt");
		InstallFileFromMod("SkyUI51AddOn/readmes/Frostfall_SkyUI_AddOn_readme.txt", "readmes/Frostfall_SkyUI_AddOn_readme.txt");
		InstallFileFromMod("SkyUI51AddOn/SKSE/Plugins/FrostfallData/interface_package_version.json", "SKSE/Plugins/FrostfallData/interface_package_version.json");
	}
	
	public static bool OnActivate()
	{
		InitializeComponents();
		mainInstallForm.ShowDialog();
		return true;
	}

	static void DetectProblems()
	{
		// Clean up previous data
		problemCount = 0;
		foundLooseScripts.Clear();
		foundLooseMenus.Clear();
		noSKSE = false;
		noSKSEScripts = false;
		skseVersion = new Version();
		oldFrostfallInstalled = false;
		noCampfire = false;

		// Check Loose Script files
 		foreach (string file in checkedLooseScriptFiles)
 			if (GetExistingDataFile(file) != null)
 				foundLooseScripts.Add(file);

 		if (foundLooseScripts.Count > 0)
 			problemCount++;

 		// Check Loose Menu files
 		if (installtype == 2) {
 			foreach (string file in checkedLooseMenuFiles)
 				if (GetExistingDataFile(file) != null)
 					foundLooseMenus.Add(file);

 			if (foundLooseMenus.Count > 0)
 				problemCount++;
 		}

 		// Check if skse is present
 		noSKSE = !ScriptExtenderPresent();
 		if (noSKSE)
 			problemCount++;

		// Check SKSE version
 		skseVersion = GetSkseVersion();
 		if (skseVersion == null || skseVersion < SKSE_MIN_VERSION)
 			problemCount++;

		// Check missing SKSE.pex
		if (GetExistingDataFile("Scripts/SKSE.pex") == null) {
 			noSKSEScripts = true;
 			problemCount++;
 		}

 		// Check for legacy version of Frostfall
 		string[] loadOrder = GetActivePlugins();
 		if (Array.Exists(loadOrder, element => element.ToLower() == "chesko_frostfall.esp")) {
 			oldFrostfallInstalled = true;
 			problemCount++;
 		}

 		// Check for Campfire
 		if (Array.Exists(loadOrder, element => element.ToLower() == "campfire.esm") == false) {
 			noCampfire = true;
 			problemCount++;
 		}
	}

	static void GenerateReport()
	{
		int c = 0;
		textArea.Clear();

		if (problemCount == 0) {
			PrintReport("All issues have been resolved.");
			installButton.Text = "Install";
			return;
		}
		PrintReport("This report is a summary of issues detected during installation of Frostfall that may prevent Frostfall from working correctly.");
		PrintReport("");
		PrintReport("Resolve the issues noted below, then press 'Refresh' to confirm that they have been fixed.");
		PrintReport("After all problems have been resolved, you can press 'Install' again to complete installation. Or, 'Install Anyway' AT YOUR OWN RISK.");
		PrintReport("");

		if (foundLooseScripts.Count > 0) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("There are script files in your 'Data/' folder which override newer versions from the Frostfall.bsa archive.");
			PrintReport("");
			PrintReport("These files are:");
 			foreach (string file in foundLooseScripts)
	 			PrintReport("\tData/" + file);
			PrintReport("");
	 		PrintReport("Potential causes:");
	 		PrintReport("* You decompressed the BSA archive into loose files from a previous version of the mod.");
	 		PrintReport("* You installed the Frostfall Dev Kit, but didn't remove it.");
	 		PrintReport("");
	 		PrintReport("Solution:");
	 		PrintReport("1. If you have the Frostfall Dev Kit installed, uninstall or disable it, and try again.");
	 		PrintReport("2. If there are still conflicting files reported, delete them manually.");
	 		PrintReport("");
		}

		if (foundLooseMenus.Count > 0) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("There are files in your 'Data/' folder which override newer versions from the Frostfall SkyUI 5.1 Add-on.");
			PrintReport("");
			PrintReport("These files are:");
 			foreach (string file in foundLooseMenus)
	 			PrintReport("\tData/" + file);
			PrintReport("");
	 		PrintReport("Potential causes:");
	 		PrintReport("* You have an old version of the Frostfall SkyUI 5.1 Add-on installed.");
	 		PrintReport("* You have a loose file version of SkyUI or SkyUI Away installed.");
	 		PrintReport("* You have another menu replacer installed that uses loose files.");
	 		PrintReport("");
	 		PrintReport("Solution:");
	 		PrintReport("1. If you have an old version of the Frostfall SkyUI 5.1 Add-on installed, uninstall or disable it, and try again.");
	 		PrintReport("2. If you have SkyUI Away, a loose file version of SkyUI, or another menu replacer installed, uninstall or disable it, and try again.");
	 		PrintReport("3. If there are still conflicting files reported, delete them manually.");
	 		PrintReport("");
		}

		if (noSKSE) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("The Skyrim Script Extender (SKSE) is not installed.");
	 		PrintReport("");
	 		PrintReport("Solution:");
			PrintReport("1. Download the latest SKSE version from 'http://skse.silverlock.org/' and install it.");
			PrintReport("   If you have problems installing it, refer to this video:");
			PrintReport("   http://www.youtube.com/watch?v=xTGnQIiNVqA");

		} else if (skseVersion == null || skseVersion < SKSE_MIN_VERSION) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("Your SKSE version is out of date.");
			PrintReport("");
			PrintReport("Detected version: " + skseVersion);
			PrintReport("Required version: " + SKSE_MIN_VERSION + " (or newer)");
	 		PrintReport("");
	 		PrintReport("Solution:");
			PrintReport("1. Download the latest SKSE version from 'http://skse.silverlock.org/' and install it.");
			PrintReport("   If you have problems installing it, refer to this video:");
			PrintReport("   http://www.youtube.com/watch?v=xTGnQIiNVqA");

		} else if (noSKSEScripts) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("The SKSE script files are missing.");
			PrintReport("");
			PrintReport("Potential causes:");
	 		PrintReport("* You didn't install the scripts included with SKSE.");
	 		PrintReport("");
	 		PrintReport("Solution:");
			PrintReport("1. Re-install SKSE. Make sure you extract the 'Data/' folder from the downloaded archive to your Skyrim installation directory.");

		}

		if (oldFrostfallInstalled) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("Frostfall 2.6 or earlier is installed.");
			PrintReport("");
			PrintReport("Potential causes:");
	 		PrintReport("* You didn't uninstall a legacy version of Frostfall.");
	 		PrintReport("");
	 		PrintReport("Solution:");
			PrintReport("1. Uninstall the old version of Frostfall, and discontinue using any mods or compatibility patches that require the legacy version (Chesko_Frostfall.esp).");

		}

		if (noCampfire) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("Campfire is not installed or the Campfire plugin is not enabled.");
			PrintReport("");
			PrintReport("Potential causes:");
	 		PrintReport("* You didn't install Campfire.");
	 		PrintReport("* Campfire.esm is not enabled.");
	 		PrintReport("");
	 		PrintReport("Solution:");
			PrintReport("1. Download the latest version of Campfire from 'http://www.nexusmods.com/skyrim/mods/64798' and install it.");
			PrintReport("2. Make sure that Campfire.esm is enabled in the plugins tab / pane of your mod manager.");
		}
		

	}

	static void PrintReport(string line)
	{
		textArea.AppendText(line + "\n");
	}
	
	static void InitializeComponents()
	{
        textArea = new System.Windows.Forms.TextBox();
        refreshButton = new System.Windows.Forms.Button();
        installButton = new System.Windows.Forms.Button();
        cancelButton = new System.Windows.Forms.Button();
        frostfallOnlyRadio = new System.Windows.Forms.RadioButton();
        frostfallAndUIRadio = new System.Windows.Forms.RadioButton();
        installDescription = new System.Windows.Forms.Label();
        titleLabel = new System.Windows.Forms.Label();
        subTitleLabel = new System.Windows.Forms.Label();
        artwork = new System.Windows.Forms.Label();
        artCredit = new System.Windows.Forms.Label();

        //
        // titleLabel
        //
        titleLabel.ForeColor = Color.LightBlue;
        titleLabel.BackColor = Color.Transparent;
        titleLabel.Location = new System.Drawing.Point(156, 11);
        titleLabel.Name = "titleLabel";
        titleLabel.Font = new Font("Palatino Linotype", 55);
        titleLabel.Size = new System.Drawing.Size(473, 82);
        titleLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        titleLabel.Text = "FROSTFALL";
        //
        // subTitleLabel
        //
        subTitleLabel.ForeColor = Color.White;
        subTitleLabel.BackColor = Color.Transparent;
        subTitleLabel.Location = new System.Drawing.Point(155, 97);
        subTitleLabel.Name = "subTitleLabel";
        subTitleLabel.Font = new Font("Palatino Linotype", 16);
        subTitleLabel.Size = new System.Drawing.Size(474, 23);
        subTitleLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        subTitleLabel.Text = "HYPOTHERMIA - CAMPING - SURVIVAL";

        //
        // artwork
        //
        artwork.ForeColor = Color.GhostWhite;
        artwork.BackColor = Color.Transparent;
        artwork.Location = new System.Drawing.Point(79, 123);
        artwork.Name = "artwork";
        artwork.Font = new Font("Courier New", 10);
        artwork.Size = new System.Drawing.Size(643, 261);
        artwork.Text = "                      _\r\n                     /#\\ \r\n                    /###\\     /\\ \r\n                   /  ###\\   /##\\  /\\ \r\n                  /      #\\ /####\\/##\\ \r\n                 /  /      /   # /  ##\\             _       /\\ \r\n               // //  /\\  /    _/  /  #\\ _         /#\\    _/##\\    /\\ \r\n              // /   /  \\     /   /    #\\ \\      _/###\\_ /   ##\\__/ _\\ \r\n             /  \\   / .. \\   / /   _   { \\ \\   _/       / //    /    \\\\ \r\n     /\\     /    /\\  ...  \\_/   / / \\   } \\ | /  /\\  \\ /  _    /  /    \\ /\\ \r\n  _ /  \\  /// / .\\  ..%:.  /... /\\ . \\ {:  \\\\   /. \\     / \\  /   ___   /  \\ \r\n /.\\ .\\.\\// \\/... \\.::::..... _/..\\ ..\\:|:. .  / .. \\\\  /.. \\    /...\\ /  \\ \\ \r\n/...\\.../..:.\\. ..:::::::..:..... . ...\\{:... / %... \\\\/..%. \\  /./:..\\__   \\ \r\n .:..\\:..:::....:::;;;;;;::::::::.:::::.\\}.....::%.:. \\ .:::. \\/.%:::.:..\\ \r\n::::...:::;;:::::;;;;;;;;;;;;;;:::::;;::{:::::::;;;:..  .:;:... ::;;::::.. \r\n;;;;:::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;];;;;;;;;;;::::::;;;;:.::;;;;;;;;:..";

        //
        // artCredit
        //
        artCredit.ForeColor = Color.White;
        artCredit.BackColor = Color.Transparent;
        artCredit.Location = new System.Drawing.Point(342, 529);
        artCredit.Name = "artCredit";
        artCredit.Font = new Font("Microsoft Sans Serif", 8);
        artCredit.Size = new System.Drawing.Size(100, 23);
        artCredit.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        artCredit.Text = "Art by unknown";

        // 
        // textArea
        // 
        textArea.Visible = false;
        textArea.BackColor = System.Drawing.SystemColors.ControlLightLight;
        textArea.Location = new System.Drawing.Point(45, 136);
        textArea.Font = new System.Drawing.Font("Courier New", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
        textArea.Multiline = true;
        textArea.Name = "textArea";
        textArea.ReadOnly = true;
        textArea.ScrollBars = System.Windows.Forms.ScrollBars.Both;
		textArea.Size = new System.Drawing.Size(695, 246);
        textArea.TabIndex = 0;

        // 
        // installDescription
        // 
        installDescription.Location = new System.Drawing.Point(12, 463);
        installDescription.Name = "installDescription";
		installDescription.Size = new System.Drawing.Size(760, 24);
		installDescription.Font = new Font("Microsoft Sans Serif", 10, System.Drawing.FontStyle.Italic);
		installDescription.ForeColor = Color.LightGray;
		installDescription.BackColor = Color.Transparent;
		installDescription.Text = "";
		installDescription.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        //
        // Frostfall Only Radio Button
        //
        frostfallOnlyRadio.Location = new System.Drawing.Point(227, 394);
    	frostfallOnlyRadio.Name = "radioButton1";
    	frostfallOnlyRadio.Size = new System.Drawing.Size(331, 24);
    	frostfallOnlyRadio.Text = "Install Frostfall 3.2";
    	frostfallOnlyRadio.Font = new Font("Microsoft Sans Serif", 12);
    	frostfallOnlyRadio.ForeColor = Color.White;
    	frostfallOnlyRadio.BackColor = Color.Transparent;
    	frostfallOnlyRadio.Checked = true;
    	frostfallOnlyRadio.CheckedChanged += new EventHandler(frostfallRadioButton_Click);
    	//
        // Frostfall And UI Radio Button
        //
        frostfallAndUIRadio.Location = new System.Drawing.Point(227, 427);
    	frostfallAndUIRadio.Name = "radioButton2";
    	frostfallAndUIRadio.Size = new System.Drawing.Size(331, 24);
    	frostfallAndUIRadio.Text = "Install Frostfall 3.2 with SkyUI 5.1 Add-on";
    	frostfallAndUIRadio.Font = new Font("Microsoft Sans Serif", 12);
    	frostfallAndUIRadio.ForeColor = Color.White;
    	frostfallAndUIRadio.BackColor = Color.Transparent;
    	frostfallAndUIRadio.CheckedChanged += new EventHandler(frostfallAndUIRadioButton_Click);
        // 
        // refreshButton
        // 
		refreshButton.Location = new System.Drawing.Point(322, 501);
        refreshButton.Name = "refreshButton";
        refreshButton.Size = new System.Drawing.Size(141, 48);
        refreshButton.TabIndex = 1;
        refreshButton.Text = "Refresh";
        refreshButton.UseVisualStyleBackColor = true;
        refreshButton.Click += new System.EventHandler(refreshButton_Click);
        refreshButton.Font = new Font("Microsoft Sans Serif", 12);
        refreshButton.Visible = false;
        // 
        // installButton
        // 
		installButton.Location = new System.Drawing.Point(631, 501);
        installButton.Name = "installButton";
        installButton.Size = new System.Drawing.Size(141, 48);
        installButton.TabIndex = 2;
        installButton.Text = "Install";
        installButton.UseVisualStyleBackColor = true;
        installButton.Click += new System.EventHandler(installButton_Click);
        installButton.Font = new Font("Microsoft Sans Serif", 12);
        // 
        // cancelButton
        // 
		cancelButton.Location = new System.Drawing.Point(12, 501);
        cancelButton.Name = "cancelButton";
        cancelButton.Size = new System.Drawing.Size(141, 48);
        cancelButton.TabIndex = 3;
        cancelButton.Text = "Cancel";
        cancelButton.UseVisualStyleBackColor = true;
        cancelButton.Click += new System.EventHandler(cancelButton_Click);
        cancelButton.Font = new Font("Microsoft Sans Serif", 12);
        // 
        // mainInstallForm
        // 
		mainInstallForm = CreateCustomForm();
        mainInstallForm.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
        mainInstallForm.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
		mainInstallForm.ClientSize = new System.Drawing.Size(784, 561);
        mainInstallForm.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
        mainInstallForm.BackColor = Color.Black;
        mainInstallForm.MaximizeBox = false;
		mainInstallForm.MinimizeBox = false;
        mainInstallForm.Controls.Add(installButton);
        mainInstallForm.Controls.Add(refreshButton);
        mainInstallForm.Controls.Add(cancelButton);
        mainInstallForm.Controls.Add(textArea);
        mainInstallForm.Controls.Add(installDescription);
        mainInstallForm.Controls.Add(frostfallOnlyRadio);
        mainInstallForm.Controls.Add(frostfallAndUIRadio);
        mainInstallForm.Controls.Add(titleLabel);
        mainInstallForm.Controls.Add(subTitleLabel);
        mainInstallForm.Controls.Add(artwork);
        mainInstallForm.Controls.Add(artCredit);
        setInstallDescriptionText(installtype);
        mainInstallForm.Name = "mainInstallForm";
        mainInstallForm.Text = "Frostfall Installer";
        mainInstallForm.Load += new System.EventHandler(mainInstallForm_Load);
	}
	
	static void installButton_Click(object sender, EventArgs e)
	{
		DetectProblems();

		if (installAnyway == false) {
			if (problemCount > 0) {
				GenerateReport();
				textArea.Visible = true;
				refreshButton.Visible = true;
				artwork.Visible = false;
				artCredit.Visible = false;
				installButton.Text = "Install Anyway";
				installAnyway = true;
			} else {
				install = true;
			}
		} else {
			install = true;
		}
		
				
		if (install) {
			if (installtype == 1) {
				frostfallInstall();
			}
			else if(installtype == 2) {
				frostfallAndUIInstall();
			}
			mainInstallForm.Close();
		}
	}

	static void frostfallRadioButton_Click(object sender, EventArgs e)
	{
		installtype = 1;
		setInstallDescriptionText(installtype);
	}

	static void frostfallAndUIRadioButton_Click(object sender, EventArgs e)
	{
		installtype = 2;
		setInstallDescriptionText(installtype);
	}

	static void refreshButton_Click(object sender, EventArgs e)
	{
		DetectProblems();
		GenerateReport();
	}

	static void cancelButton_Click(object sender, EventArgs e)
	{
		install = false;
		mainInstallForm.Close();
	}

	static void mainInstallForm_Load(object sender, EventArgs e)
	{
		
	}

	static void setInstallDescriptionText(int install_type)
	{
		if (install_type == 1) {
			installDescription.Text = "Installs Frostfall 3.2.";
		}
		else if (install_type == 2) {
			installDescription.Text = "Installs Frostfall 3.2 with the SkyUI 5.1 Add-on. Requires SkyUI 5.1 (without SkyUI Away).";
		}
		
	}
}
