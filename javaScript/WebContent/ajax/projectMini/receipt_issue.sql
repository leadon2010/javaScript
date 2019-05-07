CREATE OR REPLACE FUNCTION create_receipt_no RETURN VARCHAR2 IS
    v_new_no VARCHAR2(10);
    v_max_no VARCHAR2(10);
BEGIN
    SELECT MAX(r.receipt_no)
    INTO   v_max_no
    FROM   receipt_info r
    WHERE  SUBSTR(r.receipt_no
                 ,1
                 ,7) = 'P' || TO_CHAR(SYSDATE
                                     ,'yyyymm');

    IF v_max_no IS NULL THEN
        v_new_no := 'P' || TO_CHAR(SYSDATE
                                  ,'yyyymm') || '001';
    ELSE
        v_new_no := 'P' || TO_CHAR(SYSDATE
                                  ,'yyyymm') ||
                    LPAD(to_number(SUBSTR(v_max_no
                                         ,8)) + 1
                        ,3
                        ,'0');
    END IF;

    RETURN(v_new_no);
END create_receipt_no;


CREATE OR REPLACE PROCEDURE receipt_txn(p_receipt_no IN VARCHAR2
                                       ,p_ret_msg    OUT VARCHAR2) IS
    CURSOR receiptlist IS
        SELECT *
        FROM   receipt_info r
        WHERE  r.receipt_no = p_receipt_no;
BEGIN
    p_ret_msg := 'NG';
    FOR r IN receiptlist
    LOOP
        INSERT INTO receipt_issue_txn
            (seq_id
            ,item_code
            ,txn_quantity
            ,txn_sub
            ,txn_date
            ,receipt_issue_no)
        VALUES
            ((SELECT NVL(MAX(seq_id)
                       ,0) + 1
             FROM   receipt_issue_txn)
            ,r.receipt_item
            ,r.receipt_qty
            ,r.receipt_sub
            ,SYSDATE
            ,r.receipt_no);
    END LOOP;

    UPDATE receipt_info ri
    SET    ri.receipt_flag = 'Y'
    WHERE  ri.receipt_no = p_receipt_no;

    p_ret_msg := 'OK';

END receipt_txn;
