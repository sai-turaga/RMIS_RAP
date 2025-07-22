CLASS lsc_zr_tgrc_claim_dummy DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tgrc_claim_dummy IMPLEMENTATION.

  METHOD save_modified.


*DATA : lt_claim TYPE STANDARD TABLE OF ztgrc_claim,
*       lt_claim_tran TYPE STANDARD TABLE OF ztgrc_claim_trn.
*
* IF update-claim IS NOT INITIAL.
* lt_claim  = CORRESPONDING #( update-claim  ).
** lt_claim_tran = CORRESPONDING #( update-claim ).
* ENDIF.
*
*  IF create-claim  IS NOT INITIAL.
*  lt_claim = CORRESPONDING #( create-claim ).
**lt_asset_value = CORRESPONDING #( create-assetval ).
*ENDIF..
*
* IF lt_claim IS not INITIAL.
*  LOOP AT lt_claim ASSIGNING FIELD-SYMBOL(<ls_claim>).
*<ls_claim>-claim_external_id = <ls_claim>-claim_external_id+0(6).
*  ENDLOOP.
*MODIFY ztgrc_claim FROM TABLE @lt_claim.
*
*  endif.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_claim_trn DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE CLAIM_TRN.

TYPES :
    t_entities_update TYPE TABLE FOR UPDATE  zr_tgrc_claim_dummy\\claim_trn,
       t_failed_claimtrn   TYPE TABLE FOR FAILED   EARLY zr_tgrc_claim_trn_dummy,
      t_reported_claimtrn TYPE TABLE FOR REPORTED EARLY zr_tgrc_claim_trn_dummy.

      METHODS :
       precheck_claimtransaction
      IMPORTING
        entities_update TYPE t_entities_update OPTIONAL
      CHANGING
        failed          TYPE t_failed_claimtrn
        reported        TYPE t_reported_claimtrn.

ENDCLASS.

CLASS lhc_claim_trn IMPLEMENTATION.

  METHOD precheck_update.

 precheck_claimtransaction(
        EXPORTING
          entities_update = entities
        CHANGING
          failed          = failed-claim_trn
          reported        = reported-claim_trn
      ).
  ENDMETHOD.

  METHOD precheck_claimtransaction.


DATA:
      lt_entities          TYPE t_entities_update,
      lv_operation         TYPE if_abap_behv=>t_char01,
      is_modify_granted TYPE abap_bool.


      lt_entities = entities_update.
      lv_operation = if_abap_behv=>op-m-update.


DATA : lt_check_claim_tran type table FOR UPDATE zr_tgrc_claim_dummy\\claim_trn.


    LOOP AT lt_entities INTO DATA(ls_claimtrn).


 READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim
       ALL FIELDS WITH VALUE #( ( ClaimUuid = ls_claimtrn-ClaimUuid ) )
     RESULT DATA(lt_claim).

     DATA(ls_claim) = VALUE #(  lt_claim[  ls_claimtrn-ClaimUuid  ] OPTIONAL ).

 READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim BY \_Claim_trn
       ALL FIELDS WITH VALUE #( ( ClaimUuid = ls_claimtrn-ClaimUuid ) )
     RESULT DATA(lt_claimtrn).
IF lt_claimtrn IS NOT INITIAL.
      APPEND INITIAL LINE TO lt_check_claim_tran ASSIGNING FIELD-SYMBOL(<ls_claim_check>).

      <ls_claim_check> = CORRESPONDING #( lt_claimtrn[ 1 ] ).
      <ls_claim_check> = CORRESPONDING #( BASE ( <ls_claim_check> ) ls_claimtrn USING CONTROL ).
      ENDIF.
      ENDLOOP.
     LOOP at lt_check_claim_tran INTO ls_claimtrn .



