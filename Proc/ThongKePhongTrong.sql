create proc thongKePhongTrong @soLuong int output
as
begin
	select count(distinct Phong.maPhong)
	from TrangThaiPhong,Phong,KhachSan,LoaiPhong
	where tinhTrang=N'còn tr?ng' and Phong.maPhong=TrangThaiPhong.maPhong and Phong.LoaiPhong=LoaiPhong.maLoaiPhong
	and LoaiPhong.maKS=KhachSan.MaKS
	group by LoaiPhong,Phong.maPhong,soSao,thanhPho
	order by soSao,thanhPho
end
declare @sum int
exec sp_ThongKePhongTrong @sum out
print @sum
