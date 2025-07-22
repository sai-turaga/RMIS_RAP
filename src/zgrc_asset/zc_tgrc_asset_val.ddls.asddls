@Metadata.allowExtensions: true
@EndUserText.label: 'Asset Value'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_TGRC_ASSET_VAL  
  as projection on ZR_TGRC_ASSET_VAL
{
 
  key AssetUuid,
  key AssetValueUuid,
  AssetValueExternal,
    @UI.hidden: #(HideRecordtype)
  Recordtype,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRecordtype        :abap_boolean,
  
    @UI.hidden: #(HideAmountOfInterest)
  AmountOfInterest,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAmountOfInterest        :abap_boolean,
  
    @UI.hidden: #(HideAmountOfInterestChangeAmt)
  AmountOfInterestChangeAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAmountOfInterestChangeAmt        :abap_boolean,
  
    @UI.hidden: #(HideApmmInsuredValue)
  ApmmInsuredValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideApmmInsuredValue        :abap_boolean,
  
    @UI.hidden: #(HideAssetValue)
  AssetValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValue        :abap_boolean,
  
    @UI.hidden: #(HideAssetCategory)
  AssetCategory,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetCategory        :abap_boolean,
  
    @UI.hidden: #(HideAssetStatus)
  AssetStatus,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetStatus        :abap_boolean,
  
    @UI.hidden: #(HideAssetValueFormula)
  AssetValueFormula,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueFormula        :abap_boolean,
  
    @UI.hidden: #(HideAssetValueOnl)
  AssetValueOnl,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueOnl        :abap_boolean,
  
    @UI.hidden: #(HideAssetValue100Percent)
  AssetValue100Percent,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValue100Percent        :abap_boolean,
  
    @UI.hidden: #(HideAssetVal100PercntChngAmt)
  AssetVal100PercntChngAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetVal100PercntChngAmt        :abap_boolean,
  
    @UI.hidden: #(HideAssetValueChangeAmount)
  AssetValueChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HideAssetValueForInterest)
  AssetValueForInterest,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueForInterest        :abap_boolean,
  
    @UI.hidden: #(HideAssetValForInterestchngAmt)
  AssetValForInterestchngAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValForInterestchngAmt        :abap_boolean,
  
    @UI.hidden: #(HideAssetName)
  AssetName,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetName        :abap_boolean,
  
    @UI.hidden: #(HideAssetValueStatus)
  AssetValueStatus,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideAssetValueStatus        :abap_boolean,
  
    @UI.hidden: #(HideBusinessInterruption)
  BusinessInterruption,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBusinessInterruption        :abap_boolean,
  
  BusinessInterruptionChngAmt,
  
    @UI.hidden: #(HideBusinessUnit)
  BusinessUnit,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideBusinessUnit        :abap_boolean,
  
    @UI.hidden: #(HideCargoValue)
  CargoValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCargoValue        :abap_boolean,
  
    @UI.hidden: #(HideContentEquipment)
  ContentEquipment,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideContentEquipment        :abap_boolean,
  
    @UI.hidden: #(HideCranesAndHandlingEquipment)
  CranesAndHandlingEquipment,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCranesAndHandlingEquipment        :abap_boolean,
  
    @UI.hidden: #(HideCranesHandlingEquipChngAmt)
  CranesHandlingEquipChngAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCranesHandlingEquipChngAmt        :abap_boolean,
  
    @UI.hidden: #(HideCreatedb)
  Createdb,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCreatedb        :abap_boolean,
  
    @UI.hidden: #(HideCurrency)
  Currency,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCurrency        :abap_boolean,
  
    @UI.hidden: #(HideCurrencyCode)
  CurrencyCode,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideCurrencyCode        :abap_boolean,
  
    @UI.hidden: #(HideDeadweightTonnage)
  DeadweightTonnage,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDeadweightTonnage        :abap_boolean,
  
    @UI.hidden: #(HideDeclaredValue)
  DeclaredValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDeclaredValue        :abap_boolean,
  
    @UI.hidden: #(HideDeductible)
  Deductible,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideDeductible        :abap_boolean,
  
    @UI.hidden: #(HideEquipment)
  Equipment,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideEquipment        :abap_boolean,
  
    @UI.hidden: #(HideFlag)
  Flag,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFlag        :abap_boolean,
  
    @UI.hidden: #(HideFlagId)
  FlagId,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideFlagId        :abap_boolean,
  
    @UI.hidden: #(HideGrossTonnage)
  GrossTonnage,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideGrossTonnage        :abap_boolean,
  
    @UI.hidden: #(HideHierarchy)
  Hierarchy,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHierarchy        :abap_boolean,
  
    @UI.hidden: #(HideHullValue)
  HullValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHullValue        :abap_boolean,
  
    @UI.hidden: #(HideHullValueChangeAmount)
  HullValueChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHullValueChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HideInfrastructure)
  Infrastructure,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideInfrastructure        :abap_boolean,
  
    @UI.hidden: #(HideLastmodifiedb)
  Lastmodifiedb,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideLastmodifiedb        :abap_boolean,
  
    @UI.hidden: #(HideMostRecent)
  MostRecent,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideMostRecent        :abap_boolean,
  
    @UI.hidden: #(HideRkNextPtr)
  RkNextPtr,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkNextPtr        :abap_boolean,
  
    @UI.hidden: #(HideOtliValue)
  OtliValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOtliValue        :abap_boolean,
  
    @UI.hidden: #(HideOtliValueChangeAmount)
  OtliValueChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOtliValueChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HideHierarchyNode)
  HierarchyNode,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideHierarchyNode        :abap_boolean,
  
    @UI.hidden: #(HideOwnerId)
  OwnerId,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideOwnerId        :abap_boolean,
  
    @UI.hidden: #(HidePIClubNew)
  PIClubNew,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePIClubNew        :abap_boolean,
  
    @UI.hidden: #(HidePIClub)
  PIClub,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePIClub        :abap_boolean,
  
    @UI.hidden: #(HideRkPrevPtr)
  RkPrevPtr,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkPrevPtr        :abap_boolean,
  
    @UI.hidden: #(HidePropHandlingEquipChngAmt)
  PropHandlingEquipChngAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePropHandlingEquipChngAmt        :abap_boolean,
  
    @UI.hidden: #(HideProperty)
  Property,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideProperty        :abap_boolean,
  
    @UI.hidden: #(HidePropertyAndHandlingEquip)
  PropertyAndHandlingEquip,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePropertyAndHandlingEquip        :abap_boolean,
  
    @UI.hidden: #(HidePropertyChangeAmount)
  PropertyChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePropertyChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HidePvSTOnly)
  PvSTOnly,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HidePvSTOnly        :abap_boolean,
  
    @UI.hidden: #(HideRenewalAssignment)
  RenewalAssignment,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRenewalAssignment        :abap_boolean,
  
    @UI.hidden: #(HideRevenue)
  Revenue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRevenue        :abap_boolean,
  
    @UI.hidden: #(HideRkErrorDetail)
  RkErrorDetail,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkErrorDetail        :abap_boolean,
  
    @UI.hidden: #(HideRkErrorFlag)
  RkErrorFlag,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkErrorFlag        :abap_boolean,
  
    @UI.hidden: #(HideRkGenAssetValuesPid)
  RkGenAssetValuesPid,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkGenAssetValuesPid        :abap_boolean,
  
    @UI.hidden: #(HideRkPendingVoidCount)
  RkPendingVoidCount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkPendingVoidCount        :abap_boolean,
  
    @UI.hidden: #(HideRkPidConstructor)
  RkPidConstructor,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideRkPidConstructor        :abap_boolean,
  
    @UI.hidden: #(HideStatus)
  Status,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideStatus        :abap_boolean,
  
    @UI.hidden: #(HideTotalInsuredValue)
  TotalInsuredValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideTotalInsuredValue        :abap_boolean,
  
    @UI.hidden: #(HideTotalInsuredValueChngAmt)
  TotalInsuredValueChngAmt,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideTotalInsuredValueChngAmt        :abap_boolean,
  
    @UI.hidden: #(HideUtilisation)
  Utilisation,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUtilisation        :abap_boolean,
  
    @UI.hidden: #(HideUtilization)
  Utilization,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUtilization        :abap_boolean,
  
    @UI.hidden: #(HideUtilizationChangeAmount)
  UtilizationChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideUtilizationChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HideValuationDate)
  ValuationDate,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideValuationDate        :abap_boolean,
  
    @UI.hidden: #(HideValuationEndDate)
  ValuationEndDate,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideValuationEndDate        :abap_boolean,
  
    @UI.hidden: #(HideVarianceNotes)
  VarianceNotes,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideVarianceNotes        :abap_boolean,
  
    @UI.hidden: #(HideVolumeTons)
  VolumeTons,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideVolumeTons        :abap_boolean,
  
    @UI.hidden: #(HideWarValue)
  WarValue,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideWarValue        :abap_boolean,
  
    @UI.hidden: #(HideWarValueChangeAmount)
  WarValueChangeAmount,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideWarValueChangeAmount        :abap_boolean,
  
    @UI.hidden: #(HideWarehouseOfficeBuildings)
  WarehouseOfficeBuildings,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_ASSET_CONTROL_FIELDS'
  virtual HideWarehouseOfficeBuildings        :abap_boolean,
  
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
  _Asset: redirected to parent ZC_TGRC_ASSET
  
}
