CREATE proc thongKePhongTrong @soLuong int output
as
begin
	select count(distinct Phong.maPhong)
	from TrangThaiPhong,Phong,KhachSan,LoaiPhong
	where tinhTrang=N'còn trống' and Phong.maPhong=TrangThaiPhong.maPhong and Phong.LoaiPhong=LoaiPhong.maLoaiPhong
	and LoaiPhong.maKS=KhachSan.MaKS
	group by LoaiPhong,Phong.maPhong,soSao,thanhPho
	order by soSao,thanhPho
end
declare @sum int
exec thongKePhongTrong @sum out
print @sum
