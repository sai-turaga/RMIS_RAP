@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Picklist - MIAS Description'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_MIAS_DESC_PL as select from ZR_GRC_PICKLST_P
{
   @UI.hidden: true
    key _Child.ValueId as Id,
    
   _Child.ListValue as Description
}
where ListId = '100231';
