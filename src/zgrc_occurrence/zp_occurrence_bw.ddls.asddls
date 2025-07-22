@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Private CDS View for BW- Occurrence'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
//@VDM.viewType: #BASIC
define view entity ZP_OCCURRENCE_BW as select from ztgrc_occurence
{
    key occurence_no as OccurenceNo,
    name as Name,
//    description as Description,
    catastrophe_code as CatastropheCode,
    occurrence_type as OccurrenceType,
    date_of_loss as DateOfLoss,
    country as Country,
    owner as Owner,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat
}
