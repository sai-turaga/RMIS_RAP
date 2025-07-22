@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_LOG'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_LOG as projection on ZR_GRC_PROP_LOG
{
    key PropertyNo,
    key PropLogNo,
    ChangeDate,
    ValueDate,
    BuildingValue,
    EquipmentValue,
    TenantsImprovements,
    BusinessInterptVal,
    AvgCargoValue,
    MaxCargoValue,
    lastchangedat,
    /* Associations */
    _Property : redirected to parent ZC_GRC_PROPERTY
}
