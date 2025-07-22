@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Policy Section'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_GRC_POLICY_SEC
  as projection on ZR_GRC_POLICY_SEC
{
  key PolicysecUuid,
  key PolicyNumber,
      PolicyUuid,
       @UI.hidden: #(HidePolicyName)
      PolicyName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicyName :abap_boolean, 
   
       @UI.hidden: #(HidePolicySectionName)
      PolicySectionName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicySectionName :abap_boolean, 
   
       @UI.hidden: #(HideSectionName)
      SectionName,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSectionName :abap_boolean, 
   
       @UI.hidden: #(HideAddLDeductibleLimitsInfo)
      AddLDeductibleLimitsInfo,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAddLDeductibleLimitsInfo :abap_boolean, 
   
       @UI.hidden: #(HideSectionAttachmentPoint)
      SectionAttachmentPoint,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSectionAttachmentPoint :abap_boolean, 
   
       @UI.hidden: #(HideCreatedbyid)
      Createdbyid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCreatedbyid :abap_boolean, 
   
       @UI.hidden: #(HideCurrencyCode)
      CurrencyCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideCurrencyCode :abap_boolean, 
   
       @UI.hidden: #(HideDescription)
      Description,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDescription :abap_boolean, 
   
       @UI.hidden: #(HideExcessLayerPolicySection)
      ExcessLayerPolicySection,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideExcessLayerPolicySection :abap_boolean, 
   
       @UI.hidden: #(HideExcessPolicySection)
      ExcessPolicySection,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideExcessPolicySection :abap_boolean, 
   
       @UI.hidden: #(HideHierarchyLevel)
      HierarchyLevel,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideHierarchyLevel :abap_boolean, 
   
       @UI.hidden: #(HideLastmodifiedbyid)
      Lastmodifiedbyid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLastmodifiedbyid :abap_boolean, 
   
       @UI.hidden: #(HideNotes)
      Notes,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideNotes :abap_boolean, 
   
       @UI.hidden: #(HidePolicySectionNumber)
      PolicySectionNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePolicySectionNumber :abap_boolean, 
   
       @UI.hidden: #(HidePredecessorPolicySection)
      PredecessorPolicySection,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HidePredecessorPolicySection :abap_boolean, 
   
       @UI.hidden: #(HideRenewalPolicySection)
      RenewalPolicySection,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRenewalPolicySection :abap_boolean, 
   
       @UI.hidden: #(HideRetentionAmount)
      RetentionAmount,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRetentionAmount :abap_boolean, 
   
       @UI.hidden: #(HideRetentionType)
      RetentionType,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideRetentionType :abap_boolean, 
   
       @UI.hidden: #(HideAggregateLimit1)
      AggregateLimit1,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideAggregateLimit1 :abap_boolean, 
   
       @UI.hidden: #(HideSectionCoverage)
      @ObjectModel.text.element:  ['Section_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SECTION_COVER_PL', element: 'Id' } }]
      SectionCoverage,
      _Section_PL.section_cover            as Section_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSectionCoverage :abap_boolean, 
   
       @UI.hidden: #(HideSectionCoverageMajor)
      @ObjectModel.text.element:  ['SectionMajor_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SECTION_COVER_MAJ_PL', element: 'Id' } }]
      SectionCoverageMajor,
      _SectionMajor_PL.section_cover_major as SectionMajor_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSectionCoverageMajor :abap_boolean, 
   
       @UI.hidden: #(HideSectionCoverageMinor)
      @ObjectModel.text.element:  ['SectionMinor_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SECTION_COVER_MIN_PL', element: 'Id' } }]
      SectionCoverageMinor,
      _SectionMinor_PL.section_cover_minor as SectionMinor_PL,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideSectionCoverageMinor :abap_boolean, 
   
       @UI.hidden: #(HideDateSectionExpiration)
      DateSectionExpiration,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDateSectionExpiration :abap_boolean, 
   
       @UI.hidden: #(HideDateSectionEffective)
      DateSectionEffective,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideDateSectionEffective :abap_boolean, 
   
       @UI.hidden: #(HideOccurrenceLimit1)
      OccurrenceLimit1,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideOccurrenceLimit1 :abap_boolean, 
   
       @UI.hidden: #(HideLayerType)
      @ObjectModel.text.element:  ['SectionType_PL']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SECTION_TYPE_PL', element: 'Id' } }]
      LayerType,
      _SectionType_PL.section_type         as SectionType_PL,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_POLICY_CONTROL_FIELDS'
   virtual HideLayerType :abap_boolean, 
   
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      Locallastchangedat,
      _Policy : redirected to parent ZC_GRC_POLICY,
      _Section_PL,
      _SectionMajor_PL,
      _SectionMinor_PL,
      _SectionType_PL
}
