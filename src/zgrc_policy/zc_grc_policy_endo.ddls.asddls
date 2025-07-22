@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Policy Endorsement'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_GRC_POLICY_ENDO
  as projection on ZR_GRC_POLICY_ENDO
{
  key PolicyendoUuid,
  key PolicyEndorsementNumber,
      PolicyUuid,
       @UI.hidden: #(HidePolicyName)
      PolicyName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyName :abap_boolean, 
   
       @UI.hidden: #(HideAdditionalLiabilityMaxExpo)
      AdditionalLiabilityMaxExpo,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAdditionalLiabilityMaxExpo :abap_boolean, 
   
       @UI.hidden: #(HideAdditionalLiabilityPremium)
      AdditionalLiabilityPremium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAdditionalLiabilityPremium :abap_boolean, 
   
       @UI.hidden: #(HideAdditionalLiabilityRate)
      AdditionalLiabilityRate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAdditionalLiabilityRate :abap_boolean, 
   
       @UI.hidden: #(HidePremium)
      Premium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePremium :abap_boolean, 
   
       @UI.hidden: #(HideBeyondBespokeClause)
      BeyondBespokeClause,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBeyondBespokeClause :abap_boolean, 
   
       @UI.hidden: #(HideCommodity)
      Commodity,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCommodity :abap_boolean, 
   
       @UI.hidden: #(HideContractEndDate)
      ContractEndDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideContractEndDate :abap_boolean, 
   
       @UI.hidden: #(HideContractName)
      ContractName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideContractName :abap_boolean, 
   
       @UI.hidden: #(HideContractStartDate)
      ContractStartDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideContractStartDate :abap_boolean, 
   
       @UI.hidden: #(HideCreatedbyid)
      Createdbyid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCreatedbyid :abap_boolean, 
   
       @UI.hidden: #(HideCurrencyCode)
      CurrencyCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCurrencyCode :abap_boolean, 
   
       @UI.hidden: #(HideCustomerName)
      CustomerName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCustomerName :abap_boolean, 
   
       @UI.hidden: #(HideDepartment)
      Department,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDepartment :abap_boolean, 
   
       @UI.hidden: #(HideDateEffective)
      DateEffective,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDateEffective :abap_boolean, 
   
       @UI.hidden: #(HideEndorsementName)
      EndorsementName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideEndorsementName :abap_boolean, 
   
       @UI.hidden: #(HideEndorsementStatus)
      @ObjectModel.text.element:  ['EndorsementStatus_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ENDORSE_STATUS_PL', element: 'Id' } }]
      EndorsementStatus,
      _EndorseStatus_PL.Endorsement_Status as EndorsementStatus_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideEndorsementStatus :abap_boolean, 
   
       @UI.hidden: #(HideEndorsementText)
      EndorsementText,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideEndorsementText :abap_boolean, 
   
    @UI.hidden: #(HideEndorsementType)
      @ObjectModel.text.element:  ['EndorsementType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ENDORSE_TYPE_PL', element: 'Id' } }]
      EndorsementType,
      _EndorseType_PL.Endorsement_Type     as EndorsementType_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideEndorsementType :abap_boolean, 
   
       @UI.hidden: #(HideLocationMaersk)
      LocationMaersk,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLocationMaersk :abap_boolean, 
   
       @UI.hidden: #(HideContact)
      Contact,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideContact :abap_boolean, 
   
       @UI.hidden: #(HideLastmodifiedbyid)
      Lastmodifiedbyid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLastmodifiedbyid :abap_boolean, 
   
       @UI.hidden: #(HideLinkToMasterAgreement)
      LinkToMasterAgreement,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLinkToMasterAgreement :abap_boolean, 
   
       @UI.hidden: #(HideMasterAgreement)
      @ObjectModel.text.element:  ['MasterAgreement_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MASTER_AGREEMENT_PL', element: 'Id' } }]
      MasterAgreement,
      _MasterAgreement_PL.Master_agreement as MasterAgreement_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMasterAgreement :abap_boolean, 
   
    @UI.hidden: #(HideModeOfTransport)
      ModeOfTransport,
         @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideModeOfTransport :abap_boolean, 
   
        @UI.hidden: #(HideNonStandardClaimsCalc)
      @ObjectModel.text.element:  ['NonSSC_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_NON_SCC_PL', element: 'Id' } }]
      NonStandardClaimsCalc,
      _NonSSC_PL.Non_Standard_claims       as NonSSC_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNonStandardClaimsCalc :abap_boolean, 
   
       @UI.hidden: #(HideNotes)
      Notes,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNotes :abap_boolean, 
   
       @UI.hidden: #(HideOpportunityOwner)
      OpportunityOwner,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideOpportunityOwner :abap_boolean, 
   
       @UI.hidden: #(HidePolicyYear)
      PolicyYear,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyYear :abap_boolean, 
   
       @UI.hidden: #(HidePremium1)
      Premium1,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePremium1 :abap_boolean, 
   
       @UI.hidden: #(HidePredecessorEndorsement)
      PredecessorEndorsement,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePredecessorEndorsement :abap_boolean, 
   
       @UI.hidden: #(HideProRataPremium)
      ProRataPremium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProRataPremium :abap_boolean, 
   
       @UI.hidden: #(HideProRataPremiumFormula)
      ProRataPremiumFormula,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProRataPremiumFormula :abap_boolean, 
   
       @UI.hidden: #(HideReviewDate)
      ReviewDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideReviewDate :abap_boolean, 
   
       @UI.hidden: #(HideReviewer)
      Reviewer,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideReviewer :abap_boolean, 
   
       @UI.hidden: #(HideStorageMaximumExposure)
      StorageMaximumExposure,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideStorageMaximumExposure :abap_boolean, 
   
       @UI.hidden: #(HideStoragePremium)
      StoragePremium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideStoragePremium :abap_boolean, 
   
       @UI.hidden: #(HideStorageRate)
      StorageRate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideStorageRate :abap_boolean, 
   
       @UI.hidden: #(HideStorageRevenue)
      StorageRevenue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideStorageRevenue :abap_boolean, 
   
       @UI.hidden: #(HideSuccessorEndorsement)
      SuccessorEndorsement,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSuccessorEndorsement :abap_boolean, 
   
       @UI.hidden: #(HidePremiumT)
      PremiumT,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePremiumT :abap_boolean, 
   
       @UI.hidden: #(HideTotalPremium)
      TotalPremium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideTotalPremium :abap_boolean, 
   
       @UI.hidden: #(HideTransitMaximumExposure)
      TransitMaximumExposure,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideTransitMaximumExposure :abap_boolean, 
   
       @UI.hidden: #(HideTransitPremium)
      TransitPremium,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideTransitPremium :abap_boolean, 
   
       @UI.hidden: #(HideTransitRate)
      TransitRate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideTransitRate :abap_boolean, 
   
       @UI.hidden: #(HideTransitRevenue)
      TransitRevenue,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideTransitRevenue :abap_boolean, 
      
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _Policy : redirected to parent ZC_GRC_POLICY,
      _EndorseStatus_PL,
      _EndorseType_PL,
      _MasterAgreement_PL,
      _NonSSC_PL
}
