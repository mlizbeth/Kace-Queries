CREATE TABLE mad_ASSETMAP(
ID INT,
Status VARCHAR(255)
)

INSERT INTO mad_ASSETMAP(ID, Status)
SELECT 0, 'N/A'
UNION
SELECT 492, 'EXPIRED'
UNION 
SELECT 493, 'ACTIVE'
UNION
SELECT 494, 'DISPOSED'
UNION
SELECT 495, 'IN STOCK'
UNION
SELECT 496, 'MISSING'
UNION
SELECT 497, 'RESERVED'
UNION
SELECT 498, 'REPAIRED'
UNION 
SELECT 499, 'STOLEN'
UNION 
SELECT 500, 'RETIRED'

SELECT DISTINCT
  MACHINE.NAME AS COMPUTER_NAME,
  BIOS_SERIAL_NUMBER AS SERIAL_NUMBER,
  OS_NAME AS OPERATING_SYSTEM,
  CS_MODEL AS COMPUTER_MODEL,
  ASSET_DATA_5.FIELD_34 AS REPLACEMENT_DATE,
  ASSET_DATA_5.FIELD_30 AS CLASSIFICATION,
  ASSET_DATA_5.FIELD_41 AS COMPUTER_STATUS,
  ASSET_DATA_5.FIELD_42 AS STOCK_TYPE,
MAD_ASS.Status AS "ASSET_STATUS"
FROM
  MACHINE
  JOIN ASSET ON ASSET.MAPPED_ID = MACHINE.ID
  JOIN ASSET_DATA_5 on ASSET_DATA_5.FIELD_19 = MACHINE.BIOS_SERIAL_NUMBER
JOIN mad_ASSETMAP MAD_ASS ON MAD_ASS.ID = ASSET.ASSET_STATUS_ID
WHERE
  (((ASSET.ASSET_STATUS_ID = 0 OR ASSET.ASSET_STATUS_ID = 495 OR ASSET.ASSET_STATUS_ID = 493)
  AND
 (ASSET_DATA_5.FIELD_41 LIKE '%Use%' OR ASSET_DATA_5.FIELD_41 LIKE '%Stock%'))
 AND
 (ASSET_DATA_5.FIELD_41 NOT LIKE '%Use%' AND ASSET.ASSET_STATUS_ID != 493))
ORDER BY
  COMPUTER_NAME ASC;