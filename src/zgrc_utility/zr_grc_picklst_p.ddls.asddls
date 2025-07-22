@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZGRC_PICKLST'
define root view entity ZR_GRC_PICKLST_P
  as select from ZTGRC_PICKLST_P
    composition[0..*] of ZR_GRC_PICKLST_C as _Child
{
  key list_id as ListId,
  list_name as ListName,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
   _Child
  
}
