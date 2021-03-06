select
HD_TICKET.SUMMARY as 'Summary',
HD_PRIORITY.NAME as 'Priority',
HD_TICKET.HD_IMPACT_ID as 'Impact',
HD_TICKET.CREATED as 'Date Created',
U1.USER_NAME as 'Owner',
USER.USER_NAME as 'Submitter',
HD_STATUS.NAME as 'Status',
HD_QUEUE.NAME as 'Queue'
from
HD_TICKET
join USER U1 on U1.ID = HD_TICKET.OWNER_ID
join USER on USER.ID = HD_TICKET.SUBMITTER_ID
join HD_QUEUE on HD_QUEUE.ID = HD_TICKET.HD_QUEUE_ID
join HD_STATUS on HD_STATUS.ID = HD_TICKET.HD_STATUS_ID
join HD_PRIORITY on HD_PRIORITY.ID = HD_TICKET.HD_PRIORITY_ID
where
HD_TICKET.CREATED >= '2020-01-01 00:00:00' and HD_TICKET.CREATED <= '2020-12-31 23:59:59'
and
HD_TICKET.TIME_CLOSED = '0000-00-00 00:00:00'