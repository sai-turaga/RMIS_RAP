CLASS lsc_zr_tgrc_asset DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tgrc_asset IMPLEMENTATION.

  METHOD save_modified.

    DATA : lt_asset       TYPE STANDARD TABLE OF ztgrc_asset,
           lt_asset_value TYPE STANDARD TABLE OF ztgrc_asset_val.

    IF update-asset IS NOT INITIAL.
      lt_asset = CORRESPONDING #( update-asset ).
      lt_asset_value = CORRESPONDING #( update-assetval ).
    ENDIF.

    IF create-asset IS NOT INITIAL.
      lt_asset = CORRESPONDING #( create-asset ).
      lt_asset_value = CORRESPONDING #( create-assetval ).
    ENDIF..

    IF lt_asset IS NOT INITIAL.
      LOOP AT lt_asset ASSIGNING FIELD-SYMBOL(<ls_asset>).
*<ls_asset>-changing_operation = 'CREATE'.
*GET TIME STAMP FIELD <ls_asset>-createdat .
*READ TABLE create-asset ASSIGNING FIELD-SYMBOL(<ls_travel>)
*WITH TABLE KEY entity
*COMPONENTS AssetUuid = <ls_asset>-asset_uuid.
*
*IF sy-subrc IS INITIAL.
*
*  endif.

        <ls_asset>-material = 'MK_mateial'.
        <ls_asset>-current_asset_value = 1000.
      ENDLOOP.

      MODIFY ztgrc_asset FROM TABLE @lt_asset.

    ENDIF.

    IF lt_asset_value IS NOT INITIAL.
      LOOP AT lt_asset_value ASSIGNING FIELD-SYMBOL(<lfs_asset_value>).

        <lfs_asset_value>-apmm_insured_value = 2000.
        <lfs_asset_value>-Asset_Value_Formula = 3000.
        <lfs_asset_value>-Asset_Value_Formula = <lfs_asset_value>-Infrastructure +
          <lfs_asset_value>-Equipment + <lfs_asset_value>-Revenue + <lfs_asset_value>-Volume_Tons.

        <lfs_asset_value>-Property_and_Handling_Equip =
            <lfs_asset_value>-Property + <lfs_asset_value>-Cranes_and_Handling_Equipment.
        <lfs_asset_value>-Total_Insured_Value =  <lfs_asset_value>-Hull_Value
         + <lfs_asset_value>-OTLI_Value + <lfs_asset_value>-Property_and_Handling_Equip +
         <lfs_asset_value>-Business_Interruption.
        <lfs_asset_value>-War_Value =    <lfs_asset_value>-Hull_Value + <lfs_asset_value>-OTLI_Value.


      ENDLOOP.

    ENDIF.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_assetval DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validate_asset_value FOR VALIDATE ON SAVE
      IMPORTING keys FOR AssetVal~validate_asset_value.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR AssetVal RESULT result.

    METHODS set_Asset_Value_Formula FOR DETERMINE ON MODIFY
      IMPORTING keys FOR AssetVal~set_Asset_Value_Formula.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE AssetVal.

ENDCLASS.

CLASS lhc_assetval IMPLEMENTATION.

  METHOD validate_asset_value.

    READ ENTITIES OF ZR_TGRC_ASSEt
    IN LOCAL MODE
    ENTITY  assetval
    FIELDS ( assetvalue ) WITH CORRESPONDING #(  keys )
    RESULT DATA(lt_assetvalrec).

    LOOP AT lt_assetvalrec INTO DATA(ls_assetvalrec).

      IF ls_assetvalrec-AssetValue IS INITIAL OR ls_assetvalrec-AssetValue < 0.

*APPEND VALUE #( %tky = ls_assetvalrec-%tky ) to failed-assetval.

