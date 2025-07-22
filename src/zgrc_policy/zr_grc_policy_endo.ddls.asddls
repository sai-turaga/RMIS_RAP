@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for policy endorsement'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_GRC_POLICY_ENDO
  as select from ztgrc_policy_end as Policyendo
  association        to parent ZR_GRC_POLICY   as _Policy             on $projection.PolicyUuid = _Policy.PolicyUuid
  //and $projection.PolicyName = _Policy.PolicyName
  association [0..1] to ZR_ENDORSE_STATUS_PL   as _EndorseStatus_PL   on $projection.EndorsementStatus = _EndorseStatus_PL.Id
  association [0..1] to ZR_ENDORSE_TYPE_PL     as _EndorseType_PL     on $projection.EndorsementType = _EndorseType_PL.Id
  association [0..1] to ZR_MASTER_AGREEMENT_PL as _MasterAgreement_PL on $projection.MasterAgreement = _MasterAgreement_PL.Id
  association [0..1] to ZR_NON_SCC_PL          as _NonSSC_PL          on $projection.NonStandardClaimsCalc = _NonSSC_PL.Id
{
  key policyendo_uuid               as PolicyendoUuid,
  key policy_endorsement_number     as PolicyEndorsementNumber,
      policy_uuid                   as PolicyUuid,
      policy_name                   as PolicyName,
      additional_liability_max_expo as AdditionalLiabilityMaxExpo,
      additional_liability_premium  as AdditionalLiabilityPremium,
      additional_liability_rate     as AdditionalLiabilityRate,
      premium                       as Premium,
      beyond_bespoke_clause         as BeyondBespokeClause,
      commodity                     as Commodity,
      contract_end_date             as ContractEndDate,
      contract_name                 as ContractName,
      contract_start_date           as ContractStartDate,
      createdbyid                   as Createdbyid,
      currency_code                 as CurrencyCode,
      customer_name                 as CustomerName,
      department                    as Department,
      date_effective                as DateEffective,
      endorsement_name              as EndorsementName,
      endorsement_status            as EndorsementStatus,
      endorsement_text              as EndorsementText,
      endorsement_type              as EndorsementType,
      location_maersk               as LocationMaersk,
      contact                       as Contact,
      lastmodifiedbyid              as Lastmodifiedbyid,
      link_to_master_agreement      as LinkToMasterAgreement,
      master_agreement              as MasterAgreement,
      mode_of_transport             as ModeOfTransport,
      non_standard_claims_calc      as NonStandardClaimsCalc,
      notes                         as Notes,
      opportunity_owner             as OpportunityOwner,
      policy_year                   as PolicyYear,
      premium1                      as Premium1,
      predecessor_endorsement       as PredecessorEndorsement,
      pro_rata_premium              as ProRataPremium,
      pro_rata_premium_formula      as ProRataPremiumFormula,
      review_date                   as ReviewDate,
      reviewer                      as Reviewer,
      storage_maximum_exposure      as StorageMaximumExposure,
      storage_premium               as StoragePremium,
      storage_rate                  as StorageRate,
      storage_revenue               as StorageRevenue,
      successor_endorsement         as SuccessorEndorsement,
      premium_1                     as PremiumT,
      total_premium                 as TotalPremium,
      transit_maximum_exposure      as TransitMaximumExposure,
      transit_premium               as TransitPremium,
      transit_rate                  as TransitRate,
      transit_revenue               as TransitRevenue,
      createdby                     as Createdby,
      createdat                     as Createdat,
      lastchangedby                 as Lastchangedby,
      lastchangedat                 as Lastchangedat,
      locallastchangedat            as Locallastchangedat,
      _Policy,
      _EndorseStatus_PL,
      _EndorseType_PL,
      _MasterAgreement_PL,
      _NonSSC_PL
}
