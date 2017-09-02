# Viết Script Detect OS 

**Bước 1 Với subnet mask được nhập vào từ bàn phím xác định được các IP có trong dải và ghi vào file host.txt**

**Bước 2 Kiểm tra trong các host vừa được xác định, host nào đang UP thì lưu vào tập tin hostsong.txt**

**Bước 3 Kiểm tra các host đang sống xem chúng đang mở cổng nào, nếu mở cổng 22 thì host đó đang sử dụng HĐH Linux, nếu mở cổng 3389 thì host đó đang sử dụng HĐH Windows, còn nếu host k mở cả 2 cổng trên ta xác định là host Unknown**

**Nhận xét về Script:**
Script không phụ thuộc vào các tools bên ngoài khác như Nmap.. nhưng thời gian chạy khá lâu do thời gian tối thiểu cho mỗi câu lệnh ping để kiểm tra các host nào đang sống là 1s như vậy nếu có 256 host thì Script đã tốn ít nhất 256s cho việc kiểm tra các host đang sống sau đó là các bước kiểm tra port và detect os, rất mong nhận được những góp ý từ anh để e khắc phục nhược điểm thời gian.
