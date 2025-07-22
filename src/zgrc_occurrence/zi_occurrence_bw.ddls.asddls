@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS View for BW- Occurrence'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.query: true
define view entity ZI_OCCURRENCE_BW as select from ZP_OCCURRENCE_BW
{
    key OccurenceNo,
    Name,
//    Description,
    CatastropheCode,
    OccurrenceType,
    DateOfLoss,
    Country,
    Owner,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat
}
