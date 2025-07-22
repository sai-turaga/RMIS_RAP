@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_GRC_PROP_MULTI'
@AccessControl.authorizationCheck: #CHECK
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_MULTI as projection on ZR_GRC_PROP_MULTI
{
    key Guid,
    WallType,
    RoofType,
    RenovYrs,
    Security,
    Alarms,
    MultiSel,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY
}
