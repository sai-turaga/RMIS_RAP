@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Policy'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_GRC_POLICY_TRAN
  as projection on ZR_GRC_POLICY_TRAN
{
  key     PolicytranUuid,
  key     PolicyTransName,
          PolicyUuid,
          @UI.hidden: #(HidePolicyName)
          PolicyName,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HidePolicyName        :abap_boolean,

          @UI.hidden: #(HideAccountingDate)
          AccountingDate,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideAccountingDate    :abap_boolean,

          @UI.hidden: #(HideAccountingMonth)
          AccountingMonth,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideAccountingMonth   :abap_boolean,

          @UI.hidden: #(HideAccountingQuarter)
          AccountingQuarter,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideAccountingQuarter :abap_boolean,

          @UI.hidden: #(HideAmount)
          Amount,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideAmount            :abap_boolean,

          @UI.hidden: #(HideComments)
          Comments,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideComments          :abap_boolean,

          @UI.hidden: #(HideCommissionAmount)
          CommissionAmount,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideCommissionAmount  :abap_boolean,

          @UI.hidden: #(HideCreatedbyid)
          Createdbyid,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideCreatedbyid       :abap_boolean,

          @UI.hidden: #(HideEstimatedPremium)
          EstimatedPremium,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideEstimatedPremium  :abap_boolean,

          @UI.hidden: #(HideFeesBroker)
          FeesBroker,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideFeesBroker        :abap_boolean,

          @UI.hidden: #(HideFeesExciseTax)
          FeesExciseTax,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideFeesExciseTax     :abap_boolean,

          @UI.hidden: #(HideFeesFronting)
          FeesFronting,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideFeesFronting      :abap_boolean,

          @UI.hidden: #(HideFeesOther)
          FeesOther,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideFeesOther         :abap_boolean,

          @UI.hidden: #(HideFeesSurplus)
          FeesSurplus,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideFeesSurplus       :abap_boolean,

          @UI.hidden: #(HideGrossPremium)
          GrossPremium,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideGrossPremium      :abap_boolean,

          @UI.hidden: #(HideLastmodifiedbyid)
          Lastmodifiedbyid,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideLastmodifiedbyid  :abap_boolean,

          @UI.hidden: #(HideLocation)
          Location,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideLocation          :abap_boolean,

          @UI.hidden: #(HideNetPremium)
          NetPremium,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideNetPremium        :abap_boolean,

          @UI.hidden: #(HidePayee)
          Payee,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HidePayee             :abap_boolean,

          @UI.hidden: #(HideRkPidConstructor)
          RkPidConstructor,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideRkPidConstructor  :abap_boolean,

          @UI.hidden: #(HideStatus)
          @ObjectModel.text.element:  ['Status_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRANSACTION_STATUS_PL', element: 'Id' } }]
          Status,
          _Status_PL.transaction_status as Status_PL,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideStatus            :abap_boolean,

          @UI.hidden: #(HideTaxes)
          Taxes,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideTaxes             :abap_boolean,

          @UI.hidden: #(HideTotalPremium)
          TotalPremium,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideTotalPremium      :abap_boolean,

          @UI.hidden: #(HideTransactionDate)
          TransactionDate,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideTransactionDate   :abap_boolean,

          @UI.hidden: #(HideType)
          @ObjectModel.text.element:  ['Type_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRANSACTION_TYPE_PL', element: 'Id' } }]
          Type,
          _Type_PL.transaction_type     as Type_PL,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HideType              :abap_boolean,


          Createdby,
          Createdat,
          Lastchangedby,
          Lastchangedat,
          Locallastchangedat,
          /* Associations */
          _Policy : redirected to parent ZC_GRC_POLICY,
          _Status_PL,
          _Type_PL
}
