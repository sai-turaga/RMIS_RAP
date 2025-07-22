@Metadata.allowExtensions: true
@EndUserText.label: 'Picklist Maintaince Application'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZGRC_PICKLST'
define root view entity ZC_GRC_PICKLST_P
  provider contract transactional_query
  as projection on ZR_GRC_PICKLST_P
{
  key ListId,
  ListName,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
    _Child : redirected to composition child ZC_GRC_PICKLST_C
  
}
