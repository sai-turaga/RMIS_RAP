@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Claims for the Policy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CLAIM_POLICY as select from ZR_TGRC_CLAIM
{
//     @UI.lineItem: [{ position:10,
//     type: #WITH_INTENT_BASED_NAVIGATION,
//      semanticObject: 'claim0807',
//      semanticObjectAction: 'get',
//      value: 'ClaimUuid',
//      label: 'Navigate to Claims' }]
    key ClaimUuid,
    
     @UI.lineItem: [{ position:10,
     type: #WITH_INTENT_BASED_NAVIGATION,
      semanticObject: 'claim0807',
      semanticObjectAction: 'get',
      value: 'PolicyName', label: 'Policy Name' }]
    PolicyName,
    
 @UI.lineItem: [{ position:20, label: 'Record Type' }]
    @ObjectModel.text.element:  ['RecType']
    @UI.textArrangement: #TEXT_ONLY
    ClaimRecType,
    _ClaimRecType_PL.Claim_RecType as RecType,
        
    PolicyLookup,
    
    @UI.lineItem: [{ position:30, label:'Date of Loss' }]
    DateOfLoss,
    
    @UI.lineItem: [{ position:40, label: 'Coverage Minor' }]
    CoverageMinor,
    
    @UI.lineItem: [{ position:50, label: 'Main Event' }]
    MainEvent,
    
    _ClaimRecType_PL
}
where PolicyName <> ' ';