*APPEND VALUE #( %tky = keys[ 1 ]-%tky
*%msg = new_message_with_text(
*severity = if_abap_behv_message=>severity-error
*text = 'Asset value should be positive' ) )
*To reported-assetval.
*
*DATA(item_msg) = new_message( id = 'ZGRC_RMIS'  " id = Name Of message class
*
*                      number = '005' "number of message defined in the message class
*                      severity = cl_abap_behv=>ms-error "type of message
*                      v1 = 'test' "First Parameter
*                      v2 = ''           "Second Parameter
*                      v3 = ''           "Third Parameter
*                      v4 = ''           "Fourth Parameter
*                      ).
*
*  APPEND VALUE #(
**  // %cid = keys[ 1 ]-%cid " %cid = "Content ID" in ABAP Behavior
*        %tky = keys[ 1 ]-%tky
*       %msg = item_msg "%msg  =  type ref to if_abap_behv_message / Message to be passed
*       ) TO reported-assetval.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD set_Asset_Value_Formula.

    "Read travel instances of the transferred keys
    READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
     ENTITY Asset
      ALL FIELDS
       WITH CORRESPONDING #( keys )
     RESULT DATA(lt_assetrec)
     FAILED DATA(read_failed).

    "If overall travel status is already set, do nothing, i.e. remove such instances
    "DELETE lt_assetrec WHERE OverallStatus IS NOT INITIAL.
    CHECK lt_assetrec IS NOT INITIAL.

    "else set overall travel status to open ('O')
*MODIFY ENTITIES OF ZR_TGRC_ASSET IN LOCAL MODE
*  ENTITY Asset
*    UPDATE SET FIELDS
*    WITH VALUE #( FOR Asset IN lt_assetrec ( %tky    = Asset-%tky
*                                         ap = Asset-Infrastructure + Asset-Equipment + Asset-Revenue + Asset-Volume_Ton ) )
*REPORTED DATA(update_reported).
*
*"Set the changing parameter
*reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

  METHOD precheck_update.

    "Loop on Entity to get current values from UI, all updated changed values will be available in <lfs_entity>
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).

      "Read travel instances of the transferred keys
      READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
       ENTITY AssetVal
        ALL FIELDS
*   // WITH CORRESPONDING #( keys )
      WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
       RESULT DATA(lt_assetvalrec).

**  READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
**    ENTITY asset
**    ALL FIELDS WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
**    RESULT DATA(lt_asset)
**    ENTITY asset BY \_AssetVal
**    ALL FIELDS WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
**    RESULT DATA(lt_asset_val).

* FAILED DATA(read_failed).

      IF sy-subrc IS INITIAL .
        READ TABLE lt_assetvalrec ASSIGNING FIELD-SYMBOL(<lfs_assetval>) INDEX 1.
        IF sy-subrc IS INITIAL.
*        IF <lfs_assetval>-AssetValue IS INITIAL OR <lfs_assetval>-AssetValue < 0.
*           "Return Error Message to Frontend.
*              APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
*              APPEND VALUE #(  %tky =  <lfs_entity>-%tky
*                               %msg = new_message_with_text(
*                                  severity = if_abap_behv_message=>severity-error
*                                  text = 'Asset Value cannot be negative'
*                                )  ) TO reported-assetval.
*
*
*        ENDIF.
          IF <lfs_entity>-AssetValueExternal IS NOT INITIAL.
*           "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Asset external change '

                              )  ) TO reported-assetval.
*
*
          ENDIF.
          IF <lfs_assetval>-BusinessInterruption IS INITIAL OR <lfs_assetval>-BusinessInterruption < 0.
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Business Interruption cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF..

          IF <lfs_assetval>-BusinessInterruption IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Business Interruption cannot be blank'
                              )  ) TO reported-assetval.
          ENDIF.
*H&M Value cannot be negative
          IF <lfs_assetval>-HullValue IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'H&M Value cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF.


          IF <lfs_assetval>-AssetValueForInterest IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'ssetValueForInterest cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF.

        ENDIF.
      ENDIF.





    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_tgrc_asset DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    "DATA fields TYPE any  .
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Asset
        RESULT result,
      copyasset FOR MODIFY
        IMPORTING keys FOR ACTION Asset~copyasset,
      get_instance_features FOR INSTANCE FEATURES
        IMPORTING keys REQUEST requested_features FOR Asset RESULT result,
      precheck_create FOR PRECHECK
        IMPORTING entities FOR CREATE Asset.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Asset.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Asset RESULT result.
ENDCLASS.

