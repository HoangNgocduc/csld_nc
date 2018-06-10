use QLKS
CREATE index KhachHang_DN
ON KhachHang(tenDangNhap,matKhau)

CREATE index KhachHang_CMND
ON KhachHang(soCMND)

CREATE index KhachSan_SoSaoTP
ON KhachSan (soSao,thanhPho)

CREATE index KhachSan_giaTBTP
ON KhachSan(giaTB, thanhPho)

CREATE index KhachSan_TP
ON KhachSan(thanhPho)

CREATE index LoaiPhong_maKS
ON LoaiPhong(maKS)

CREATE index LoaiPhong_dongiaKS
ON LoaiPhong(maKS,donGia)

CREATE index Phong_LoaiPhong
ON Phong(loaiPhong)

CREATE index TrangThaiPhong_maPhong
ON TrangThaiPhong(maPhong)

CREATE index DatPhong_KH
ON DatPhong(maLoaiPhong,maKH)

CREATE index HoaDon_DP
ON HoaDon(maDP)

CREATE index HoaDon_ThanhToan
ON HoaDon(ngayThanhToan, tongTien)