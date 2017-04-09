// *** GENERAL SETTINGS ***
GRLIB_side_friendly = EAST;
GRLIB_side_enemy = WEST;

GRLIB_color_friendly = "ColorOPFOR";
GRLIB_color_enemy = "ColorBLUFOR";
GRLIB_color_enemy_bright = "ColorBlue";

GRLIB_civ_killing_penalty = 60;

// Array of names used for FOBs there should be 26 names in this array.
// The names will be used in order in which they appear in array.
military_alphabet = ["Anna","Boris","Vasily","Gregory","Dmitri","Yelena","Ivan","Konstantin","Leonid","Mikhail","Nikolai","Olga","Pavel","Roman","Semyon","Tatyana","Ulyana","Fyodor","Khariton","Shura","Yuri","Yakov","Maxim","","Pyotor","Yaroslav"];

// Allow MI8 to lift heavy stuff with advanced slingloading
ASL_HEAVY_LIFTING_MIN_LIFT_OVERRIDE = 2700;

// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.

// REQUIRED MODS FOR THIS PRESET:
// CBA A3
// RHS: Armed Forces of the Russian Federation
// RHS: Green Forces

// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";					// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = "O_CargoNet_01_ammo_F";				// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = "rhs_typhoon_vdv";					// Default "B_Truck_01_box_F";
Arsenal_typename = "rhs_weapon_crate";					// Default "B_supplyCrate_F";
Respawn_truck_typename = "rhsgref_BRDM2UM_msv";			// Default "B_Truck_01_medical_F";
huron_typename = "RHS_Mi8mt_vdv";						// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_East_AmmoVeh_F";				// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_NATO_AmmoVeh_F";				// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "B_Truck_01_transport_F";		// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = "rhs_msv_emr_officer_armored";	// Default "B_officer_F"
crewman_classname = "rhs_msv_emr_armoredcrew";			// Default "B_crew_F";
pilot_classname = "rhs_pilot_combat_heli";				// Default "B_Helipilot_F";
KP_liberation_little_bird_classname = "rhs_ka60_grey";	// Default "B_Heli_Light_01_F" // classname of little birds that spawn on the lhd or chimera base




// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = true;
infantry_units_extension = [
	["rhs_msv_emr_rifleman",2,0,0],
	["rhs_msv_emr_grenadier",3,0,0],
	["rhs_msv_emr_arifleman",3,0,0],
	["rhs_msv_emr_medic",3,0,0],
	["rhs_msv_emr_marksman",3,0,0],
	["rhs_msv_emr_engineer",3,0,0],
	["rhs_msv_emr_grenadier_rpg",4,0,0],
	["rhs_msv_emr_machinegunner",4,0,0],
	["rhs_vmf_recon_rifleman",4,0,0],
	["rhs_vmf_recon_marksman",4,0,0],
	["rhs_msv_emr_aa",5,10,0],
	["rhs_msv_emr_armoredcrew",1,0,0],
	["rhs_pilot_combat_heli",1,0,0]
];

light_vehicles_overwrite = true;
light_vehicles_extension = [
	["O_Quadbike_01_F",0,0,2],
	["rhs_uaz_open_vmf",0,0,4],
	["rhs_tigr_m_msv",0,0,10],
	["rhs_tigr_sts_msv",0,40,15],
	["RHS_Ural_Zu23_MSV_01",0,45,15],
	["RHS_Ural_Open_MSV_01",0,0,5],
	["RHS_Ural_MSV_01",0,0,5],
	["rhs_gaz66_ap2_msv",5,0,5],
	["O_Boat_Transport_01_F",0,0,2],
	["O_Boat_Armed_01_hmg_F",0,70,15]
];

heavy_vehicles_overwrite = true;
heavy_vehicles_extension = [
	["rhs_pts_vmf",0,0,10],
	["rhsgref_BRDM2_msv",0,70,10],
	["rhsgref_BRDM2_ATGM_msv",0,110,10],
	["rhs_zsu234_aa",0,200,15],
	["rhs_bmp1d_msv",0,200,15],
	["rhs_bmp2d_msv",0,250,15],
	["rhs_t72ba_tv",0,450,20],
	["rhs_sprut_vdv",0,400,20],
	["rhs_t90a_tv",0,600,25],
	["rhs_2s3_tv",0,1800,30]
];

