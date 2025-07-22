@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Claims for the Occurrences'    
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CLAIM_OCCURRENCE as select from ZR_TGRC_CLAIM
//association [0..1] to ZR_CLAIM_RECTYPE_PL as _ClaimRecType
//on $projection.ClaimRecType = _ClaimRecType.Id
{
  
//    @UI.lineItem: [ {
//     type: #WITH_INTENT_BASED_NAVIGATION,
//      semanticObject: 'claim0807',
//      semanticObjectAction: 'get',
//      value: 'ClaimUuid',
//    position:10, label: 'Internal Numbering' }]
    key ClaimUuid,
    
     @UI.lineItem: [{ position: 10,
     type: #WITH_INTENT_BASED_NAVIGATION,
      semanticObject: 'claim0807',
      semanticObjectAction: 'get',
      value: 'Occurrence', label: 'Occurrence No' 
    }]
    Occurrence,
    
     
    @UI.lineItem: [{ position:20, label: 'Record Type' }]
    @ObjectModel.text.element:  ['RecType']
    @UI.textArrangement: #TEXT_ONLY
    ClaimRecType,
    _ClaimRecType_PL.Claim_RecType as RecType,
    
    
   _ClaimRecType_PL

}
where Occurrence <> ' ';
