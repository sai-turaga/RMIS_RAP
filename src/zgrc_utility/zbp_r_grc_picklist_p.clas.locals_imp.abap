CLASS lsc_zr_grc_picklist_p DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_grc_picklist_p IMPLEMENTATION.

  METHOD adjust_numbers.
*    DATA: entity     TYPE STRUCTURE FOR CREATE zr_grc_occurence,
      DATA:    lv_listid  TYPE zgrc_picklist_numbering,
          lv_valueid TYPE zgrc_picklist_numbering.


* IF mapped-parent IS NOT INITIAL.
* TRY.
*        cl_numberrange_runtime=>number_get(
*          EXPORTING
*            nr_range_nr       = '01'
*            object            = 'ZGRC_PLIST'
*            quantity          = '00001'
*          IMPORTING
*            number            = DATA(number_range_key)
*            returncode        = DATA(number_range_return_code)
*            returned_quantity = DATA(number_range_returned_quantity)
*        ).
*      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
*    ENDTRY.
*  IF number_range_key IS NOT INITIAL.
**    lv_map->%key = number_range_key.
*    LOOP AT mapped-parent ASSIGNING FIELD-SYMBOL(<ls_parent>).
*      <ls_parent>-ListId = number_range_key.
*    ENDLOOP.
*  ENDIF.
*ENDIF.

    IF mapped-parent IS NOT INITIAL.
*  DATA : value_id_max TYPE zgrc_numbering.
      SELECT MAX( list_id )
          FROM ztgrc_picklist_p
          INTO @DATA(lv_lists).
      IF sy-subrc = 0 AND lv_lists IS NOT INITIAL.
        DATA(list_id_max) = lv_lists.
*      SORT lt_picklists BY createdat DESCENDING.
*      READ TABLE lt_picklists INTO DATA(ls_picklists) INDEX 1.
      ELSE.
        list_id_max = '100000'.
      ENDIF.

      LOOP AT mapped-parent ASSIGNING FIELD-SYMBOL(<ls_parent>) .

        list_id_max += 1.
        <ls_parent>-ListId = list_id_max.
      ENDLOOP.

    ENDIF.
*  IF mapped-child IS NOT INITIAL.
**   LOOP AT mapped-child INTO DATA(ls_child) WHERE ValueId IS NOT INITIAL.
**      APPEND CORRESPONDING #( ls_child ) TO mapped-child.
**    ENDLOOP.
*
*    DATA(entities_wo_valueid) = mapped-child.
*    DELETE entities_wo_valueid WHERE ValueId IS NOT INITIAL.
*
*   TRY.
*        cl_numberrange_runtime=>number_get(
*          EXPORTING
*            nr_range_nr       = '01'
*            object            = 'ZGRC_PKLST'
*            quantity          = CONV #( lines( entities_wo_valueid ) )
*          IMPORTING
*            number            = number_range_key
*            returncode        = number_range_return_code
*            returned_quantity = number_range_returned_quantity
*        ).
*      CATCH cx_number_ranges INTO lx_number_ranges.
*    ENDTRY.
*  IF number_range_key IS NOT INITIAL.
*
*  DATA(value_id_max) = number_range_key - number_range_returned_quantity.
*   LOOP AT mapped-child ASSIGNING FIELD-SYMBOL(<ls_child>) .
*     <ls_child>-ListId = <ls_child>-%tmp-ListId.
*     value_id_max += 1.
*      <ls_child>-ValueId = value_id_max.
*    ENDLOOP.
*  ENDIF.
* ENDIF.
    IF mapped-child IS NOT INITIAL.
*  DATA : value_id_max TYPE zgrc_numbering.
      SELECT MAX( value_id )
          FROM ztgrc_picklist_c
          INTO @DATA(lv_picklists).
      IF sy-subrc = 0 AND lv_picklists IS NOT INITIAL.
        DATA(value_id_max) = lv_picklists.
*      SORT lt_picklists BY createdat DESCENDING.
*      READ TABLE lt_picklists INTO DATA(ls_picklists) INDEX 1.
      ELSE.
        value_id_max = '500000'.
      ENDIF.

      LOOP AT mapped-child ASSIGNING FIELD-SYMBOL(<ls_child>) .
        <ls_child>-ListId = <ls_child>-%tmp-ListId.
        value_id_max += 1.
        <ls_child>-ValueId = value_id_max.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_grc_picklist_p DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Parent
        RESULT result.
*      earlynumbering_create FOR NUMBERING
*        IMPORTING entities FOR CREATE Parent,
*      earlynumbering_cba_Child FOR NUMBERING
*        IMPORTING entities FOR CREATE Parent\_Child.

ENDCLASS.

