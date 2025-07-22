@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZTGRC_XLS_USER'
define root view entity ZR_TGRC_XLS_USER
  as select from ZTGRC_XLS_USER
   composition [0..*] of ZR_TGRC_SCR_CONTRL000 as _XLData
{
  key end_user as EndUser,
  key file_id as FileId,
  file_status as FileStatus,
  attachment as Attachment,
  mimetype as Mimetype,
  filename as Filename,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  _XLData
  
}