*Admin_only_for_TPA_Transaction_Codes    Non-admins are not allowed to use TPA Transaction Codes. Please change the transaction code.
*Expse_Paymts_cant_be_less_total_exp_paid    Expense payment cannot be less than the total expenses paid
*      IF ls_claimtrn-ex <  cl_abap_context_info=>get_system_date( ).
*
*
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Expense payment cannot be less than the total expenses paid.' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AccountingDate = if_abap_behv=>mk-on
*                         ) TO reported-claim_transaction.
*        ENDIF.
*Indem_Paymts_cant_be_less_total_Ind_paid    Indemnity payment cannot be less than the total Indemnity paid
*      IF ls_claimtrn-IndemnityPdPaid <  ls_claimtrn-TotalReserve.
*
*
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Expense payment cannot be less than the total expenses paid.' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AccountingDate = if_abap_behv=>mk-on
*                         ) TO reported-claim_transaction.
*        ENDIF.
*Insufficient_Expense_Reserve    Not Enough Expense Reserve to Post Transaction
*Insufficient_Indemnity_Reserve  Not Enough Indemnity / Property Damage Reserve to Post Transaction
*Insufficient_Medical_Reserve    Not Enough Medical /Bodily Injury Reserve to Post Transaction
*Invalid_Transaction_Code    TPA transaction codes are not available for this profile type. Please pick another option.
*Med_Paymts_cant_be_less_total_Med_paid  Medical payment cannot be less than the total Medical paid
*No_Payments_on_a_Closed_Claim   No transactions are permitted on a closed claim. Reopen the claim then post a transaction.
*NonUserEnteredTransactionsCannotBeMod   Non-User-Entered Transactions Cannot Be Modified.
*
*Payment_cannot_be_less_than_Total_Paid  Payments cannot be less than the total already paid
*TPA_Data_No_New_Transactions    Cannot change add transaction to a TPA handled claim.
*TPATransactionsCannotBeModified TPA Transactions Cannot Be Modified.
*
*    If you believe you SHOULD be able to edit this transaction, please contact your system administrator and tell them the validation rule to check is TPATransactionsCannotBeModified.
*Error message to user if master claims record field TPA_Carrier
* picklist value = "Signal" OR "Sedgwick CMS" OR "Gallagher Bassett"
IF ls_claim-TpaCarrier = 'Signal' OR
ls_claim-TpaCarrier = 'Sedgwick CMS' OR
ls_claim-TpaCarrier = 'Gallagher Bassett'.


ENDIF.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_TGRC_CLAIM DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Claim
        RESULT result,
      Payment FOR MODIFY
            IMPORTING keys FOR ACTION Claim~payment RESULT result,
      copyclaim FOR MODIFY
            IMPORTING keys FOR ACTION Claim~copyclaim,
      precheck_create FOR PRECHECK
            IMPORTING entities FOR CREATE Claim.

          METHODS precheck_update FOR PRECHECK
            IMPORTING entities FOR UPDATE Claim.
          METHODS get_instance_features FOR INSTANCE FEATURES
            IMPORTING keys REQUEST requested_features FOR Claim RESULT result.
          METHODS closeclaim FOR MODIFY
            IMPORTING keys FOR ACTION claim~closeclaim RESULT result.
          METHODS get_global_features FOR GLOBAL FEATURES
            IMPORTING REQUEST requested_features FOR claim RESULT result.

TYPES :
t_entities_create TYPE TABLE FOR CREATE zr_tgrc_claim_dummy\\claim,
      t_entities_update TYPE TABLE FOR UPDATE  zr_tgrc_claim_dummy\\claim,
       t_failed_claim   TYPE TABLE FOR FAILED   EARLY zr_tgrc_claim_dummy,
      t_reported_claim TYPE TABLE FOR REPORTED EARLY zr_tgrc_claim_dummy.

      METHODS :
       precheck_claim
      IMPORTING
        entities_create TYPE t_entities_create OPTIONAL
        entities_update TYPE t_entities_update OPTIONAL
      CHANGING
        failed          TYPE t_failed_claim
        reported        TYPE t_reported_claim.

ENDCLASS.

