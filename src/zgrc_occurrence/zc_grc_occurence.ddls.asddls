@Metadata.allowExtensions: true
@EndUserText.label: 'Occurrence Application'
@AccessControl.authorizationCheck: #CHECK

define root view entity ZC_GRC_OCCURENCE
  provider contract transactional_query
  as projection on ZR_GRC_OCCURENCE
{
  key OccurenceNo,  
  Name,
  Description,
  CatastropheCode,
    @ObjectModel.text.element:  ['OccType']
  @UI.textArrangement: #TEXT_ONLY
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_OCCTYPE_PL', element: 'Id' } }]
  OccurrenceType,
  _OccType.OccurenceType as OccType,
  DateOfLoss,
  Country,
  Owner,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
  _OccType,
//  _Claim.RecordTypeCustom as RecordType,
  _Claim,
  _ClaimTxn
  
}
