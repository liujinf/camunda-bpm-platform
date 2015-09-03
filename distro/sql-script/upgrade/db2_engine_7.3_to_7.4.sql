-- metrics --

ALTER TABLE ACT_RU_METER_LOG 
  ADD REPORTER_ varchar(255);

-- job prioritization --
  
ALTER TABLE ACT_RU_JOB
  ADD PRIORITY_ bigint not null
  DEFAULT 0;

ALTER TABLE ACT_RU_JOBDEF
  ADD JOB_PRIORITY_ bigint;

ALTER TABLE ACT_HI_JOB_LOG
  ADD JOB_PRIORITY_ bigint not null
  DEFAULT 0;

-- create decision definition table --
create table ACT_RE_DECISION_DEF (
    ID_ varchar(64) not null,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) not null,
    VERSION_ integer not null,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    primary key (ID_)
);

-- create unique constraint on ACT_RE_DECISION_DEF --
alter table ACT_RE_DECISION_DEF
    add constraint ACT_UNIQ_DECISION_DEF
    unique (KEY_,VERSION_);
    
-- case execution repetition rule --

ALTER TABLE ACT_RU_CASE_EXECUTION
  ADD REPEATABLE_ smallint check(REPEATABLE_ in (1,0));

ALTER TABLE ACT_RU_CASE_EXECUTION
  ADD REPETITION_ smallint check(REPETITION_ in (1,0));

-- historic case activity instance repetition rule --

ALTER TABLE ACT_HI_CASEACTINST
  ADD REPEATABLE_ smallint check(REPEATABLE_ in (1,0));

ALTER TABLE ACT_HI_CASEACTINST
  ADD REPETITION_ smallint check(REPETITION_ in (1,0));

-- case sentry part source --

ALTER TABLE ACT_RU_CASE_SENTRY_PART
  ADD SOURCE_ varchar(255);
