@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test CDS for Multi Select'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_TEST as select from ZR_GRC_PICKLIST_P

                                
{    
//   key _Child.ListId,
   key _Child.ValueId as Id,
   _Child.ListValue
}
where ListId = '10001';
