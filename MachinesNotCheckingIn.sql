#Grab all Asset Records that have devices in inventory
#Where the devices are not listed as disposed
#Where Archive is not completed or pending
#Where checkin hasn't occurred for 3+ months
SELECT
  DATE_FORMAT(LAST_INVENTORY, '%m/%d/%Y') as LAST_INVENTORY,
  BIOS_SERIAL_NUMBER AS SERIAL_NUMBER,
  OS_NAME AS OPERATING_SYSTEM,
  MACHINE.NAME AS COMPUTER_NAME,
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
WHERE
  ASSET.MAPPED_ID != 0
  and ASSET.ASSET_STATUS_ID != 494
  AND ASSET.ARCHIVE NOT LIKE '%COMPLETED%'
  AND ASSET.ARCHIVE NOT LIKE '%PENDING%'
  and LAST_INVENTORY NOT BETWEEN NOW() - INTERVAL 30 DAY
  AND NOW()
ORDER BY
  LAST_INVENTORY DESC;
