SELECT DISTINCT
  DATE_FORMAT(LAST_INVENTORY, '%m/%d/%Y') as LAST_INVENTORY,
  BIOS_SERIAL_NUMBER AS SERIAL_NUMBER,
  OS_NAME AS OPERATING_SYSTEM,
  MACHINE.NAME AS COMPUTER_NAME,
  ASSET_DATA_5.FIELD_34 AS REPLACEMENT_DATE,
  CASE
    WHEN ASSET.ASSET_STATUS_ID = 0 THEN "N/A"
    WHEN ASSET.ASSET_STATUS_ID = 492 THEN "EXPIRED"
    WHEN ASSET.ASSET_STATUS_ID = 493 THEN "ACTIVE"
    WHEN ASSET.ASSET_STATUS_ID = 494 THEN "DISPOSED"
    WHEN ASSET.ASSET_STATUS_ID = 495 THEN "IN STOCK"
    WHEN ASSET.ASSET_STATUS_ID = 496 THEN "MISSING"
    WHEN ASSET.ASSET_STATUS_ID = 497 THEN "RESERVED"
    WHEN ASSET.ASSET_STATUS_ID = 498 THEN "REPAIRED"
    WHEN ASSET.ASSET_STATUS_ID = 499 THEN "STOLEN"
    WHEN ASSET.ASSET_STATUS_ID = 500 THEN "RETIRED"
  END AS "ASSET_STATUS"
FROM
  MACHINE
  JOIN ASSET ON ASSET.MAPPED_ID = MACHINE.ID
  JOIN ASSET_DATA_5 on ASSET_DATA_5.FIELD_19 = MACHINE.BIOS_SERIAL_NUMBER
WHERE
  ASSET.MAPPED_ID != 0
  and ASSET.ASSET_STATUS_ID != 494
  AND ASSET.ARCHIVE NOT LIKE '%COMPLETED%'
  AND ASSET.ARCHIVE NOT LIKE '%PENDING%'
  AND ASSET_DATA_5.FIELD_41 != 'Disposed'
  AND ASSET_DATA_5.FIELD_22 = 'Primary'
  AND MACHINE.NAME LIKE 'ITS-%'
  and ASSET_DATA_5.FIELD_34 < '2020-05-31'
  AND MACHINE.NAME NOT LIKE '%LOANER%'
  AND MACHINE.NAME NOT LIKE '%LOAN%'
  AND MACHINE.NAME NOT LIKE '%LNR%'
  AND MACHINE.NAME NOT LIKE '%OPER%'
  AND MACHINE.NAME NOT LIKE '%CONTRACTOR%'
  AND MACHINE.NAME NOT LIKE '%TEST%'
ORDER BY
  LAST_INVENTORY DESC;
