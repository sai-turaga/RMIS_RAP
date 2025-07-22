@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MIAS Claim  Register record type'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_GRC_MI_CLAIM_RECORD_type as select from ztgrc_picklist_c
{
    key cast ( list_id as abap.dec(5,0) ) as ListId,
    key value_id as ValueId,
    list_value as ListValue,
    list_desc as ListDesc,
    active as Active,
    lang as Lang,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat
    
}
//where list_id = '100002';