air_vehicles_overwrite = true;
air_vehicles_extension = [
	["rhs_ka60_c",0,0,10],
	["RHS_Ka52_vvs",0,800,30],
	["RHS_Mi24P_AT_vdv",0,800,30],
	["RHS_Mi24V_AT_vdv",0,800,30],
	["rhs_mi28n_vvs",0,1100,40],
	["RHS_Su25SM_KH29_vvs",0,1500,50],
	["RHS_Su25SM_vvs",0,1200,50],
	// UAV
	["rhs_pchela1t_vvs",0,0,5],
	["O_UAV_01_F",0,50,5],
	["O_UAV_02_F",0,500,20],
	["O_UAV_02_CAS_F",0,600,20]
];

static_vehicles_overwrite = true;
static_vehicles_extension = [
	["RHS_NSV_TriPod_MSV",0,20,0],
	["rhs_KORD_MSV",0,20,0],
	["rhs_KORD_high_MSV",0,20,0],
	["RHS_AGS30_TriPod_MSV",0,40,0],
	["rhs_SPG9M_MSV",0,40,0],
	["rhs_Igla_AA_pod_msv",0,50,0],
	["RHS_ZU23_MSV",0,45,0],
	["rhs_Metis_9k115_2_msv",0,50,0],
	["rhs_Kornet_9M133_2_msv",0,60,0],
	["rhs_D30_at_msv",0,100,0],
	["rhs_D30_msv",0,220,0],
	["rhs_2b14_82mm_msv",0,120,0]
];

