@Metadata.allowExtensions: true
@EndUserText.label: 'Picklist Maintaince Application'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_GRC_PICKLIST_P
  provider contract transactional_query
  as projection on ZR_GRC_PICKLIST_P
{
  key ListId,
  ListName,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
   _Child : redirected to composition child ZC_GRC_PICKLIST_C
}
