Cách Fork trong github:
https://gist.github.com/Chaser324/ce0505fbed06b947d962

Hướng dẫn tạo ứng dụng với C#
https://www.youtube.com/watch?v=GcFJjpMFJvI

Mô hình kết hợp:
https://erdplus.com/#/

Work Log:
https://docs.google.com/spreadsheets/d/1WM1WktSSKxo4zRSg1p62Nk6dimCgNHH3KFuSJHSCPBo/edit#gid=0

SQL trigger task list:
https://docs.google.com/document/d/1DKXysStC-UvfYj15xaxCLOsWGOFoJ6OCHgRMMUs70XY/edit

Hướng dẫn gen data: (với SQL Data Generator của Redgate)
https://www.youtube.com/watch?v=ZOqRUbdsBjk

+Hiện tại mình đang sử dụng SQL Data Generator của Redgate. Nếu các bạn muốn sử dụng công cụ gen khác thì báo cho mình để mình tìm hiểu thêm nhé.
+
+Link download SQL Data Generator:
+https://www.red-gate.com/dynamic/products/sql-development/sql-data-generator/download
+
+Link download keygen cho SQL Data Generator:
+http://team-rept.com/board2/index.php?/topic/2079-redgate-multi-products/
+hoặc
+http://www.mediafire.com/file/xkng2rem4rxmt0d/RedGate.Products.Multi.Keygen.REPT.rar
+
+Download công cụ Data Generator và cài đặt bình thường. Cài đặt xong xuôi tất cả mọi thứ rồi mở SQL Data Generator 4 lên và đăng kí tài khoản free-trial 14 ngày. Có thể sử dụng email của bạn nếu muốn.
+
+Link hướng dẫn sử dụng keygen:
+http://www.howkteam.vn/Course/How-to-install/Huong-dan-cai-dat-SQL-Toolbelt-103
+(lưu ý: vì đã cài đặt xong nên bạn tiếp tục từ bước 12 của hướng dẫn này).
+
+Nếu đã làm hết mọi việc mà vẫn chưa đăng kí được bản quyền thì liên lạc mình qua:
++ Facebook: Hùng Huy Lê (https://www.facebook.com/kenkenkiota)
++ Email: kenkenkiota@gmail.com

Link download các tập tin cần thiết:
http://www.mediafire.com/file/msvfx9rctsvb5eq/Generate%20Data.rar

Trong file rar down về bao gồm 3 folder (Generate Project, Script file và Text files.
Trong đó,
+ Generate Project chứa các tập tin chứa sãn porject chứa các cài đặt cách generate dữ liệu (sử dụng tool SQL Data Generate của Redgate để mở)
+ Script file chứa tập tin script nguồn của database (có một số điều chỉnh để chứa dữ liệu. Khuyến khích sử dụng file này khi muốn generate data)
+ Text files chứa các tập tin dạng text. Thiếu các file text thì tool không generate được.

Các bước generate dữ liệu:
1. Dùng SQL Server Management Studio để chạy file script (trong folder Script file). Lưu ý, chỉ chạy phần create table và alter table. Không chạy các phần trigger vì một số trigger sẽ gây ra lỗi khi generate.
(Mình đã cài đặt tool để generate dữ liệu theo đề bài. Ví dụ như đã cài đặt dữ liệu khi generate cho bảng KhachHang sẽ không có dòng nào bị trùng tenDangNhap hay email,... hoặc cho bảng HoaDon thì không bị trùng maDP,...)

2. Copy các file text (trong folder Text files) vào thư mục với đường dẫn sau:
E:\Program Files (x86)\Red Gate\SQL Data Generator 4\Config
hoặc tuỳ vào thư mục mà bạn cài đặt tool.
(Copy vào thư mục Config của SQL Data Generator 4)

3. Sử dụng SQL Data Generate để mở 1 trong 2 file project (trong folder Generate Project). 
Note: 
+ Sử dụng "Generate Part" để generate một phần nhỏ để test dữ liệu (hoặc kiểm tra tính đúng đắn của dữ liệu). 
+ Sử dụng "Generate Full" để generate toàn bộ các dòng dữ liệu mà đề bài yêu cầu.
+ Nhớ kết nối đến database QLKS trước khi generate dữ liệu.
