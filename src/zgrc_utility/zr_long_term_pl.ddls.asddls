@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Picklist - Long Term'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_LONG_TERM_PL as select from ZR_GRC_PICKLST_P
{
   @UI.hidden: true
    key _Child.ValueId as Id,
    
   _Child.ListValue as Long_Term
}
where ListId = '100159';
