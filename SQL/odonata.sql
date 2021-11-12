CREATE TABLE "USER" (
	"User_code"	NUMBER		NOT NULL,
	"User_name"	VARCHAR2(30)		NOT NULL,
	"User_pwd"	VARCHAR2(30)		NOT NULL,
	"User_email"	VARCHAR2(100)		NOT NULL,
	"User_phone"	VARCHAR2(10)		NOT NULL,
	"User_birth"	VARCHAR2(30)		NOT NULL,
	"User_id"	VARCHAR2(30)		NOT NULL,
	"User_type"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "USER"."User_type" IS 'Admin/User/Host';

CREATE TABLE "Reserv" (
	"V_code"	NUMBER		NOT NULL,
	"V_status"	CHAR(1)		NOT NULL,
	"check_in"	DATE		NOT NULL,
	"check_out"	DATE		NOT NULL,
	"personnel"	NUMBER		NOT NULL,
	"Rooms_Code"	NUMBER		NOT NULL,
	"User_code"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Reserv"."V_status" IS 'Y or N';

COMMENT ON COLUMN "Reserv"."personnel" IS 'Min. 1';

CREATE TABLE "Review" (
	"R_code"	NUMBER		NOT NULL,
	"R_content"	NVARCHAR2(200)		NOT NULL,
	"R_update"	DATE		NOT NULL,
	"R_modfiy"	DATE		NOT NULL,
	"User_code"	NUMBER		NOT NULL,
	"Rooms_Code"	NUMBER		NOT NULL
);

CREATE TABLE "Payment" (
	"P_code"	NUMBER		NOT NULL,
	"P_status"	CHAR(1)		NOT NULL,
	"P_method"	VARCHAR2(50)		NOT NULL,
	"P_total"	NUMBER		NOT NULL,
	"V_code"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Payment"."P_status" IS 'Y or N';

COMMENT ON COLUMN "Payment"."P_total" IS '원';

CREATE TABLE "MSG" (
	"Message_code"	NUMBER		NOT NULL,
	"Message_title"	VARCHAR2(20)		NOT NULL,
	"sendTime"	Date		NOT NULL,
	"readTime"	Date		NOT NULL,
	"msgtext"	VARCHAR2(300)		NULL,
	"send_id"	VARCHAR2(30)		NOT NULL,
	"receive_id"	VARCHAR2(30)		NOT NULL
);

CREATE TABLE "SookSoIMG" (
	"image_number"	NUMBER		NOT NULL,
	"image_name"	VARCHAR2(50)		NOT NULL,
	"image_path"	VARCHAR2(50)		NOT NULL,
	"ssum"	CHAR(1)		NOT NULL,
	"Rooms_Code"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SookSoIMG"."ssum" IS 'Y or N';

CREATE TABLE "Rooms" (
	"Rooms_Code"	NUMBER		NOT NULL,
	"Rooms_Addr"	VARCHAR2(100)		NOT NULL,
	"Rooms_Type"	VARCHAR2(20)		NOT NULL,
	"Rooms_Personnel"	NUMBER		NOT NULL,
	"Rooms_Host"	VARCHAR2(300)		NOT NULL,
	"Rooms_Desc"	VARCHAR2(500)		NOT NULL,
	"Rooms_Price"	NUMBER		NOT NULL,
	"Rooms_RegDate"	DATE		NOT NULL,
	"Rooms_RoomCnt"	NUMBER		NOT NULL,
	"Rooms_ToiletCnt"	NUMBER		NOT NULL,
	"Rooms_DogAvail"	CHAR(1)		NOT NULL,
	"User_code"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "Rooms"."Rooms_Personnel" IS 'Min. 1';

COMMENT ON COLUMN "Rooms"."Rooms_Price" IS '원';

COMMENT ON COLUMN "Rooms"."Rooms_RoomCnt" IS 'Min. 1';

COMMENT ON COLUMN "Rooms"."Rooms_ToiletCnt" IS 'Min. 0';

COMMENT ON COLUMN "Rooms"."Rooms_DogAvail" IS 'Y or N';

ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"User_code"
);

ALTER TABLE "Reserv" ADD CONSTRAINT "PK_RESERV" PRIMARY KEY (
	"V_code"
);

ALTER TABLE "Review" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"R_code"
);

ALTER TABLE "Payment" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"P_code"
);

ALTER TABLE "MSG" ADD CONSTRAINT "PK_MSG" PRIMARY KEY (
	"Message_code"
);

ALTER TABLE "SookSoIMG" ADD CONSTRAINT "PK_SOOKSOIMG" PRIMARY KEY (
	"image_number"
);

ALTER TABLE "Rooms" ADD CONSTRAINT "PK_ROOMS" PRIMARY KEY (
	"Rooms_Code"
);

ALTER TABLE "Reserv" ADD CONSTRAINT "FK_Rooms_TO_Reserv_1" FOREIGN KEY (
	"Rooms_Code"
)
REFERENCES "Rooms" (
	"Rooms_Code"
);

ALTER TABLE "Reserv" ADD CONSTRAINT "FK_USER_TO_Reserv_1" FOREIGN KEY (
	"User_code"
)
REFERENCES "USER" (
	"User_code"
);

ALTER TABLE "Review" ADD CONSTRAINT "FK_USER_TO_Review_1" FOREIGN KEY (
	"User_code"
)
REFERENCES "USER" (
	"User_code"
);

ALTER TABLE "Review" ADD CONSTRAINT "FK_Rooms_TO_Review_1" FOREIGN KEY (
	"Rooms_Code"
)
REFERENCES "Rooms" (
	"Rooms_Code"
);

ALTER TABLE "Payment" ADD CONSTRAINT "FK_Reserv_TO_Payment_1" FOREIGN KEY (
	"V_code"
)
REFERENCES "Reserv" (
	"V_code"
);

ALTER TABLE "MSG" ADD CONSTRAINT "FK_USER_TO_MSG_1" FOREIGN KEY (
	"send_id"
)
REFERENCES "USER" (
	"User_code"
);

ALTER TABLE "MSG" ADD CONSTRAINT "FK_USER_TO_MSG_2" FOREIGN KEY (
	"receive_id"
)
REFERENCES "USER" (
	"User_code"
);

ALTER TABLE "SookSoIMG" ADD CONSTRAINT "FK_Rooms_TO_SookSoIMG_1" FOREIGN KEY (
	"Rooms_Code"
)
REFERENCES "Rooms" (
	"Rooms_Code"
);

ALTER TABLE "Rooms" ADD CONSTRAINT "FK_USER_TO_Rooms_1" FOREIGN KEY (
	"User_code"
)
REFERENCES "USER" (
	"User_code"
);

