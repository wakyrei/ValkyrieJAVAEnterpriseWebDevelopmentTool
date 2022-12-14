# ------------------------------------------------两种语句效果一样------------------------------------------

# sql1
SELECT OFFLINE_PAY_INFO,
    (@rowNum := @rowNum + 1) AS rowNo
FROM ewallet_transaction,
        (SELECT (@rowNum := 0)) t
WHERE OFFLINE_PAY_INFO IS NOT NULL AND OFFLINE_PAY_INFO != "";

# sql2
SET @rowNum := 0;
SELECT OFFLINE_PAY_INFO,
    (@rowNum := @rowNum + 1) AS rowNo
FROM ewallet_transaction
WHERE OFFLINE_PAY_INFO IS NOT NULL AND OFFLINE_PAY_INFO != "";