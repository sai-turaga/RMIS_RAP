CLASS lhc_claim_transaction DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE claim_transaction.

ENDCLASS.

CLASS lhc_claim_transaction IMPLEMENTATION.

  METHOD precheck_update.

*   LOOP AT entities INTO DATA(claimregtran).
*
*      IF claimregtran-AccountingDate <  cl_abap_context_info=>get_system_date( ).
*
*
*          APPEND VALUE #( %key = claimregtran-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
*          APPEND VALUE #( %key = claimregtran-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'The accounting date should be after today.' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AccountingDate = if_abap_behv=>mk-on
*                         ) TO reported-claim_transaction.
*        ENDIF.
*
*
*    ENDLOOP.

 DATA : lt_check_claim_tran type table FOR UPDATE zr_grc_mi_claimreg\\claim_transaction.

    LOOP AT entities INTO DATA(ls_claimtrn).

 READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
      ENTITY claim_register BY \_claim_transaction
       ALL FIELDS WITH VALUE #( ( ClaimRegUuid = ls_claimtrn-ClaimRegUuid ) )
     RESULT DATA(lt_claimtrn).

 IF lines( lt_claimtrn ) = 0.
        CONTINUE.
      ENDIF.

      APPEND INITIAL LINE TO lt_check_claim_tran ASSIGNING FIELD-SYMBOL(<ls_claimtrn_check>).

      <ls_claimtrn_check> = CORRESPONDING #( lt_claimtrn[ 1 ] ).
      <ls_claimtrn_check> = CORRESPONDING #( BASE ( <ls_claimtrn_check> ) ls_claimtrn USING CONTROL ).
      ENDLOOP.
      LOOP at lt_check_claim_tran INTO ls_claimtrn .


      IF ls_claimtrn-AccountingDate <  cl_abap_context_info=>get_system_date( ).


          APPEND VALUE #( %key = ls_claimtrn-%key
                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
          APPEND VALUE #( %key = ls_claimtrn-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'The accounting date should be after today.' )
                          %update = if_abap_behv=>mk-on
                          %element-AccountingDate = if_abap_behv=>mk-on
                         ) TO reported-claim_transaction.
        ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
.

CLASS LHC_ZR_GRC_MI_CLAIMREG DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR claim_register
        RESULT result,
      precheck_update FOR PRECHECK
            IMPORTING entities FOR UPDATE claim_register,
      copyclaimreg FOR MODIFY
            IMPORTING keys FOR ACTION claim_register~copyclaimreg,
      precheck_create FOR PRECHECK
            IMPORTING entities FOR CREATE claim_register,
*      calculate_fields FOR DETERMINE ON MODIFY
*            IMPORTING keys FOR claim_register~calculate_fields,
      setbrand FOR DETERMINE ON MODIFY
            IMPORTING keys FOR claim_register~setbrand.

*      get_instance_features FOR INSTANCE FEATURES
*            IMPORTING keys REQUEST requested_features FOR claim_register RESULT result.

TYPES :
t_entities_create TYPE TABLE FOR CREATE zr_grc_mi_claimreg\\claim_register,
      t_entities_update TYPE TABLE FOR UPDATE  zr_grc_mi_claimreg\\claim_register,
       t_failed_claimreg   TYPE TABLE FOR FAILED   EARLY zr_grc_mi_claimreg,
      t_reported_claimreg TYPE TABLE FOR REPORTED EARLY zr_grc_mi_claimreg.

      METHODS :
       precheck_claimreg
      IMPORTING
        entities_create TYPE t_entities_create OPTIONAL
        entities_update TYPE t_entities_update OPTIONAL
      CHANGING
        failed          TYPE t_failed_claimreg
        reported        TYPE t_reported_claimreg.

ENDCLASS.

CLASS LHC_ZR_GRC_MI_CLAIMREG IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD precheck_update.

   precheck_claimreg(
        EXPORTING
          entities_update = entities
        CHANGING
          failed          = failed-claim_register
          reported        = reported-claim_register
      ).

