@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Picklist - Mesc Employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_MESC_EMPLOYEE_PL as select from ZR_GRC_PICKLST_P
{
   @UI.hidden: true
    key _Child.ValueId as Id,
    
   _Child.ListValue as Medicare_Report
}
where ListId = '100172';