CLASS lhc_zr_grc_picklist_p IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
*  METHOD earlynumbering_create.
*    DATA: entity    TYPE STRUCTURE FOR CREATE zr_grc_picklist_p,
*          lv_listid TYPE zgrc_numbering.
*
*    LOOP AT entities INTO entity WHERE ListId IS NOT INITIAL.
*      APPEND CORRESPONDING #( entity ) TO mapped-parent.
*    ENDLOOP.
*
*    DATA(entities_wo_listid) = entities.
*    DELETE entities_wo_listid WHERE ListId IS NOT INITIAL.
*
*    SELECT *
*        FROM ztgrc_picklist_p
*        INTO TABLE @DATA(lt_picklists).
*    IF sy-subrc = 0.
*      SORT lt_picklists BY createdat DESCENDING.
*      READ TABLE lt_picklists INTO DATA(ls_picklists) INDEX 1.
*      LOOP AT entities_wo_listid INTO entity.
*        ls_picklists-list_id += 1.
*        entity-ListId = ls_picklists-list_id.
*
*        APPEND VALUE #( %cid = entity-%cid %key = entity-%key %is_draft = entity-%is_draft ) TO mapped-parent.
*      ENDLOOP.
*    ELSE.
*      LOOP AT entities_wo_listid INTO entity.
*        entity-ListId = '10001'.
*        APPEND VALUE #( %cid = entity-%cid %key = entity-%key %is_draft = entity-%is_draft ) TO mapped-parent.
*      ENDLOOP.
*    ENDIF.
*  ENDMETHOD.
*
*  METHOD earlynumbering_cba_Child.
*
*    DATA : max_value_id TYPE zgrc_numbering,
*           max_value_id2 TYPE zgrc_numbering,
*           max_value_id3 TYPE zgrc_numbering.
*
*    SELECT *
*        FROM ztgrc_picklist_c
*        INTO TABLE @DATA(lt_valuelist).
*    IF sy-subrc = 0.
*      SORT lt_valuelist BY createdat DESCENDING.
*      READ TABLE lt_valuelist INTO DATA(ls_valuelist) INDEX 1.
*    ENDIF.
*    "Get all the PickList and their child values
*    READ ENTITIES OF zr_grc_picklist_p IN LOCAL MODE
*       ENTITY Parent BY \_Child
*       FROM CORRESPONDING #(  entities )
*       LINK DATA(lt_values).
*
*   "'''''''''''''''''''''''''''''''''''''''''
*
*
**    LOOP AT lt_valuelist INTO DATA(ls_values1).
**       IF max_value_id2 < ls_values1-value_id.
**        max_value_id2  = ls_values1-value_id.
**       ENDIF.
**    ENDLOOP.
**    LOOP AT lt_values INTO DATA(ls_values2).
**       IF max_value_id3 < ls_values2-target-ValueId.
**        max_value_id3  = ls_values2-target-ValueId.
**       ENDIF.
**    ENDLOOP.
**    IF max_value_id2 < max_value_id3.
**      max_value_id = max_value_id3.
**    ELSE.
**     max_value_id = max_value_id2.
**
**   ENDIF.
*   TRY.
*        cl_numberrange_runtime=>number_get(
*          EXPORTING
*            nr_range_nr       = '01'
*            object            = 'ZGRC_PLIST'
*            quantity          = '00001'
*          IMPORTING
*            number            = DATA(number_range_key)
*            returncode        = DATA(number_range_return_code)
*            returned_quantity = DATA(number_range_returned_quantity)
*        ).
*      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
*    ENDTRY.
*
*    max_value_id = number_range_key.
*      "Loop over all the entities of PickList with the same ListID
*      LOOP AT entities ASSIGNING FIELD-SYMBOL(<Picklist>).
**       USING KEY entity WHERE ListId = <s_entities>-ListId.
*        "Assign new ValueID
*        LOOP AT <Picklist>-%target ASSIGNING FIELD-SYMBOL(<value>).
*          APPEND CORRESPONDING #(  <value> ) TO mapped-child
*          ASSIGNING FIELD-SYMBOL(<map_value>).
*          IF <value>-ValueId IS INITIAL .
**            max_value_id += 1.
*            <map_value>-ValueId = max_value_id .
*          ENDIF .
*        ENDLOOP.
*      ENDLOOP.
**    ENDLOOP.
*
*
*
**    DATA: value_id TYPE zgrc_numbering.
**    SELECT *
**      FROM ztgrc_picklist_c
**      INTO TABLE @DATA(lt_list_val).
**    IF sy-subrc = 0.
**      SORT lt_list_val BY createdat DESCENDING.
**      READ TABLE lt_list_val INTO DATA(ls_listval) INDEX 1.
**      DATA(lv_high) = ls_listval-value_id.
**      LOOP AT entities ASSIGNING FIELD-SYMBOL(<Picklist>).
**
**        "Assign new ValueID
**
**
**
**        LOOP AT <Picklist>-%target ASSIGNING FIELD-SYMBOL(<value>).
**          APPEND CORRESPONDING #(  <value> ) TO mapped-child
**          ASSIGNING FIELD-SYMBOL(<map_value>).
**          IF <value>-ValueId IS INITIAL .
**            lv_high += 1.
**            <map_value>-ValueId = lv_high.
**          ENDIF .
**        ENDLOOP.
**      ENDLOOP.
**    ELSE.
**      LOOP AT entities ASSIGNING FIELD-SYMBOL(<Picklist1>).
**        LOOP AT <Picklist1>-%target ASSIGNING FIELD-SYMBOL(<value_list1>).
**          APPEND CORRESPONDING #(  <value_list1> ) TO mapped-child
**          ASSIGNING FIELD-SYMBOL(<map_list_value>).
**          <map_list_value>-ValueId = '40001'.
**        ENDLOOP.
**      ENDLOOP.
**    ENDIF.
*
*
*
*
*
*  ENDMETHOD.
ENDCLASS.