buildings_overwrite = true;
buildings_extension = [
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["rhs_Flag_Russia_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],
	["Flag_White_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
	["CargoNet_01_box_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["Land_Metal_rack_Tall_F",0,0,0],
	["PortableHelipadLight_01_blue_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles_overwrite = true;		// If you're going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
	[Arsenal_typename,10,0,0],
	[Respawn_truck_typename,20,0,8],
	[FOB_box_typename,30,400,0],
	[FOB_truck_typename,30,400,5],
	["ACE_medicalSupplyCrate_advanced",5,0,0],
	["ACE_Box_82mm_Mo_HE",5,40,0],
	["ACE_Box_82mm_Mo_Smoke",5,10,0],
	["ACE_Box_82mm_Mo_Illum",5,10,0],
	["rhs_gaz66_repair_msv",10,20,5],
	["RHS_Ural_Fuel_MSV_01",10,20,25],
	["rhs_gaz66_ammo_msv",10,80,5],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,20],
	["B_Slingload_01_Ammo_F",5,60,0],
	["Box_NATO_AmmoVeh_F",0,154,0],
	["Box_East_AmmoVeh_F",0,115,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"rhs_pchela1t_vvs",
	"O_UAV_01_F",
	"O_UAV_02_F",
	"O_UAV_02_CAS_F"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [
	"rhs_msv_emr_sergeant",
	"rhs_msv_emr_efreitor",
	"rhs_msv_emr_grenadier_rpg",
	"rhs_msv_emr_strelok_rpg_assist",
	"rhs_msv_emr_machinegunner",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_rifleman"
];

// Heavy infantry squad
blufor_squad_inf = [
	"rhs_msv_emr_sergeant",
	"rhs_msv_emr_efreitor",
	"rhs_msv_emr_grenadier_rpg",
	"rhs_msv_emr_strelok_rpg_assist",
	"rhs_msv_emr_machinegunner",
	"rhs_msv_emr_machinegunner",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_rifleman"
];

// AT specialists squad
blufor_squad_at = [
	"rhs_msv_emr_junior_sergeant",
	"rhs_msv_emr_at",
	"rhs_msv_emr_at",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_LAT",
	"rhs_msv_emr_rifleman"
];

// AA specialists squad
blufor_squad_aa = [
	"rhs_msv_emr_junior_sergeant",
	"rhs_msv_emr_aa",
	"rhs_msv_emr_aa",
	"rhs_msv_emr_aa",
	"rhs_msv_emr_rifleman"
];

// Force recon squad
blufor_squad_recon = [
	"rhs_vdv_recon_sergeant",
	"rhs_vdv_recon_efreitor",
	"rhs_vdv_recon_arifleman",
	"rhs_vdv_recon_machinegunner_assistant",
	"rhs_vdv_recon_rifleman_lat",
	"rhs_vdv_recon_grenadier",
	"rhs_vdv_recon_grenadier",
	"rhs_vdv_recon_rifleman_lat"
];

// Paratroopers squad
blufor_squad_para = [
	"rhs_vdv_recon_sergeant",
	"rhs_vdv_recon_efreitor",
	"rhs_vdv_recon_efreitor",
	"rhs_vdv_recon_arifleman",
	"rhs_vdv_recon_machinegunner_assistant",
	"rhs_vdv_recon_rifleman_lat",
	"rhs_vdv_recon_grenadier",
	"rhs_vdv_recon_grenadier",
	"rhs_vdv_recon_rifleman_lat"
];







// *** BADDIES ***

// All Enemy infantry. Defining a value here will replace the default value from the original mission.
opfor_sentry = "rhsgref_cdf_b_reg_rifleman_lite";
opfor_rifleman = "rhsgref_cdf_b_reg_rifleman_m70";
opfor_grenadier = "rhsgref_cdf_b_reg_grenadier";
opfor_squad_leader = "rhsgref_cdf_b_reg_squadleader";
opfor_team_leader = "rhsgref_cdf_b_reg_rifleman";
opfor_marksman = "rhsgref_cdf_b_reg_marksman";
opfor_machinegunner = "rhsgref_cdf_b_reg_machinegunner";
opfor_heavygunner = "rhsgref_cdf_b_para_autorifleman";
opfor_medic = "rhsgref_cdf_b_reg_medic";
opfor_rpg = "rhsgref_cdf_b_reg_grenadier_rpg";
opfor_at = "rhsgref_cdf_b_reg_grenadier_rpg";
opfor_aa = "rhsgref_cdf_b_reg_specialist_aa";
opfor_officer = "rhsgref_cdf_b_reg_officer";
opfor_sharpshooter = "rhsgref_cdf_b_reg_marksman";
opfor_sniper = "rhsgref_cdf_b_reg_marksman";
opfor_engineer = "rhsgref_cdf_b_reg_engineer";
opfor_paratrooper = "rhsgref_cdf_b_para_rifleman";

// Enemy Vehicles to be used in secondary objectives
opfor_mrap = "rhsgref_BRDM2UM_b";
opfor_mrap_armed = "rhsgref_BRDM2_b";
opfor_transport_helo = "rhsgref_cdf_b_reg_Mi8amt";
opfor_transport_truck = "rhsgref_cdf_b_ural_open";
opfor_fuel_truck = "rhsgref_cdf_b_ural_fuel";
opfor_ammo_truck = "rhsgref_cdf_b_gaz66_ammo";
opfor_fuel_container = nil;
opfor_ammo_container = nil;
opfor_flag = "FlagCarrierCDF";

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = true;
militia_squad_extension = [
	"LOP_NAPA_Infantry_SL",
	"LOP_NAPA_Infantry_MG",
	"LOP_NAPA_Infantry_AT",
	"LOP_NAPA_Infantry_Marksman",
	"LOP_NAPA_Infantry_Engineer",
	"LOP_NAPA_Infantry_Corpsman",
	"LOP_NAPA_Infantry_TL",
	"LOP_NAPA_Infantry_Rifleman",
	"LOP_NAPA_Infantry_Rifleman_2",
	"LOP_NAPA_Infantry_Rifleman_3",
	"LOP_NAPA_Infantry_GL",
	"LOP_NAPA_Infantry_GL_2",
	"LOP_NAPA_Infantry_Prizrak"
];

// Militia vehicles to choose from
militia_vehicles_overwrite = true;
militia_vehicles_extension = [
	"LOP_NAPA_Landrover_M2",
	"LOP_NAPA_Offroad_M2"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = true;
opfor_vehicles_extension = [
	"rhsgref_cdf_b_btr60",
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_bmp2k",
	"rhsgref_cdf_b_t80b_tv",
	"rhsgref_cdf_b_t80b_tv",
	"rhsgref_cdf_b_zsu234",
	"rhsgref_BRDM2_b",
	"rhsgref_BRDM2_b",
	"rhsgref_cdf_b_reg_uaz_dshkm"
];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = true;
opfor_vehicles_low_intensity_extension = [
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr60",
	"rhsgref_cdf_b_btr60",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_reg_uaz_dshkm",
	"rhsgref_cdf_b_reg_uaz_dshkm",
	"rhsgref_cdf_b_reg_uaz_ags",
	"rhsgref_cdf_b_reg_uaz_spg9"
];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = true;
opfor_battlegroup_vehicles_extension = [
	"rhsgref_cdf_b_reg_uaz_ags",
	"rhsgref_cdf_b_reg_uaz_dshkm",
	"rhsgref_cdf_b_btr60",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_ural_open",
	"rhsgref_cdf_b_t80b_tv",
	"rhsgref_cdf_b_t80b_tv",
	"rhsgref_cdf_b_zsu234",
	"rhsgref_b_mi24g_CAS",
	"rhsgref_cdf_b_Mi24D",
	"rhsgref_cdf_b_reg_Mi8amt",
	"rhsgref_cdf_b_ural"
];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = true;
opfor_battlegroup_vehicles_low_intensity_extension = [
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_reg_uaz_ags",
	"rhsgref_cdf_b_reg_uaz_dshkm",
	"rhsgref_cdf_b_reg_uaz_dshkm",
	"rhsgref_cdf_b_ural_open",
	"rhsgref_cdf_b_reg_Mi8amt",
	"rhsgref_cdf_b_ural_open"
];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = true;
opfor_troup_transports_extension = [
	"rhsgref_cdf_b_bmp2d",
	"rhsgref_cdf_b_btr70",
	"rhsgref_cdf_b_ural_open",
	"rhsgref_cdf_b_ural",
	"rhsgref_cdf_b_Mi24D",
	"rhsgref_cdf_b_reg_Mi8amt",
	"rhsgref_b_mi24g_CAS"
];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = true;
opfor_choppers_extension = [
	"rhsgref_b_mi24g_CAS",
	"rhsgref_cdf_b_Mi24D",
	"rhsgref_cdf_b_reg_Mi8amt"
];

// Opfor military aircrafts
opfor_air_overwrite = true;
opfor_air_extension = [
	"rhs_l159_cdf_b_CDF_plamen"
];







// Other stuff

// civilians
civilians_overwrite = false;
civilians_extension = [

];

// Civilian vehicles
civilian_vehicles_overwrite = false;
civilian_vehicles_extension = [

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [
	"rhs_gaz66_ammo_msv"
];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [
	"rhs_gaz66_repair_msv"
];
vehicle_rearm_sources_extension = [
	"rhs_gaz66_ammo_msv"
];
vehicle_refuel_sources_extension = [
	"RHS_Ural_Fuel_MSV_01"
];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
	"rhs_bmp2d_msv",
	"rhs_t72ba_tv",
	"rhs_t90a_tv",
	"rhs_sprut_vdv",
	"rhs_2s3_tv",
	"rhs_zsu234_aa",
	"RHS_Ka52_vvs",
	"RHS_Mi24P_AT_vdv",
	"RHS_Mi24V_AT_vdv",
	"rhs_mi28n_vvs",
	"RHS_Su25SM_KH29_vvs",
	"RHS_Su25SM_vvs",
	"O_UAV_01_F",
	"O_UAV_02_F",
	"O_UAV_02_CAS_F",
	"rhs_D30_msv"
];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf

// Classnames of weapons which should not be available in the arsenal
blacklisted_from_arsenal_weapons = [

];

// Classnames of items (optics, uniforms, vests, etc.) which should not be available in the arsenal
blacklisted_from_arsenal_items = [
	"optic_Nightstalker",
	"optic_tws",
	"optic_tws_mg"
];

// Classnames of magazines or explosives which should not be available in the arsenal
blacklisted_from_arsenal_magazines = [

];

// Classnames of backpacks which should not be available in the arsenal
blacklisted_from_arsenal_extension = [

];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
	[ "greuh_eh101_gr", -6.5, [0, 4.2, -1.45], [0,	2.5, -1.45], [0, 0.8, -1.45], [0, -0.9, -1.45] ],
	[ "rhs_pts_vmf", -8.5, [0, 2.65, 0.1], [0, 1, 0.1], [0, -0.7, 0.1], [0, -2.4, 0.1] ],
	[ "RHS_Ural_Open_MSV_01", -4.5, [0, -0.5, 0.6], [0, -2.4, 0.6] ],
	[ "RHS_Ural_MSV_01", -4.5, [0, -0.5, 0.6], [0, -2.4, 0.6] ]
];