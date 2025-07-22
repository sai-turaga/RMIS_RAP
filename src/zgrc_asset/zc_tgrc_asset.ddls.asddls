@Metadata.allowExtensions: true
@EndUserText.label: 'Asset'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TGRC_ASSET
  provider contract transactional_query
  as projection on ZR_TGRC_ASSET
{
  key AssetUuid,
      AssetExternalId,
      @ObjectModel.text.element:  ['RecordType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ASSET_RECTYPE_PL', element: 'Id' } }]
      RecordType,
      _AssetRecType_PL.RecordType as RecordType_PL,
//       @UI.hidden: #(HideAssetName)
      AssetName,
//      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
//  virtual HideAssetName        :abap_boolean,
  
       @UI.hidden: #(HideAccountingCode)
      AccountingCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAccountingCode        :abap_boolean,
      
       @UI.hidden: #(HideAfe)
      @ObjectModel.text.element:  ['AFE_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_AFE_PL', element: 'Id' } }]
      Afe,
      _AFE_PL.AFE                             as AFE_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAfe        :abap_boolean,
  
       @UI.hidden: #(HideAgreedValueLookup)
      AgreedValueLookup,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAgreedValueLookup        :abap_boolean,
  
       @UI.hidden: #(HideAreaSqKm)
      AreaSqKm,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAreaSqKm        :abap_boolean,
  
       @UI.hidden: #(HideAssetCategory)
      @ObjectModel.text.element:  ['AssetCat_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Asset_Category_PL', element: 'Id' } }]
      AssetCategory,
      _AssetCat_PL                            as AssetCat_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetCategory        :abap_boolean,
  
       @UI.hidden: #(HideAssetDescription)
      AssetDescription,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetDescription        :abap_boolean,
  
       @UI.hidden: #(HideAssetMakeOrModel)
      AssetMakeOrModel,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetMakeOrModel        :abap_boolean,
  
       @UI.hidden: #(HideAssetPolicyHistory)
      AssetPolicyHistory,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetPolicyHistory        :abap_boolean,
  
       @UI.hidden: #(HideAssetStatus)
      @ObjectModel.text.element:  ['AssetStatus_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Asset_Status_PL', element: 'Id' } }]
      AssetStatus,
      _AssetStatus_PL.Asset_Status            as AssetStatus_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetStatus        :abap_boolean,
  
       @UI.hidden: #(HideAssetTypeP)
      AssetTypeP,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetTypeP        :abap_boolean,
  
       @UI.hidden: #(HideType)
      Type,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideType        :abap_boolean,
  
       @UI.hidden: #(HideDeclaredValue)
      DeclaredValue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDeclaredValue        :abap_boolean,
  
       @UI.hidden: #(HideAssetValueStatus)
      AssetValueStatus,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueStatus        :abap_boolean,
  
       @UI.hidden: #(HideAuxiliaryEngineHorsepower)
      AuxiliaryEngineHorsepower,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAuxiliaryEngineHorsepower        :abap_boolean,
  
       @UI.hidden: #(HideAuxiliaryEngineKilowatts)
      AuxiliaryEngineKilowatts,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAuxiliaryEngineKilowatts        :abap_boolean,
  
       @UI.hidden: #(HideAuxiliaryEngineMake)
      @ObjectModel.text.element:  ['AuxiliaryMake_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_AUXILIARY_MAKE_PL', element: 'Id' } }]
      AuxiliaryEngineMake,
      _AuxiliaryMake_PL.Auxiliary_Make        as AuxiliaryMake_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAuxiliaryEngineMake        :abap_boolean,
  
       @UI.hidden: #(HideAuxiliaryEngineRpm)
      AuxiliaryEngineRpm,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAuxiliaryEngineRpm        :abap_boolean,
  
       @UI.hidden: #(HideAuxiliaryEngineType)
      @ObjectModel.text.element:  ['AuxiliaryType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_AUXILIARY_TYPE_PL', element: 'Id' } }]
      AuxiliaryEngineType,
       _AuxiliaryType_PL.Auxiliary_Type        as AuxiliaryType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAuxiliaryEngineType        :abap_boolean,
  
   
       @UI.hidden: #(HideNumberAuxiliaryEngines)
      @ObjectModel.text.element:  ['AuxiliaryEngines_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Auxiliary_Engines_PL', element: 'Id' } }]
      NumberAuxiliaryEngines,
      _AuxiliaryEng_PL.Auxiliary_Engines      as AuxiliaryEngines_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideNumberAuxiliaryEngines        :abap_boolean,
  
       @UI.hidden: #(HideBlock)
      Block,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBlock        :abap_boolean,
  
       @UI.hidden: #(HideBlowoutPreventerRating)
      BlowoutPreventerRating,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBlowoutPreventerRating        :abap_boolean,
  
       @UI.hidden: #(HideBottomHoleTemperature)
      BottomHoleTemperature,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBottomHoleTemperature        :abap_boolean,
  
       @UI.hidden: #(HideBreadth)
      Breadth,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBreadth        :abap_boolean,
  
       @UI.hidden: #(HideBreadthExtremeMeters)
      BreadthExtremeMeters,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBreadthExtremeMeters        :abap_boolean,
  
       @UI.hidden: #(HideBuildingYardCode)
      BuildingYardCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBuildingYardCode        :abap_boolean,
  
       @UI.hidden: #(HideBuildingYardNumber)
      BuildingYardNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBuildingYardNumber        :abap_boolean,
  
       @UI.hidden: #(HideCallSign)
      CallSign,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCallSign        :abap_boolean,
  
       @UI.hidden: #(HideCancellationDate)
      CancellationDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCancellationDate        :abap_boolean,
  
       @UI.hidden: #(HideCargoValue)
      CargoValue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCargoValue        :abap_boolean,
  
       @UI.hidden: #(HideCauseOfCancellation)
      @ObjectModel.text.element:  ['AuxiliaryEngines_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CANCEL_CAUSE_PL', element: 'Id' } }]
      CauseOfCancellation,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCauseOfCancellation        :abap_boolean,
  
       @UI.hidden: #(HideClassEngine)
      @ObjectModel.text.element:  ['ClassEngine_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Class_Engine_PL', element: 'Id' } }]
      ClassEngine,
      _ClassEngine_PL.Class_Engine            as ClassEngine_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideClassEngine        :abap_boolean,
  
       @UI.hidden: #(HideClassGen)
      ClassGen,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideClassGen        :abap_boolean,
  
       @UI.hidden: #(HideClassIce)
      @ObjectModel.text.element:  ['ClassIce_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Class_Ice_PL', element: 'Id' } }]
      ClassIce,
      _ClassIce_PL.Class_Ice                  as ClassIce_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideClassIce        :abap_boolean,
  
       @UI.hidden: #(HideClassificationSociety)
      @ObjectModel.text.element:  ['ClassifSocty_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Classification_Society_PL', element: 'Id' } }]
      ClassificationSociety,
      _ClassifSocty_PL.Classification_Society as ClassifSocty_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideClassificationSociety        :abap_boolean,
  
       @UI.hidden: #(HideClassificationSocietyCode)
      @ObjectModel.text.element:  ['SocietyCode_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SOCIETY_CODE_PL', element: 'Id' } }]
      ClassificationSocietyCode,
      _SocietyCode_PL.Society_Code            as SocietyCode_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideClassificationSocietyCode        :abap_boolean,
  
       @UI.hidden: #(HideContentEquipment)
      ContentEquipment,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideContentEquipment        :abap_boolean,
  
       @UI.hidden: #(HideContinent)
      @ObjectModel.text.element:  ['Continent_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Continent_PL', element: 'Id' } }]
      Continent,
      _Continent_PL.Continent                 as Continent_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideContinent        :abap_boolean,
  
       @UI.hidden: #(HideCurrency)
      Currency,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCurrency        :abap_boolean,
  
       @UI.hidden: #(HideCurrentAssetValue)
      CurrentAssetValue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCurrentAssetValue        :abap_boolean,
  
       @UI.hidden: #(HideCurrCovrUnderConstructIns)
      CurrCovrUnderConstructIns,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCurrCovrUnderConstructIns        :abap_boolean,
  
       @UI.hidden: #(HideDateAddedAcquired)
      DateAddedAcquired,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDateAddedAcquired        :abap_boolean,
  
       @UI.hidden: #(HideDtAssetAttchDtchToPolicy)
      DtAssetAttchDtchToPolicy,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDtAssetAttchDtchToPolicy        :abap_boolean,
  
       @UI.hidden: #(HideDateOfRemovalDisposal)
      DateOfRemovalDisposal,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDateOfRemovalDisposal        :abap_boolean,
  
       @UI.hidden: #(HideDateOwnershipEffective)
      DateOwnershipEffective,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDateOwnershipEffective        :abap_boolean,
  
       @UI.hidden: #(HideDeadweightTonnage)
      DeadweightTonnage,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDeadweightTonnage        :abap_boolean,
  
       @UI.hidden: #(HideDepth)
      Depth,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDepth        :abap_boolean,
  
       @UI.hidden: #(HideDescription)
      Description,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDescription        :abap_boolean,
  
       @UI.hidden: #(HideDisplacementMeters)
      DisplacementMeters,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDisplacementMeters        :abap_boolean,
  
       @UI.hidden: #(HideDoubleHull)
      @ObjectModel.text.element:  ['DoubleHull_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Double_Hull_PL', element: 'Id' } }]
      DoubleHull,
      _DoubleHull.Double_Hull                 as DoubleHull_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDoubleHull        :abap_boolean,
    
       @UI.hidden: #(HideDraughtMeters)
      DraughtMeters,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDraughtMeters        :abap_boolean,
  
       @UI.hidden: #(HideDrillingContrator)
      DrillingContrator,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDrillingContrator        :abap_boolean,
  
       @UI.hidden: #(HideExpectedRedeliveryDate)
      ExpectedRedeliveryDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideExpectedRedeliveryDate        :abap_boolean,
  
       @UI.hidden: #(HideFi)
      Fi,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFi        :abap_boolean,
  
       @UI.hidden: #(HideFieldCode)
      FieldCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFieldCode        :abap_boolean,
  
       @UI.hidden: #(HideFlag)
      Flag,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFlag        :abap_boolean,
  
       @UI.hidden: #(HideFlagSrc)
      @ObjectModel.text.element:  ['FlagSRC_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Flag_SRC_PL', element: 'Id' } }]
      FlagSrc,
      _FlagSRC_PL.Flag_SRC                    as FlagSRC_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFlagSrc        :abap_boolean,
  
       @UI.hidden: #(HideFleetNumber)
      FleetNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFleetNumber        :abap_boolean,
  
       @UI.hidden: #(HideFormulaDeadweight)
      FormulaDeadweight,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFormulaDeadweight        :abap_boolean,
  
       @UI.hidden: #(HideGrossRegisterTonnage)
      GrossRegisterTonnage,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideGrossRegisterTonnage        :abap_boolean,
  
       @UI.hidden: #(HideGrossTonnage)
      GrossTonnage,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideGrossTonnage        :abap_boolean,
  
       @UI.hidden: #(HideHeadOwners)
      HeadOwners,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHeadOwners        :abap_boolean,
  
       @UI.hidden: #(HideHfmCode)
      HfmCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHfmCode        :abap_boolean,
  
       @UI.hidden: #(HideHierarchyManaged)
      HierarchyManaged,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHierarchyManaged        :abap_boolean,
  
       @UI.hidden: #(HideImoNumber)
      ImoNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideImoNumber        :abap_boolean,
  
       @UI.hidden: #(HideHierarchyNode)
        @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' } }]
      HierarchyNode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHierarchyNode        :abap_boolean,
  
       @UI.hidden: #(HideJuly2023update)
      July2023update,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideJuly2023update        :abap_boolean,
  
       @UI.hidden: #(HideLastHandledDate)
      LastHandledDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLastHandledDate        :abap_boolean,
  
       @UI.hidden: #(HideLayUpDate)
      LayUpDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLayUpDate        :abap_boolean,
  
       @UI.hidden: #(HideLayUpPosition)
      LayUpPosition,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLayUpPosition        :abap_boolean,
  
       @UI.hidden: #(HideLayUpType)
      @ObjectModel.text.element:  ['LayupType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LAYUP_TYPE_PL', element: 'Id' } }]
      LayUpType,
      _LayupType_PL.Layup_Type                as LayupType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLayUpType        :abap_boolean,
  
       @UI.hidden: #(HideLengthOverallMeters)
      LengthOverallMeters,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLengthOverallMeters        :abap_boolean,
  
       @UI.hidden: #(HideLocation)
      @ObjectModel.text.element:  ['Location_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Location_PL', element: 'Id' } }]
      Location,
      _Location_PL.Location                   as Location_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLocation        :abap_boolean,
  
       @UI.hidden: #(HideMaerskOilInterest)
      @ObjectModel.text.element:  ['MaerskOil_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAERSK_OIL_PL', element: 'Id' } }]
      MaerskOilInterest,
      _MaerskOil_PL.Maersk_Oil                as MaerskOil_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMaerskOilInterest        :abap_boolean,
  
       @UI.hidden: #(HideMainEngineHorsepower)
      MainEngineHorsepower,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMainEngineHorsepower        :abap_boolean,
  
       @UI.hidden: #(HideMainEngineKilowatts)
      MainEngineKilowatts,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMainEngineKilowatts        :abap_boolean,
  
       @UI.hidden: #(HideMainEngineMake)
      @ObjectModel.text.element:  ['EngineMake_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ENGINE_MAKE_PL', element: 'Id' } }]
      MainEngineMake,
      _EngineMake_PL.Engine_Make              as EngineMake_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMainEngineMake        :abap_boolean,
  
       @UI.hidden: #(HideMainEngineRpm)
      MainEngineRpm,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMainEngineRpm        :abap_boolean,
  
       @UI.hidden: #(HideMainEngineType)
      @ObjectModel.text.element:  ['EngineType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ENGINE_TYPE_PL', element: 'Id' } }]
      MainEngineType,
      _EngineType_PL.Engine_Type              as EngineType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMainEngineType        :abap_boolean,
  
       @UI.hidden: #(HideNumberMainEngines)
      @ObjectModel.text.element:  ['EngineNo_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ENGINE_NO_PL', element: 'Id' } }]
      NumberMainEngines,
      _EngineNo_PL.Engine_Number              as EngineNo_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideNumberMainEngines        :abap_boolean,
  
       @UI.hidden: #(HideManagingOwners)
      ManagingOwners,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideManagingOwners        :abap_boolean,
  
       @UI.hidden: #(HideMaterial)
      @ObjectModel.text.element:  ['Material_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Material_PL', element: 'Id' } }]
      Material,
      _Material_PL.Material                   as Material_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMaterial        :abap_boolean,
  
       @UI.hidden: #(HideMaxvaluationdate)
      Maxvaluationdate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMaxvaluationdate        :abap_boolean,
  
       @UI.hidden: #(HideMd)
      Md,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMd        :abap_boolean,
  
       @UI.hidden: #(HideDepthBelowSeabedFeet)
      DepthBelowSeabedFeet,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDepthBelowSeabedFeet        :abap_boolean,
  
       @UI.hidden: #(HideMmsiNumber)
      MmsiNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMmsiNumber        :abap_boolean,
  
       @UI.hidden: #(HideNotes)
      Notes,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideNotes        :abap_boolean,
  
       @UI.hidden: #(HideNumberOfPassengers)
      NumberOfPassengers,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideNumberOfPassengers        :abap_boolean,
  
       @UI.hidden: #(HideObjectStatus)
      @ObjectModel.text.element:  ['ObjectStatus_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Object_Status_PL', element: 'Id' } }]
      ObjectStatus,
      _ObjectStatus_PL.Object_Status          as ObjectStatus_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideObjectStatus        :abap_boolean,
  
       @UI.hidden: #(HideOperator)
      Operator,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOperator        :abap_boolean,
  
       @UI.hidden: #(HideOwnership)
      Ownership,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOwnership        :abap_boolean,
  
       @UI.hidden: #(HideOwnershipStatus)
      @ObjectModel.text.element:  ['OwnerStatus_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Ownership_Status_PL', element: 'Id' } }]
      OwnershipStatus,
      _OwnershipStatus_PL.Owner_Status        as OwnerStatus_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOwnershipStatus        :abap_boolean,
  
       @UI.hidden: #(HidePIClubNew)
      @ObjectModel.text.element:  ['PIClub_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PI_CLUB_NEW_PL', element: 'Id' } }]
      PIClubNew,
      _PIClubNew_PL.PI_Club                   as PIClub_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePIClubNew        :abap_boolean,
  
       @UI.hidden: #(HideParcelTanker)
      @ObjectModel.text.element:  ['ParcelTanker_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Parcel_Tanker_PL', element: 'Id' } }]
      ParcelTanker,
      _ParcelTanker_PL.Parcel_Tanker          as ParcelTanker_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideParcelTanker        :abap_boolean,
  
       @UI.hidden: #(HidePartOfJointVentureYN)
      @ObjectModel.text.element:  ['Venture_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VENTURE_PL', element: 'Id' } }]
      PartOfJointVentureYN,
      _Venture_PL.Venture                     as Venture_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePartOfJointVentureYN        :abap_boolean,
  
       @UI.hidden: #(HidePartners)
      Partners,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePartners        :abap_boolean,
  
       @UI.hidden: #(HidePicture)
      Picture,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePicture        :abap_boolean,
  
       @UI.hidden: #(HidePort)
      Port,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePort        :abap_boolean,
  
       @UI.hidden: #(HidePortOfRegistry)
      PortOfRegistry,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePortOfRegistry        :abap_boolean,
  
       @UI.hidden: #(HideProductionStart)
      ProductionStart,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProductionStart        :abap_boolean,
  
       @UI.hidden: #(HideProgramEntry)
      ProgramEntry,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProgramEntry        :abap_boolean,
  
       @UI.hidden: #(HideProgramExit)
      ProgramExit,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProgramExit        :abap_boolean,
  
       @UI.hidden: #(HideProgramLine)
      @ObjectModel.text.element:  ['ProgramLine_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Program_Line_PL', element: 'Id' } }]
      ProgramLine,
      _ProgramLine_PL.Program_Line            as ProgramLine_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProgramLine        :abap_boolean,
  
       @UI.hidden: #(HidePropulsion)
      @ObjectModel.text.element:  ['Propulsion_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Propulsion_PL', element: 'Id' } }]
      Propulsion,
      _Propulsion_PL.Propulsion               as Propulsion_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePropulsion        :abap_boolean,
  
       @UI.hidden: #(HideProperty)
      Property,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProperty        :abap_boolean,
  
       @UI.hidden: #(HidePurchaseDate)
      PurchaseDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePurchaseDate        :abap_boolean,
  
       @UI.hidden: #(HideRegistrationDate)
      RegistrationDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRegistrationDate        :abap_boolean,
  
       @UI.hidden: #(HideRegistryType)
      @ObjectModel.text.element:  ['RegistryType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Registry_Type_PL', element: 'Id' } }]
      RegistryType,
      _RegistryType.Registry_Type             as RegistryType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRegistryType        :abap_boolean,
  
       @UI.hidden: #(HideRevenue)
      Revenue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRevenue        :abap_boolean,
  
       @UI.hidden: #(HideRkAssetValueStatusDate)
      RkAssetValueStatusDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkAssetValueStatusDate        :abap_boolean,
  
       @UI.hidden: #(HideSegregatedBallastTank)
      @ObjectModel.text.element:  ['SegregateTank_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SEGREGATE_TANK_PL', element: 'Id' } }]
      SegregatedBallastTank,
      _SegregateTank_PL.Segregate_Tank        as SegregateTank_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideSegregatedBallastTank        :abap_boolean,
  
       @UI.hidden: #(HideSerialNo)
      SerialNo,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideSerialNo        :abap_boolean,
  
       @UI.hidden: #(HideSpudDate)
      SpudDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideSpudDate        :abap_boolean,
  
       @UI.hidden: #(HideSubtype)
      @ObjectModel.text.element:  ['SubType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_Subtype_PL', element: 'Id' } }]
      Subtype,
      _SubType_PL.SubType                     as SubType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideSubtype        :abap_boolean,
  
       @UI.hidden: #(HideTerminalName)
      TerminalName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideTerminalName        :abap_boolean,
  
       @UI.hidden: #(HideTotalLengthKm)
      TotalLengthKm,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideTotalLengthKm        :abap_boolean,
  
       @UI.hidden: #(HideTvd)
      Tvd,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideTvd        :abap_boolean,
  
       @UI.hidden: #(HideUniqueId1)
      UniqueId1,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUniqueId1        :abap_boolean,
  
       @UI.hidden: #(HideUniqueId2)
      UniqueId2,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUniqueId2        :abap_boolean,
  
       @UI.hidden: #(HideUtilisation)
      Utilisation,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUtilisation        :abap_boolean,
  
       @UI.hidden: #(HideVesselCode)
      VesselCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideVesselCode        :abap_boolean,
  
       @UI.hidden: #(HideVesselExName)
      VesselExName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideVesselExName        :abap_boolean,
  
       @UI.hidden: #(HideWarehouseOfficeBuildings)
      WarehouseOfficeBuildings,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideWarehouseOfficeBuildings        :abap_boolean,
  
        @UI.hidden: #(HideWaterDepth)
      WaterDepth,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideWaterDepth        :abap_boolean,
  
       @UI.hidden: #(HideYearBuilt)
      YearBuilt,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideYearBuilt        :abap_boolean,
  
       @UI.hidden: #(HideYearOfForecast1)
      @ObjectModel.text.element:  ['YOF_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_YOF_PL', element: 'Id' } }]
      YearOfForecast1,
      _YOF_PL.YOF                             as YOF_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideYearOfForecast1        :abap_boolean,
  
       @UI.hidden: #(HideYearOfManufacture)
      @ObjectModel.text.element:  ['YOM_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_YOM_PL', element: 'Id' } }]
      YearOfManufacture,
      _YOM_PL.YOM                             as YOM_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideYearOfManufacture        :abap_boolean,
  
         @ObjectModel.text.element:  ['HierarchyNode']
      @UI.textArrangement: #TEXT_SEPARATE
//       @ObjectModel.text.association: '_Location'
      _Location.LocationUuid as LocationUuid,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      _AssetVal : redirected to composition child ZC_TGRC_ASSET_VAL,    
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
