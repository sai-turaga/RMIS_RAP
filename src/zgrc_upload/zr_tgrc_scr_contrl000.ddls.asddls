@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZTGRC_SCR_CONTRL000'
define view entity ZR_TGRC_SCR_CONTRL000
  as select from ztgrc_scr_contrl
   association to parent ZR_TGRC_XLS_USER as _XLUser on  $projection.EndUser = _XLUser.EndUser
                                                   and $projection.FileId  = _XLUser.FileId
{
  key end_user as EndUser,
  key file_id as FileId,
  key line_id as LineId,
  key linenum as LineNum,
  application as Application,
  record_type as RecordType,
  record_type_desc as RecordTypeDesc,
  fieldname as Fieldname,
  control as Control,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
   _XLUser
}
