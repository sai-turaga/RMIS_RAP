@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Entity for policy'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_GRC_POLICY
  as select from ztgrc_policy as Policy
  composition [*] of ZR_GRC_POLICY_SEC             as _Policysec
  composition [*] of ZR_GRC_POLICY_ENDO            as _Policyendo
  composition [*] of ZR_GRC_POLICY_TRAN            as _Policytran
  association [0..*] to ZR_GRC_CLAIM_POLICY as _Claim 
  on $projection.PolicyName = _Claim.PolicyName
  association[0..1] to ZR_TGRC_LOCATION as _Location
  on $projection.Insured = _Location.Level1Id
  association [0..1] to ZR_POLICY_RECTYPE_PL        as _RecordType_PL    on $projection.Recordtypeid = _RecordType_PL.Id
  association [0..1] to ZR_GRC_COVERAREA_PL        as _CoverageArea_PL    on $projection.CoverageArea = _CoverageArea_PL.Id
  association [0..1] to ZR_GRC_COVERLINE_PL        as _CoverageLine_PL    on $projection.CoverageLine = _CoverageLine_PL.Id
  association [0..1] to ZR_GRC_COVERMAJOR_PL       as _CoverageMajor_PL   on $projection.CoverageMajor = _CoverageMajor_PL.Id
  association [0..1] to ZR_GRC_COVERMINOR_PL       as _CoverageMinor_PL   on $projection.CoverageMinor = _CoverageMinor_PL.Id
  association [0..1] to ZR_GRC_FORM_PL             as _Form_PL            on $projection.Form = _Form_PL.Id
  association [0..1] to ZR_GRC_FRONTING_INSURER_PL as _FrontingInsurer_PL on $projection.FrontingInsurer = _FrontingInsurer_PL.Id
  association [0..1] to ZR_GRC_MIAS_PROG_PL        as _MIASProg_PL        on $projection.MiasProgram = _MIASProg_PL.Id
  association [0..1] to ZR_GRC_MIAS_PROG_DESC_PL   as _MIASProgDesc_PL    on $projection.MiasProgramDescription = _MIASProgDesc_PL.Id
  association [0..1] to ZR_GRC_POLICY_BASIS_PL     as _PolicyBasis_PL     on $projection.PolicyBasis = _PolicyBasis_PL.Id
  association [0..1] to ZR_GRC_POLICY_STATUS_PL    as _PolicyStatus_PL    on $projection.PolicyStatus = _PolicyStatus_PL.Id
  association [0..1] to ZR_GRC_POLICY_TYPE_PL      as _PolicyType_PL      on $projection.PolicyTypes = _PolicyType_PL.Id
  association [0..1] to ZR_GRC_PRO_RATE_PL         as _ProRate_PL         on $projection.ProRatePeriod = _ProRate_PL.Id
  association [0..1] to ZR_RETENTION_TYPE_PL       as _Retention_PL       on $projection.RetentionType = _Retention_PL.Id


  // association [0..*] to ZR_GRC_POLICY as _Child on $projection.PolicyUuid = _Child.PolicyUuid
{
  key policy_uuid                    as PolicyUuid,
      policy_name                    as PolicyName,
      broker                         as Broker,
      broker_amount                  as BrokerAmount,
      broker_commission_percent      as BrokerCommissionPercent,
      broker_compensation_type       as BrokerCompensationType,
      broker_contact_details         as BrokerContactDetails,
      broker_fee                     as BrokerFee,
      carrier                        as Carrier,
      carrier_coverage               as CarrierCoverage,
      coverage_area                  as CoverageArea,
      coverage_area_desc             as CoverageAreaDesc,
      coverage_line                  as CoverageLine,
      coverage_major                 as CoverageMajor,
      coverage_minor                 as CoverageMinor,
      createdbyid                    as Createdbyid,
      currency_code                  as CurrencyCode,
      date_cancelled                 as DateCancelled,
      date_excess_carrier_notified   as DateExcessCarrierNotified,
      date_policy_canceled           as DatePolicyCanceled,
      excess_policy                  as ExcessPolicy,
      exclusions                     as Exclusions,
      date_policy_expiration         as DatePolicyExpiration,
      form                           as Form,
      fronting_insurer               as FrontingInsurer,
      gross_grm                      as GrossGrm,
      gross_premium_paid             as GrossPremiumPaid,
      gross_reinsurance_premium_paid as GrossReinsurancePremiumPaid,
      gross_reinsurance_premium_repo as GrossReinsurancePremiumRepo,
      gross_written_premium_received as GrossWrittenPremiumReceived,
      gross_written_premium_reported as GrossWrittenPremiumReported,
      hierarchy_level                as HierarchyLevel,
      date_policy_effective          as DatePolicyEffective,
      user_id                        as UserId,
      insured                        as Insured,
      insurer                        as Insurer,
      insurer_contact_details        as InsurerContactDetails,
      lastmodifiedbyid               as Lastmodifiedbyid,
      layer_number                   as LayerNumber,
      local_policy_autonum           as LocalPolicyAutonum,
      mias_gross_premium             as MiasGrossPremium,
      mias_net_premium               as MiasNetPremium,
      mias_program                   as MiasProgram,
      mias_program_description       as MiasProgramDescription,
      mias_r_i_y_n                   as MiasRIYN,
      r_i_percent_1                  as RIPercent1,
      named_insured                  as NamedInsured,
      named_insured_address          as NamedInsuredAddress,
      net_grm                        as NetGrm,
      notes                          as Notes,
      notify_excess_carrier          as NotifyExcessCarrier,
      ownerid                        as Ownerid,
      percent_reinsured              as PercentReinsured,
      mias_percentage                as MiasPercentage,
      policy_aggregate_limit         as PolicyAggregateLimit,
      policy_basis                   as PolicyBasis,
      policy_description             as PolicyDescription,
      policy_document                as PolicyDocument,
      policy_number                  as PolicyNumber,
      policy_occurrence_limit        as PolicyOccurrenceLimit,
      policy_status                  as PolicyStatus,
      policy_type                    as PolicyTypes,
      policy_year                    as PolicyYear,
      predecessor_policy             as PredecessorPolicy,
      primary_policy                 as PrimaryPolicy,
      pro_rata_share                 as ProRataShare,
      pro_rate_period                as ProRatePeriod,
      producer                       as Producer,
      program_id                     as ProgramId,
      program_year                   as ProgramYear,
      program_comments               as ProgramComments,
      rating                         as Rating,
      recordtypeid                   as Recordtypeid,
      renewal_policy                 as RenewalPolicy,
      retention_amount               as RetentionAmount,
      retention_type                 as RetentionType,
      subsidiary_or_business_unit    as SubsidiaryOrBusinessUnit,
      successor_policy               as SuccessorPolicy,
      rk_process_status              as RkProcessStatus,
      createdby                      as Createdby,
      createdat                      as Createdat,
      lastchangedby                  as Lastchangedby,
      lastchangedat                  as Lastchangedat,
      locallastchangedat             as Locallastchangedat,
      //    _Child,
            _Claim,
      _Location,
      //Picklist
      _RecordType_PL,
      _Policysec,
      _Policyendo,
      _Policytran,
      _CoverageArea_PL,
      _CoverageLine_PL,
      _CoverageMajor_PL,
      _CoverageMinor_PL,
      _Form_PL,
      _FrontingInsurer_PL,
      _MIASProg_PL,
      _MIASProgDesc_PL,
      _PolicyBasis_PL,
      _PolicyStatus_PL,
      _PolicyType_PL,
      _ProRate_PL,
      _Retention_PL

}
