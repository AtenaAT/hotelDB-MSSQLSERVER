create database HOTEL
use HOTEL
-- tables
------------------------------------------------------------------
---guestinfo tbl
------------------

CREATE TABLE guestInfo(
	guestID int IDENTITY(1,1) NOT NULL,
	guestFirstName varchar(40) NOT NULL,
	guestLastName varchar(40) NOT NULL,
	guestNationalCode char(10) NOT NULL,
	guestPassNO varchar(50) NULL,
	guestNumber int NOT NULL,
	guestEmail varchar(50) NOT NULL,
	guestCity varchar(50) NOT NULL,
	guestCountry varchar(50) NOT NULL,
	guestAddressLine1 varchar(50) NOT NULL,
	guestAddressLine2 varchar(50) SPARSE  NULL,

	 CONSTRAINT PK_guestInfo PRIMARY KEY CLUSTERED 
	(guestID ASC)
	)

------------------------------------------------------------------
---payment tbl
------------------

CREATE TABLE payment(
	[Row] int IDENTITY(1,1) NOT NULL,
	guestID int NOT NULL,
	reservationID int NOT NULL,
	price decimal(10, 2) NOT NULL,
	GID uniqueidentifier ROWGUIDCOL  NOT NULL,
	CONSTRAINT [PK_payment] PRIMARY KEY CLUSTERED 
	(reservationID ASC)
)

------------------------------------------------------------------
---reservationInfo tbl
------------------

CREATE TABLE reservationInfo(
	reservationID int IDENTITY(1,1) NOT NULL,
	roomName int NOT NULL,
	guestID int NOT NULL,
	Arrival date NOT NULL,
	Departure date NOT NULL,
	reservationDate date NOT NULL,
	Duration  AS (datediff(day,[Arrival],[Departure])+(1)) PERSISTED,
	CONSTRAINT PK_reservationInfo PRIMARY KEY CLUSTERED 
	(reservationID ASC)
)

------------------------------------------------------------------
---room tbl
------------------

CREATE TABLE room(
	roomName int NOT NULL,
	roomTypeID int NOT NULL,
	smoke bit NOT NULL,
	roomDescription varchar(50) SPARSE  NULL,
	roomStatus varchar(10) NOT NULL,
	 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
	(roomName ASC)
)

------------------------------------------------------------------
---roomType tbl
------------------

CREATE TABLE roomType(
	roomTypeID int IDENTITY(1,1) NOT NULL,
	roomtypeName varchar(20) NOT NULL,
	Maxcapacity int NOT NULL,
	CONSTRAINT PK_roomType PRIMARY KEY CLUSTERED 
	(roomTypeID ASC)
) 
