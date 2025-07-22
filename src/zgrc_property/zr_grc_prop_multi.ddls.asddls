@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_MULTI as select from ztgrc_prop_multi
association to parent ZR_GRC_PROPERTY as _Property on
$projection.guid = _Property.PropertyNo
{
    key guid as Guid,
    wall_type as WallType,  
  roof_type as RoofType,   
  renov_yrs as RenovYrs,   
  security as Security,   
  Alarms as Alarms,  
     multi_sel as MultiSel,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
  _Property
}

