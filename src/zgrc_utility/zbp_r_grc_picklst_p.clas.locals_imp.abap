CLASS lsc_zr_grc_picklst_p DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_grc_picklst_p IMPLEMENTATION.

  METHOD adjust_numbers.

      DATA:    lv_listid  TYPE zgrc_picklist_numbering,
          lv_valueid TYPE zgrc_picklist_numbering.

    IF mapped-parent IS NOT INITIAL.
*  DATA : value_id_max TYPE zgrc_numbering.
      SELECT MAX( list_id )
          FROM ztgrc_picklst_p
          INTO @DATA(lv_lists).
      IF sy-subrc = 0 AND lv_lists IS NOT INITIAL.
        DATA(list_id_max) = lv_lists.
      ELSE.
        list_id_max = '100000'.
      ENDIF.

      LOOP AT mapped-parent ASSIGNING FIELD-SYMBOL(<ls_parent>) .

        list_id_max += 1.
        <ls_parent>-ListId = list_id_max.
      ENDLOOP.

    ENDIF.

    IF mapped-child IS NOT INITIAL.
*  DATA : value_id_max TYPE zgrc_numbering.
      SELECT MAX( value_id )
          FROM ztgrc_picklst_c
          INTO @DATA(lv_picklists).
      IF sy-subrc = 0 AND lv_picklists IS NOT INITIAL.
        DATA(value_id_max) = lv_picklists.
      ELSE.
        value_id_max = '500000'.
      ENDIF.

      LOOP AT mapped-child ASSIGNING FIELD-SYMBOL(<ls_child>) STEP -1.
        <ls_child>-ListId = <ls_child>-%tmp-ListId.
        value_id_max += 1.
        <ls_child>-ValueId = value_id_max.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_GRC_PICKLST_P DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Parent
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_GRC_PICKLST_P IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
ENDCLASS.
