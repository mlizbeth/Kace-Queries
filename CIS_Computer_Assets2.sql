select
ASSET.NAME as 'Asset Name',
USER.USER_NAME as 'Username',
ASSET_DATA_5.FIELD_10011 as 'Assignment Type',
ASSET_DATA_5.FIELD_10031 as 'Date Assigned',
case 
when ASSET.MAPPED_ID = 0 then 'Not In New Kace'
else ASSET.MAPPED_ID
end as 'Mapped ID'
from ASSET
join USER on USER.ID = ASSET.OWNER_ID
join ASSET_DATA_5 ON ASSET_DATA_5.ID = ASSET.ASSET_DATA_ID
where
(USER.USER_NAME like 'gerno' or USER.USER_NAME like 'jpack' or USER.USER_NAME like 'gbotello'
or USER.USER_NAME like 'jhatch' or USER.USER_NAME like 'dcooper' or USER.USER_NAME like 'gguzman'
or USER.USER_NAME like 'ksamp' or USER.USER_NAME like 'eestrad1' or USER.USER_NAME like 'greinard')