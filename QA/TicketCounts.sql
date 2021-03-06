select
HD_TICKET.ID as 'Ticket Number',
OWNER.FULL_NAME as 'Ticket Owner',
SUBMITTER.FULL_NAME as 'Ticket Submitter',
HD_TICKET.TITLE,
HD_TICKET.CREATED as 'Date Created',
HD_STATUS.NAME as 'Ticket State'
from HD_TICKET
join USER OWNER ON OWNER.ID = HD_TICKET.OWNER_ID
join USER SUBMITTER ON SUBMITTER.ID = HD_TICKET.SUBMITTER_ID
join HD_STATUS on HD_STATUS.ID = HD_TICKET.HD_STATUS_ID
where 
((HD_TICKET.CREATED <= '2021-06-22 23:59:59') and (HD_TICKET.CREATED >= '2021-06-22 00:00:00'))