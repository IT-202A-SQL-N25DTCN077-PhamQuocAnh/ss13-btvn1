# Giai thich code
- Sự khac biệt giữ OLD và NEW trong TRIGGER
- Trong UPDATE OLD sẽ trả về bản ghi cũ, NEW sẽ trả về bản ghi mới với điều kiện ở đây là sau khi UPDATE ta sẽ kiểm tra xem ngày mà người dùng khi sửa có nhỏ hơn ngày hiện tại không nếu ngày sửa bé hơn thì sẽ in ra lỗi nếu không thì sẽ cho phép update 
- Tại sao ở đây không dùng được OLD là vì ta lấy giá trị sau khi update để so sánh chứ nếu lấy giá trị OLD thì điều kiện sẽ luôn đúng là sẽ báo lỗi