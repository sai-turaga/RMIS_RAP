CLASS ztest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM ztgrc_property.
    DELETE FROM ztgrc_prprty_d.

* TRY.
*    cl_numberrange_intervals=>create(
*      EXPORTING
*        interval  = VALUE #( ( nrrangenr = '01' fromnumber = '10001' tonumber = '19999' procind = 'I' ) )
*        object    = 'ZGRC_PKLST'
**        subobject =
**        option    =
*      IMPORTING
*        error     = DATA(ls_error)
*        error_inf = DATA(ls_error_inf)
*        error_iv  = DATA(ls_error_inv)
*        warning   = DATA(ls_error_war)
*    ).
*    CATCH cx_nr_object_not_found.
*    CATCH cx_number_ranges.
*ENDTRY.


*  CALL FUNCTION 'NUMBER_RANGE_INTERVAL_INIT'
*    EXPORTING
*      object            = 'ZGRC_PLIST'
**      subobject         = space
**      intervals         =
**      client            = SY-MANDT
**      commit            =
**    EXCEPTIONS
**      no_interval_found = 1
**      object_not_found  = 2
**      others            = 3
*    .
*  IF SY-SUBRC <> 0.
**   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
**     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
*  ENDIF.
 ENDMETHOD.
ENDCLASS.