* DATA : lt_check_claim_reg type table FOR UPDATE zr_grc_mi_claimreg\\claim_register.
*
*    LOOP AT entities INTO DATA(ls_claimreg).
*
* READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
*           ENTITY claim_register
*           ALL FIELDS WITH VALUE #( ( %tky = ls_claimreg-%tky ) )
*           RESULT DATA(lt_claim_register).
*
* IF lines( lt_claim_register ) = 0.
*        CONTINUE.
*      ENDIF.
*
*      APPEND INITIAL LINE TO lt_check_claim_reg ASSIGNING FIELD-SYMBOL(<ls_claimreg_check>).
*
*      <ls_claimreg_check> = CORRESPONDING #( lt_claim_register[ 1 ] ).
*      <ls_claimreg_check> = CORRESPONDING #( BASE ( <ls_claimreg_check> ) ls_claimreg USING CONTROL ).
*      ENDLOOP.
*      LOOP at lt_check_claim_reg INTO ls_claimreg.
* IF ls_claimreg-BrandBu IS INITIAL.
*
*          APPEND VALUE #( %key = ls_claimreg-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_register.
*          APPEND VALUE #( %key = ls_claimreg-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Provide Brand BU' )
*                          %update = if_abap_behv=>mk-on
*                          %element-BrandBu = if_abap_behv=>mk-on
*                         ) TO reported-claim_register.
*        ENDIF.
*
* IF ls_claimreg-AssetLocation IS INITIAL.
*
*          APPEND VALUE #( %key = ls_claimreg-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_register.
*          APPEND VALUE #( %key = ls_claimreg-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Provide Asset/Location  ' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AssetLocation  = if_abap_behv=>mk-on
*                         ) TO reported-claim_register.
*        ENDIF.
*
*
*    ENDLOOP.


  ENDMETHOD.

  METHOD copyclaimreg.

 DATA:
      claimreg      TYPE TABLE FOR CREATE zr_grc_mi_claimreg,
claimtrn_cba  TYPE TABLE FOR CREATE zr_grc_mi_claimreg\\claim_register\_claim_transaction.

   " remove travel instances with initial %cid (i.e., not set by caller API)
   READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_inital_cid).
   ASSERT key_with_inital_cid IS INITIAL.

   " read the data from the travel instances to be copied
   READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
      ENTITY claim_register
      ALL FIELDS WITH CORRESPONDING #( keys )
   RESULT DATA(lt_claimreg_read_result)
   FAILED failed.


 READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
      ENTITY claim_register BY \_claim_transaction
       ALL FIELDS WITH CORRESPONDING #( lt_claimreg_read_result )
     RESULT DATA(lt_claimtrn_read_result).

LOOP AT lt_claimreg_read_result ASSIGNING FIELD-SYMBOL(<claimreg_read_result>).
      " fill in travel container for creating new travel instance
      APPEND VALUE #( %cid      = keys[ KEY entity %key = <claimreg_read_result>-%key ]-%cid
                     %is_draft = keys[ KEY entity %key = <claimreg_read_result>-%key ]-%param-%is_draft
                     %data     = CORRESPONDING #( <claimreg_read_result> EXCEPT claimreguuid )
                  )
      TO claimreg ASSIGNING FIELD-SYMBOL(<new_claimreg_read_result>).

      "Fill %cid_ref of travel as instance identifier for cba booking
      APPEND VALUE #( %cid_ref = keys[ KEY entity %key = <claimreg_read_result>-%key ]-%cid )
        TO claimtrn_cba ASSIGNING FIELD-SYMBOL(<claimtrn_cba>).


   <new_claimreg_read_result>-ClaimRegExtId = 'Clone_' && cl_abap_context_info=>get_system_time( ).


  LOOP AT lt_claimtrn_read_result ASSIGNING FIELD-SYMBOL(<ls_claim_tran>) USING KEY entity WHERE ClaimRegUuid EQ <claimreg_read_result>-ClaimRegUuid.

        APPEND VALUE #( %cid     = keys[ KEY entity %key = <claimreg_read_result>-%key ]-%cid && <ls_claim_tran>-ClaimTranUuid
                        %data    = CORRESPONDING #( lt_claimtrn_read_result[ KEY entity %key = <ls_claim_tran>-%key ] EXCEPT  ClaimRegUuid ) )
          TO <claimtrn_cba>-%target ASSIGNING FIELD-SYMBOL(<new_claim_tran>).

          <new_claim_tran>-ClaimTranExtId = 'Clone_Trn' && cl_abap_context_info=>get_system_time( ).

    ENDLOOP.

  ENDLOOP.

   " create new BO instance
   MODIFY ENTITIES OF  zr_grc_mi_claimreg IN LOCAL MODE
      ENTITY claim_register
      CREATE FIELDS
      (

    ClaimRegExtId
    AssetLocation
    BrandBu
    CloseDate
    DateOfLoss
    IbnerFormula
    IbnerAdjustment
    Ibner
    InsurerClaimNumber
    InsurerClaimNumber2
    LossDescription
    MiasGrossIncurredFormula
    MiasGrossIncurred
    MiasPaid
    MiasGrossReservedExclIbner
    MiasNetReservedExclIbner
    MiasNetReservedInclIbnerF
    MiasPolicyYear
    MiasShare
    Subtype
    Description
    RI1stBracket
    RITotalRecieved
    RITotalShare
    RIShareOfGrossReserve
    ReinsuranceReceivables
    Status
     )
         WITH claimreg
