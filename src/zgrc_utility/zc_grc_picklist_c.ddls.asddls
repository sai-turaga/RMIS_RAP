@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for PickList Child'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_GRC_PICKLIST_C as projection on ZR_GRC_PICKLIST_C
{
       key ListId,
    key ValueId,
    ListValue,
    ListDesc,
    Active,
//    @Consumption.defaultValue: 'EN'
    Language,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Parent : redirected to parent ZC_GRC_PICKLIST_P
}
