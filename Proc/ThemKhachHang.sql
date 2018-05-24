CREATE PROCEDURE ThemKhachHang 
        @maKH bigint,
		@hoTen nvarchar(30),
		@tenDangNhap nvarchar(50),
		@matKhau varchar(100),
		@soCMND char(15),
		@diaChi nvarchar(100),
		@soDienThoai varchar(15),		
		@moTa nvarchar(300),
		@email varchar(50)
    AS
        IF (
            @hoTen is not null and
            @tenDangNhap is not null and
            @matKhau is not null and
            @soCMND is not null and
            @email is not null
        )
        BEGIN
            INSERT INTO ThemKhachHang
            VALUES
            (@maKH, @hoTen, @tenDangNhap, @matKhau, @soCMND, @diaChi, @soDienThoai, @moTa, @email)
        END