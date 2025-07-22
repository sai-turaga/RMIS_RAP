@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TGRC_ASSET
  as select from ztgrc_asset as Asset
  composition [*] of ZR_TGRC_ASSET_VAL               as _AssetVal
  association[1..*] to ZR_GRC_CLAIM_ASSET as _Claim
  on $projection.AssetName = _Claim.AssetName
  association[0..1] to ZR_TGRC_LOCATION as _Location
  on $projection.HierarchyNode = _Location.Level1Id
   association [0..1] to ZR_ASSET_RECTYPE_PL         as _AssetRecType_PL    on $projection.RecordType = _AssetRecType_PL.Id
  association [0..1] to ZR_AFE_PL                    as _AFE_PL             on $projection.Afe = _AFE_PL.Id
  association [0..1] to ZR_Asset_Category_PL         as _AssetCat_PL        on $projection.AssetCategory = _AssetCat_PL.Id
  association [0..1] to ZR_Asset_Status_PL           as _AssetStatus_PL     on $projection.AssetStatus = _AssetStatus_PL.Id
  association [0..1] to ZR_Asset_Type_PL             as _AssetType_PL       on $projection.AssetTypeP = _AssetType_PL.Id
  //  association [0..1] to ZR_Asset_Type2_PL       as _AssetType2_PL    on $projection.Type = _AssetType2_PL.Id
  association [0..1] to ZR_AUXILIARY_MAKE_PL         as _AuxiliaryMake_PL   on $projection.AuxiliaryEngineMake = _AuxiliaryMake_PL.Id
  association [0..1] to ZR_AUXILIARY_TYPE_PL         as _AuxiliaryType_PL   on $projection.AuxiliaryEngineType = _AuxiliaryType_PL.Id
  association [0..1] to ZR_Auxiliary_Engines_PL      as _AuxiliaryEng_PL    on $projection.NumberAuxiliaryEngines = _AuxiliaryEng_PL.Id
  association [0..1] to ZR_CANCEL_CAUSE_PL           as _CauseCancer_PL     on $projection.NumberAuxiliaryEngines = _CauseCancer_PL.Id
  association [0..1] to ZR_Class_Engine_PL           as _ClassEngine_PL     on $projection.ClassEngine = _ClassEngine_PL.Id
  association [0..1] to ZR_Class_Ice_PL              as _ClassIce_PL        on $projection.ClassIce = _ClassIce_PL.Id
  association [0..1] to ZR_Classification_Society_PL as _ClassifSocty_PL    on $projection.ClassificationSociety = _ClassifSocty_PL.Id
  association [0..1] to ZR_SOCIETY_CODE_PL           as _SocietyCode_PL     on $projection.ClassificationSocietyCode = _SocietyCode_PL.Id
  association [0..1] to ZR_Continent_PL              as _Continent_PL       on $projection.Continent = _Continent_PL.Id
  association [0..1] to ZR_Double_Hull_PL            as _DoubleHull         on $projection.DoubleHull = _DoubleHull.Id
  association [0..1] to ZR_Flag_SRC_PL               as _FlagSRC_PL         on $projection.FlagSrc = _FlagSRC_PL.Id
  association [0..1] to ZR_LAYUP_TYPE_PL             as _LayupType_PL       on $projection.LayUpType = _LayupType_PL.Id
  association [0..1] to ZR_Location_PL               as _Location_PL        on $projection.Location = _Location_PL.Id
  association [0..1] to ZR_MAERSK_OIL_PL             as _MaerskOil_PL       on $projection.MaerskOilInterest = _MaerskOil_PL.Id
  association [0..1] to ZR_ENGINE_MAKE_PL            as _EngineMake_PL      on $projection.MainEngineMake = _EngineMake_PL.Id
  association [0..1] to ZR_ENGINE_TYPE_PL            as _EngineType_PL      on $projection.MainEngineType = _EngineType_PL.Id
  association [0..1] to ZR_ENGINE_NO_PL              as _EngineNo_PL        on $projection.NumberMainEngines = _EngineNo_PL.Id
  association [0..1] to ZR_Material_PL               as _Material_PL        on $projection.Material = _Material_PL.Id
  association [0..1] to ZR_Object_Status_PL          as _ObjectStatus_PL    on $projection.ObjectStatus = _ObjectStatus_PL.Id
  association [0..1] to ZR_Ownership_Status_PL       as _OwnershipStatus_PL on $projection.OwnershipStatus = _OwnershipStatus_PL.Id
  association [0..1] to ZR_PI_CLUB_NEW_PL            as _PIClubNew_PL       on $projection.PIClubNew = _PIClubNew_PL.Id
  association [0..1] to ZR_Parcel_Tanker_PL          as _ParcelTanker_PL    on $projection.ParcelTanker = _ParcelTanker_PL.Id
  association [0..1] to ZR_VENTURE_PL                as _Venture_PL         on $projection.PartOfJointVentureYN = _Venture_PL.Id
  association [0..1] to ZR_Program_Line_PL           as _ProgramLine_PL     on $projection.ProgramLine = _ProgramLine_PL.Id
  association [0..1] to ZR_Propulsion_PL             as _Propulsion_PL      on $projection.Propulsion = _Propulsion_PL.Id
  association [0..1] to ZR_Registry_Type_PL          as _RegistryType       on $projection.RegistryType = _RegistryType.Id
  association [0..1] to ZR_SEGREGATE_TANK_PL         as _SegregateTank_PL   on $projection.SegregatedBallastTank = _SegregateTank_PL.Id
  association [0..1] to ZR_Subtype_PL                as _SubType_PL         on $projection.Subtype = _SubType_PL.Id
  association [0..1] to ZR_YOF_PL                    as _YOF_PL             on $projection.YearOfForecast1 = _YOF_PL.Id
  association [0..1] to ZR_YOM_PL                    as _YOM_PL             on $projection.YearOfManufacture = _YOM_PL.Id