CLASS lhc_zr_tgrc_asset IMPLEMENTATION.

  METHOD copyasset.

    DATA:
      asset       TYPE TABLE FOR CREATE zr_tgrc_asset,
      asset_value TYPE TABLE FOR CREATE zr_tgrc_asset\\asset\_AssetVal.

    " remove asset instances with initial %cid (i.e., not set by caller API)
    READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_inital_cid).
    ASSERT key_with_inital_cid IS INITIAL.

    " read the data from the asset instances to be copied
    READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
       ENTITY asset
       ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_asset_read_result)
    FAILED failed.


    READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
         ENTITY asset BY \_AssetVal
          ALL FIELDS WITH CORRESPONDING #( lt_asset_read_result )
        RESULT DATA(lt_assetval_read_result).

    LOOP AT lt_asset_read_result ASSIGNING FIELD-SYMBOL(<ls_asset_read_result>).
      " fill in asset container for creating new asset instance
      APPEND VALUE #( %cid      = keys[ KEY entity %key = <ls_asset_read_result>-%key ]-%cid
                     %is_draft = keys[ KEY entity %key = <ls_asset_read_result>-%key ]-%param-%is_draft
                     %data     = CORRESPONDING #( <ls_asset_read_result> EXCEPT assetuuid )
                  )
      TO asset ASSIGNING FIELD-SYMBOL(<ls_new_asset>).

      "Fill %cid_ref of travel as instance identifier for cba booking
      APPEND VALUE #( %cid_ref = keys[ KEY entity %key = <ls_asset_read_result>-%key ]-%cid )
        TO asset_value ASSIGNING FIELD-SYMBOL(<ls_assetval>).

      <ls_new_asset>-AssetUuid = 'Clone_' && cl_abap_context_info=>get_system_time( ).

      LOOP AT lt_assetval_read_result ASSIGNING FIELD-SYMBOL(<ls_asset_val>) USING KEY entity WHERE AssetUuid EQ <ls_asset_read_result>-AssetUuid.

        APPEND VALUE #( %cid     = keys[ KEY entity %key = <ls_asset_read_result>-%key ]-%cid && <ls_asset_val>-AssetValueUuid
                        %data    = CORRESPONDING #( lt_assetval_read_result[ KEY entity %key = <ls_asset_val>-%key ] EXCEPT  AssetUuid ) )
          TO <ls_assetval>-%target ASSIGNING FIELD-SYMBOL(<ls_new_asset_val>).

        <ls_new_asset_val>-AssetValueExternal = 'Clone_Trn' && cl_abap_context_info=>get_system_time( ).

      ENDLOOP.
*
    ENDLOOP.
*
*   " create new BO instance
*   MODIFY ENTITIES OF  zr_grc_mi_claimreg IN LOCAL MODE
*      ENTITY claim_register
*      CREATE FIELDS
*      (
*
*    ClaimRegExtId
*    AssetLocation
*    BrandBu
*    CloseDate
*    DateOfLoss
*    IbnerFormula
*    IbnerAdjustment
*    Ibner
*    InsurerClaimNumber
*    InsurerClaimNumber2
*    LossDescription
*    MiasGrossIncurredFormula
*    MiasGrossIncurred
*    MiasPaid
*    MiasGrossReservedExclIbner
*    MiasNetReservedExclIbner
*    MiasNetReservedInclIbnerF
*    MiasPolicyYear
*    MiasShare
*    Subtype
*    Description
*    RI1stBracket
*    RITotalRecieved
*    RITotalShare
*    RIShareOfGrossReserve
*    ReinsuranceReceivables
*    Status
*     )
*         WITH claimreg
**ENTITY claim_register
*      CREATE BY \_claim_transaction AUTO FILL CID
*      FIELDS ( accountingdate AccountingMonth AccountingQuarter )
*          WITH claimtrn_cba
*      MAPPED DATA(mapped_create).
*
*
*
*   " set the new BO instances
*   mapped-asset =  mapped_create-asset.

