@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZTGRC_XLS_USER'
define root view entity ZC_TGRC_XLS_USER
  provider contract transactional_query
  as projection on ZR_TGRC_XLS_USER
{
  key EndUser,
  key FileId,
  FileStatus,
     @Semantics.largeObject:
            { mimeType: 'Mimetype',
            fileName: 'Filename',
            acceptableMimeTypes: [ 'application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
            contentDispositionPreference: #INLINE } 
  Attachment,
  Mimetype,
  Filename,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
    /* Associations */
    _XLData: redirected to composition child ZC_TGRC_SCR_CONTRL000  
  
  
}
