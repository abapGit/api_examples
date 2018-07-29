REPORT zabapgit_api_local_files.

START-OF-SELECTION.
  PERFORM run.

FORM run.

  DATA: lv_total TYPE i.

  TRY.
      DATA(lt_repos) = NEW zcl_abapgit_persistence_repo( )->list( ).

      LOOP AT lt_repos INTO DATA(ls_repo).
        DATA(lt_files) = zcl_abapgit_repo_srv=>get_instance( )->get( ls_repo-key )->get_files_local( ).
        lv_total = lv_total + lines( lt_files ).
      ENDLOOP.

      WRITE: / 'Done,', lv_total, 'files'.
    CATCH zcx_abapgit_exception INTO DATA(lx_error).
      WRITE: / 'Error:', lx_error->get_text( ).
  ENDTRY.

ENDFORM.
