select 
ASSET.ID as 'Asset Unique ID',
ASSET.ASSET_TYPE_ID as 'Asset Type ID',
ASSET.NAME as 'Asset Name',
ASSET.ASSET_DATA_ID as 'Asset Data ID',
ASSET.OWNER_ID as 'Asset Owner ID', #Contracts do not get an owner
ASSET.LOCATION_ID as 'Asset Location ID',
ASSET.MODIFIED as 'Date Asset Modified',
ASSET.CREATED as 'Date Asset Created',
ASSET.MAPPED_ID as 'Mapped Computer ID',
ASSET.ASSET_CLASS_ID as 'Asset Class ID',
ASSET.ARCHIVE as 'Asset Archived',
ASSET.ARCHIVE_DATE as 'Archive Date',
ASSET.ARCHIVE_REASON as 'Archive Reason',
ASSET.ASSET_STATUS_ID as 'Asset Stats ID',
ASSET_DATA_10000.ID as 'Contract Unique ID',
ASSET_DATA_10000.FIELD_9979 as 'Contract Start Date',
ASSET_DATA_10000.FIELD_9980 as 'Contract End Date',
ASSET_DATA_10000.FIELD_9981 as 'Purchase Order Date',
ASSET_DATA_10000.FIELD_9977 as 'Publisher ID',
ASSET_DATA_10000.FIELD_9978,
ASSET_DATA_10000.FIELD_9982,
ASSET_DATA_10000.FIELD_9983,
ASSET_DATA_10000.FIELD_9984 as 'Contract Anniversary',
ASSET_DATA_10000.FIELD_9985 as 'Contract Number',
ASSET_DATA_10000.FIELD_9986 as 'Contract Description',
ASSET_DATA_10000.FIELD_9987 as 'Vendor Agreement Number',
ASSET_DATA_10000.FIELD_9988 as 'Purchase Order Number',
ASSET_DATA_10000.FIELD_9989 as 'Contact Name',
ASSET_DATA_10000.FIELD_9990 as 'Contact Email',
ASSET_DATA_10000.FIELD_9991 as 'Contact Phone',
ASSET_DATA_10000.FIELD_9992 as 'Notes'
from 
ASSET
join ASSET_DATA_10000 on ASSET_DATA_10000.ID = ASSET.ASSET_DATA_ID
join ASSET_TYPE on ASSET_TYPE.ID = ASSET.ASSET_TYPE_ID where ASSET_TYPE.ID = 10000
