select 
HD_TICKET.ID as 'Ticket Number',
USER.USER_NAME as 'Ticket Owner',
U.USER_NAME as 'Ticket Submitter',
HD_TICKET.SUMMARY as 'Ticket Summary',
HD_TICKET.CREATED as 'Date Created',
HD_TICKET.TIME_CLOSED as 'Date Closed'
from HD_TICKET 
join USER on USER.ID = HD_TICKET.OWNER_ID
join USER U on U.ID = HD_TICKET.SUBMITTER_ID
where HD_TICKET.TIME_CLOSED = '0000-00-00'
and
(USER.USER_NAME like 'eergun' or USER.USER_NAME like 'lmatthew' or USER.USER_NAME like 'dcollier' or USER.USER_NAME like 'manders5' or USER.USER_NAME like 'okaltenb' or USER.USER_NAME like 'cryder')
order by USER.USER_NAME desc;
