--TẠO DATA
create database QuanLyNo
go
use QuanLyNo
go

-- BẢNG NHÀ CUNG CẤP
create table NHACUNGCAP
(
	MaNCC char(10),
	TenNCC nvarchar(50),
	DC nvarchar(30),
	SDT char(10),
	primary key(MaNCC)
)
go

-- BẢNG KHÁCH HÀNG NỢ
create table KHACH 
(
	MaKH char(10),
	TenKH nvarchar(100),
	Diachi nvarchar(30),  
	primary key(MaKH)
)
go

-- BẢNG HÀNG
create table HANGG 
(
	MaH char(10),
	TenHang nvarchar(15),
	DonGiaNo int,
	DonGiaN int,
	SoLuongHCS int,
	primary key(MaH)
)
go

-- BẢNG NHẬP HÀNG
create table NHAP
(
	MaNDH char(10),
	NgayNH date,
	MaNCC char(10),
	TongTien numeric(12,0),
	primary key(MaNDH),
	foreign key (MaNCC) references NHACUNGCAP

)
go

-- BẢNG NHẬP CHI TIẾT
create  table NHAPCHITIET
(
	MaNDHChiTiet char(10),
	MaH char(10),
	MaNDH char(10),
	SoLuongNH int,
	ThanhTien numeric(12,0),
	primary key(MaNDHChiTiet),
	foreign key (MaNDH) references NHAP,
	foreign key (MaH) references HANGG
)
go
 
-- BẢNG NỢ
create table NO_NO     
(
	SoHDN char(10),
	MaKH char(10),
	NgayNH date,
	TongTien numeric(12,0),
	primary key(SoHDN),
	foreign key (MaKH) references KHACH

)
go

--BẢNG NỢ CHI TIẾT
create table NOCHITIET
(
	SoHDChiTiet char(10),
	SoHDN char(10),
	MaH char(10),
	SoLuongNo int,
	ThanhTien numeric(12,0),
	primary key(SoHDChiTiet),
	foreign key (SoHDN) references NO_NO,
	foreign key (MaH) references HANGG
)
go

-- NHẬP DỮ LIỆU

insert into NHACUNGCAP values ('S001', N'Bánh kẹo ABC', '98 Lê Văn Hưu, Mỹ An, Ngũ Hành Sơn, Đà Nẵng','0345666777')
insert into NHACUNGCAP values ('S002', N'Đại lý nước ngọt AN', '32 Ông Ích Khiêm, Hòa Khánh, Đà Nẵng','0345654457')
insert into NHACUNGCAP values ('S003', N'Sỉ lẻ bánh nước MINH KHANG', '322 Nguyễn Văn Linh, Hòa Minh, Đà Nẵng','0388324556')
insert into NHACUNGCAP values ('S004', N'Kem ngũ vị BÌNH TINH', '02 Nguyễn Chí Thanh, Hòa Khương, Đà Nẵng','0999567432')

insert into KHACH values('C001', N'Phan Hoàng Oanh', '94 Ngô Huy Diễn, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C002', N'Nguyễn Công Phượng', '12 Ngô Huy Diễn, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C003', N'Nguyễn Thị Kim Hồng', '05 An Dương Vương, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C004', N'Trần Thị Kiều Nhung', '333 Ngô Huy Diễn, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C005', N'Nguyễn Văn A', '01 Ngô Huy Diễn, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C006', N'Trần Thị Tằm', '99 Hòa Bắc, Hòa Xuân, Đà Nẵng')
insert into KHACH values('C007', N'Đặng Nữ Hoàng Ngọc', '97 Ngô Huy Diễn, Hòa Xuân, Đà Nẵng')


insert into HANGG values ('P001', N'Bánh Oreo', '12000', '10000', '20')
insert into HANGG values ('P002', N'Nước coca chai lớn', '19000', '16000', '15')
insert into HANGG values ('P003', N'Xúc xích', '6000', '3000', '50')
insert into HANGG values ('P004', N'Bánh Pons', '32000', '28000', '10')
insert into HANGG values ('P005', N'Bánh Oreo', '12000', '10000', '20')
insert into HANGG values ('P006', N'Sữa bắp', '30000', '28000', '20')
insert into HANGG values ('P007', N'Kẹo mút', '2000', '1000', '30')
insert into HANGG values ('P008', N'Dầu gội chai Dove', '90000', '75000', '10')
insert into HANGG values ('P009', N'Mỳ chính', '58000', '51000', '12')
insert into HANGG values ('P0010', N'Ngũ vị hương', '16000', '12000', '25')

insert into NHAP values('I001', '2022/06/11', 'S001', 1200000)
insert into NHAP values('I002', '2022/01/11', 'S002', 300000)
insert into NHAP values('I003', '2022/02/12', 'S004', 1134000)
insert into NHAP values('I004', '2021/12/21', 'S003', 944000)

insert into NHAPCHITIET values('D001', 'P001', 'I001', '40', 200000)
insert into NHAPCHITIET values('D002', 'P009', 'I003', '60', 970000)
insert into NHAPCHITIET values('D003', 'P007', 'I002', '20', 2000000)
insert into NHAPCHITIET values('D004', 'P001', 'I004', '40', 400000)

insert into NO_NO values ('N001', 'C001', '2022/06/12', 356000 )
insert into NO_NO values ('N002', 'C002', '2022/12/01', 98000 )
insert into NO_NO values ('N003', 'C003', '2022/02/01', 36000 )
insert into NO_NO values ('N004', 'C004', '2022/03/02', 38000 )
insert into NO_NO values ('N005', 'C005', '2022/07/01', 122000 )
insert into NO_NO values ('N006', 'C006', '2022/06/12', 16000 )
insert into NO_NO values ('N007', 'C007', '2022/12/01', 83000 )
insert into NO_NO values ('N008', 'C004', '2022/03/12', 33000 )
insert into NO_NO values ('N009', 'C001', '2022/18/06', 332000 )
insert into NO_NO values ('N0010', 'C003', '2022/03/03', 19000 )
insert into NO_NO values ('N0011', 'C005', '2022/07/12', 36000 )

insert into NOCHITIET values ('MD001', 'N001', 'P002', '40', '1', 19000)
insert into NOCHITIET values ('MD002', 'N002', 'P005', '40', '2', 24000)
insert into NOCHITIET values ('MD003', 'N003', 'P002', '40', '1', 19000)
insert into NOCHITIET values ('MD004', 'N004', 'P008', '40', '1', 90000)


-- XÁC ĐỊNH VÀ TẠO CÁC INDEX CHO CÁC THUỘC TÍNH CẦN THIẾT 
CREATE UNIQUE INDEX TenHang_index on HANGG(TenHang)
CREATE UNIQUE INDEX SDT_index on NHACUNGCAP(SDT)
CREATE UNIQUE INDEX TenNCC_index on NHACUNGCAP(TenNCC)
CREATE UNIQUE INDEX TenKH_index on KHACH(TenKH)


---- SỬ DỤNG LỆNH T-SQL THÊM QUYỀN CHO NGƯỜI DÙNG ---
GRANT INSERT, SELECT, UPDATE, DELETE ON HANGG TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON KHACH TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON NHACUNGCAP TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON NHAP TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON NHAPCHITIET TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON NO_NO TO chuquan
GRANT INSERT, SELECT, UPDATE, DELETE ON NOCHITIET TO chuquan
