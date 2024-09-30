*&---------------------------------------------------------------------*
*& Report ZKH_SALESTEXT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkh_salestext.

DATA: lt_lines TYPE TABLE OF tline,
      ls_lines TYPE tline.
DATA: lv_id      TYPE tdid,
      lv_language TYPE TDSPRAS,
      lv_name     TYPE THEAD-TDNAME,
      lv_object   TYPE TDOBJECT.

lv_id      = '0001'.
lv_language = sy-langu.
lv_name    = 'TG20                                    171010'.
lv_object  = 'MVKE'.

CALL FUNCTION 'READ_TEXT'
  EXPORTING
    id        = lv_id
    language  = lv_language
    name      = lv_name
    object    = lv_object
  TABLES
    lines     = lt_lines
  EXCEPTIONS
    id                 = 1
    language           = 2
    name               = 3
    not_found          = 4
    object             = 5
    reference_check    = 6
    wrong_access_to_archive = 7
    OTHERS             = 8.

IF sy-subrc = 0.
   WRITE: / 'ID: ', lv_id,
            'Language: ', lv_language,
            'Name: ', lv_name,
            'Object: ', lv_object.



  LOOP AT lt_lines INTO ls_lines.
    WRITE: / ls_lines-tdline.
  ENDLOOP.
ELSE.
  WRITE: / 'Error reading text: ', sy-subrc.
ENDIF.