{
  key asset_uuid                    as AssetUuid,
      asset_external_id             as AssetExternalId,

      //  @Consumption.valueHelpDefinition: [ {
      //  entity: {
      //    name: 'ZI_GRC_MI_CLAIM_RECORD_type',
      //    element: 'ListId'
      //  }
      //} ]
      //  list_id as ListId,
      //  value_id as ValueId,
      //    @Consumption.valueHelpDefinition: [ {
      //  entity: {
      //    name: 'ZI_GRC_MI_CLAIM_RECORD_type',
      //    element: 'ListValue'
      //  }
      //} ]
      record_type                   as RecordType,
      asset_name                    as AssetName,
      accounting_code               as AccountingCode,
      afe                           as Afe,
      agreed_value_lookup           as AgreedValueLookup,
      area_sq_km                    as AreaSqKm,
      asset_category                as AssetCategory,
      asset_description             as AssetDescription,
      asset_make_or_model           as AssetMakeOrModel,
      asset_policy_history          as AssetPolicyHistory,
      asset_status                  as AssetStatus,
      asset_type_p                  as AssetTypeP,
      type                          as Type,
      declared_value                as DeclaredValue,
      asset_value_status            as AssetValueStatus,
      auxiliary_engine_horsepower   as AuxiliaryEngineHorsepower,
      auxiliary_engine_kilowatts    as AuxiliaryEngineKilowatts,
      auxiliary_engine_make         as AuxiliaryEngineMake,
      auxiliary_engine_rpm          as AuxiliaryEngineRpm,
      auxiliary_engine_type         as AuxiliaryEngineType,
      number_auxiliary_engines      as NumberAuxiliaryEngines,
      block                         as Block,
      blowout_preventer_rating      as BlowoutPreventerRating,
      bottom_hole_temperature       as BottomHoleTemperature,
      breadth                       as Breadth,
      breadth_extreme_meters        as BreadthExtremeMeters,
      building_yard_code            as BuildingYardCode,
      building_yard_number          as BuildingYardNumber,
      call_sign                     as CallSign,
      cancellation_date             as CancellationDate,
      cargo_value                   as CargoValue,
      cause_of_cancellation         as CauseOfCancellation,
      class_engine                  as ClassEngine,
      class_gen                     as ClassGen,
      class_ice                     as ClassIce,
      classification_society        as ClassificationSociety,
      classification_society_code   as ClassificationSocietyCode,
      content_equipment             as ContentEquipment,
      continent                     as Continent,
      currency                      as Currency,
      current_asset_value           as CurrentAssetValue,
      curr_covr_under_construct_ins as CurrCovrUnderConstructIns,
      date_added_acquired           as DateAddedAcquired,
      dt_asset_attch_dtch_to_policy as DtAssetAttchDtchToPolicy,
      date_of_removal_disposal      as DateOfRemovalDisposal,
      date_ownership_effective      as DateOwnershipEffective,
      deadweight_tonnage            as DeadweightTonnage,
      depth                         as Depth,
      description                   as Description,
      displacement_meters           as DisplacementMeters,
      double_hull                   as DoubleHull,
      draught_meters                as DraughtMeters,
      drilling_contrator            as DrillingContrator,
      expected_redelivery_date      as ExpectedRedeliveryDate,
      fi                            as Fi,
      field_code                    as FieldCode,
      flag                          as Flag,
      flag_src                      as FlagSrc,
      fleet_number                  as FleetNumber,
      formula_deadweight            as FormulaDeadweight,
      gross_register_tonnage        as GrossRegisterTonnage,
      gross_tonnage                 as GrossTonnage,
      head_owners                   as HeadOwners,
      hfm_code                      as HfmCode,
      hierarchy_managed             as HierarchyManaged,
      imo_number                    as ImoNumber,
      hierarchy_node                as HierarchyNode,
      july2023update                as July2023update,
      last_handled_date             as LastHandledDate,
      lay_up_date                   as LayUpDate,
      lay_up_position               as LayUpPosition,
      lay_up_type                   as LayUpType,
      length_overall_meters         as LengthOverallMeters,
      location                      as Location,
      maersk_oil_interest           as MaerskOilInterest,
      main_engine_horsepower        as MainEngineHorsepower,
      main_engine_kilowatts         as MainEngineKilowatts,
      main_engine_make              as MainEngineMake,
      main_engine_rpm               as MainEngineRpm,
      main_engine_type              as MainEngineType,
      number_main_engines           as NumberMainEngines,
      managing_owners               as ManagingOwners,
      material                      as Material,
      maxvaluationdate              as Maxvaluationdate,
      md                            as Md,
      depth_below_seabed_feet       as DepthBelowSeabedFeet,
      mmsi_number                   as MmsiNumber,
      notes                         as Notes,
      number_of_passengers          as NumberOfPassengers,
      object_status                 as ObjectStatus,
      operator                      as Operator,
      ownership                     as Ownership,
      ownership_status              as OwnershipStatus,
      p_i_club_new                  as PIClubNew,
      parcel_tanker                 as ParcelTanker,
      part_of_joint_venture_y_n     as PartOfJointVentureYN,
      partners                      as Partners,
      picture                       as Picture,
      port                          as Port,
      port_of_registry              as PortOfRegistry,
      production_start              as ProductionStart,
      program_entry                 as ProgramEntry,
      program_exit                  as ProgramExit,
      program_line                  as ProgramLine,
      propulsion                    as Propulsion,
      property                      as Property,
      purchase_date                 as PurchaseDate,
      registration_date             as RegistrationDate,
      registry_type                 as RegistryType,
      revenue                       as Revenue,
      rk_asset_value_status_date    as RkAssetValueStatusDate,
      segregated_ballast_tank       as SegregatedBallastTank,
      serial_no                     as SerialNo,
      spud_date                     as SpudDate,
      subtype                       as Subtype,
      terminal_name                 as TerminalName,
      total_length_km               as TotalLengthKm,
      tvd                           as Tvd,
      unique_id_1                   as UniqueId1,
      unique_id_2                   as UniqueId2,
      utilisation                   as Utilisation,
      vessel_code                   as VesselCode,
      vessel_ex_name                as VesselExName,
      warehouse_office_buildings    as WarehouseOfficeBuildings,
      water_depth                   as WaterDepth,
      year_built                    as YearBuilt,
      year_of_forecast1             as YearOfForecast1,
      year_of_manufacture           as YearOfManufacture,
      @Semantics.user.createdBy: true
      createdby                     as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat                     as Createdat,
      @Semantics.user.localInstanceLastChangedBy: true
      lastchangedby                 as Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat                 as Lastchangedat,
      _AssetVal,
      _Claim,
      _Location,
      //Piclist
      _AssetRecType_PL,
      _AFE_PL,
      _AssetCat_PL,
      _AssetStatus_PL,
      _AuxiliaryMake_PL,
      _AuxiliaryType_PL,
      _AuxiliaryEng_PL,
      _CauseCancer_PL,
      _ClassEngine_PL,
      _ClassIce_PL,
      _ClassifSocty_PL,
      _SocietyCode_PL,
      _Continent_PL,
      _DoubleHull,
      _FlagSRC_PL,
      _LayupType_PL,
      _Location_PL,
      _MaerskOil_PL,
      _EngineMake_PL,
      _EngineType_PL,
      _EngineNo_PL,
      _Material_PL,
      _ObjectStatus_PL,
      _OwnershipStatus_PL,
      _PIClubNew_PL,
      _ParcelTanker_PL,
      _Venture_PL,
      _ProgramLine_PL,
      _Propulsion_PL,
      _RegistryType,
      _SegregateTank_PL,
      _SubType_PL,
      _YOF_PL,
      _YOM_PL

}
