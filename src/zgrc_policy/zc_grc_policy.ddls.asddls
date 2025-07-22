@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Policy'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_GRC_POLICY
  provider contract transactional_query
  as projection on ZR_GRC_POLICY
{
  key PolicyUuid,
      PolicyName,
       @UI.hidden: #(HideBroker)
      Broker,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBroker :abap_boolean, 
   
       @UI.hidden: #(HideBrokerAmount)
      BrokerAmount,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBrokerAmount :abap_boolean, 
   
       @UI.hidden: #(HideBrokerCommissionPercent)
      BrokerCommissionPercent,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBrokerCommissionPercent :abap_boolean, 
   
       @UI.hidden: #(HideBrokerCompensationType)
      BrokerCompensationType,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBrokerCompensationType :abap_boolean, 
   
       @UI.hidden: #(HideBrokerContactDetails)
      BrokerContactDetails,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBrokerContactDetails :abap_boolean, 
   
       @UI.hidden: #(HideBrokerFee)
      BrokerFee,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideBrokerFee :abap_boolean, 
   
       @UI.hidden: #(HideCarrier)
      Carrier,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCarrier :abap_boolean, 
   
       @UI.hidden: #(HideCarrierCoverage)
      CarrierCoverage,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCarrierCoverage :abap_boolean, 
   
       @UI.hidden: #(HideCoverageArea)
      @ObjectModel.text.element:  ['CoverageArea_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_COVERAREA_PL', element: 'Id' } }]
      CoverageArea,
      _CoverageArea_PL.Coverage_Area       as CoverageArea_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCoverageArea :abap_boolean, 
   
       @UI.hidden: #(HideCoverageAreaDesc)
      CoverageAreaDesc,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCoverageAreaDesc :abap_boolean, 
   
       @UI.hidden: #(HideCoverageLine)
      @ObjectModel.text.element:  ['CoverageLine_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_COVERLINE_PL', element: 'Id' } }]
      CoverageLine,
      _CoverageLine_PL.Coverage_Line       as CoverageLine_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCoverageLine :abap_boolean, 
   
       @UI.hidden: #(HideCoverageMajor)
      @ObjectModel.text.element:  ['CoverageMajor_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_COVERMAJOR_PL', element: 'Id' } }]
      CoverageMajor,
      _CoverageMajor_PL.Coverage_Major     as CoverageMajor_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCoverageMajor :abap_boolean, 
   
       @UI.hidden: #(HideCoverageMinor)
      @ObjectModel.text.element:  ['CoverageMinor_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_COVERMINOR_PL', element: 'Id' } }]
      CoverageMinor,
      _CoverageMinor_PL.Coverage_Minor     as CoverageMinor_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCoverageMinor :abap_boolean, 
   
       @UI.hidden: #(HideCreatedbyid)
      Createdbyid,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCreatedbyid :abap_boolean, 
   
       @UI.hidden: #(HideCurrencyCode)
      CurrencyCode,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCurrencyCode :abap_boolean, 
   
       @UI.hidden: #(HideDateCancelled)
      DateCancelled,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDateCancelled :abap_boolean, 
   
    
      DateExcessCarrierNotified,
       @UI.hidden: #(HideDatePolicyCanceled)
      DatePolicyCanceled,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDatePolicyCanceled :abap_boolean, 
   
       @UI.hidden: #(HideExcessPolicy)
      ExcessPolicy,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideExcessPolicy :abap_boolean, 
   
       @UI.hidden: #(HideExclusions)
      Exclusions,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideExclusions :abap_boolean, 
   
       @UI.hidden: #(HideDatePolicyExpiration)
      DatePolicyExpiration,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDatePolicyExpiration :abap_boolean, 
   
       @UI.hidden: #(HideForm)
      @ObjectModel.text.element:  ['Form_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_FORM_PL', element: 'Id' } }]
      Form,
      _Form_PL.Form                        as Form_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideForm :abap_boolean, 
   
       @UI.hidden: #(HideFrontingInsurer)
      @ObjectModel.text.element:  ['FrontingInsurer_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_FRONTING_INSURER_PL', element: 'Id' } }]
      FrontingInsurer,
      _FrontingInsurer_PL.Fronting_insurer as FrontingInsurer_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideFrontingInsurer :abap_boolean, 
   
       @UI.hidden: #(HideGrossGrm)
      GrossGrm,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideGrossGrm :abap_boolean, 
   
       @UI.hidden: #(HideGrossPremiumPaid)
      GrossPremiumPaid,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideGrossPremiumPaid :abap_boolean, 
   
      
      GrossReinsurancePremiumPaid,
    
      GrossReinsurancePremiumRepo,
       
      GrossWrittenPremiumReceived,
      GrossWrittenPremiumReported,
      
       @UI.hidden: #(HideHierarchyLevel)
      HierarchyLevel,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideHierarchyLevel :abap_boolean, 
      
       @UI.hidden: #(HideDatePolicyEffective)
      DatePolicyEffective,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDatePolicyEffective :abap_boolean, 
      
       @UI.hidden: #(HideUserId)
      UserId,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideUserId :abap_boolean, 
   
       @UI.hidden: #(HideInsured)
       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' } }]
      Insured,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideInsured :abap_boolean, 
      
       @UI.hidden: #(HideInsurer)
      Insurer,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideInsurer :abap_boolean, 
      
       @UI.hidden: #(HideInsurerContactDetails)
      InsurerContactDetails,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideInsurerContactDetails :abap_boolean, 
      
       @UI.hidden: #(HideLastmodifiedbyid)
      Lastmodifiedbyid,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLastmodifiedbyid :abap_boolean, 
   
       @UI.hidden: #(HideLayerNumber)
      LayerNumber,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLayerNumber :abap_boolean, 
   
       @UI.hidden: #(HideLocalPolicyAutonum)
      LocalPolicyAutonum,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLocalPolicyAutonum :abap_boolean, 
   
       @UI.hidden: #(HideMiasGrossPremium)
      MiasGrossPremium,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasGrossPremium :abap_boolean, 
   
       @UI.hidden: #(HideMiasNetPremium)
      MiasNetPremium,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasNetPremium :abap_boolean, 
      
       @UI.hidden: #(HideMiasProgram)
      @ObjectModel.text.element:  ['MiasProg_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MIAS_PROG_PL', element: 'Id' } }]
      MiasProgram,
      _MIASProg_PL.Mias_Program            as MiasProg_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasProgram :abap_boolean, 
      
       @UI.hidden: #(HideMiasProgramDescription)
      @ObjectModel.text.element:  ['MiasProgDesc_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MIAS_PROG_DESC_PL', element: 'Id' } }]
      MiasProgramDescription,
      _MIASProgDesc_PL.Mias_Program_Desc   as MiasProgDesc_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasProgramDescription :abap_boolean, 
      
       @UI.hidden: #(HideMiasRIYN)
      MiasRIYN,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasRIYN :abap_boolean, 
      
       @UI.hidden: #(HideRIPercent1)
      RIPercent1,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRIPercent1 :abap_boolean, 
      
       @UI.hidden: #(HideNamedInsured)
      NamedInsured,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNamedInsured :abap_boolean, 
      
       @UI.hidden: #(HideNamedInsuredAddress)
      NamedInsuredAddress,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNamedInsuredAddress :abap_boolean, 
      
       @UI.hidden: #(HideNetGrm)
      NetGrm,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNetGrm :abap_boolean, 
      
       @UI.hidden: #(HideNotes)
      Notes,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNotes :abap_boolean, 
      
       @UI.hidden: #(HideNotifyExcessCarrier)
      NotifyExcessCarrier,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNotifyExcessCarrier :abap_boolean, 
      
       @UI.hidden: #(HideOwnerid)
      Ownerid,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideOwnerid :abap_boolean, 
      
       @UI.hidden: #(HidePercentReinsured)
      PercentReinsured,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePercentReinsured :abap_boolean, 
      
       @UI.hidden: #(HideMiasPercentage)
      MiasPercentage,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideMiasPercentage :abap_boolean, 
      
       @UI.hidden: #(HidePolicyAggregateLimit)
      PolicyAggregateLimit,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyAggregateLimit :abap_boolean, 
      
       @UI.hidden: #(HidePolicyBasis)
      @ObjectModel.text.element:  ['PolicyBasis_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_POLICY_BASIS_PL', element: 'Id' } }]
      PolicyBasis,
      _PolicyBasis_PL.Policy_Basis         as PolicyBasis_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyBasis :abap_boolean, 
      
       @UI.hidden: #(HidePolicyDescription)
      PolicyDescription,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyDescription :abap_boolean, 
      
       @UI.hidden: #(HidePolicyDocument)
      PolicyDocument,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyDocument :abap_boolean, 
      
       @UI.hidden: #(HidePolicyNumber)
      PolicyNumber,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyNumber :abap_boolean, 
      
       @UI.hidden: #(HidePolicyOccurrenceLimit)
      PolicyOccurrenceLimit,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyOccurrenceLimit :abap_boolean, 
      
       @UI.hidden: #(HidePolicyStatus)
      @ObjectModel.text.element:  ['PolicyStatus_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_POLICY_STATUS_PL', element: 'Id' } }]
      PolicyStatus,
      _PolicyStatus_PL.Policy_Status       as PolicyStatus_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyStatus :abap_boolean, 
      
       @UI.hidden: #(HidePolicyTypes)
      @ObjectModel.text.element:  ['PolicyType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_POLICY_TYPE_PL', element: 'Id' } }]
      PolicyTypes,
      _PolicyType_PL.Policy_Type           as PolicyType_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyTypes :abap_boolean, 
      
       @UI.hidden: #(HidePolicyYear)
      PolicyYear,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyYear :abap_boolean, 
      
       @UI.hidden: #(HidePredecessorPolicy)
      PredecessorPolicy,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
  virtual HidePredecessorPolicy :abap_boolean, 
  
       @UI.hidden: #(HidePrimaryPolicy)
      PrimaryPolicy,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePrimaryPolicy :abap_boolean, 

 @UI.hidden: #(HideProRataShare)
      ProRataShare,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProRataShare :abap_boolean, 
      
       @UI.hidden: #(HideProRatePeriod)
      @ObjectModel.text.element:  ['ProRate_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PRO_RATE_PL', element: 'Id' } }]
      ProRatePeriod,
      _ProRate_PL.Coverage_Line            as ProRate_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProRatePeriod :abap_boolean, 
      
       @UI.hidden: #(HideAllowAgreedValueInput)
      Producer,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAllowAgreedValueInput :abap_boolean, 
      
       @UI.hidden: #(HideProgramId)
      ProgramId,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProgramId :abap_boolean, 
      
       @UI.hidden: #(HideProgramYear)
      ProgramYear,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProgramYear :abap_boolean, 
      
       @UI.hidden: #(HideProgramComments)
      ProgramComments,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideProgramComments :abap_boolean, 
   
       @UI.hidden: #(HideRating)
      Rating,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRating :abap_boolean, 
      
       @UI.hidden: #(HideRecordtypeid)
        @ObjectModel.text.element:  ['RecordType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_POLICY_RECTYPE_PL', element: 'Id' } }]
      Recordtypeid,
      _RecordType_PL.RecordType as RecordType_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRecordtypeid :abap_boolean, 
      
       @UI.hidden: #(HideRenewalPolicy)
      RenewalPolicy,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRenewalPolicy :abap_boolean, 
      
       @UI.hidden: #(HideRetentionAmount)
      RetentionAmount,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRetentionAmount :abap_boolean, 
      
       @UI.hidden: #(HideRetentionType)
      @ObjectModel.text.element:  ['RetentionType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RETENTION_TYPE_PL', element: 'Id' } }]
      RetentionType,
      _Retention_PL.Retention_Type         as RetentionType_PL,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRetentionType :abap_boolean, 
      
       
      SubsidiaryOrBusinessUnit,
      
       @UI.hidden: #(HideSuccessorPolicy)
      SuccessorPolicy,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSuccessorPolicy :abap_boolean, 
      
       @UI.hidden: #(HideRkProcessStatus)
      RkProcessStatus,
        @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRkProcessStatus :abap_boolean, 
   
            @ObjectModel.text.element:  ['Insured']
      @UI.textArrangement: #TEXT_SEPARATE
//       @ObjectModel.text.association: '_Location'
      _Location.LocationUuid as LocationUuid,
      
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      Locallastchangedat,
      //  _Child: redirected to ZC_GRC_POLICY,
      _Policyendo : redirected to composition child ZC_GRC_POLICY_ENDO,
      _Policysec  : redirected to composition child ZC_GRC_POLICY_SEC,
      _Policytran : redirected to composition child ZC_GRC_POLICY_TRAN,
      _Claim,
      _Location,
      //Picklist
      _RecordType_PL,
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
