@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZTGRC_SCR_CONTRL000'
define view entity ZC_TGRC_SCR_CONTRL000  
  as projection on ZR_TGRC_SCR_CONTRL000
{
  key EndUser,
  key FileId,
  key LineId,
  key LineNum,
  Application,
  RecordType,
  RecordTypeDesc,
  Fieldname,
  Control,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
    /* Associations */
      _XLUser: redirected to parent ZC_TGRC_XLS_USER
  
}
