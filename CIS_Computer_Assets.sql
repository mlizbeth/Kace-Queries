select distinct
ASSET.NAME as 'Asset Name',
USER.USER_NAME as 'Username',
ASSET_DATA_5.FIELD_26 as 'Date Assigned',
ASSET_DATA_5.FIELD_34 as 'Replacement Date',
ASSET_DATA_5.FIELD_22 as 'Assignment Type',
ASSET_DATA_5.FIELD_25 as 'Hardware Notes',
ASSET_DATA_5.FIELD_41 as 'Asset Status',
ASSET.MAPPED_ID as 'Machine ID (If Mapped)'
from ASSET
join USER on USER.ID = ASSET.OWNER_ID
join ASSET_DATA_5 on ASSET_DATA_5.ID = ASSET.ASSET_DATA_ID
where
(USER.USER_NAME like 'gerno' or USER.USER_NAME like 'jpack' or USER.USER_NAME like 'gbotello'
or USER.USER_NAME like 'jhatch' or USER.USER_NAME like 'dcooper' or USER.USER_NAME like 'gguzman'
or USER.USER_NAME like 'ksamp' or USER.USER_NAME like 'eestrad1' or USER.USER_NAME like 'greinard')