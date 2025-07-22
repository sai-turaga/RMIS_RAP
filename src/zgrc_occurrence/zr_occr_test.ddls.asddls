@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TEST'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_OCCR_TEST
  as select from ztgrc_occurence
  association[0..1] to ZR_GRC_OCCTYPE_PL as _OccType on
  $projection.OccurrenceType = _OccType.Id
  association [0..*] to ZR_GRC_CLAIM_OCCURRENCE as _Claim
  on $projection.Name = _Claim.Occurrence
{
  key occurence_no as OccurenceNo,
  //cast(lpad(occurence_no,10,'0') as abap.char(10)) as OccurenceLong,
  name as Name,
  description as Description,
  catastrophe_code as CatastropheCode,
  occurrence_type as OccurrenceType,
  _Claim.ClaimUuid,
  date_of_loss as DateOfLoss,
  country as Country,
  owner as Owner,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
  _OccType,
  _Claim
  }
