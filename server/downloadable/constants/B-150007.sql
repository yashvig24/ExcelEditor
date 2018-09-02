--------------------------------------------------------------------------------
-- Copyright 2018 ABB Inc. All Rights Reserved.
-- Confidential and Proprietary.

SET SERVEROUTPUT ON;
SET DEFINE OFF;

PROMPT
PROMPT B-150007
PROMPT

DECLARE
   lc_sysdate               CONSTANT DATE             := SYSDATE;
   lc_user_id               CONSTANT NUMBER           := -10;
   lc_high_dt               CONSTANT DATE             := TO_DATE ('31-DEC-4000', 'DD-MON-YYYY');
   lc_low_dt                CONSTANT DATE             := TO_DATE ('01-Jan-1900', 'DD-MON-YYYY');

   lv_count                 NUMBER;
   lv_sct_rec               nm_sttl_component_type%ROWTYPE;
   lv_gtcol_xref            pjm_sttl_ld_gtcol_xref%ROWTYPE;
   lv_sicxt_rec             nm_sttl_item_comp_xref_type%ROWTYPE;

BEGIN
   SAVEPOINT  Before_script;

   -- NM_STTL_COMPONENT_TYPE table inserts

   lv_sct_rec.sttl_comp_num                           := 370080;
   lv_sct_rec.sttl_comp_short_desc                    := 'Total Monthly TEC Pro-Rata Adjustment';
   lv_sct_rec.sttl_comp_desc                          := 'Total Monthly TEC Pro-Rata Adjustment';
   lv_sct_rec.dest_field_nme                          := 'NUM_VAL';
   lv_sct_rec.column_num                              := 3;
   lv_sct_rec.mktrpt_src_tbl                          := 'PJM_STTL_COMP_GT';
   lv_sct_rec.mktrpt_src_fld                          := 'NUM_VAL';
   lv_sct_rec.estim_src_tbl                           := NULL;
   lv_sct_rec.estim_src_fld                           := NULL;
   lv_sct_rec.format_mask                             := '999G999G999G990D00';
   lv_sct_rec.load_flg                                := 1;
   lv_sct_rec.uom_cd                                  := 'DOLLAR';
   lv_sct_rec.function_nme                            := NULL;
   lv_sct_rec.display_tol_flg                         := 1;
   lv_sct_rec.sttl_vfy_flg                            := 0;
   lv_sct_rec.sttl_sem_flg                            := 0;
   lv_sct_rec.mkt_level_flg                           := 0;
   lv_sct_rec.sttl_elem_flg                           := 0;
   lv_sct_rec.user_id                                 := lc_user_id;
   lv_sct_rec.revised_dt_sys                          := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_component_type(lv_sct_rec);

   lv_sct_rec.sttl_comp_num                           := 370081;
   lv_sct_rec.sttl_comp_short_desc                    := 'Total Transitional Period TEC Adjustment';
   lv_sct_rec.sttl_comp_desc                          := 'Total Transitional Period TEC Adjustment';
   lv_sct_rec.dest_field_nme                          := 'NUM_VAL';
   lv_sct_rec.column_num                              := 3;
   lv_sct_rec.mktrpt_src_tbl                          := 'PJM_STTL_COMP_GT';
   lv_sct_rec.mktrpt_src_fld                          := 'NUM_VAL';
   lv_sct_rec.estim_src_tbl                           := NULL;
   lv_sct_rec.estim_src_fld                           := NULL;
   lv_sct_rec.format_mask                             := '999G999G999G990D00';
   lv_sct_rec.load_flg                                := 1;
   lv_sct_rec.uom_cd                                  := 'DOLLAR';
   lv_sct_rec.function_nme                            := NULL;
   lv_sct_rec.display_tol_flg                         := 1;
   lv_sct_rec.sttl_vfy_flg                            := 0;
   lv_sct_rec.sttl_sem_flg                            := 0;
   lv_sct_rec.mkt_level_flg                           := 0;
   lv_sct_rec.sttl_elem_flg                           := 0;
   lv_sct_rec.user_id                                 := lc_user_id;
   lv_sct_rec.revised_dt_sys                          := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_component_type(lv_sct_rec);

   lv_sct_rec.sttl_comp_num                           := 370082;
   lv_sct_rec.sttl_comp_short_desc                    := 'Total Transitional Period TEC Pro-Rata Adjustment';
   lv_sct_rec.sttl_comp_desc                          := 'Total Transitional Period TEC Pro-Rata Adjustment';
   lv_sct_rec.dest_field_nme                          := 'NUM_VAL';
   lv_sct_rec.column_num                              := 3;
   lv_sct_rec.mktrpt_src_tbl                          := 'PJM_STTL_COMP_GT';
   lv_sct_rec.mktrpt_src_fld                          := 'NUM_VAL';
   lv_sct_rec.estim_src_tbl                           := NULL;
   lv_sct_rec.estim_src_fld                           := NULL;
   lv_sct_rec.format_mask                             := '999G999G999G990D00';
   lv_sct_rec.load_flg                                := 1;
   lv_sct_rec.uom_cd                                  := 'DOLLAR';
   lv_sct_rec.function_nme                            := NULL;
   lv_sct_rec.display_tol_flg                         := 1;
   lv_sct_rec.sttl_vfy_flg                            := 0;
   lv_sct_rec.sttl_sem_flg                            := 0;
   lv_sct_rec.mkt_level_flg                           := 0;
   lv_sct_rec.sttl_elem_flg                           := 0;
   lv_sct_rec.user_id                                 := lc_user_id;
   lv_sct_rec.revised_dt_sys                          := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_component_type(lv_sct_rec);

   lv_sct_rec.sttl_comp_num                           := 370083;
   lv_sct_rec.sttl_comp_short_desc                    := 'Total Transitional Period TEC Interest Amount';
   lv_sct_rec.sttl_comp_desc                          := 'Total Transitional Period TEC Interest Amount';
   lv_sct_rec.dest_field_nme                          := 'NUM_VAL';
   lv_sct_rec.column_num                              := 3;
   lv_sct_rec.mktrpt_src_tbl                          := 'PJM_STTL_COMP_GT';
   lv_sct_rec.mktrpt_src_fld                          := 'NUM_VAL';
   lv_sct_rec.estim_src_tbl                           := NULL;
   lv_sct_rec.estim_src_fld                           := NULL;
   lv_sct_rec.format_mask                             := NULL;
   lv_sct_rec.load_flg                                := NULL;
   lv_sct_rec.uom_cd                                  := NULL;
   lv_sct_rec.function_nme                            := NULL;
   lv_sct_rec.display_tol_flg                         := 1;
   lv_sct_rec.sttl_vfy_flg                            := 0;
   lv_sct_rec.sttl_sem_flg                            := 0;
   lv_sct_rec.mkt_level_flg                           := 0;
   lv_sct_rec.sttl_elem_flg                           := 0;
   lv_sct_rec.user_id                                 := lc_user_id;
   lv_sct_rec.revised_dt_sys                          := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_component_type(lv_sct_rec);


   -- NM_STTL_ITEM_COMP_XREF_TYPE table inserts

   lv_sicxt_rec.sttl_item_num                         := 3501;
   lv_sicxt_rec.sttl_comp_num                         := 370080;
   lv_sicxt_rec.seq_num                               := 50;
   lv_sicxt_rec.display_flg                           := 1;
   lv_sicxt_rec.start_dt_gmt                          := TO_DATE('12/01/2016 05:00','MM/DD/YYYY HH24:MI');
   lv_sicxt_rec.end_dt_gmt                            := lc_high_dt;
   lv_sicxt_rec.dflt_required_flg                     := 0;
   lv_sicxt_rec.rpt_id                                := 258;
   lv_sicxt_rec.biltrl_iso_ref_ind                    := 2;
   lv_sicxt_rec.schd_id_ind                           := 0;
   lv_sicxt_rec.lse_num_ind                           := 1;
   lv_sicxt_rec.ftr_iso_ref_ind                       := 1;
   lv_sicxt_rec.frequency_cd                          := 'HOUR';
   lv_sicxt_rec.user_id                               := lc_user_id;
   lv_sicxt_rec.revised_dt_sys                        := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_item_comp_xt(lv_sicxt_rec);

   lv_sicxt_rec.sttl_item_num                         := 3501;
   lv_sicxt_rec.sttl_comp_num                         := 370081;
   lv_sicxt_rec.seq_num                               := 60;
   lv_sicxt_rec.display_flg                           := 1;
   lv_sicxt_rec.start_dt_gmt                          := TO_DATE('12/01/2016 05:00','MM/DD/YYYY HH24:MI');
   lv_sicxt_rec.end_dt_gmt                            := lc_high_dt;
   lv_sicxt_rec.dflt_required_flg                     := 0;
   lv_sicxt_rec.rpt_id                                := 258;
   lv_sicxt_rec.biltrl_iso_ref_ind                    := 2;
   lv_sicxt_rec.schd_id_ind                           := 0;
   lv_sicxt_rec.lse_num_ind                           := 1;
   lv_sicxt_rec.ftr_iso_ref_ind                       := 1;
   lv_sicxt_rec.frequency_cd                          := 'HOUR';
   lv_sicxt_rec.user_id                               := lc_user_id;
   lv_sicxt_rec.revised_dt_sys                        := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_item_comp_xt(lv_sicxt_rec);

   lv_sicxt_rec.sttl_item_num                         := 3501;
   lv_sicxt_rec.sttl_comp_num                         := 370082;
   lv_sicxt_rec.seq_num                               := 70;
   lv_sicxt_rec.display_flg                           := 1;
   lv_sicxt_rec.start_dt_gmt                          := TO_DATE('12/01/2016 05:00','MM/DD/YYYY HH24:MI');
   lv_sicxt_rec.end_dt_gmt                            := lc_high_dt;
   lv_sicxt_rec.dflt_required_flg                     := 0;
   lv_sicxt_rec.rpt_id                                := 258;
   lv_sicxt_rec.biltrl_iso_ref_ind                    := 2;
   lv_sicxt_rec.schd_id_ind                           := 0;
   lv_sicxt_rec.lse_num_ind                           := 1;
   lv_sicxt_rec.ftr_iso_ref_ind                       := 1;
   lv_sicxt_rec.frequency_cd                          := 'HOUR';
   lv_sicxt_rec.user_id                               := lc_user_id;
   lv_sicxt_rec.revised_dt_sys                        := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_item_comp_xt(lv_sicxt_rec);

   lv_sicxt_rec.sttl_item_num                         := 3501;
   lv_sicxt_rec.sttl_comp_num                         := 370083;
   lv_sicxt_rec.seq_num                               := 80;
   lv_sicxt_rec.display_flg                           := 1;
   lv_sicxt_rec.start_dt_gmt                          := TO_DATE('12/01/2016 05:00','MM/DD/YYYY HH24:MI');
   lv_sicxt_rec.end_dt_gmt                            := lc_high_dt;
   lv_sicxt_rec.dflt_required_flg                     := 0;
   lv_sicxt_rec.rpt_id                                := 258;
   lv_sicxt_rec.biltrl_iso_ref_ind                    := 2;
   lv_sicxt_rec.schd_id_ind                           := 0;
   lv_sicxt_rec.lse_num_ind                           := 1;
   lv_sicxt_rec.ftr_iso_ref_ind                       := 1;
   lv_sicxt_rec.frequency_cd                          := 'HOUR';
   lv_sicxt_rec.user_id                               := lc_user_id;
   lv_sicxt_rec.revised_dt_sys                        := lc_sysdate;

   pjm_dml_utils.insert_nm_sttl_item_comp_xt(lv_sicxt_rec);


   -- PJM_STTL_LD_GTCOL_XREF table inserts

   lv_gtcol_xref.job_cd                               := 'LTESCS';
   lv_gtcol_xref.config_nme                           := NULL;
   lv_gtcol_xref.data_type                            := 'CMP';
   lv_gtcol_xref.data_type_id                         := 370080;
   lv_gtcol_xref.frequency_cd                         := 'HOUR';
   lv_gtcol_xref.gt_table_nme                         := 'PJM_LD_MSRS_MONTHLY_FILE_GT';
   lv_gtcol_xref.gt_sttl_qty_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_prc_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_amt_col_nme                  := NULL;
   lv_gtcol_xref.gt_cmp_val_col_nme                   := 'INP_V_NUM_VAL06';
   lv_gtcol_xref.gt_cmp_val_col_typ                   := 'NUM';
   lv_gtcol_xref.sttl_type_cd                         := 'TRESCH';
   lv_gtcol_xref.mkt_volume_cd                        := NULL;
   lv_gtcol_xref.mkt_data_type_cd                     := NULL;
   lv_gtcol_xref.mkt_data_uom_cd                      := NULL;
   lv_gtcol_xref.price_type_cd                        := NULL;
   lv_gtcol_xref.xml_file_tag_nme                     := 'TOT_MON_TEC_PR_ADJUST';   ----ADD
   lv_gtcol_xref.rollup_type                          := 'NONE';
   lv_gtcol_xref.xp_level_rollup                      := 'CURRENT';
   lv_gtcol_xref.mkt_cd                               := 'PJM';

   pjm_dml_utils.ins_pjm_gtcol_xref(lv_gtcol_xref);

   lv_gtcol_xref.job_cd                               := 'LTESCS';
   lv_gtcol_xref.config_nme                           := NULL;
   lv_gtcol_xref.data_type                            := 'CMP';
   lv_gtcol_xref.data_type_id                         := 370081;
   lv_gtcol_xref.frequency_cd                         := 'HOUR';
   lv_gtcol_xref.gt_table_nme                         := 'PJM_LD_MSRS_MONTHLY_FILE_GT';
   lv_gtcol_xref.gt_sttl_qty_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_prc_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_amt_col_nme                  := NULL;
   lv_gtcol_xref.gt_cmp_val_col_nme                   := 'INP_V_NUM_VAL07';
   lv_gtcol_xref.gt_cmp_val_col_typ                   := 'NUM';
   lv_gtcol_xref.sttl_type_cd                         := 'TRESCH';
   lv_gtcol_xref.mkt_volume_cd                        := NULL;
   lv_gtcol_xref.mkt_data_type_cd                     := NULL;
   lv_gtcol_xref.mkt_data_uom_cd                      := NULL;
   lv_gtcol_xref.price_type_cd                        := NULL;
   lv_gtcol_xref.xml_file_tag_nme                     := NULL;----ADD
   lv_gtcol_xref.rollup_type                          := 'NONE';
   lv_gtcol_xref.xp_level_rollup                      := 'CURRENT';
   lv_gtcol_xref.mkt_cd                               := 'PJM';

   pjm_dml_utils.ins_pjm_gtcol_xref(lv_gtcol_xref);

   lv_gtcol_xref.job_cd                               := 'LTESCS';
   lv_gtcol_xref.config_nme                           := NULL;
   lv_gtcol_xref.data_type                            := 'CMP';
   lv_gtcol_xref.data_type_id                         := 370082;
   lv_gtcol_xref.frequency_cd                         := 'HOUR';
   lv_gtcol_xref.gt_table_nme                         := 'PJM_LD_MSRS_MONTHLY_FILE_GT';
   lv_gtcol_xref.gt_sttl_qty_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_prc_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_amt_col_nme                  := NULL;
   lv_gtcol_xref.gt_cmp_val_col_nme                   := 'INP_V_NUM_VAL08';
   lv_gtcol_xref.gt_cmp_val_col_typ                   := 'NUM';
   lv_gtcol_xref.sttl_type_cd                         := 'TRESCH';
   lv_gtcol_xref.mkt_volume_cd                        := NULL;
   lv_gtcol_xref.mkt_data_type_cd                     := NULL;
   lv_gtcol_xref.mkt_data_uom_cd                      := NULL;
   lv_gtcol_xref.price_type_cd                        := NULL;
   lv_gtcol_xref.xml_file_tag_nme                     := NULL;----ADD
   lv_gtcol_xref.rollup_type                          := 'NONE';
   lv_gtcol_xref.xp_level_rollup                      := 'CURRENT';
   lv_gtcol_xref.mkt_cd                               := 'PJM';

   pjm_dml_utils.ins_pjm_gtcol_xref(lv_gtcol_xref);

   lv_gtcol_xref.job_cd                               := 'LTESCS';
   lv_gtcol_xref.config_nme                           := NULL;
   lv_gtcol_xref.data_type                            := 'CMP';
   lv_gtcol_xref.data_type_id                         := 370083;
   lv_gtcol_xref.frequency_cd                         := 'HOUR';
   lv_gtcol_xref.gt_table_nme                         := 'PJM_LD_MSRS_MONTHLY_FILE_GT';
   lv_gtcol_xref.gt_sttl_qty_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_prc_col_nme                  := NULL;
   lv_gtcol_xref.gt_sttl_amt_col_nme                  := NULL;
   lv_gtcol_xref.gt_cmp_val_col_nme                   := 'INP_V_NUM_VAL09';
   lv_gtcol_xref.gt_cmp_val_col_typ                   := 'NUM';
   lv_gtcol_xref.sttl_type_cd                         := 'TRESCH';
   lv_gtcol_xref.mkt_volume_cd                        := NULL;
   lv_gtcol_xref.mkt_data_type_cd                     := NULL;
   lv_gtcol_xref.mkt_data_uom_cd                      := NULL;
   lv_gtcol_xref.price_type_cd                        := NULL;
   lv_gtcol_xref.xml_file_tag_nme                     := NULL;----ADD
   lv_gtcol_xref.rollup_type                          := 'NONE';
   lv_gtcol_xref.xp_level_rollup                      := 'CURRENT';
   lv_gtcol_xref.mkt_cd                               := 'PJM';

   pjm_dml_utils.ins_pjm_gtcol_xref(lv_gtcol_xref);


   COMMIT; 

   DBMS_OUTPUT.PUT_LINE('B-150007: End.'); 

EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK TO Before_script;
      DBMS_OUTPUT.put_line('B-150007: SQLERRM = ['|| SQLERRM || ']. ERROR_BACKTRACE = [' || DBMS_UTILITY.format_error_backtrace);
END;
/
PROMPT
PROMPT B-150007: END
PROMPT
