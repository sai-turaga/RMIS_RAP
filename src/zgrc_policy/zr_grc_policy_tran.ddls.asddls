@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for policy transaction'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_GRC_POLICY_TRAN 
as select from ztgrc_policy_tra as _Policytran
association to parent ZR_GRC_POLICY as _Policy on $projection.PolicyUuid = _Policy.PolicyUuid 
association [0..1] to ZR_TRANSACTION_STATUS_PL     as _Status_PL  on $projection.Status = _Status_PL.Id
association [0..1] to ZR_TRANSACTION_TYPE_PL     as _Type_PL  on $projection.Status = _Type_PL.Id
{
  
    key policytran_uuid as PolicytranUuid,
    key policy_trans_name as PolicyTransName,
    policy_uuid as PolicyUuid,
    policy_name as PolicyName,
    accounting_date as AccountingDate,
    accounting_month as AccountingMonth,
    accounting_quarter as AccountingQuarter,
    amount as Amount,
    comments as Comments,
    commission_amount as CommissionAmount,
    createdbyid as Createdbyid,
    estimated_premium as EstimatedPremium,
    fees_broker as FeesBroker,
    fees_excise_tax as FeesExciseTax,
    fees_fronting as FeesFronting,
    fees_other as FeesOther,
    fees_surplus as FeesSurplus,
    gross_premium as GrossPremium,
    lastmodifiedbyid as Lastmodifiedbyid,
    location as Location,
    net_premium as NetPremium,
    payee as Payee,
    rk_pid_constructor as RkPidConstructor,
    status as Status,
    taxes as Taxes,
    total_premium as TotalPremium,
    transaction_date as TransactionDate,
    type as Type,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat,
    _Policy,
    _Status_PL,
    _Type_PL
}