*ENTITY claim_register
      CREATE BY \_claim_transaction AUTO FILL CID
      FIELDS ( accountingdate AccountingMonth AccountingQuarter )
          WITH claimtrn_cba
      MAPPED DATA(mapped_create).

*MODIFY ENTITIES OF  zr_grc_mi_claimreg IN LOCAL MODE
*ENTITY claim_register
*CREATE FROM claimreg
* CREATE BY \_claim_transaction  FROM claimtrn_cba
*MAPPED DATA(mapped_create)
*FAILED DATA(mapped_create)
*REPORTED DATA(mapped_create).

   " set the new BO instances
   mapped-claim_register  =  mapped_create-claim_register.
  ENDMETHOD.

*  METHOD get_instance_features.
*  ENDMETHOD.

  METHOD precheck_create.
     precheck_claimreg(
        EXPORTING
          entities_create = entities
        CHANGING
          failed          = failed-claim_register
          reported        = reported-claim_register
      ).
  ENDMETHOD.

  METHOD PRECHECK_CLAIMREG.

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

DATA : lt_check_claim_reg type table FOR UPDATE zr_grc_mi_claimreg\\claim_register.

    LOOP AT lt_entities INTO DATA(ls_claimreg).

 READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
           ENTITY claim_register
           ALL FIELDS WITH VALUE #( ( %tky = ls_claimreg-%tky ) )
           RESULT DATA(lt_claim_register).

 IF lines( lt_claim_register ) = 0.
        CONTINUE.
      ENDIF.

      APPEND INITIAL LINE TO lt_check_claim_reg ASSIGNING FIELD-SYMBOL(<ls_claimreg_check>).

      <ls_claimreg_check> = CORRESPONDING #( lt_claim_register[ 1 ] ).
      <ls_claimreg_check> = CORRESPONDING #( BASE ( <ls_claimreg_check> ) ls_claimreg USING CONTROL ).
      ENDLOOP.
      LOOP at lt_check_claim_reg INTO ls_claimreg.
 IF ls_claimreg-BrandBu IS INITIAL.

          APPEND VALUE #( %key = ls_claimreg-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claimreg-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Provide Brand BU' )
                          %update = if_abap_behv=>mk-on
                          %element-BrandBu = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.

 IF ls_claimreg-AssetLocation IS INITIAL.

          APPEND VALUE #( %key = ls_claimreg-%key
                          %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claimreg-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Provide Asset/Location  ' )
                          %update = if_abap_behv=>mk-on
                          %element-AssetLocation  = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.


    ENDLOOP.


  ENDMETHOD.


*  METHOD calculate_fields.
*
*
*" read the data
*   READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
*      ENTITY claim_register
*      ALL FIELDS WITH CORRESPONDING #( keys )
*   RESULT DATA(lt_claimreg_read_result).
*
*  LOOP AT lt_claimreg_read_result ASSIGNING FIELD-SYMBOL(<ls_claimreg>).
*
*  MODIFY ENTITIES OF zr_grc_mi_claimreg  IN LOCAL MODE
*      ENTITY claim_register
*        UPDATE FIELDS ( brandbu  )
*        with VALUE #(  (
*        %tky = <ls_claimreg>-%tky
*        %data-brandbu = '2000'
**        %control-brandbu  = if_abap_behv=>mk-on
*        ) ).
*
*
*  ENDLOOP.
*
*
*
*  ENDMETHOD.

  METHOD setbrand.

  " read the data
   READ ENTITIES OF zr_grc_mi_claimreg IN LOCAL MODE
      ENTITY claim_register
      ALL FIELDS WITH CORRESPONDING #( keys )
   RESULT DATA(lt_claimreg_read_result).


    MODIFY ENTITIES OF  zr_grc_mi_claimreg  IN LOCAL MODE
      ENTITY claim_register
        UPDATE FIELDS ( brandbu )
        WITH VALUE #( FOR claim_register IN lt_claimreg_read_result ( %tky          = claim_register-%tky
                                               brandbu = 'Brand001' ) ).

ENDMETHOD.
ENDCLASS.
