# hotelDB-MSSQLSERVER
sample database for hotel management


consist of five tables:
 1. guest Info
 2. payment
 3. reservation Info
 4. room
 5. room Type

as you see, every table has its own field

![pic](https://user-images.githubusercontent.com/91009525/177598869-e2a1add9-4eed-4d97-b5d9-04b21183cdb9.png)


relations:
- one to many


roomType / room


guestInfo / payment


room / reservationInfo


guestInfo / reservationInfo




- many to many
bridge table :reservationInfo


room-reservationInfo-guestInfo







for inserting data, I used "https://www.mockaroo.com/" in "data.sql"










also I added about 14 queries in "hotelQQ.sql"