*  DATA:
*      asset      TYPE TABLE FOR CREATE zr_tgrc_asset.
*
*   " remove travel instances with initial %cid (i.e., not set by caller API)
*   READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_inital_cid).
*   ASSERT key_with_inital_cid IS INITIAL.
*
*   " read the data from the travel instances to be copied
*   READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
*      ENTITY asset
*      ALL FIELDS WITH CORRESPONDING #( keys )
*   RESULT DATA(asset_read_result)
*   FAILED failed.
*
*   LOOP AT asset_read_result ASSIGNING FIELD-SYMBOL(<asset>).
*      " fill in travel container for creating new travel instance
*      APPEND VALUE #( %cid      = keys[ KEY entity %key = <asset>-%key ]-%cid
*                     %is_draft = keys[ KEY entity %key = <asset>-%key ]-%param-%is_draft
*                     %data     = CORRESPONDING #( <asset> EXCEPT assetuuid )
*                  )
*      TO asset ASSIGNING FIELD-SYMBOL(<new_asset>).
*
*      <new_asset>-AssetStatus = 'Copy'.
*   ENDLOOP.
*
*   " create new BO instance
*   MODIFY ENTITIES OF zr_tgrc_asset IN LOCAL MODE
*      ENTITY asset
*      CREATE FIELDS
*      (
*    AssetName
*    AccountingCode
*    Afe
*    AgreedValueLookup
*    AreaSqKm
*    AssetCategory
*    AssetDescription
*    AssetMakeOrModel
*    AssetPolicyHistory
*    AssetStatus
*    AssetTypeP
*     )
*         WITH asset
*      MAPPED DATA(mapped_create).
*
*   " set the new BO instances
*   mapped-asset   =  mapped_create-asset .
*
*  ENDMETHOD.
*
*  METHOD get_instance_features.
*
*
* READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
*      ENTITY asset
*      FIELDS ( AssetExternalId  AssetDescription )
*      WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_asset).
*
*.
*
*result = VALUE #( for ls_asset IN lt_asset
*(  %tky = ls_asset-%tky
*%features-%field-AssetExternalId = if_abap_behv=>fc-f-read_only
*%features-%field-AssetName = COND #(
* when ls_asset-AssetExternalId IS not initial then if_abap_behv=>fc-f-read_only else
*  if_abap_behv=>fc-o-disabled )
* )  ).





  ENDMETHOD.

  METHOD precheck_update.


    "Loop on Entity to get current values from UI, all updated changed values will be available in <lfs_entity>
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).

      "Read travel instances of the transferred keys
      READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
       ENTITY AssetVal
        ALL FIELDS
*   //WITH CORRESPONDING #( keys )
      WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
       RESULT DATA(lt_assetvalrec).

**  READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
**    ENTITY asset
**    ALL FIELDS WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
**    RESULT DATA(lt_asset)
**    ENTITY asset BY \_AssetVal
**    ALL FIELDS WITH VALUE #(  (  %key = <lfs_entity>-%key ) )
**    RESULT DATA(lt_asset_val).

* FAILED DATA(read_failed).

      IF sy-subrc IS INITIAL .
        READ TABLE lt_assetvalrec ASSIGNING FIELD-SYMBOL(<lfs_assetval>) INDEX 1.
        IF sy-subrc IS INITIAL.

*     <entity_assetval> = CORRESPONDING #( asset_read[ 1 ] ).
          <lfs_assetval> = CORRESPONDING #( BASE ( <lfs_assetval> ) <lfs_entity>  USING CONTROL ).
**
*        IF <lfs_assetval>-AssetValue IS INITIAL OR <lfs_assetval>-AssetValue < 0.
*           "Return Error Message to Frontend.
*              APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
*              APPEND VALUE #(  %tky =  <lfs_entity>-%tky
*                               %msg = new_message_with_text(
*                                  severity = if_abap_behv_message=>severity-error
*                                  text = 'Asset Value cannot be negative'
*                                )  ) TO reported-assetval.
*
*
*        ENDIF.
          IF <lfs_assetval>-AssetValueExternal IS NOT INITIAL.
*           "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Asset external change '

                              )  ) TO reported-assetval.
*
*
          ENDIF.
          IF <lfs_assetval>-BusinessInterruption IS INITIAL OR <lfs_assetval>-BusinessInterruption < 0.
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Business Interruption cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF..

          IF <lfs_assetval>-BusinessInterruption IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Business Interruption cannot be blank'
                              )  ) TO reported-assetval.
          ENDIF.
