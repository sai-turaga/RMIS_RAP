CLASS lsc_zr_grc_occurence DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_grc_occurence IMPLEMENTATION.

  METHOD adjust_numbers.
    DATA: entity    TYPE STRUCTURE FOR CREATE zr_grc_occurence,
          lv_listid TYPE zgrc_numbering.

*    LOOP AT entities INTO entity WHERE OccurenceNo IS NOT INITIAL.
*      APPEND CORRESPONDING #( entity ) TO mapped-zrrmisoccurnce.
*    ENDLOOP.
*
*    DATA(entities_wo_occno) = entities.
*    DELETE entities_wo_occno WHERE OccurenceNo IS NOT INITIAL.
    SELECT MAX( occurence_no )
           FROM ztgrc_occurence
           INTO @DATA(lv_occurence).
    IF sy-subrc = 0 or lv_occurence IS INITIAL.
      lv_occurence = lv_occurence + 1.
      LOOP AT mapped-zrgrcoccurence REFERENCE INTO DATA(lv_map).
        lv_map->%key = CONV #( |{ lv_occurence WIDTH = 5 ALIGN = RIGHT PAD = '0' }| ).
      ENDLOOP.
*    ELSE.
*      LOOP AT mapped-zrgrcoccurence REFERENCE INTO lv_map.
*        lv_map->%key = '00001'.
*      ENDLOOP.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_grc_occurence DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrGrcOccurence
        RESULT result,
      setowner FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrGrcOccurence~setowner,
      copy FOR MODIFY
        IMPORTING keys FOR ACTION ZrGrcOccurence~copy.
ENDCLASS.

CLASS lhc_zr_grc_occurence IMPLEMENTATION.
  METHOD get_global_authorizations.
  IF requested_authorizations-%create = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_OCCUR_O'
            ID 'ACTVT' FIELD '01'.
      IF sy-subrc <> 0.
        result-%create = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %msg      = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = 'operation not authorized!' ) )
                        TO reported-zrgrcoccurence.
      ENDIF.
    ENDIF.

    IF requested_authorizations-%update = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_OCCUR_O'
            ID 'ACTVT' FIELD '02'.
      IF sy-subrc <> 0.
        result-%update = if_abap_behv=>auth-unauthorized.
      ENDIF.
    ENDIF.
    IF requested_authorizations-%delete = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_OCCUR_O'
            ID 'ACTVT' FIELD '06'.
      IF sy-subrc <> 0.
        result-%delete = if_abap_behv=>auth-unauthorized.
      ENDIF.
    ENDIF.
  ENDMETHOD.
  METHOD setowner.
    READ ENTITIES OF zr_grc_occurence IN LOCAL MODE
    ENTITY ZrGrcOccurence
    FIELDS ( Createdby ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_owner).



    LOOP AT lt_owner INTO DATA(ls_owner).

      DATA(lv_uname) = sy-uname.
      IF sy-uname = 'CB9980000011'.
        MODIFY ENTITIES OF zr_grc_occurence IN LOCAL MODE
        ENTITY ZrGrcOccurence
        UPDATE
        FIELDS ( Owner ) WITH VALUE #( (  %tky = ls_owner-%tky owner = 'Sai Gowtham Turaga' ) ).
      ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD copy.
    DATA: occurences TYPE TABLE FOR CREATE zr_grc_occurence.
    "Remove the travel instances with initial %cid
    READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_initial_cid).
    ASSERT key_with_initial_cid IS INITIAL.

    "Read all travel, booking and booking supplement using EML
    READ ENTITIES OF zr_grc_occurence IN LOCAL MODE
    ENTITY ZrGrcOccurence
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(occurence_read_result)
        FAILED failed.


    " Fill travel internal table for travel data creation - %cid
    LOOP AT occurence_read_result ASSIGNING FIELD-SYMBOL(<occurence>).

      "Occurence data prepration
      APPEND VALUE #( %cid = keys[ %tky = <occurence>-%tky ]-%cid
                     %data = CORRESPONDING #( <occurence> )
      ) TO occurences ASSIGNING FIELD-SYMBOL(<new_occurence>).
    ENDLOOP.

    " MODIFY ENTITY EML to create new BO instance using existing data
    MODIFY ENTITIES OF zr_grc_occurence IN LOCAL MODE
        ENTITY ZrGrcOccurence
            CREATE FIELDS ( Name Description OccurrenceType Country CatastropheCode DateOfLoss )
                WITH occurences
        MAPPED DATA(mapped_create).

    mapped-zrgrcoccurence = mapped_create-zrgrcoccurence.

  ENDMETHOD.

ENDCLASS.
