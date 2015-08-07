-- tao co so du lieu co ten BanHoa
Create database BanHoaEntity
go

use BanHoaEntity
go

-- Tao bang ChuDeHoa
Create table ChuDeHoa
(
	MaChuDe nchar(10) primary key,
	LoaiChuDe nvarchar(100) not null
)

-- Tao bang Hoa
Create table Hoa
(
	MaHoa nchar(10) primary key,
	TenHoa nvarchar(100) not null,
	GiaBan float not null,
	SoLuong int not null,
	HinhAnh nvarchar(100) not null,
	MaChuDe nchar(10)  foreign key references ChuDeHoa(MaChuDe)
)

-- Them du lieu vao bang ChuDeHoa
Insert into ChuDeHoa values('HTY',N'Hoa tình yêu')
Insert into ChuDeHoa values('HKT',N'Hoa khai trương')
Insert into ChuDeHoa values('HCB',N'Hoa chia buồn')

-- Them du lieu vao bang Hoa
Insert into Hoa values ('TY1',N'Khu Vườn Tình Yêu','550000','10','khu-vuon-tinh-yeu.jpg','HTY')
Insert into Hoa values ('TY2',N'Gắn Kết Yêu Thương','500000','5','gan-ket-yeu-thuong.jpg','HTY')
Insert into Hoa values ('KT1',N'Như ý','1000000','5','nhu-y.jpg','HKT')
Insert into Hoa values ('KT2',N'Thành Công','800000','15','thanh-cong-i.jpg','HKT')
Insert into Hoa values ('CB1',N'Tiếc thương','550000','25','tiec-thuong-ii.jpg','HCB')
Insert into Hoa values ('CB2',N'Giã Biệt','850000','15','gia-biet.jpg','HCB')
go

-- Tao thu tuc them hoa vao bang Hoa
Create proc InsertFlower
	@MaHoa nchar(10),
	@TenHoa nvarchar(100),
	@GiaBan float,
	@SoLuong int,
	@HinhAnh nvarchar(100),
	@MaChuDe nchar(10),
	@Error nvarchar(100) output
as
	if @TenHoa in (Select TenHoa From Hoa Where @MaHoa <> MaHoa)
	begin
		set @Error=N'Tên này đã tồn tại'
		return
	end
	Insert into Hoa values(@MaHoa, @TenHoa, @GiaBan, @SoLuong, @HinhAnh, @MaChuDe)
	set @Error=''
go

-- Thu tuc lay hoa trong bang Hoa
Create proc GetFlower
as
	select HinhAnh, TenHoa, GiaBan, SoLuong, LoaiChuDe
	from Hoa, ChuDeHoa
	where Hoa.MaChuDe=ChuDeHoa.MaChuDe
	order by TenHoa
go

-- Thu tuc lay chu de hoa
Create proc GetChuDeHoa
as
	select * from ChuDeHoa
go