*H&M Value cannot be negative
          IF <lfs_assetval>-HullValue IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'H&M Value cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF.


          IF <lfs_assetval>-AssetValueForInterest IS INITIAL .
            "Return Error Message to Frontend.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky ) TO failed-assetval.
            APPEND VALUE #(  %tky =  <lfs_entity>-%tky
                             %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'AssetValueForInterest cannot be negative'
                              )  ) TO reported-assetval.
          ENDIF.

        ENDIF.
      ENDIF.





    ENDLOOP.



  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
                    ENTITY Asset
                      FIELDS ( RecordType )
                      WITH CORRESPONDING #( keys )
                    RESULT DATA(lt_rectyp)
                    FAILED failed.
    AUTHORITY-CHECK OBJECT 'Z_ASSET_O'
          ID 'ACTVT' FIELD '14'
          ID 'Z_ARECT_F' DUMMY.
    IF sy-subrc = 0.
      DATA(lv_admin) = abap_true.
    ENDIF.

    result = VALUE #( for ls_rectyp in lt_rectyp
                    ( %tky = ls_rectyp-%tky
                      %features-%field-AssetName = cond #( when lv_admin = abap_false
                                                           THEN if_abap_behv=>fc-f-read_only ) )
                        ).



  ENDMETHOD.
  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_ASSET_O'
            ID 'ACTVT' FIELD '01'
            ID 'Z_ARECT_F' DUMMY.
      IF sy-subrc <> 0.
        result-%create = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %msg      = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = 'operation not authorized!' ) )
                        TO reported-asset.
      ENDIF.
    ENDIF.

  ENDMETHOD.
  METHOD get_instance_authorizations.
    IF requested_authorizations-%update EQ if_abap_behv=>mk-on OR
     requested_authorizations-%delete EQ if_abap_behv=>mk-on.
      READ ENTITIES OF zr_tgrc_asset IN LOCAL MODE
                ENTITY Asset
                  FIELDS ( RecordType )
                  WITH CORRESPONDING #( keys )
                RESULT DATA(lt_rectyp)
                FAILED failed.

      CHECK lt_rectyp IS NOT INITIAL.
      LOOP AT lt_rectyp INTO DATA(ls_rectyp).
        IF requested_authorizations-%update EQ if_abap_behv=>mk-on.
          AUTHORITY-CHECK OBJECT 'Z_ASSET_O'
             ID 'ACTVT' FIELD '02'
             ID 'Z_ARECT_F' FIELD ls_rectyp-RecordType.
          IF sy-subrc = 0.
            DATA(lv_update) = abap_true.
          ENDIF.

        ENDIF.
        IF requested_authorizations-%delete EQ if_abap_behv=>mk-on.
          AUTHORITY-CHECK OBJECT 'Z_ASSET_O'
            ID 'ACTVT' FIELD '06'
            ID 'Z_ARECT_F' FIELD ls_rectyp-RecordType.
          IF sy-subrc = 0.
            DATA(lv_delete) = abap_true.
          ENDIF.

        ENDIF.
        APPEND VALUE #(  %tky    = ls_rectyp-%tky
                           %update = COND #( WHEN lv_update = abap_false
                                             THEN if_abap_behv=>auth-unauthorized
                                             ELSE if_abap_behv=>auth-allowed )
                           %action = VALUE #( edit = COND #( WHEN lv_update = abap_false
                                             THEN if_abap_behv=>auth-unauthorized
                                             ELSE if_abap_behv=>auth-allowed ) )
                           %delete = COND #( WHEN lv_delete = abap_false
                                             THEN if_abap_behv=>auth-unauthorized
                                             ELSE if_abap_behv=>auth-allowed )
                                              )  TO result.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.

  METHOD precheck_create.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entity>).
      AUTHORITY-CHECK OBJECT 'Z_ASSET_O'
            ID 'ACTVT' FIELD '01'
            ID 'Z_ARECT_F' FIELD <fs_entity>-RecordType.
      IF sy-subrc <> 0.
        "Return Error Message to Frontend.
        APPEND VALUE #(  %cid =  <fs_entity>-%cid ) TO failed-asset.
        APPEND VALUE #(  %cid =  <fs_entity>-%cid
                         %msg = new_message_with_text(
                            severity = if_abap_behv_message=>severity-error
                            text = |No Autorization to create Asset for RecType{  <fs_entity>-RecordType }|
                          )  ) TO reported-asset.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
