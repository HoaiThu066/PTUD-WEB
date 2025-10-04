Dự án của nhóm là xây dựng một trang web ecommerce chuyên bán vé kịch, với tên gọi "StageX". 

Mục tiêu chính của dự án là phát triển một nền tảng trực tuyến, nơi người dùng có thể dễ dàng tra cứu thông tin vở diễn (shows/performances), đặt vé, thanh toán và gửi đánh giá. Hệ thống được thiết kế để phục vụ ba nhóm người dùng: Khách (guest), Thành viên (member) và Quản trị viên (admin)


Dự án sử dụng PHP cho backend, MySQL cho CSDL, HTML/CSS/JS/Bootstrap cho frontend, và XAMPP làm môi trường phát triển. Đến nay, chúng em đã hoàn thành phân tích thiết kế, giao diện cơ bản, và các chức năng nhập liệu, liệt kê, search theo yêu cầu của thầy. Em sẽ trình bày theo từng bước.

Về thiết kế cơ sở dữ liệu, nhóm đã sử dụng MySQL để xây dựng một hệ thống CSDL gồm 10 bảng chính, hỗ trợ đầy đủ các chức năng theo yêu cầu. Các bảng này bao gồm:
users: Lưu trữ thông tin người dùng
genres: Chứa thông tin thể loại vở diễn
shows: Lưu thông tin vở diễn
performances: Quản lý suất diễn
theaters: Lưu thông tin rạp
seat_categories: Chứa thông tin loại ghế
seats: Lưu chi tiết các ghế
bookings: Quản lý đơn đặt vé
tickets: Lưu thông tin vé
review: lưu thông tin đánh giá
