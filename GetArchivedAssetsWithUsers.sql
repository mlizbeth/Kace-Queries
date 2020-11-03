SELECT DISTINCT
AD5.FIELD_41 AS ASSET_STATUS,
ASSET.NAME AS SERIAL_NUMBER,
ARCHIVE_ASSET_DEVICE.NAME AS COMPUTER_NAME,
USER.USER_NAME AS ASSIGNED_TO,
USER.EMAIL AS EMAIL_ADDRESS,
ASSET_DATA_VIEW_Location.NAME AS LOCATION,
ASSET_DATA_VIEW_Department.NAME AS DEPT,
AD5.FIELD_39 AS ROOM,
AD5.FIELD_22 AS ASSIGNMENT_TYPE,
AD5.FIELD_31 AS FUNDS_USED,
AD5.FIELD_27 AS DATE_PURCHASED,
AD5.FIELD_34 AS REPLACEMENT_DATE,
AD5.FIELD_26 AS DATE_ASSIGNED,
AD5.FIELD_30 AS CLASSIFICATION,
AD5.FIELD_42 AS STOCK_TYPE,
AD5.FIELD_33 AS PO_NUMBER
FROM 
ARCHIVE_ASSET_DEVICE
JOIN ASSET ON ASSET.ID = ARCHIVE_ASSET_DEVICE.ID
JOIN ASSET_DATA_5 AD5 ON AD5.ID = ASSET.ASSET_DATA_ID
JOIN ASSET_DATA_VIEW_Location ON ASSET_DATA_VIEW_Location.ASSET_ID = ASSET.LOCATION_ID
JOIN ASSET_ASSOCIATION_VIEW AAV ON AAV.ASSET_ID = ASSET.ID
JOIN ASSET_DATA_VIEW_Department ON ASSET_DATA_VIEW_Department.ASSET_ID = AAV.ASSOCIATED_ASSET_ID
JOIN USER ON USER.ID = ASSET.OWNER_ID
WHERE
(((ARCHIVE_ASSET_DEVICE.NAME NOT LIKE 'AR-%') AND (ARCHIVE_ASSET_DEVICE.NAME NOT LIKE '%TEST%'))
AND
((AD5.FIELD_41 NOT LIKE 'Disposed') AND (AD5.FIELD_41 NOT LIKE 'Sold')))