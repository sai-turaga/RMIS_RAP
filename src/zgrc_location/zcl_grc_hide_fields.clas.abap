CLASS zcl_grc_hide_fields DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_grc_hide_fields IMPLEMENTATION.
METHOD if_sadl_exit_calc_element_read~calculate.
   DATA LT_ORIGINAL_DATA TYPE STANDARD TABLE OF zc_tgrc_location WITH DEFAULT KEY.
    LT_ORIGINAL_DATA = CORRESPONDING #( IT_ORIGINAL_DATA ).


    LOOP AT LT_ORIGINAL_DATA ASSIGNING FIELD-SYMBOL(<FS_ORIGINAL_DATA>).
      <FS_ORIGINAL_DATA>-testField =  abap_true.
    ENDLOOP.

    CT_CALCULATED_DATA = CORRESPONDING #( LT_ORIGINAL_DATA ).
  data(a) = 1.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
*    LOOP AT IT_REQUESTED_CALC_ELEMENTS ASSIGNING FIELD-SYMBOL(<FS_CALC_ELEMENT>).
*      CASE <FS_CALC_ELEMENT>.
*        WHEN 'TESTFIELD'.
*          APPEND 'ALARMSEQUENCE' TO et_requested_orig_elements.
*        ...
*      ENDCASE.
*    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
