create proc timkiemKhachSan @Gia money,@soSao nvarchar(10),
@thanhPho nvarchar(20)
as 
begin
	select *from KhachSan 
	where (@Gia=giaTB and @thanhPho=thanhPho)
		or (@soSao=soSao and @thanhPho=thanhPho)
		or @thanhPho=thanhPho
end
