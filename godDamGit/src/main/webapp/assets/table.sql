-- 테이블 생성 SQL - tb_d_chungju
CREATE TABLE tb_d_chungju
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_chungju.dinfo_seq
CREATE SEQUENCE tb_d_chungju_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_chungju.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_chungju_AI_TRG
BEFORE INSERT ON tb_d_chungju 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_chungju_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_chungju_AI_TRG; 

-- DROP SEQUENCE tb_d_chungju_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_chungju
COMMENT ON TABLE tb_d_chungju IS '충주댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.dinfo_seq
COMMENT ON COLUMN tb_d_chungju.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.dam_num
COMMENT ON COLUMN tb_d_chungju.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_date
COMMENT ON COLUMN tb_d_chungju.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_level
COMMENT ON COLUMN tb_d_chungju.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_vow
COMMENT ON COLUMN tb_d_chungju.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_vow_rate
COMMENT ON COLUMN tb_d_chungju.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_inflow
COMMENT ON COLUMN tb_d_chungju.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_chungju.d_ttl_outflow
COMMENT ON COLUMN tb_d_chungju.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_chungju(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_chungju
    ADD CONSTRAINT FK_tb_d_chungju_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_chungju(dam_num)
-- ALTER TABLE tb_d_chungju
-- DROP CONSTRAINT FK_tb_d_chungju_dam_num_tb_dam;


-- 테이블 생성 SQL - tb_m_chungju
CREATE TABLE tb_m_chungju
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_chungju.minfo_seq
CREATE SEQUENCE tb_m_chungju_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_chungju.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_chungju_AI_TRG
BEFORE INSERT ON tb_m_chungju 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_chungju_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_chungju_AI_TRG; 

-- DROP SEQUENCE tb_m_chungju_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_chungju
COMMENT ON TABLE tb_m_chungju IS '충주댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.minfo_seq
COMMENT ON COLUMN tb_m_chungju.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.dam_num
COMMENT ON COLUMN tb_m_chungju.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_date
COMMENT ON COLUMN tb_m_chungju.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_level
COMMENT ON COLUMN tb_m_chungju.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_vow
COMMENT ON COLUMN tb_m_chungju.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_vow_rate
COMMENT ON COLUMN tb_m_chungju.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_inflow
COMMENT ON COLUMN tb_m_chungju.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_chungju.m_ttl_outflow
COMMENT ON COLUMN tb_m_chungju.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_chungju(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_chungju
    ADD CONSTRAINT FK_tb_m_chungju_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_chungju(dam_num)
-- ALTER TABLE tb_m_chungju
-- DROP CONSTRAINT FK_tb_m_chungju_dam_num_tb_dam;


-- 테이블 생성 SQL - tb_d_hoengseong
CREATE TABLE tb_d_hoengseong
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_hoengseong.dinfo_seq
CREATE SEQUENCE tb_d_hoengseong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_hoengseong.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_hoengseong_AI_TRG
BEFORE INSERT ON tb_d_hoengseong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_hoengseong_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_hoengseong_AI_TRG; 

-- DROP SEQUENCE tb_d_hoengseong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_hoengseong
COMMENT ON TABLE tb_d_hoengseong IS '횡성댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.dinfo_seq
COMMENT ON COLUMN tb_d_hoengseong.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.dam_num
COMMENT ON COLUMN tb_d_hoengseong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_date
COMMENT ON COLUMN tb_d_hoengseong.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_level
COMMENT ON COLUMN tb_d_hoengseong.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_vow
COMMENT ON COLUMN tb_d_hoengseong.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_vow_rate
COMMENT ON COLUMN tb_d_hoengseong.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_inflow
COMMENT ON COLUMN tb_d_hoengseong.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_hoengseong.d_ttl_outflow
COMMENT ON COLUMN tb_d_hoengseong.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_hoengseong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_hoengseong
    ADD CONSTRAINT FK_tb_d_hoengseong_dam_num_tb_ FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_hoengseong(dam_num)
-- ALTER TABLE tb_d_hoengseong
-- DROP CONSTRAINT FK_tb_d_hoengseong_dam_num_tb_;
-- 테이블 생성 SQL - tb_m_hoengseong
CREATE TABLE tb_m_hoengseong
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_hoengseong.minfo_seq
CREATE SEQUENCE tb_m_hoengseong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_hoengseong.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_hoengseong_AI_TRG
BEFORE INSERT ON tb_m_hoengseong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_hoengseong_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_hoengseong_AI_TRG; 

-- DROP SEQUENCE tb_m_hoengseong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_hoengseong
COMMENT ON TABLE tb_m_hoengseong IS '횡성댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.minfo_seq
COMMENT ON COLUMN tb_m_hoengseong.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.dam_num
COMMENT ON COLUMN tb_m_hoengseong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_date
COMMENT ON COLUMN tb_m_hoengseong.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_level
COMMENT ON COLUMN tb_m_hoengseong.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_vow
COMMENT ON COLUMN tb_m_hoengseong.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_vow_rate
COMMENT ON COLUMN tb_m_hoengseong.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_inflow
COMMENT ON COLUMN tb_m_hoengseong.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_hoengseong.m_ttl_outflow
COMMENT ON COLUMN tb_m_hoengseong.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_hoengseong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_hoengseong
    ADD CONSTRAINT FK_tb_m_hoengseong_dam_num_tb_ FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_hoengseong(dam_num)
-- ALTER TABLE tb_m_hoengseong
-- DROP CONSTRAINT FK_tb_m_hoengseong_dam_num_tb_;


-- 테이블 생성 SQL - tb_d_daecheong
CREATE TABLE tb_d_daecheong
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_daecheong.dinfo_seq
CREATE SEQUENCE tb_d_daecheong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_daecheong.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_daecheong_AI_TRG
BEFORE INSERT ON tb_d_daecheong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_daecheong_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_daecheong_AI_TRG; 

-- DROP SEQUENCE tb_d_daecheong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_daecheong
COMMENT ON TABLE tb_d_daecheong IS '대청댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.dinfo_seq
COMMENT ON COLUMN tb_d_daecheong.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.dam_num
COMMENT ON COLUMN tb_d_daecheong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_date
COMMENT ON COLUMN tb_d_daecheong.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_level
COMMENT ON COLUMN tb_d_daecheong.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_vow
COMMENT ON COLUMN tb_d_daecheong.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_vow_rate
COMMENT ON COLUMN tb_d_daecheong.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_inflow
COMMENT ON COLUMN tb_d_daecheong.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_daecheong.d_ttl_outflow
COMMENT ON COLUMN tb_d_daecheong.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_daecheong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_daecheong
    ADD CONSTRAINT FK_tb_d_daecheong_dam_num_tb_d FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq)  ;

-- Foreign Key 삭제 SQL - tb_d_daecheong(dam_num)
-- ALTER TABLE tb_d_daecheong
-- DROP CONSTRAINT FK_tb_d_daecheong_dam_num_tb_d;

-- 테이블 생성 SQL - tb_m_daecheong
CREATE TABLE tb_m_daecheong
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_daecheong.minfo_seq
CREATE SEQUENCE tb_m_daecheong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_daecheong.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_daecheong_AI_TRG
BEFORE INSERT ON tb_m_daecheong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_daecheong_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_daecheong_AI_TRG; 

-- DROP SEQUENCE tb_m_daecheong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_daecheong
COMMENT ON TABLE tb_m_daecheong IS '대청댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.minfo_seq
COMMENT ON COLUMN tb_m_daecheong.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.dam_num
COMMENT ON COLUMN tb_m_daecheong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_date
COMMENT ON COLUMN tb_m_daecheong.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_level
COMMENT ON COLUMN tb_m_daecheong.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_vow
COMMENT ON COLUMN tb_m_daecheong.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_vow_rate
COMMENT ON COLUMN tb_m_daecheong.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_inflow
COMMENT ON COLUMN tb_m_daecheong.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_daecheong.m_ttl_outflow
COMMENT ON COLUMN tb_m_daecheong.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_daecheong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_daecheong
    ADD CONSTRAINT FK_tb_m_daecheong_dam_num_tb_d FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_daecheong(dam_num)
-- ALTER TABLE tb_m_daecheong
-- DROP CONSTRAINT FK_tb_m_daecheong_dam_num_tb_d;

-- 테이블 생성 SQL - tb_d_boryeong
CREATE TABLE tb_d_boryeong
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_boryeong.dinfo_seq
CREATE SEQUENCE tb_d_boryeong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_boryeong.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_boryeong_AI_TRG
BEFORE INSERT ON tb_d_boryeong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_boryeong_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_boryeong_AI_TRG; 

-- DROP SEQUENCE tb_d_boryeong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_boryeong
COMMENT ON TABLE tb_d_boryeong IS '보령댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.dinfo_seq
COMMENT ON COLUMN tb_d_boryeong.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.dam_num
COMMENT ON COLUMN tb_d_boryeong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_date
COMMENT ON COLUMN tb_d_boryeong.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_level
COMMENT ON COLUMN tb_d_boryeong.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_vow
COMMENT ON COLUMN tb_d_boryeong.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_vow_rate
COMMENT ON COLUMN tb_d_boryeong.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_inflow
COMMENT ON COLUMN tb_d_boryeong.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_boryeong.d_ttl_outflow
COMMENT ON COLUMN tb_d_boryeong.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_boryeong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_boryeong
    ADD CONSTRAINT FK_tb_d_boryeong_dam_num_tb_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_d_boryeong(dam_num)
-- ALTER TABLE tb_d_boryeong
-- DROP CONSTRAINT FK_tb_d_boryeong_dam_num_tb_da;
-- 테이블 생성 SQL - tb_m_boryeong
CREATE TABLE tb_m_boryeong
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_boryeong.minfo_seq
CREATE SEQUENCE tb_m_boryeong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_boryeong.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_boryeong_AI_TRG
BEFORE INSERT ON tb_m_boryeong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_boryeong_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_boryeong_AI_TRG; 

-- DROP SEQUENCE tb_m_boryeong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_boryeong
COMMENT ON TABLE tb_m_boryeong IS '보령댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.minfo_seq
COMMENT ON COLUMN tb_m_boryeong.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.dam_num
COMMENT ON COLUMN tb_m_boryeong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_date
COMMENT ON COLUMN tb_m_boryeong.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_level
COMMENT ON COLUMN tb_m_boryeong.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_vow
COMMENT ON COLUMN tb_m_boryeong.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_vow_rate
COMMENT ON COLUMN tb_m_boryeong.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_inflow
COMMENT ON COLUMN tb_m_boryeong.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_boryeong.m_ttl_outflow
COMMENT ON COLUMN tb_m_boryeong.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_boryeong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_boryeong
    ADD CONSTRAINT FK_tb_m_boryeong_dam_num_tb_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_boryeong(dam_num)
-- ALTER TABLE tb_m_boryeong
-- DROP CONSTRAINT FK_tb_m_boryeong_dam_num_tb_da;

-- 테이블 생성 SQL - tb_d_buan
CREATE TABLE tb_d_buan
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_buan.dinfo_seq
CREATE SEQUENCE tb_d_buan_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_buan.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_buan_AI_TRG
BEFORE INSERT ON tb_d_buan 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_buan_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_buan_AI_TRG; 

-- DROP SEQUENCE tb_d_buan_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_buan
COMMENT ON TABLE tb_d_buan IS '부안댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_buan.dinfo_seq
COMMENT ON COLUMN tb_d_buan.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_buan.dam_num
COMMENT ON COLUMN tb_d_buan.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_date
COMMENT ON COLUMN tb_d_buan.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_level
COMMENT ON COLUMN tb_d_buan.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_vow
COMMENT ON COLUMN tb_d_buan.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_vow_rate
COMMENT ON COLUMN tb_d_buan.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_inflow
COMMENT ON COLUMN tb_d_buan.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_buan.d_ttl_outflow
COMMENT ON COLUMN tb_d_buan.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_buan(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_buan
    ADD CONSTRAINT FK_tb_d_buan_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_buan(dam_num)
-- ALTER TABLE tb_d_buan
-- DROP CONSTRAINT FK_tb_d_buan_dam_num_tb_dam_da;
-- 테이블 생성 SQL - tb_m_buan
CREATE TABLE tb_m_buan
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_buan.minfo_seq
CREATE SEQUENCE tb_m_buan_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_buan.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_buan_AI_TRG
BEFORE INSERT ON tb_m_buan 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_buan_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_buan_AI_TRG; 

-- DROP SEQUENCE tb_m_buan_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_buan
COMMENT ON TABLE tb_m_buan IS '부안댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_buan.minfo_seq
COMMENT ON COLUMN tb_m_buan.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_buan.dam_num
COMMENT ON COLUMN tb_m_buan.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_date
COMMENT ON COLUMN tb_m_buan.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_level
COMMENT ON COLUMN tb_m_buan.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_vow
COMMENT ON COLUMN tb_m_buan.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_vow_rate
COMMENT ON COLUMN tb_m_buan.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_inflow
COMMENT ON COLUMN tb_m_buan.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_buan.m_ttl_outflow
COMMENT ON COLUMN tb_m_buan.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_buan(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_buan
    ADD CONSTRAINT FK_tb_m_buan_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_buan(dam_num)
-- ALTER TABLE tb_m_buan
-- DROP CONSTRAINT FK_tb_m_buan_dam_num_tb_dam_da;

-- 테이블 생성 SQL - tb_d_yongdam
CREATE TABLE tb_d_yongdam
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_yongdam.dinfo_seq
CREATE SEQUENCE tb_d_yongdam_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_yongdam.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_yongdam_AI_TRG
BEFORE INSERT ON tb_d_yongdam 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_yongdam_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_yongdam_AI_TRG; 

-- DROP SEQUENCE tb_d_yongdam_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_yongdam
COMMENT ON TABLE tb_d_yongdam IS '용담댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.dinfo_seq
COMMENT ON COLUMN tb_d_yongdam.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.dam_num
COMMENT ON COLUMN tb_d_yongdam.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_date
COMMENT ON COLUMN tb_d_yongdam.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_level
COMMENT ON COLUMN tb_d_yongdam.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_vow
COMMENT ON COLUMN tb_d_yongdam.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_vow_rate
COMMENT ON COLUMN tb_d_yongdam.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_inflow
COMMENT ON COLUMN tb_d_yongdam.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_yongdam.d_ttl_outflow
COMMENT ON COLUMN tb_d_yongdam.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_yongdam(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_yongdam
    ADD CONSTRAINT FK_tb_d_yongdam_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_d_yongdam(dam_num)
-- ALTER TABLE tb_d_yongdam
-- DROP CONSTRAINT FK_tb_d_yongdam_dam_num_tb_dam;


-- 테이블 생성 SQL - tb_m_yongdam
CREATE TABLE tb_m_yongdam
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_yongdam.minfo_seq
CREATE SEQUENCE tb_m_yongdam_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_yongdam.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_yongdam_AI_TRG
BEFORE INSERT ON tb_m_yongdam 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_yongdam_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_yongdam_AI_TRG; 

-- DROP SEQUENCE tb_m_yongdam_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_yongdam
COMMENT ON TABLE tb_m_yongdam IS '용담댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.minfo_seq
COMMENT ON COLUMN tb_m_yongdam.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.dam_num
COMMENT ON COLUMN tb_m_yongdam.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_date
COMMENT ON COLUMN tb_m_yongdam.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_level
COMMENT ON COLUMN tb_m_yongdam.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_vow
COMMENT ON COLUMN tb_m_yongdam.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_vow_rate
COMMENT ON COLUMN tb_m_yongdam.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_inflow
COMMENT ON COLUMN tb_m_yongdam.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_yongdam.m_ttl_outflow
COMMENT ON COLUMN tb_m_yongdam.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_yongdam(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_yongdam
    ADD CONSTRAINT FK_tb_m_yongdam_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_yongdam(dam_num)
-- ALTER TABLE tb_m_yongdam
-- DROP CONSTRAINT FK_tb_m_yongdam_dam_num_tb_dam;


-- 테이블 생성 SQL - tb_d_namgang
CREATE TABLE tb_d_namgang
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_namgang.dinfo_seq
CREATE SEQUENCE tb_d_namgang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_namgang.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_namgang_AI_TRG
BEFORE INSERT ON tb_d_namgang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_namgang_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_namgang_AI_TRG; 

-- DROP SEQUENCE tb_d_namgang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_namgang
COMMENT ON TABLE tb_d_namgang IS '남강댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.dinfo_seq
COMMENT ON COLUMN tb_d_namgang.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.dam_num
COMMENT ON COLUMN tb_d_namgang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_date
COMMENT ON COLUMN tb_d_namgang.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_level
COMMENT ON COLUMN tb_d_namgang.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_vow
COMMENT ON COLUMN tb_d_namgang.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_vow_rate
COMMENT ON COLUMN tb_d_namgang.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_inflow
COMMENT ON COLUMN tb_d_namgang.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_namgang.d_ttl_outflow
COMMENT ON COLUMN tb_d_namgang.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_namgang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_namgang
    ADD CONSTRAINT FK_tb_d_namgang_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_namgang(dam_num)
-- ALTER TABLE tb_d_namgang
-- DROP CONSTRAINT FK_tb_d_namgang_dam_num_tb_dam;

-- 테이블 생성 SQL - tb_m_namgang
CREATE TABLE tb_m_namgang
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_namgang.minfo_seq
CREATE SEQUENCE tb_m_namgang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_namgang.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_namgang_AI_TRG
BEFORE INSERT ON tb_m_namgang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_namgang_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_namgang_AI_TRG; 

-- DROP SEQUENCE tb_m_namgang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_namgang
COMMENT ON TABLE tb_m_namgang IS '남강댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.minfo_seq
COMMENT ON COLUMN tb_m_namgang.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.dam_num
COMMENT ON COLUMN tb_m_namgang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_date
COMMENT ON COLUMN tb_m_namgang.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_level
COMMENT ON COLUMN tb_m_namgang.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_vow
COMMENT ON COLUMN tb_m_namgang.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_vow_rate
COMMENT ON COLUMN tb_m_namgang.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_inflow
COMMENT ON COLUMN tb_m_namgang.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_namgang.m_ttl_outflow
COMMENT ON COLUMN tb_m_namgang.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_namgang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_namgang
    ADD CONSTRAINT FK_tb_m_namgang_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_namgang(dam_num)
-- ALTER TABLE tb_m_namgang
-- DROP CONSTRAINT FK_tb_m_namgang_dam_num_tb_dam;

-- 테이블 생성 SQL - tb_d_milyang
CREATE TABLE tb_d_milyang
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_milyang.dinfo_seq
CREATE SEQUENCE tb_d_milyang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_milyang.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_milyang_AI_TRG
BEFORE INSERT ON tb_d_milyang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_milyang_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_milyang_AI_TRG; 

-- DROP SEQUENCE tb_d_milyang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_milyang
COMMENT ON TABLE tb_d_milyang IS '밀양댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.dinfo_seq
COMMENT ON COLUMN tb_d_milyang.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.dam_num
COMMENT ON COLUMN tb_d_milyang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_date
COMMENT ON COLUMN tb_d_milyang.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_level
COMMENT ON COLUMN tb_d_milyang.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_vow
COMMENT ON COLUMN tb_d_milyang.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_vow_rate
COMMENT ON COLUMN tb_d_milyang.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_inflow
COMMENT ON COLUMN tb_d_milyang.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_milyang.d_ttl_outflow
COMMENT ON COLUMN tb_d_milyang.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_milyang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_milyang
    ADD CONSTRAINT FK_tb_d_milyang_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq)  ;

-- Foreign Key 삭제 SQL - tb_d_milyang(dam_num)
-- ALTER TABLE tb_d_milyang
-- DROP CONSTRAINT FK_tb_d_milyang_dam_num_tb_dam;

-- 테이블 생성 SQL - tb_m_milyang
CREATE TABLE tb_m_milyang
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_milyang.minfo_seq
CREATE SEQUENCE tb_m_milyang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_milyang.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_milyang_AI_TRG
BEFORE INSERT ON tb_m_milyang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_milyang_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_milyang_AI_TRG; 

-- DROP SEQUENCE tb_m_milyang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_milyang
COMMENT ON TABLE tb_m_milyang IS '밀양댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.minfo_seq
COMMENT ON COLUMN tb_m_milyang.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.dam_num
COMMENT ON COLUMN tb_m_milyang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_date
COMMENT ON COLUMN tb_m_milyang.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_level
COMMENT ON COLUMN tb_m_milyang.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_vow
COMMENT ON COLUMN tb_m_milyang.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_vow_rate
COMMENT ON COLUMN tb_m_milyang.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_inflow
COMMENT ON COLUMN tb_m_milyang.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_milyang.m_ttl_outflow
COMMENT ON COLUMN tb_m_milyang.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_milyang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_milyang
    ADD CONSTRAINT FK_tb_m_milyang_dam_num_tb_dam FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_milyang(dam_num)
-- ALTER TABLE tb_m_milyang
-- DROP CONSTRAINT FK_tb_m_milyang_dam_num_tb_dam;


-- 테이블 생성 SQL - tb_d_andong
CREATE TABLE tb_d_andong
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_andong.dinfo_seq
CREATE SEQUENCE tb_d_andong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_andong.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_andong_AI_TRG
BEFORE INSERT ON tb_d_andong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_andong_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_andong_AI_TRG; 

-- DROP SEQUENCE tb_d_andong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_andong
COMMENT ON TABLE tb_d_andong IS '안동댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_andong.dinfo_seq
COMMENT ON COLUMN tb_d_andong.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_andong.dam_num
COMMENT ON COLUMN tb_d_andong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_date
COMMENT ON COLUMN tb_d_andong.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_level
COMMENT ON COLUMN tb_d_andong.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_vow
COMMENT ON COLUMN tb_d_andong.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_vow_rate
COMMENT ON COLUMN tb_d_andong.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_inflow
COMMENT ON COLUMN tb_d_andong.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_andong.d_ttl_outflow
COMMENT ON COLUMN tb_d_andong.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_andong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_andong
    ADD CONSTRAINT FK_tb_d_andong_dam_num_tb_dam_ FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_andong(dam_num)
-- ALTER TABLE tb_d_andong
-- DROP CONSTRAINT FK_tb_d_andong_dam_num_tb_dam_;

-- 테이블 생성 SQL - tb_m_andong
CREATE TABLE tb_m_andong
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_andong.minfo_seq
CREATE SEQUENCE tb_m_andong_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_andong.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_andong_AI_TRG
BEFORE INSERT ON tb_m_andong 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_andong_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_andong_AI_TRG; 

-- DROP SEQUENCE tb_m_andong_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_andong
COMMENT ON TABLE tb_m_andong IS '안동댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_andong.minfo_seq
COMMENT ON COLUMN tb_m_andong.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_andong.dam_num
COMMENT ON COLUMN tb_m_andong.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_date
COMMENT ON COLUMN tb_m_andong.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_level
COMMENT ON COLUMN tb_m_andong.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_vow
COMMENT ON COLUMN tb_m_andong.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_vow_rate
COMMENT ON COLUMN tb_m_andong.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_inflow
COMMENT ON COLUMN tb_m_andong.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_andong.m_ttl_outflow
COMMENT ON COLUMN tb_m_andong.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_andong(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_andong
    ADD CONSTRAINT FK_tb_m_andong_dam_num_tb_dam_ FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_andong(dam_num)
-- ALTER TABLE tb_m_andong
-- DROP CONSTRAINT FK_tb_m_andong_dam_num_tb_dam_;


-- 테이블 생성 SQL - tb_d_imha
CREATE TABLE tb_d_imha
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_imha.dinfo_seq
CREATE SEQUENCE tb_d_imha_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_imha.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_imha_AI_TRG
BEFORE INSERT ON tb_d_imha 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_imha_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_imha_AI_TRG; 

-- DROP SEQUENCE tb_d_imha_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_imha
COMMENT ON TABLE tb_d_imha IS '임하댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_imha.dinfo_seq
COMMENT ON COLUMN tb_d_imha.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_imha.dam_num
COMMENT ON COLUMN tb_d_imha.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_date
COMMENT ON COLUMN tb_d_imha.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_level
COMMENT ON COLUMN tb_d_imha.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_vow
COMMENT ON COLUMN tb_d_imha.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_vow_rate
COMMENT ON COLUMN tb_d_imha.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_inflow
COMMENT ON COLUMN tb_d_imha.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_imha.d_ttl_outflow
COMMENT ON COLUMN tb_d_imha.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_imha(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_imha
    ADD CONSTRAINT FK_tb_d_imha_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_d_imha(dam_num)
-- ALTER TABLE tb_d_imha
-- DROP CONSTRAINT FK_tb_d_imha_dam_num_tb_dam_da;


-- 테이블 생성 SQL - tb_m_imha
CREATE TABLE tb_m_imha
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_imha.minfo_seq
CREATE SEQUENCE tb_m_imha_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_imha.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_imha_AI_TRG
BEFORE INSERT ON tb_m_imha 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_imha_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_imha_AI_TRG; 

-- DROP SEQUENCE tb_m_imha_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_imha
COMMENT ON TABLE tb_m_imha IS '임하댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_imha.minfo_seq
COMMENT ON COLUMN tb_m_imha.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_imha.dam_num
COMMENT ON COLUMN tb_m_imha.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_date
COMMENT ON COLUMN tb_m_imha.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_level
COMMENT ON COLUMN tb_m_imha.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_vow
COMMENT ON COLUMN tb_m_imha.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_vow_rate
COMMENT ON COLUMN tb_m_imha.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_inflow
COMMENT ON COLUMN tb_m_imha.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_imha.m_ttl_outflow
COMMENT ON COLUMN tb_m_imha.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_imha(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_imha
    ADD CONSTRAINT FK_tb_m_imha_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_m_imha(dam_num)
-- ALTER TABLE tb_m_imha
-- DROP CONSTRAINT FK_tb_m_imha_dam_num_tb_dam_da;
-- 테이블 생성 SQL - tb_d_hapcheon
CREATE TABLE tb_d_hapcheon
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_hapcheon.dinfo_seq
CREATE SEQUENCE tb_d_hapcheon_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_hapcheon.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_hapcheon_AI_TRG
BEFORE INSERT ON tb_d_hapcheon 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_hapcheon_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_hapcheon_AI_TRG; 

-- DROP SEQUENCE tb_d_hapcheon_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_hapcheon
COMMENT ON TABLE tb_d_hapcheon IS '합천댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.dinfo_seq
COMMENT ON COLUMN tb_d_hapcheon.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.dam_num
COMMENT ON COLUMN tb_d_hapcheon.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_date
COMMENT ON COLUMN tb_d_hapcheon.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_level
COMMENT ON COLUMN tb_d_hapcheon.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_vow
COMMENT ON COLUMN tb_d_hapcheon.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_vow_rate
COMMENT ON COLUMN tb_d_hapcheon.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_inflow
COMMENT ON COLUMN tb_d_hapcheon.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_hapcheon.d_ttl_outflow
COMMENT ON COLUMN tb_d_hapcheon.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_hapcheon(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_hapcheon
    ADD CONSTRAINT FK_tb_d_hapcheon_dam_num_tb_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_d_hapcheon(dam_num)
-- ALTER TABLE tb_d_hapcheon
-- DROP CONSTRAINT FK_tb_d_hapcheon_dam_num_tb_da;
-- 테이블 생성 SQL - tb_m_hapcheon
CREATE TABLE tb_m_hapcheon
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_hapcheon.minfo_seq
CREATE SEQUENCE tb_m_hapcheon_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_hapcheon.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_hapcheon_AI_TRG
BEFORE INSERT ON tb_m_hapcheon 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_hapcheon_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_hapcheon_AI_TRG; 

-- DROP SEQUENCE tb_m_hapcheon_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_hapcheon
COMMENT ON TABLE tb_m_hapcheon IS '합천댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.minfo_seq
COMMENT ON COLUMN tb_m_hapcheon.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.dam_num
COMMENT ON COLUMN tb_m_hapcheon.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_date
COMMENT ON COLUMN tb_m_hapcheon.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_level
COMMENT ON COLUMN tb_m_hapcheon.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_vow
COMMENT ON COLUMN tb_m_hapcheon.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_vow_rate
COMMENT ON COLUMN tb_m_hapcheon.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_inflow
COMMENT ON COLUMN tb_m_hapcheon.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_hapcheon.m_ttl_outflow
COMMENT ON COLUMN tb_m_hapcheon.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_hapcheon(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_hapcheon
    ADD CONSTRAINT FK_tb_m_hapcheon_dam_num_tb_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_hapcheon(dam_num)
-- ALTER TABLE tb_m_hapcheon
-- DROP CONSTRAINT FK_tb_m_hapcheon_dam_num_tb_da;

-- 테이블 생성 SQL - tb_d_seomjingang
CREATE TABLE tb_d_seomjingang
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_seomjingang.dinfo_seq
CREATE SEQUENCE tb_d_seomjingang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_seomjingang.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_seomjingang_AI_TRG
BEFORE INSERT ON tb_d_seomjingang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_seomjingang_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_seomjingang_AI_TRG; 

-- DROP SEQUENCE tb_d_seomjingang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_seomjingang
COMMENT ON TABLE tb_d_seomjingang IS '섬진강댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.dinfo_seq
COMMENT ON COLUMN tb_d_seomjingang.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.dam_num
COMMENT ON COLUMN tb_d_seomjingang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_date
COMMENT ON COLUMN tb_d_seomjingang.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_level
COMMENT ON COLUMN tb_d_seomjingang.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_vow
COMMENT ON COLUMN tb_d_seomjingang.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_vow_rate
COMMENT ON COLUMN tb_d_seomjingang.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_inflow
COMMENT ON COLUMN tb_d_seomjingang.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_seomjingang.d_ttl_outflow
COMMENT ON COLUMN tb_d_seomjingang.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_seomjingang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_seomjingang
    ADD CONSTRAINT FK_tb_d_seomjingang_dam_num_tb FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq);

-- Foreign Key 삭제 SQL - tb_d_seomjingang(dam_num)
-- ALTER TABLE tb_d_seomjingang
-- DROP CONSTRAINT FK_tb_d_seomjingang_dam_num_tb;

-- 테이블 생성 SQL - tb_m_seomjingang
CREATE TABLE tb_m_seomjingang
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_seomjingang.minfo_seq
CREATE SEQUENCE tb_m_seomjingang_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_seomjingang.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_seomjingang_AI_TRG
BEFORE INSERT ON tb_m_seomjingang 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_seomjingang_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_seomjingang_AI_TRG; 

-- DROP SEQUENCE tb_m_seomjingang_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_seomjingang
COMMENT ON TABLE tb_m_seomjingang IS '섬진강댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.minfo_seq
COMMENT ON COLUMN tb_m_seomjingang.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.dam_num
COMMENT ON COLUMN tb_m_seomjingang.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_date
COMMENT ON COLUMN tb_m_seomjingang.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_level
COMMENT ON COLUMN tb_m_seomjingang.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_vow
COMMENT ON COLUMN tb_m_seomjingang.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_vow_rate
COMMENT ON COLUMN tb_m_seomjingang.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_inflow
COMMENT ON COLUMN tb_m_seomjingang.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_seomjingang.m_ttl_outflow
COMMENT ON COLUMN tb_m_seomjingang.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_seomjingang(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_seomjingang
    ADD CONSTRAINT FK_tb_m_seomjingang_dam_num_tb FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_seomjingang(dam_num)
-- ALTER TABLE tb_m_seomjingang
-- DROP CONSTRAINT FK_tb_m_seomjingang_dam_num_tb;

-- 테이블 생성 SQL - tb_d_juam
CREATE TABLE tb_d_juam
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_juam.dinfo_seq
CREATE SEQUENCE tb_d_juam_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_juam.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_juam_AI_TRG
BEFORE INSERT ON tb_d_juam 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_juam_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_juam_AI_TRG; 

-- DROP SEQUENCE tb_d_juam_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_juam
COMMENT ON TABLE tb_d_juam IS '주암댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_juam.dinfo_seq
COMMENT ON COLUMN tb_d_juam.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_juam.dam_num
COMMENT ON COLUMN tb_d_juam.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_date
COMMENT ON COLUMN tb_d_juam.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_level
COMMENT ON COLUMN tb_d_juam.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_vow
COMMENT ON COLUMN tb_d_juam.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_vow_rate
COMMENT ON COLUMN tb_d_juam.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_inflow
COMMENT ON COLUMN tb_d_juam.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_juam.d_ttl_outflow
COMMENT ON COLUMN tb_d_juam.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_juam(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_juam
    ADD CONSTRAINT FK_tb_d_juam_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_d_juam(dam_num)
-- ALTER TABLE tb_d_juam
-- DROP CONSTRAINT FK_tb_d_juam_dam_num_tb_dam_da;
-- 테이블 생성 SQL - tb_m_juam
CREATE TABLE tb_m_juam
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_juam.minfo_seq
CREATE SEQUENCE tb_m_juam_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_juam.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_juam_AI_TRG
BEFORE INSERT ON tb_m_juam 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_juam_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_juam_AI_TRG; 

-- DROP SEQUENCE tb_m_juam_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_juam
COMMENT ON TABLE tb_m_juam IS '주암댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_juam.minfo_seq
COMMENT ON COLUMN tb_m_juam.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_juam.dam_num
COMMENT ON COLUMN tb_m_juam.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_date
COMMENT ON COLUMN tb_m_juam.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_level
COMMENT ON COLUMN tb_m_juam.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_vow
COMMENT ON COLUMN tb_m_juam.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_vow_rate
COMMENT ON COLUMN tb_m_juam.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_inflow
COMMENT ON COLUMN tb_m_juam.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_juam.m_ttl_outflow
COMMENT ON COLUMN tb_m_juam.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_juam(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_juam
    ADD CONSTRAINT FK_tb_m_juam_dam_num_tb_dam_da FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_juam(dam_num)
-- ALTER TABLE tb_m_juam
-- DROP CONSTRAINT FK_tb_m_juam_dam_num_tb_dam_da;
-- 테이블 생성 SQL - tb_d_jangheung
CREATE TABLE tb_d_jangheung
(
    dinfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    d_date           DATE             NOT NULL, 
    d_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    d_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (dinfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_d_jangheung.dinfo_seq
CREATE SEQUENCE tb_d_jangheung_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_d_jangheung.dinfo_seq
CREATE OR REPLACE TRIGGER tb_d_jangheung_AI_TRG
BEFORE INSERT ON tb_d_jangheung 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_d_jangheung_SEQ.NEXTVAL
    INTO :NEW.dinfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_d_jangheung_AI_TRG; 

-- DROP SEQUENCE tb_d_jangheung_SEQ; 

-- 테이블 Comment 설정 SQL - tb_d_jangheung
COMMENT ON TABLE tb_d_jangheung IS '장흥댐 일일정보';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.dinfo_seq
COMMENT ON COLUMN tb_d_jangheung.dinfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.dam_num
COMMENT ON COLUMN tb_d_jangheung.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_date
COMMENT ON COLUMN tb_d_jangheung.d_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_level
COMMENT ON COLUMN tb_d_jangheung.d_level IS '저수위. 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_vow
COMMENT ON COLUMN tb_d_jangheung.d_vow IS '저수량. 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_vow_rate
COMMENT ON COLUMN tb_d_jangheung.d_vow_rate IS '저수율. 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_inflow
COMMENT ON COLUMN tb_d_jangheung.d_inflow IS '유입량. 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_d_jangheung.d_ttl_outflow
COMMENT ON COLUMN tb_d_jangheung.d_ttl_outflow IS '총방류량. 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_d_jangheung(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_d_jangheung
    ADD CONSTRAINT FK_tb_d_jangheung_dam_num_tb_d FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq)  ;

-- Foreign Key 삭제 SQL - tb_d_jangheung(dam_num)
-- ALTER TABLE tb_d_jangheung
-- DROP CONSTRAINT FK_tb_d_jangheung_dam_num_tb_d;

-- 테이블 생성 SQL - tb_m_jangheung
CREATE TABLE tb_m_jangheung
(
    minfo_seq        NUMBER(18, 0)    NOT NULL, 
    dam_num          NUMBER(18, 0)    NOT NULL, 
    m_date           DATE             NOT NULL, 
    m_level          NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow            NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_vow_rate       NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_inflow         NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
    m_ttl_outflow    NUMBER(6,2)      DEFAULT 0.00 NOT NULL, 
     PRIMARY KEY (minfo_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_m_jangheung.minfo_seq
CREATE SEQUENCE tb_m_jangheung_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_m_jangheung.minfo_seq
CREATE OR REPLACE TRIGGER tb_m_jangheung_AI_TRG
BEFORE INSERT ON tb_m_jangheung 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_m_jangheung_SEQ.NEXTVAL
    INTO :NEW.minfo_seq
    FROM DUAL;
END;

-- DROP TRIGGER tb_m_jangheung_AI_TRG; 

-- DROP SEQUENCE tb_m_jangheung_SEQ; 

-- 테이블 Comment 설정 SQL - tb_m_jangheung
COMMENT ON TABLE tb_m_jangheung IS '장흥댐 월별정보';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.minfo_seq
COMMENT ON COLUMN tb_m_jangheung.minfo_seq IS '일일정보 순번';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.dam_num
COMMENT ON COLUMN tb_m_jangheung.dam_num IS '댐 번호. 댐 번호';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_date
COMMENT ON COLUMN tb_m_jangheung.m_date IS '날짜. 날짜';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_level
COMMENT ON COLUMN tb_m_jangheung.m_level IS '저수위. 월평균 저수위(EL.m)';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_vow
COMMENT ON COLUMN tb_m_jangheung.m_vow IS '저수량. 월평균 저수량(백만㎥) vow: Volume Of Water, 저수량';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_vow_rate
COMMENT ON COLUMN tb_m_jangheung.m_vow_rate IS '저수율. 월평균 저수율(%)';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_inflow
COMMENT ON COLUMN tb_m_jangheung.m_inflow IS '유입량. 월평균 유입량(㎥/s)';

-- 컬럼 Comment 설정 SQL - tb_m_jangheung.m_ttl_outflow
COMMENT ON COLUMN tb_m_jangheung.m_ttl_outflow IS '총방류량. 월평균 총방류량(㎥/s)';

-- Foreign Key 설정 SQL - tb_m_jangheung(dam_num) -> tb_dam(dam_seq)
ALTER TABLE tb_m_jangheung
    ADD CONSTRAINT FK_tb_m_jangheung_dam_num_tb_d FOREIGN KEY (dam_num)
        REFERENCES tb_dam (dam_seq) ;

-- Foreign Key 삭제 SQL - tb_m_jangheung(dam_num)
-- ALTER TABLE tb_m_jangheung
-- DROP CONSTRAINT FK_tb_m_jangheung_dam_num_tb_d;