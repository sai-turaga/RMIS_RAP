@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Claims of Asset'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CLAIM_ASSET
  as select from ZR_TGRC_CLAIM
{
      @UI.lineItem: [{ position:10,
      type: #WITH_INTENT_BASED_NAVIGATION,
      semanticObject: 'claim0807',
      semanticObjectAction: 'get',
      value: 'ClaimUuid', label: 'ClaimInternal ID'  }]
  key ClaimUuid,

      @UI.lineItem: [{ position:20, label: 'Claim Name' }]
      ClaimName,

      @UI.lineItem: [{ position: 30, label: 'Asset Name' }]
      AssetName,

      @UI.lineItem: [{ position: 40, label: 'Date of Loss' }]
      DateLossOfTime,

      @UI.lineItem: [{ position: 50, label: 'Status' }]
      Status,

      @UI.lineItem: [{ position: 60, label: 'Accident Description' }]
      AccidentDescription

}
where AssetName <> ' ';
