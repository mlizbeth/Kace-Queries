select DATE(DATE_ADD(MAKEDATE(YEAR(CREATED), 1), INTERVAL WEEK(CREATED) WEEK) -2) as 'Week', COUNT(HD_TICKET.CREATED) as 'Tickets Created'
from HD_TICKET
Where HD_TICKET.CREATED between '2020-01-01' AND '2020-12-31'
GROUP BY week(HD_TICKET.CREATED)