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
	static Label titleLabel;
	static Label subTitleLabel;
	static Label artwork;
	static Label artCredit;

	static string[] checkedLooseScriptFiles = {
		"Scripts/CampCampfire.pex",
		"Scripts/CampConjuredContainer.pex",
		"Scripts/CampConjuredPlaceableObject.pex",
		"Scripts/CampConjuredScriptedActivator.pex",
		"Scripts/CampConjuredShelter.pex",
		"Scripts/CampConjureObjectEffect.pex",
		"Scripts/CampCookingPot.pex",
		"Scripts/CampfireAPI.pex",
		"Scripts/CampfireData.pex",
		"Scripts/CampLargeTentTriggerVolumeScript.pex",
		"Scripts/CampPerkNode.pex",
		"Scripts/CampPerkNodeController.pex",
		"Scripts/CampPerkNodeControllerBehavior.pex",
		"Scripts/CampPerkSystemRegister.pex",
		"Scripts/CampPlaceableContainer.pex",
		"Scripts/CampPlaceableContainerEx.pex",
		"Scripts/CampPlaceableMiscItem.pex",
		"Scripts/CampPlaceableObject.pex",
		"Scripts/CampPlaceableObjectEx.pex",
		"Scripts/CampPlaceableScriptedActivator.pex",
		"Scripts/CampPlaceableScriptedActivatorEx.pex",
		"Scripts/CampPlacementIndicator.pex",
		"Scripts/CampShelterSphereTriggerVolumeScript.pex",
		"Scripts/CampTent.pex",
		"Scripts/CampTentEx.pex",
		"Scripts/CampTentShelterCollider.pex",
		"Scripts/CampUsableMiscItem.pex",
		"Scripts/CampUsableObject.pex",
		"Scripts/CampUtil.pex",
		"Scripts/TentSystem.pex",
		"Scripts/_CampfireInternalAPI.pex",
		"Scripts/_CampInternal.pex",
		"Scripts/_CampTentEx_LargeHideTent.pex",
		"Scripts/_Camp_BackpackReclaim.pex",
		"Scripts/_Camp_BackpackToggle.pex",
		"Scripts/_Camp_BookToPaperScript.pex",
		"Scripts/_Camp_CampCrimeGuardScript.pex",
		"Scripts/_Camp_CampfireSitScript.pex",
		"Scripts/_Camp_CampfireType_CracklingScript.pex",
		"Scripts/_Camp_CampfireType_FlickeringScript.pex",
		"Scripts/_Camp_CampfireType_FragileScript.pex",
		"Scripts/_Camp_CampfireType_RoaringScript.pex",
		"Scripts/_Camp_CampfireUseMonitor.pex",
		"Scripts/_Camp_CampTentNPCBedrollScript.pex",
		"Scripts/_Camp_Compatibility.pex",
		"Scripts/_Camp_ConditionValues.pex",
		"Scripts/_Camp_CraftingObjectEffectScript.pex",
		"Scripts/_Camp_DebugSpouseAliasScript.pex",
		"Scripts/_Camp_Deconstruct.pex",
		"Scripts/_Camp_DeleteLargeFire.pex",
		"Scripts/_Camp_EquipMonitor.pex",
		"Scripts/_Camp_ExitBug.pex",
		"Scripts/_Camp_FollowerDelegate.pex",
		"Scripts/_Camp_FollowerDetectDebugEffect.pex",
		"Scripts/_Camp_FollowerRegistration.pex",
		"Scripts/_Camp_FollowerTentBehavior.pex",
		"Scripts/_Camp_Frag_CampingCrimeExecute.pex",
		"Scripts/_Camp_IndicatorFuture.pex",
		"Scripts/_Camp_IndicatorTrigger.pex",
		"Scripts/_Camp_InstinctsController.pex",
		"Scripts/_Camp_InstinctsEffects.pex",
		"Scripts/_Camp_InstinctsGlowScript.pex",
		"Scripts/_Camp_LegacyMenu.pex",
		"Scripts/_Camp_LegalAreaCheck.pex",
		"Scripts/_Camp_LightFireFurnScript.pex",
		"Scripts/_Camp_LightMethod.pex",
		"Scripts/_Camp_Main.pex",
		"Scripts/_Camp_NextBug.pex",
		"Scripts/_Camp_ObjectFuture.pex",
		"Scripts/_Camp_ObjectPlacementIndicatorThread.pex",
		"Scripts/_Camp_ObjectPlacementIndicatorThread01.pex",
		"Scripts/_Camp_ObjectPlacementIndicatorThread02.pex",
		"Scripts/_Camp_ObjectPlacementIndicatorThread03.pex",
		"Scripts/_Camp_ObjectPlacementThread.pex",
		"Scripts/_Camp_ObjectPlacementThread01.pex",
		"Scripts/_Camp_ObjectPlacementThread02.pex",
		"Scripts/_Camp_ObjectPlacementThread03.pex",
		"Scripts/_Camp_ObjectPlacementThread04.pex",
		"Scripts/_Camp_ObjectPlacementThread05.pex",
		"Scripts/_Camp_ObjectPlacementThread06.pex",
		"Scripts/_Camp_ObjectPlacementThread07.pex",
		"Scripts/_Camp_ObjectPlacementThread08.pex",
		"Scripts/_Camp_ObjectPlacementThread09.pex",
		"Scripts/_Camp_ObjectPlacementThread10.pex",
		"Scripts/_Camp_ObjectPlacementThread11.pex",
		"Scripts/_Camp_ObjectPlacementThread12.pex",
		"Scripts/_Camp_ObjectPlacementThread13.pex",
		"Scripts/_Camp_ObjectPlacementThread14.pex",
		"Scripts/_Camp_ObjectPlacementThread15.pex",
		"Scripts/_Camp_ObjectPlacementThread16.pex",
		"Scripts/_Camp_ObjectPlacementThread17.pex",
		"Scripts/_Camp_ObjectPlacementThread18.pex",
		"Scripts/_Camp_ObjectPlacementThread19.pex",
		"Scripts/_Camp_ObjectPlacementThread20.pex",
		"Scripts/_Camp_ObjectPlacementThread21.pex",
		"Scripts/_Camp_ObjectPlacementThread22.pex",
		"Scripts/_Camp_ObjectPlacementThread23.pex",
		"Scripts/_Camp_ObjectPlacementThread24.pex",
		"Scripts/_Camp_ObjectPlacementThread25.pex",
		"Scripts/_Camp_ObjectPlacementThread26.pex",
		"Scripts/_Camp_ObjectPlacementThread27.pex",
		"Scripts/_Camp_ObjectPlacementThread28.pex",
		"Scripts/_Camp_ObjectPlacementThread29.pex",
		"Scripts/_Camp_ObjectPlacementThread30.pex",
		"Scripts/_Camp_ObjectPlacementThreadManager.pex",
		"Scripts/_Camp_PerkNavController.pex",
		"Scripts/_Camp_PF_IllegalCampPkg.pex",
		"Scripts/_Camp_PlaceableObjectBase.pex",
		"Scripts/_Camp_PlayerEventMonitor.pex",
		"Scripts/_Camp_PlayerHitMonitor.pex",
		"Scripts/_Camp_PrevBug.pex",
		"Scripts/_Camp_RubbleFire.pex",
		"Scripts/_Camp_SearchAliasBase.pex",
		"Scripts/_Camp_SearchAliasFloraOther.pex",
		"Scripts/_Camp_SearchAliasTinder.pex",
		"Scripts/_Camp_SearchAliasTinderOther.pex",
		"Scripts/_Camp_SearchAliasTreeFlora.pex",
		"Scripts/_Camp_SearchQuest.pex",
		"Scripts/_Camp_SetLegality.pex",
		"Scripts/_Camp_SkyUIConfigPanelScript.pex",
		"Scripts/_Camp_SpawnCampfire.pex",
		"Scripts/_Camp_Strings.pex",
		"Scripts/_Camp_SwapCraftedBow.pex",
		"Scripts/_Camp_SwapCraftedItem.pex",
		"Scripts/_Camp_SwapCraftedTorch.pex",
		"Scripts/_Camp_TentSystem.pex",
		"Scripts/_Camp_Tent_InteractTriggerScript.pex",
		"Scripts/_Camp_TinderTypeScript.pex",
		"Scripts/_Camp_UpliftedTriggerVolumeScript.pex",
		"Scripts/_Camp_VendorStock.pex",
		"Scripts/_Camp_WoodChoppingFurnitureScript.pex",
		"Scripts/_Camp_woodharvestscriptEFFECT.pex",
		"Scripts/_Camp_ZReporterAScript.pex",
		"Scripts/_Camp_ZReporterBScript.pex",
		"Scripts/_Camp_ZReporterCScript.pex",
		"Scripts/_Camp_TentSitLayScript.pex"
	};

	static bool install = false;

	static int problemCount = 0;

	static List<string> foundLooseScripts = new List<string>();

	static bool noSKSE = false;
	static bool noSKSEScripts = false;
	static Version skseVersion;
	static bool installAnyway = false;

	static void installCampfire() {
		InstallFileFromMod("Campfire/Campfire.esm", "Campfire.esm");
		InstallFileFromMod("Campfire/Campfire.bsa", "Campfire.bsa");
		InstallFileFromMod("Campfire/readmes/Campfire_readme.txt", "readmes/Campfire_readme.txt");
		InstallFileFromMod("Campfire/readmes/Campfire_changelog.txt", "readmes/Campfire_changelog.txt");
		InstallFileFromMod("Campfire/readmes/Campfire_license.txt", "readmes/Campfire_license.txt");
		InstallFileFromMod("Campfire/SKSE/Plugins/StorageUtil.dll", "SKSE/Plugins/StorageUtil.dll");
		InstallFileFromMod("Campfire/SKSE/Plugins/CampfireData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt", "SKSE/Plugins/CampfireData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt");
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
		noSKSE = false;
		noSKSEScripts = false;
		skseVersion = new Version();

		// Check Loose Script files
 		foreach (string file in checkedLooseScriptFiles)
 			if (GetExistingDataFile(file) != null)
 				foundLooseScripts.Add(file);

 		if (foundLooseScripts.Count > 0)
 			problemCount++;

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
		PrintReport("This report is a summary of issues detected during installation of Campfire that may prevent Campfire from working correctly.");
		PrintReport("");
		PrintReport("Resolve the issues noted below, then press 'Refresh' to confirm that they have been fixed.");
		PrintReport("After all problems have been resolved, you can press 'Install' again to complete installation. Or, 'Install Anyway' AT YOUR OWN RISK.");
		PrintReport("");

		if (foundLooseScripts.Count > 0) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("There are script files in your 'Data/' folder which override newer versions from the Campfire.bsa archive.");
			PrintReport("");
			PrintReport("These files are:");
 			foreach (string file in foundLooseScripts)
	 			PrintReport("\tData/" + file);
			PrintReport("");
	 		PrintReport("Potential causes:");
	 		PrintReport("* You decompressed the BSA archive into loose files from a previous version of the mod.");
	 		PrintReport("* You installed the Campfire Dev Kit, but didn't remove it.");
	 		PrintReport("");
	 		PrintReport("Solution:");
	 		PrintReport("1. If you have the Campfire Dev Kit installed, uninstall or disable it, and try again.");
	 		PrintReport("2. If there are still conflicting files reported, delete them manually.");
	 		PrintReport("");
		}

		if (noSKSE) {
			c++;
			PrintReport("-----------");
			PrintReport("Problem #" + c + ":");
			PrintReport("-----------");
			PrintReport("The Skyrim Script Extender (SKSE) is not installed.");
			PrintReport("This isn't a critical problem, but certain specific features (such as Survival Skill: Instincts) will not function.");
			PrintReport("You can safely continue with the installation if you are OK with these features not being available.");
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
        titleLabel = new System.Windows.Forms.Label();
        subTitleLabel = new System.Windows.Forms.Label();
        artwork = new System.Windows.Forms.Label();
        artCredit = new System.Windows.Forms.Label();

        //
        // titleLabel
        //
        titleLabel.ForeColor = Color.DarkOrange;
        titleLabel.BackColor = Color.Transparent;
        titleLabel.Location = new System.Drawing.Point(156, 11);
        titleLabel.Name = "titleLabel";
        titleLabel.Font = new Font("Times New Roman", 55);
        titleLabel.Size = new System.Drawing.Size(473, 82);
        titleLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        titleLabel.Text = "CAMPFIRE";
        //
        // subTitleLabel
        //
        subTitleLabel.ForeColor = Color.White;
        subTitleLabel.BackColor = Color.Transparent;
        subTitleLabel.Location = new System.Drawing.Point(155, 97);
        subTitleLabel.Name = "subTitleLabel";
        subTitleLabel.Font = new Font("Times New Roman", 16);
        subTitleLabel.Size = new System.Drawing.Size(474, 23);
        subTitleLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
        subTitleLabel.Text = "COMPLETE CAMPING SYSTEM";

        //
        // artwork
        //
        artwork.ForeColor = Color.Gold;
        artwork.BackColor = Color.Transparent;
        artwork.Location = new System.Drawing.Point(127, 161);
        artwork.Name = "artwork";
        artwork.Font = new Font("Courier New", 22);
        artwork.Size = new System.Drawing.Size(530, 303);
        artwork.Text = "        ______\r\n       /     /\\ \r\n      /     /  \\ \r\n     /_____/----\\_    (  \r\n    \"     \"          ).  \r\n   _ ___          o (:') o\r\n  (@))_))        o ~/~~\\~ o\r\n                  o  o  o";

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
        artCredit.Text = "Art by jgs";

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
        mainInstallForm.Controls.Add(titleLabel);
        mainInstallForm.Controls.Add(subTitleLabel);
        mainInstallForm.Controls.Add(artwork);
        mainInstallForm.Controls.Add(artCredit);
        mainInstallForm.Name = "mainInstallForm";
        mainInstallForm.Text = "Campfire Installer";
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
			installCampfire();
			mainInstallForm.Close();
		}
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
}
