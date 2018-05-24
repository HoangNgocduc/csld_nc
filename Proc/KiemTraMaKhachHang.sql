create procedure kiemTramaKH @maKH bigint
as
if (exists (select KH.maKH
			from KhachHang KH
			where hoTen = @maKH))
	begin
		raiserror (N'Create another ID',16,1)
		rollback transaction
		return
	end
