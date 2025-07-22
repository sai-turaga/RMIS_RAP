CLASS lhc_xldata DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR XLData RESULT result.

    METHODS processData FOR MODIFY
      IMPORTING keys FOR ACTION XLData~processData RESULT result.

ENDCLASS.

CLASS lhc_xldata IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD processData.


  ENDMETHOD.

ENDCLASS.

CLASS LHC_ZR_TGRC_XLS_USER DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR XLHead
        RESULT result,
      uploadExcelData FOR MODIFY
            IMPORTING keys FOR ACTION XLHead~uploadExcelData RESULT result.

          METHODS FillFileStatus FOR DETERMINE ON MODIFY
            IMPORTING keys FOR XLHead~FillFileStatus.

          METHODS FillSelectedStatus FOR DETERMINE ON MODIFY
            IMPORTING keys FOR XLHead~FillSelectedStatus.
ENDCLASS.

CLASS LHC_ZR_TGRC_XLS_USER IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD uploadExcelData.

  TYPES: BEGIN OF gty_gr_xl,
 application      TYPE string,
  record_type     TYPE string,
  record_type_desc TYPE string,
  fieldname         TYPE string,
  control          TYPE string,
             line_number     type string, "Internal Use during Upload
             line_id         type string, "Internal Use during Upload
           END OF gty_gr_xl.

   DATA: lt_rows         TYPE STANDARD TABLE OF string,
          lv_content      TYPE string,
          lo_table_descr  TYPE REF TO cl_abap_tabledescr,
          lo_struct_descr TYPE REF TO cl_abap_structdescr,
          lt_excel        TYPE STANDARD TABLE OF gty_gr_xl,
          lt_data         TYPE TABLE FOR CREATE zr_tgrc_xls_user\_XLData,
          lv_index        TYPE sy-index.


    FIELD-SYMBOLS: <lfs_col_header> TYPE string.

    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_file_entity).

    DATA(lv_attachment) = lt_file_entity[ 1 ]-attachment.
    CHECK lv_attachment IS NOT INITIAL.

    "Move Excel Data to Internal Table
    DATA(lo_xlsx) = xco_cp_xlsx=>document->for_file_content(
        iv_file_content = lv_attachment )->read_access( ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).
    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).
    DATA(lo_execute) = lo_worksheet->select(
        lo_selection_pattern )->row_stream( )->operation->write_to(
            REF #( lt_excel ) ).
    lo_execute->set_value_transformation(
        xco_cp_xlsx_read_access=>value_transformation->string_value )->if_xco_xlsx_ra_operation~execute( ).

    " Get number of columns in upload file for validation
    TRY.
        lo_table_descr ?= cl_abap_tabledescr=>describe_by_data( p_data = lt_excel ).
        lo_struct_descr ?= lo_table_descr->get_table_line_type( ).
        DATA(lv_no_of_cols) = 5. " Will do later
*          lines( lo_struct_descr->components ).
      CATCH cx_sy_move_cast_error.
        "Implement error handling
    ENDTRY.

    "Validate Header record
    DATA(ls_excel) = VALUE #( lt_excel[ 1 ] OPTIONAL ).
    IF ls_excel IS NOT INITIAL.
      DO lv_no_of_cols TIMES.
        lv_index = sy-index.
        ASSIGN COMPONENT lv_index OF STRUCTURE ls_excel TO <lfs_col_header>.
        CHECK <lfs_col_header> IS ASSIGNED.
        DATA(lv_value) = to_upper( <lfs_col_header> ).
        DATA(lv_has_error) = abap_false.
        CASE lv_index.
          WHEN 1.
            lv_has_error = COND #( WHEN lv_value <> 'APPLICATION' THEN abap_true ELSE lv_has_error ).
          WHEN 2.
            lv_has_error = COND #( WHEN lv_value <> 'RECORDID' THEN abap_true ELSE lv_has_error ).
          WHEN 3.
            lv_has_error = COND #( WHEN lv_value <> 'RECORDDESC' THEN abap_true ELSE lv_has_error ).
          WHEN 4.
            lv_has_error = COND #( WHEN lv_value <> 'FIELDNAME' THEN abap_true ELSE lv_has_error ).
          WHEN 5.
            lv_has_error = COND #( WHEN lv_value <> 'CONTROL' THEN abap_true ELSE lv_has_error ).
          WHEN OTHERS ." 9. "More than 7 columns (error)
            lv_has_error = abap_true.
        ENDCASE.
        IF lv_has_error = abap_true.
          APPEND VALUE #( %tky = lt_file_entity[ 1 ]-%tky ) TO failed-xlhead.
          APPEND VALUE #(
            %tky = lt_file_entity[ 1 ]-%tky
            %msg = new_message_with_text(
                     severity = if_abap_behv_message=>severity-error
                     text     = 'Wrong File Format!!' )
          ) TO reported-xlhead.
          UNASSIGN <lfs_col_header>.
          EXIT.
        ENDIF.
        UNASSIGN <lfs_col_header>.
      ENDDO.
    ENDIF.
    CHECK lv_has_error = abap_false.

    DELETE lt_excel INDEX 1.
    DELETE lt_excel WHERE application IS INITIAL.

    "Fill Line ID / Line Number
     TRY.
        DATA(lv_line_id) = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error.
    ENDTRY.
    LOOP AT lt_excel ASSIGNING FIELD-SYMBOL(<lfs_excel>).
      <lfs_excel>-line_id     = lv_line_id.
      <lfs_excel>-line_number = sy-tabix.
    ENDLOOP.

    "Prepare Data for  Child Entity (XLData)
    lt_data = VALUE #(
        (   %cid_ref  = keys[ 1 ]-%cid_ref
            %is_draft = keys[ 1 ]-%is_draft
            EndUser   = keys[ 1 ]-EndUser
            FileId    = keys[ 1 ]-FileId
            %target   = VALUE #(
                FOR lwa_excel IN lt_excel (
                    "%cid        = |{ lwa_excel-po_number }_{ lwa_excel-po_item }_{ lwa_excel-site_id }|
                    %cid         = keys[ 1 ]-%cid_ref
                    %is_draft   = keys[ 1 ]-%is_draft
                    %data = VALUE #(
                        EndUser         = keys[ 1 ]-EndUser
                        FileId          = keys[ 1 ]-FileId
                        LineId          = lwa_excel-line_id
                        LineNum      = lwa_excel-line_number
*                        PoNumber        = lwa_excel-po_number
*                        PoItem          = lwa_excel-po_item
*                        GrQuantity      = lwa_excel-gr_quantity
*                        UnitOfMeasure   = lwa_excel-unit_of_measure
*                        SiteId          = lwa_excel-site_id
*                        HeaderText      = lwa_excel-header_text
Application  = lwa_excel-application
RecordType   = lwa_excel-record_type
RecordTypeDesc = lwa_excel-record_type_desc
Fieldname = lwa_excel-fieldname
Control  = lwa_excel-control
                    )
                    %control = VALUE #(
                        EndUser         = if_abap_behv=>mk-on
                        FileId          = if_abap_behv=>mk-on
                        LineId          = if_abap_behv=>mk-on
                        LineNum      = if_abap_behv=>mk-on
Application   = if_abap_behv=>mk-on
RecordType   = if_abap_behv=>mk-on
RecordTypeDesc   = if_abap_behv=>mk-on
Fieldname   = if_abap_behv=>mk-on
Control   = if_abap_behv=>mk-on
                    )
                )
            )
        )
    ).

    "Delete Existing entry for user if any
    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead BY \_XLData
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_existing_XLData).
    IF lt_existing_XLData IS NOT INITIAL.
      MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
      ENTITY XLData DELETE FROM VALUE #(
        FOR lwa_data IN lt_existing_XLData (
          %key        = lwa_data-%key
          %is_draft   = lwa_data-%is_draft
        )
      )
      MAPPED DATA(lt_del_mapped)
      REPORTED DATA(lt_del_reported)
      FAILED DATA(lt_del_failed).
    ENDIF.

    "Add New Entry for XLData (association)
    MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead CREATE BY \_XLData
    AUTO FILL CID WITH lt_data.

    "Modify Status
    MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead
    UPDATE FROM VALUE #(  (
        %tky        = lt_file_entity[ 1 ]-%tky "keys[ 1 ]-%tky
        FileStatus  = 'File Uploaded'
        %control-FileStatus = if_abap_behv=>mk-on ) )
    MAPPED DATA(lt_upd_mapped)
    FAILED DATA(lt_upd_failed)
    REPORTED DATA(lt_upd_reported).

    "Read Updated Entry
    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead ALL FIELDS WITH CORRESPONDING #( Keys )
    RESULT DATA(lt_updated_XLHead).

    "Send Status back to front end
    result = VALUE #(
      FOR lwa_upd_head IN lt_updated_XLHead (
        %tky    = lwa_upd_head-%tky
        %param  = lwa_upd_head
      )
    ).
  ENDMETHOD.

  METHOD FillFileStatus.

   "Read the data to be modified
    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead FIELDS ( EndUser FileStatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_user).

    "Update File Status
    LOOP AT lt_user INTO DATA(ls_user).
      MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
      ENTITY XLHead
      UPDATE FIELDS ( FileStatus )
      WITH VALUE #( (
          %tky                  = ls_user-%tky
          %data-FileStatus      = 'File Not Selected'
          %control-FileStatus   = if_abap_behv=>mk-on
          ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD FillSelectedStatus.

   "Delete XLDATA Existing (if any)
    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead BY \_XLData
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_existing_XLData).

    IF lt_existing_xldata IS NOT INITIAL.
      MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
      ENTITY XLData DELETE FROM VALUE #(
        FOR lwa_data IN lt_existing_XLData (
          %key        = lwa_data-%key
          %is_draft   = lwa_data-%is_draft ) ).
    ENDIF.

    "Read XL_Head Entities and change file status
    READ ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
    ENTITY XLHead ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_xlhead).

    "Update File Status
    LOOP AT lt_xlhead INTO DATA(ls_xlhead).
      MODIFY ENTITIES OF zr_tgrc_xls_user IN LOCAL MODE
      ENTITY XLHead
      UPDATE FIELDS ( FileStatus )
      WITH VALUE #( (
          %tky                  = ls_xlhead-%tky
          %data-FileStatus      = COND #(
                                    WHEN ls_xlhead-Attachment IS INITIAL
                                    THEN 'File Not Selected'
                                    ELSE 'File Selected' )
          %control-FileStatus   = if_abap_behv=>mk-on
          ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