CLASS LHC_ZR_TGRC_CLAIM IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ZBP_R_TGRC_CLAIM=>lv_control = abap_true.
  ENDMETHOD.
  METHOD Payment.
data(lt_tab) = 1.
  ENDMETHOD.

  METHOD copyclaim.

  DATA:
      claim      TYPE TABLE FOR CREATE zr_tgrc_claim_dummy,
claimtrn TYPE TABLE FOR CREATE zr_tgrc_claim_dummy\\claim\_claim_trn.

   " remove travel instances with initial %cid (i.e., not set by caller API)
   READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_inital_cid).
   ASSERT key_with_inital_cid IS INITIAL.

   " read the data from the travel instances to be copied
   READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim
      ALL FIELDS WITH CORRESPONDING #( keys )
   RESULT DATA(lt_claim_read_result)
   FAILED failed.


 READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim BY \_Claim_trn
       ALL FIELDS WITH CORRESPONDING #( lt_claim_read_result )
     RESULT DATA(lt_claimtrn_read_result).

LOOP AT lt_claim_read_result ASSIGNING FIELD-SYMBOL(<ls_claim_read_result>).
      " fill in travel container for creating new travel instance
      APPEND VALUE #( %cid      = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid
                     %is_draft = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%param-%is_draft
                     %data     = CORRESPONDING #( <ls_claim_read_result> EXCEPT claimuuid )
                  )
      TO claim ASSIGNING FIELD-SYMBOL(<ls_new_claim>).

      "Fill %cid_ref of travel as instance identifier for cba booking
      APPEND VALUE #( %cid_ref = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid )
        TO claimtrn ASSIGNING FIELD-SYMBOL(<ls_claimtrn>).


   <ls_new_claim>-ClaimExternalId = 'Clone_' && cl_abap_context_info=>get_system_time( ).


  LOOP AT lt_claimtrn_read_result ASSIGNING FIELD-SYMBOL(<ls_claim_tran>) USING KEY entity WHERE ClaimUuid EQ <ls_claim_read_result>-ClaimUuid.

        APPEND VALUE #( %cid     = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid && <ls_claim_tran>-ClaimTrnUuid
                        %data    = CORRESPONDING #( lt_claimtrn_read_result[ KEY entity %key = <ls_claim_tran>-%key ] EXCEPT  ClaimUuid ) )
          TO <ls_claimtrn>-%target ASSIGNING FIELD-SYMBOL(<ls_new_claim_tran>).

          <ls_new_claim_tran>-ClaimTrnExternalId = 'Clone_Trn' && cl_abap_context_info=>get_system_time( ).

    ENDLOOP.

  ENDLOOP.

   " create new BO instance
   MODIFY ENTITIES OF  zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim
      CREATE FIELDS
      (


    ClaimExternalId
    ClaimRecType
    X2ndWitness
    X3rdPartyClaimSubmittedTo
    X3rdPartyClaimsReceivedTtl
    X3rdPartyClaimsSettledTtl
    X3rdPartyPropertyDamage
    X3rdPartyLiability
    X3rdPartyRecoveriesUsd
    X3rdRecoveryObtainedFormula

     )
         WITH claim
*ENTITY claim
      CREATE BY \_Claim_trn AUTO FILL CID
       FIELDS (

    ClaimTrnUuid
    ClaimTrnExternalId
    ClaimTrnRecType
    Adjustment
    Amount
    BankAccountNumber
    Category
    CheckNumber
    CheckStatus
    CoverageMajor
    CurrencyCode
    CurrencyLookup
    DateCheckCleared )
          WITH claimtrn
      MAPPED DATA(mapped_create).

