use QLKS
go
CREATE PROCEDURE TimKhachSan
    @tenKS nvarchar(50),
    @duong nvarchar(30),
    @quan nvarchar(20),
    @thanhPho nvarchar(20),
    @soSao int,
    @giaTu int,
    @giaDen int
AS 
    DECLARE @ketqua TABLE (
        MaKS nvarchar(30) not null,
		tenKS nvarchar(50),
		soSao int,
		soNha nvarchar(10),
		duong nvarchar(30),
		quan nvarchar(20),
		thanhPho nvarchar(20),
		giaTB int,
		moTa nvarchar(300),
        primary key (maKS)
    )
    INSERT INTO @ketqua (maKS, tenKS, soSao, soNha, duong, quan, thanhPho, giaTB, mota)
    SELECT maKS, tenKS, soSao, soNha, duong, quan, thanhPho, giaTB, mota FROM KhachSan
    IF (
        @tenKS is not null
    ) BEGIN
        SET @tenKS = '%' + RTRIM(@tenKS) + '%'
        delete FROM @ketqua where (tenKS not like @tenKS)
    END
    IF (
        @duong is not null
    ) BEGIN
        SET @duong = '%' + RTRIM(@duong) + '%'
        delete FROM @ketqua where not (duong like @duong)
    END
    IF (
        @quan is not null
    ) BEGIN
        SET @quan = '%' + RTRIM(@quan) + '%'
        delete FROM @ketqua where not (quan like @quan)
    END
    IF (
        @thanhpho is not null
    ) BEGIN
        SET @thanhPho = '%' + RTRIM(@thanhPho) + '%'
        delete FROM @ketqua where not (thanhPho like @thanhPho)
    END
    IF (
        @soSao is not null and @soSao > 0
    ) BEGIN
        DELETE FROM @ketqua where (soSao != @soSao)
    END
    IF (
        @giaTu is not null
    ) BEGIN
        delete FROM @ketqua where giaTB < @giaTu
    END
    IF (
        @giaDen is not null
    ) BEGIN
        delete FROM @ketqua where giaTB > @giaDen
    END
    SELECT * FROM @ketqua
