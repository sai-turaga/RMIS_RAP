@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Claim Transactions of Occurence'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CLAIMTXN_OCCURRENCE as select from ZR_TGRC_CLAIM_TRN
   association[0..*] to ZR_TGRC_CLAIM as _Claim
   on $projection.ClaimUuid = _Claim.ClaimUuid
{
//@UI.lineItem: [{ position:10, label: 'Claim UUID'
//    }]
    key ZR_TGRC_CLAIM_TRN.ClaimUuid,
    @UI.lineItem: [{ position:10, label: 'Claim Txn UUID',
    type: #WITH_INTENT_BASED_NAVIGATION,
      semanticObject: 'claim0807',
      semanticObjectAction: 'get',
      value: 'ClaimTrnUuid' }]
    @Consumption.semanticObject: 'claim0807'
    @Consumption.semanticObjectMapping.additionalBinding: [{localElement: 'ClaimTrnUuid'}]
    key ZR_TGRC_CLAIM_TRN.ClaimTrnUuid,
    CurrencyCode,
    @UI.lineItem: [{ position:20, label: 'Occurrence' }]
    _Claim.Occurrence as Occurrence,
     @UI.lineItem: [{ position:40, label: 'Transaction Status' }]
    TransactionStatus,
     @UI.lineItem: [{ position:50, label: 'Category' }]
    Category,
     @UI.lineItem: [{ position:60, label: 'Transaction Date' }]
    TransactionDate,
     @UI.lineItem: [{ position:70, label: 'Amount' }]
     @Semantics.amount.currencyCode: 'CurrencyCode'
    Amount

}