*MODIFY ENTITIES OF  zr_grc_mi_claimreg IN LOCAL MODE
*ENTITY claim
*CREATE FROM claimreg
* CREATE BY \_claim_transaction  FROM claimtrn_cba
*MAPPED DATA(mapped_create)
*FAILED DATA(mapped_create)
*REPORTED DATA(mapped_create).

   " set the new BO instances
   mapped-claim  =  mapped_create-claim.

  ENDMETHOD.

  METHOD precheck_create.
    precheck_claim(
        EXPORTING
          entities_create = entities
        CHANGING
          failed          = failed-claim
          reported        = reported-claim
      ).
  ENDMETHOD.

  METHOD precheck_update.
    precheck_claim(
        EXPORTING
          entities_update = entities
        CHANGING
          failed          = failed-claim
          reported        = reported-claim
      ).
  ENDMETHOD.

  METHOD PRECHECK_CLAIM.

DATA:
      lt_entities          TYPE t_entities_update,
      lv_operation         TYPE if_abap_behv=>t_char01,
      is_modify_granted TYPE abap_bool.

    " Either entities_create or entities_update is provided.  NOT both and at least one.
    ASSERT NOT ( entities_create IS INITIAL EQUIV entities_update IS INITIAL ).

    IF entities_create IS NOT INITIAL.
      lt_entities = CORRESPONDING #( entities_create MAPPING %cid_ref = %cid ).
      lv_operation = if_abap_behv=>op-m-create.
    ELSE.
      lt_entities = entities_update.
      lv_operation = if_abap_behv=>op-m-update.
    ENDIF.

DATA : lt_check_claim type table FOR UPDATE zr_tgrc_claim_dummy\\claim.

    LOOP AT lt_entities INTO DATA(ls_claim).

 READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
           ENTITY claim
           ALL FIELDS WITH VALUE #( ( %tky = ls_claim-%tky ) )
           RESULT DATA(lt_claim).

 IF lines( lt_claim ) = 0.
        CONTINUE.
      ENDIF.

      APPEND INITIAL LINE TO lt_check_claim ASSIGNING FIELD-SYMBOL(<ls_claim_check>).

      <ls_claim_check> = CORRESPONDING #( lt_claim[ 1 ] ).
      <ls_claim_check> = CORRESPONDING #( BASE ( <ls_claim_check> ) ls_claim USING CONTROL ).
      ENDLOOP.
      LOOP at lt_check_claim INTO ls_claim.

*      Closed claims require a date claim closed
 IF ls_claim-Status = 'CLOSED' AND ls_claim-DateClosed Is INITIAL.

          APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Closed claims require a date claim closed' )
                          %update = if_abap_behv=>mk-on
                          %element-DateClosed = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.

*Date of Loss is required
IF ls_claim-DateOfLoss IS INITIAL.
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Closed claims require a date claim closed' )
                          %update = if_abap_behv=>mk-on
                          %element-DateOfLoss  = if_abap_behv=>mk-on
                         ) TO reported.
*                         ELSE.
*                         Loss Date cannot be in the future.
ELSEIF ls_claim-DateOfLoss >  cl_abap_context_info=>get_system_date( ).
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Loss Date cannot be in the future' )
                          %update = if_abap_behv=>mk-on
                          %element-DateOfLoss = if_abap_behv=>mk-on
                         ) TO reported.


      endif.

      IF ls_claim-DateClosed  IS NOT INITIAL.
*Date Closed cannot be before Date of Loss
IF ls_claim-DateClosed < ls_claim-DateOfLoss.
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Closed claims require a date claim closed' )
                          %update = if_abap_behv=>mk-on
                          %element-DateClosed = if_abap_behv=>mk-on
                         ) TO reported.
      endif.

*Date Closed cannot be after todays date
IF ls_claim-DateClosed >  cl_abap_context_info=>get_system_date( ).
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Date Closed cannot be after todays date' )
                          %update = if_abap_behv=>mk-on
                          %element-DateClosed = if_abap_behv=>mk-on
                         ) TO reported.
      endif.
      ENDIF.
*Date of Claim Reported to Insurer cannot be in the future
 IF ls_claim-DtOfClaimReportToInsurer >  cl_abap_context_info=>get_system_date( ).
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Date of Claim Reported to Insurer cannot be in the future' )
                          %update = if_abap_behv=>mk-on
                          %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                         ) TO reported.
      endif.

