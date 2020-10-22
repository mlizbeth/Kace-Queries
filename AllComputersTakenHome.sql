SELECT DISTINCT
  DATE_FORMAT(LAST_INVENTORY, '%m/%d/%Y') as LAST_INVENTORY,
  BIOS_SERIAL_NUMBER AS SERIAL_NUMBER,
  OS_NAME AS OPERATING_SYSTEM,
  MACHINE.NAME AS COMPUTER_NAME,
  MACHINE.IP AS IP_ADDRESS,
  CS_MODEL AS COMPUTER_MODEL,
  ASSET_DATA_5.FIELD_30 AS CLASSIFICATION,
  ASSET_OWNER.EMAIL AS EMAIL,
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
  LEFT JOIN USER USER_21 ON USER_21.ID = ASSET_DATA_5.FIELD_21 
  LEFT JOIN USER ASSET_OWNER ON ASSET_OWNER.ID = ASSET.OWNER_ID   
WHERE
  ASSET.MAPPED_ID != 0
  and ASSET.ASSET_STATUS_ID != 494
  AND ASSET.ARCHIVE NOT LIKE '%COMPLETED%'
  AND ASSET.ARCHIVE NOT LIKE '%PENDING%'
  and LAST_INVENTORY BETWEEN '2020-03-13' AND NOW()
  AND ((MACHINE.CHASSIS_TYPE LIKE 'Desktop') OR (MACHINE.CHASSIS_TYPE LIKE 'All In One'))
  AND (((MACHINE.IP LIKE '%131.194.14%') OR (MACHINE.IP LIKE '%131.194.15%') 
  OR (MACHINE.IP NOT LIKE '%131.194%')))
ORDER BY
  LAST_INVENTORY DESC;