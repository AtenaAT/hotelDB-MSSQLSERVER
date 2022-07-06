------- etelaate room hayi k empty hastan------------------
select *
from [dbo].[room] 
where [roomStatus]='empty'
---------------------
select top 20 *
from [dbo].[guestInfo]
---------------------------------------------------------------------- 
-------- guest hayi k bishtar az yek hafte eghamat dashtand-------------

select guestInfo.guestFirstName, guestInfo.guestLastName, reservationInfo.Duration
from [dbo].[guestInfo]
inner join [dbo].[reservationInfo]
on guestInfo.guestID = reservationInfo.guestID  
where Duration > 7

-------------------------------------------------------------------------------
--------------------------------
---------  esm guest ha + price + b tartibe desc---------------------------------

select guestInfo.guestFirstName, guestInfo.guestLastName  ,payment.price
from [dbo].[payment]
left join [dbo].[guestInfo]
on payment.guestID = guestInfo.guestID
group by guestInfo.guestFirstName ,guestInfo.guestLastName ,payment.price 
order by payment.price desc
------------------------------------------------------------------------------------------
----------------------------------- subQuery --- esm afradi k bishtarin price o dadan------------------ 
select guestInfo.guestFirstName ,[guestLastName] , (select max(price)
from [dbo].[payment]) as bishtarin_price
from [dbo].[guestInfo]

--------------------------------------------------------------------------------------
--------------------------------
------------- majmooe gheymate otagh ya b tafkike room type-----------------------

select [roomtypeName], (select sum(price)
from [dbo].[payment])  as sum_Price
from [dbo].[roomType]

-----------------------------------------------------------------------------------
----------------------------

----------------------------- guest hayi k az keshvar chin hastan--------like----------------
select [guestFirstName],[guestLastName],[guestCountry]
from [dbo].[guestInfo]
where [guestCountry] like '%China%'
--------------------------
--------------right join / having----- sum price haye guest ha k kamtar az 50 bude-----------

select [guestFirstName],[guestLastName],[price],sum(price) as sum_price
from [dbo].[guestInfo]
right join [dbo].[payment]
on guestInfo.guestID = payment.guestID
group by [guestFirstName], [guestLastName] ,[price]
having sum(price) < 15;
--------------------------------------
-------------------------------------
------------top------- 10 ta guest avali k tu turkey nabashan ba order by asc first name-----------
select top 10 [guestFirstName], [guestLastName], [guestCountry]
from [dbo].[guestInfo]
where guestCountry !=  'Turkey'
order by [guestFirstName] asc

------------------------------------------------------------------
--------------------  union---- room status/room type
select [roomStatus]
from [dbo].[room]
union
select [roomtypeName]
from [dbo].[roomType]
---------------------------------------------------------
--------------------case expression--------------
------------------
select [guestFirstName],[guestCountry], 'result'=case
when [guestCountry] = 'ir' then 'guestdakheli'
else  'guestkhareji'
end
from [dbo].[guestInfo]

--------------------------------------------------
----------- distinct
select distinct [guestCountry],[guestFirstName], [guestLastName]
from [dbo].[guestInfo]
order by [guestCountry] 
--------------------------------------------------------
------------between----
select [roomName]
from [dbo].[room]
where [roomName] between 100 and 200
-------------------------------
-----------------------avg--------------------------------
select [price],[guestID], avg(price) as avg_price
from [dbo].[payment]
group by [price],[guestID]
having avg(price) >= 12
----------------------------------------------------
--------full join
select [guestFirstName],[roomName]
from [dbo].[guestInfo]
full join [dbo].[reservationInfo]
on guestInfo.guestID = reservationInfo.guestID
--------------------------------------------------------