*Date Reported to Client must be on after Date of Loss
 IF ls_claim-DateReportedtoClient IS not INITIAL AND ls_claim-DateReportedtoClient < ls_claim-DateOfLoss.
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Date Reported to Client must be on after Date of Loss' )
                          %update = if_abap_behv=>mk-on
                          %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                         ) TO reported.
      endif.

*Date Reported to Client cannot be in the future
 IF ls_claim-DateReportedtoClient  >  cl_abap_context_info=>get_system_date( ).
  APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Date Reported to Client cannot be in the future' )
                          %update = if_abap_behv=>mk-on
                          %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                         ) TO reported.
      endif.

*Closed claims can't have an Underwriters Reserve
*Error message to user where field Status__c is being changed to "Closed" but where field RecordTypeid "Marine" and field Underwriters_Reserve_Total__c is not = 0
 IF ls_claim-Status = 'CLOSED' AND ls_claim-UnderwritersReserveTotal Is not INITIAL.

          APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Closed claims cant have an Underwriters Reserve' )
                          %update = if_abap_behv=>mk-on
                          %element-UnderwritersReserveTotal = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.
* Error message to user where field Status_Detail__c = "N-Potential Claim" AND field Date_Closed__c is not blank OR field Status_c is trying to be changed to "Closed"
* Please change Status Detail from a Potential Claim, when the Claim is closed.
 IF ls_claim-StatusDetail = 'N-Potential Claim' AND ls_claim-DateClosed Is not INITIAL.

          APPEND VALUE #( %key = ls_claim-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Please change Status Detail from a Potential Claim, when the Claim is closed.' )                          %update = if_abap_behv=>mk-on
                          %element-StatusDetail = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.


    ENDLOOP.


  ENDMETHOD.

  METHOD get_instance_features.
ZBP_R_TGRC_CLAIM=>lv_control = abap_true.

     READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim
         FIELDS ( status )
         WITH CORRESPONDING #( keys )
      RESULT DATA(lt_claim_read_result)
      FAILED failed.


**LOOP AT lt_claim_read_result INTO DATA(ls_claim_control).
**
**APPEND VALUE #( %tky                   = ls_claim_control-%tky
**%field-status =   if_abap_behv=>fc-f-read_only ) To result.
**
**APPEND VALUE #( %tky                   = ls_claim_control-%tky
**%field-DateClosed    =   if_abap_behv=>fc-f-read_only ).
**
**
**ENDLOOP.


**    result = VALUE #( FOR ls_claim IN lt_claim_read_result
*                       ( %tky                   = ls_claim-%tky
*                         %field-status =   if_abap_behv=>fc-f-read_only
*                         %field-DateClosed    =   if_abap_behv=>fc-f-read_only
**                          %field-Activity   =
*
*                         %assoc-_claim_trn = COND #( WHEN ls_claim-status = 'C'
*                                                          THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  ) ) ).

*
*LOOp at result INTO DATA(ls_result).
*ls_result-
*
*ENDLOOP..


  ENDMETHOD.

  METHOD closeclaim.


    MODIFY ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
           ENTITY claim
              UPDATE FIELDS ( status )
                 WITH VALUE #( FOR key IN keys ( %tky      = key-%tky
                                                 status = 'C' ) ). " closed

    " Read changed data for action result
    READ ENTITIES OF zr_tgrc_claim_dummy IN LOCAL MODE
      ENTITY claim
         ALL FIELDS WITH
         CORRESPONDING #( keys )
       RESULT DATA(lt_claim).

    result = VALUE #( FOR ls_claim IN lt_claim ( %tky      = ls_claim-%tky
                                              %param    = ls_claim ) ).

  ENDMETHOD.

  METHOD get_global_features.




  ENDMETHOD.

ENDCLASS.
