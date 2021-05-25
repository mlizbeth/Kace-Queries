select 
ASSET_HISTORY.NAME,
ASSET_HISTORY.CHANGE_TYPE,
ASSET_HISTORY.FIELD_NAME,
ASSET.NAME as 'Serial Number'
from
ASSET_HISTORY
join ASSET on ASSET.ID = ASSET_HISTORY.ASSET_ID
where
ASSET.NAME = '' #Device Serial #
and
((ASSET_HISTORY.FIELD_NAME like '%Name%') or (ASSET_HISTORY.FIELD_NAME like '%Archive%'))