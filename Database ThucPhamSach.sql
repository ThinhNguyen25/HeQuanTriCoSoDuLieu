-- Tạo cơ sở dữ liệu (nếu chưa có)
CREATE DATABASE ThucPhamSach;
USE ThucPhamSach;
-- Tạo bảng Nhà cung cấp
CREATE TABLE Suppliers (
    SupplierID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Tạo bảng Loại thực phẩm
CREATE TABLE FoodCategories (
    CategoryID VARCHAR(5) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- Tạo bảng Thực phẩm
CREATE TABLE Food (
    FoodID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    SupplierID VARCHAR(5),
    HarvestDate DATE,
    ExpirationDate DATE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Tạo bảng Kiểm tra chất lượng
CREATE TABLE QualityChecks (
    CheckID VARCHAR(5) PRIMARY KEY,
    FoodID VARCHAR(5),
    CheckDate DATE,
    Result VARCHAR(50),
    Remarks TEXT,
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

-- Tạo bảng Lịch sử thu hoạch
CREATE TABLE HarvestHistory (
    HarvestID VARCHAR(5) PRIMARY KEY,
    FoodID VARCHAR(5),
    HarvestDate DATE,
    Quantity INT,
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

-- Tạo bảng Khách hàng
CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Tạo bảng Đơn hàng
CREATE TABLE Orders (
    OrderID VARCHAR(5) PRIMARY KEY,
    CustomerID VARCHAR(5),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng Chi tiết đơn hàng
CREATE TABLE OrderDetails (
    OrderDetailID VARCHAR(5) PRIMARY KEY,
    OrderID VARCHAR(5),
    FoodID VARCHAR(5),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

-- Chèn dữ liệu vào bảng Nhà cung cấp
INSERT INTO Suppliers (SupplierID, Name, Address, Phone, Email) VALUES
('S001', 'Công ty TNHH Thuc pham sach Hoang Ha', 'Ha Noi, Viet Nam', '0123456789', 'HoangHa@thucphamsach.com'),
('S002', 'Công ty co phan Thuc pham xanh', 'TP.HCM, Viet Nam', '0987654321', 'xanh@thucphamsach.com'),
('S003', 'Công ty Thuc pham sach toan cau', 'Da Nang, Viet Nam', '0912345678', 'toancau@thucphamsach.com'),
('S004', 'Công ty TNHH Thực phẩm Sạch', 'Số 123, Đường ABC, TP.HCM', '0901234567', 'contact@thucphamsach.com'),
('S005', 'Thực phẩm Xanh', 'Số 456, Đường DEF, Hà Nội', '0912345678', 'info@thucphamxanh.com'),
('S006', 'Công ty A', 'Số 789, Đường GHI, Đà Nẵng', '0923456789', 'support@congtya.com');
INSERT INTO Suppliers (SupplierID, Name, Address, Phone, Email) VALUES
('S008', 'Công ty Tân Bình', 'TP.HCM, Việt Nam', '0945678901', 'tanbinh@thucphamsach.com'),
('S009', 'Công ty Thực phẩm Minh Quang', 'TP.HCM, Việt Nam', '0967890123', 'minhquang@thucphamsach.com'),
('S010', 'Công ty Hải Phát', 'Hà Nội, Việt Nam', '0908765432', 'haiphat@thucphamsach.com'),
('S011', 'Công ty An Bình', 'Đà Nẵng, Việt Nam', '0934567891', 'anbinh@thucphamsach.com'),
('S012', 'Công ty Thiên Thanh', 'Bình Dương, Việt Nam', '0945678902', 'thienthanh@thucphamsach.com'),
('S013', 'Công ty Bình An', 'Quảng Ninh, Việt Nam', '0976543210', 'binhan@thucphamsach.com');


-- Chèn dữ liệu vào bảng Loại thực phẩm
INSERT INTO FoodCategories (CategoryID, CategoryName) VALUES
('C001', 'Rau củ quả'),
('C002', 'Trái cây'),
('C003', 'Thực phẩm khô'),
('C004', 'Gia vị'),
('C005', 'Thịt và hải sản'),
('C006', 'Đồ ăn chế biến sẵn'),
('C007', 'Gia vị'),
('C008', 'Nước giải khát'),
('C009', 'Sữa và sản phẩm từ sữa'),
('C010', 'Hạt và ngũ cốc'),
('C011', 'Đồ ăn chế biến sẵn lạnh'),
('C012', 'Thực phẩm chay'),
('C013', 'Dầu và mỡ'),
('C014', 'Mì và gia vị nấu ăn'),
('C015', 'Thực phẩm đông lạnh');
INSERT INTO FoodCategories (CategoryID, CategoryName) VALUES
('C016', 'Đồ uống có cồn'),
('C017', 'Bánh kẹo'),
('C018', 'Thực phẩm chức năng'),
('C019', 'Đồ ăn cho thú cưng'),
('C020', 'Sản phẩm từ hạt giống'),
('C021', 'Đồ ăn tiện lợi'),
('C022', 'Bánh mì và các sản phẩm từ bột'),
('C023', 'Đồ ăn cho trẻ em');

-- Chèn dữ liệu vào bảng Thực phẩm
INSERT INTO Food (FoodID, Name, Category, Price, SupplierID, HarvestDate, ExpirationDate) VALUES
('F001', 'Cà rốt', 'Rau củ quả', 10.50, 'S001', '2025-02-01', '2025-03-01'),
('F002', 'Táo', 'Trái cây', 15.00, 'S002', '2025-02-05', '2025-04-05'),
('F003', 'Gạo hữu cơ', 'Thực phẩm khô', 20.00, 'S003', '2025-01-15', '2025-12-15'),
('F004', 'Muối biển', 'Gia vị', 5.00, 'S001', '2025-01-20', '2026-01-20'),
('F005', 'Cá hồi', 'Thịt và hải sản', 200.00, 'S003', '2025-02-05', '2025-04-05'),
('F006', 'Gạo', 'Đồ ăn chế biến sẵn', 50.00, 'S001', '2025-02-01', '2025-05-01'),
('F007', 'Khoai tây', 'Rau củ quả', 18.00, 'S001', '2025-02-12', '2025-04-12'),
('F008', 'Bắp cải', 'Rau củ quả', 20.00, 'S001', '2025-02-10', '2025-04-10'),
('F009', 'Táo', 'Trái cây', 30.00, 'S002', '2025-02-01', '2025-04-01'),
('F010', 'Cam', 'Trái cây', 40.00, 'S002', '2025-02-15', '2025-04-15'),
('F011', 'Lê', 'Trái cây', 35.00, 'S002', '2025-02-10', '2025-04-10'),
('F012', 'Gạo', 'Thực phẩm khô', 50.00, 'S003', '2025-02-01', '2025-05-01'),
('F013', 'Mỳ tôm', 'Thực phẩm khô', 5.00, 'S003', '2025-02-10', '2025-06-01'),
('F014', 'Muối', 'Gia vị', 3.00, 'S001', '2025-02-01', '2025-08-01'),
('F015', 'Tiêu', 'Gia vị', 10.00, 'S001', '2025-02-05', '2025-08-05'),
('F016', 'Thịt bò', 'Thịt và hải sản', 120.00, 'S003', '2025-02-10', '2025-04-10'),
('F017', 'Cá hồi', 'Thịt và hải sản', 200.00, 'S003', '2025-02-12', '2025-04-12'),
('F018', 'Bánh bao đông lạnh', 'Đồ ăn chế biến sẵn', 80.00, 'S002', '2025-02-15', '2025-03-15'),
('F019', 'Bánh mì', 'Đồ ăn chế biến sẵn', 50.00, 'S002', '2025-02-10', '2025-03-10'),
('F020', 'Nước ngọt non', 'Nước giải khát', 15.00, 'S001', '2025-01-01', '2025-06-01'),
('F021', 'Nước táo', 'Nước giải khát', 12.00, 'S001', '2025-01-10', '2025-06-10'),
('F022', 'Sữa tươi', 'Sữa và sản phẩm từ sữa', 25.00, 'S002', '2025-02-01', '2025-04-01'),
('F023', 'Phô mai', 'Sữa và sản phẩm từ sữa', 40.00, 'S002', '2025-02-05', '2025-04-05');
INSERT INTO Food (FoodID, Name, Category, Price, SupplierID, HarvestDate, ExpirationDate) VALUES
('F024', 'Rượu vang đỏ', 'Đồ uống có cồn', 150.00, 'S007', '2025-02-15', '2025-12-15'),
('F025', 'Kẹo dẻo', 'Bánh kẹo', 12.00, 'S008', '2025-02-20', '2025-08-20'),
('F026', 'Viên sủi vitamin C', 'Thực phẩm chức năng', 25.00, 'S007', '2025-02-18', '2025-12-18'),
('F027', 'Chả cá', 'Thịt và hải sản', 70.00, 'S009', '2025-02-20', '2025-12-20'),
('F028', 'Sữa bột', 'Sữa và sản phẩm từ sữa', 120.00, 'S010', '2025-02-22', '2026-02-22'),
('F029', 'Bánh quy', 'Bánh kẹo', 30.00, 'S011', '2025-02-25', '2025-09-25'),
('F030', 'Thực phẩm ăn liền', 'Đồ ăn chế biến sẵn', 15.00, 'S012', '2025-02-18', '2025-06-18'),
('F031', 'Cà phê', 'Đồ uống có cồn', 50.00, 'S013', '2025-02-10', '2025-08-10'),
('F032', 'Thịt heo', 'Thịt và hải sản', 80.00, 'S009', '2025-02-28', '2025-06-28'),
('F033', 'Mì tôm', 'Thực phẩm khô', 12.00, 'S010', '2025-03-01', '2025-09-01'),
('F034', 'Bánh chưng', 'Thực phẩm chế biến sẵn', 100.00, 'S011', '2025-03-03', '2025-04-03'),
('F035', 'Gà tươi', 'Thịt và hải sản', 150.00, 'S012', '2025-03-05', '2025-05-05'),
('F036', 'Nước dừa', 'Nước giải khát', 10.00, 'S013', '2025-02-15', '2025-08-15');


-- Chèn dữ liệu vào bảng Kiểm tra chất lượng
INSERT INTO QualityChecks (CheckID, FoodID, CheckDate, Result, Remarks) VALUES
('QC001', 'F001', '2025-02-02', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC002', 'F002', '2025-02-06', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC003', 'F003', '2025-01-17', 'Fail', 'Có dấu hiệu ẩm mốc'),
('QC004', 'F004', '2025-01-21', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC005', 'F005', '2025-02-12', 'Passed', 'Cà rốt đạt yêu cầu chất lượng, không có dấu hiệu hư hỏng.');
INSERT INTO QualityChecks (CheckID, FoodID, CheckDate, Result, Remarks) VALUES
('QC006', 'F024', '2025-02-16', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC007', 'F025', '2025-02-22', 'Fail', 'Có dấu hiệu nấm mốc'),
('QC008', 'F026', '2025-02-19', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC009', 'F027', '2025-02-21', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC010', 'F028', '2025-02-23', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC011', 'F029', '2025-02-27', 'Fail', 'Hơi cứng và mất độ tươi'),
('QC012', 'F030', '2025-02-20', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC013', 'F031', '2025-02-12', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC014', 'F032', '2025-03-02', 'Fail', 'Có mùi lạ'),
('QC015', 'F033', '2025-03-05', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC016', 'F034', '2025-03-04', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC017', 'F035', '2025-03-06', 'Pass', 'Chất lượng đạt yêu cầu'),
('QC018', 'F036', '2025-03-07', 'Pass', 'Chất lượng đạt yêu cầu');

-- Chèn dữ liệu vào bảng Lịch sử thu hoạch
INSERT INTO HarvestHistory (HarvestID, FoodID, HarvestDate, Quantity) VALUES
('H001', 'F001', '2025-02-01', 100),
('H002', 'F002', '2025-02-05', 200),
('H003', 'F003', '2025-01-15', 500);
INSERT INTO HarvestHistory (HarvestID, FoodID, HarvestDate, Quantity) VALUES
('H004', 'F024', '2025-02-14', 300),
('H005', 'F025', '2025-02-19', 150),
('H006', 'F026', '2025-02-17', 200),
('H007', 'F027', '2025-02-18', 150),
('H008', 'F028', '2025-02-20', 200),
('H009', 'F029', '2025-02-22', 180),
('H010', 'F030', '2025-02-19', 100),
('H011', 'F031', '2025-02-10', 250),
('H012', 'F032', '2025-03-01', 120),
('H013', 'F033', '2025-03-03', 300),
('H014', 'F034', '2025-03-02', 50),
('H015', 'F035', '2025-03-04', 200),
('H016', 'F036', '2025-03-05', 300);

-- Chèn dữ liệu vào bảng Khách hàng
INSERT INTO Customers (CustomerID, Name, Phone, Email, Address) VALUES
('C001', 'Nguyễn Văn A', '0912345678', 'nguyenvana@gmail.com', 'Hà Nội'),
('C002', 'Trần Thị B', '0909876543', 'tranb@gmail.com', 'TP.HCM'),
('C003', 'Lê Văn C', '0923456789', 'levanc@gmail.com', 'Đà Nẵng');
INSERT INTO Customers (CustomerID, Name, Phone, Email, Address) VALUES
('C004', 'Phạm Thanh D', '0934567890', 'phamd@gmail.com', 'Hải Phòng'),
('C005', 'Nguyễn Thị E', '0945678901', 'nguyen.e@gmail.com', 'Cần Thơ'),
('C006', 'Hoàng Minh G', '0961234567', 'hoangminhg@gmail.com', 'TP.HCM'),
('C007', 'Vũ Quang H', '0938765432', 'vquangh@gmail.com', 'Đà Nẵng'),
('C008', 'Ngô Thanh I', '0912345679', 'ngothi@gmail.com', 'Hà Nội'),
('C009', 'Lê Thanh K', '0945678903', 'lethanhk@gmail.com', 'Cần Thơ'),
('C010', 'Đặng Thị L', '0923456789', 'dangthil@gmail.com', 'Bình Dương');

-- Chèn dữ liệu vào bảng Đơn hàng
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
('O001', 'C001', '2025-02-01', 1000.00, 'Đã giao'),
('O002', 'C002', '2025-02-05', 500.00, 'Chưa giao'),
('O003', 'C003', '2025-02-10', 1500.00, 'Đã giao');
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
('O004', 'C004', '2025-02-12', 800.00, 'Đang xử lý'),
('O005', 'C005', '2025-02-18', 1200.00, 'Đã giao'),
('O006', 'C006', '2025-02-15', 700.00, 'Chưa giao'),
('O007', 'C007', '2025-02-25', 1500.00, 'Đã giao'),
('O008', 'C008', '2025-03-02', 1200.00, 'Đã giao'),
('O009', 'C009', '2025-03-05', 950.00, 'Đang xử lý'),
('O010', 'C010', '2025-03-03', 500.00, 'Chưa giao');


-- Chèn dữ liệu vào bảng Chi tiết đơn hàng
INSERT INTO OrderDetails (OrderDetailID, OrderID, FoodID, Quantity, Price) VALUES
('OD001', 'O001', 'F001', 10, 10.50),
('OD002', 'O001', 'F002', 5, 15.00),
('OD003', 'O002', 'F003', 20, 20.00);
INSERT INTO OrderDetails (OrderDetailID, OrderID, FoodID, Quantity, Price) VALUES
('OD004', 'O004', 'F024', 3, 150.00),
('OD005', 'O004', 'F025', 10, 12.00),
('OD006', 'O005', 'F026', 5, 25.00),
('OD007', 'O006', 'F027', 4, 70.00),
('OD008', 'O006', 'F028', 6, 120.00),
('OD009', 'O007', 'F029', 10, 30.00),
('OD010', 'O007', 'F030', 10, 15.00),
('OD011', 'O008', 'F031', 5, 50.00),
('OD012', 'O009', 'F032', 2, 80.00),
('OD013', 'O009', 'F033', 10, 12.00),
('OD014', 'O010', 'F034', 3, 100.00),
('OD015', 'O010', 'F035', 3, 150.00);

SELECT * FROM Food;
SELECT * FROM Suppliers;
SELECT * FROM FoodCategories;
SELECT * FROM HarvestHistory;
SELECT * FROM QualityChecks;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;


--View
-- Kết hợp dữ liệu từ bảng Food và Suppliers qua SupplierID để người dùng có thể xem thông tin thực phẩm và nhà cung cấp trong một lần truy vấn.
CREATE VIEW FoodWithSuppliers AS
SELECT F.FoodID, 
       F.Name AS FoodName, 
       F.Category, 
       F.Price, 
       F.HarvestDate, 
       F.ExpirationDate, 
       S.Name AS SupplierName, 
       S.Address AS SupplierAddress, 
       S.Phone AS SupplierPhone, 
       S.Email AS SupplierEmail
FROM Food F
JOIN Suppliers S ON F.SupplierID = S.SupplierID;
--Giúp người dùng theo dõi chi tiết các đơn hàng và các thực phẩm trong mỗi đơn hàng.
CREATE VIEW OrderDetailsWithFood AS
SELECT O.OrderID, 
       O.CustomerID, 
       O.OrderDate, 
       O.TotalAmount, 
       O.Status, 
       OD.OrderDetailID, 
       OD.FoodID, 
       F.Name AS FoodName, 
       OD.Quantity, 
       OD.Price
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Food F ON OD.FoodID = F.FoodID;
--Hiển thị thông tin về khách hàng (tên, điện thoại, email, địa chỉ) và các đơn hàng của họ, bao gồm mã đơn hàng, ngày đặt hàng, tổng số tiền và trạng thái của đơn hàng.
CREATE VIEW CustomerOrders AS
SELECT C.CustomerID, 
       C.Name AS CustomerName, 
       C.Phone, 
       C.Email, 
       C.Address, 
       O.OrderID, 
       O.OrderDate, 
       O.TotalAmount, 
       O.Status
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;
--Hiển thị thông tin về khách hàng (tên, điện thoại, email, địa chỉ) và các đơn hàng của họ, bao gồm mã đơn hàng, ngày đặt hàng, tổng số tiền và trạng thái của đơn hàng.
CREATE VIEW HarvestHistoryWithFood AS
SELECT H.HarvestID, 
       H.FoodID, 
       F.Name AS FoodName, 
       H.HarvestDate, 
       H.Quantity
FROM HarvestHistory H
JOIN Food F ON H.FoodID = F.FoodID;
--Cung cấp lịch sử thu hoạch của từng loại thực phẩm, bao gồm ngày thu hoạch và số lượng thu hoạch.
CREATE VIEW QualityCheckResults AS
SELECT QC.CheckID, 
       QC.FoodID, 
       F.Name AS FoodName, 
       QC.CheckDate, 
       QC.Result, 
       QC.Remarks
FROM QualityChecks QC
JOIN Food F ON QC.FoodID = F.FoodID;
--Cung cấp kết quả kiểm tra chất lượng của các thực phẩm
CREATE VIEW ExpiringFood AS
SELECT FoodID, 
       Name AS FoodName, 
       Category, 
       Price, 
       ExpirationDate
FROM Food
WHERE ExpirationDate > GETDATE();

--Hiển thị danh sách các thực phẩm có ngày hết hạn trong tương lai.
CREATE VIEW SupplierFoodCount AS
SELECT S.SupplierID, 
       S.Name AS SupplierName, 
       COUNT(F.FoodID) AS NumberOfFoods
FROM Suppliers S
LEFT JOIN Food F ON S.SupplierID = F.SupplierID
GROUP BY S.SupplierID, S.Name;
--Đếm số thực phẩm mà mỗi nhà cung cấp cung cấp và hiển thị tên của nhà cung cấp, cùng với số lượng thực phẩm.

CREATE VIEW CustomerOrderSummary AS
SELECT C.CustomerID, 
       C.Name AS CustomerName, 
       COUNT(O.OrderID) AS TotalOrders, 
       SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name;
--Tính toán tổng số đơn hàng và tổng số tiền đã chi của mỗi khách hàng.
CREATE VIEW TopHarvestedFoods AS
SELECT H.FoodID, 
       F.Name AS FoodName, 
       SUM(H.Quantity) AS TotalHarvested
FROM HarvestHistory H
JOIN Food F ON H.FoodID = F.FoodID
GROUP BY H.FoodID, F.Name;
--Cung cấp danh sách các thực phẩm được thu hoạch nhiều nhất, dựa trên tổng số lượng thu hoạch
CREATE VIEW ExpiredFood AS
SELECT FoodID, 
       Name AS FoodName, 
       Category, 
       Price, 
       ExpirationDate,
       CONVERT(VARCHAR, ExpirationDate, 103) AS ExpirationDateFormatted -- Định dạng dd/mm/yyyy
FROM Food
WHERE ExpirationDate < GETDATE();

-- Cung cap danh sach thuc pham da qua han su dung
SELECT * FROM SupplierFoodCount;
SELECT * FROM CustomerOrderSummary;
SELECT * FROM TopHarvestedFoods;
SELECT * FROM ExpiringFood;
SELECT * FROM ExpiredFood;
DROP VIEW ExpiredFood;








--Procedure (Thủ tục)
--Thủ tục lấy thông tin về thực phẩm sắp hết hạn
CREATE PROCEDURE GetExpiringFood
AS
BEGIN
    SELECT FoodID, 
           Name AS FoodName, 
           Category, 
           Price, 
           ExpirationDate
    FROM Food
    WHERE ExpirationDate > GETDATE() AND ExpirationDate <= DATEADD(DAY, 7, GETDATE());
END;
DROP PROCEDURE GetExpiringFood;
--Thủ tục tìm thực phẩm hết hạn (ExpiredFood)
CREATE PROCEDURE GetExpiredFood
AS
BEGIN
    SELECT FoodID, 
           Name AS FoodName, 
           Category, 
           Price, 
           ExpirationDate
    FROM Food
    WHERE ExpirationDate < GETDATE();
END;
--Thủ tục thêm một nhà cung cấp
CREATE PROCEDURE AddSupplier
    @SupplierID VARCHAR(5),
    @Name VARCHAR(255),
    @Address VARCHAR(255),
    @Phone VARCHAR(15),
    @Email VARCHAR(100)
AS
BEGIN
    INSERT INTO Suppliers (SupplierID, Name, Address, Phone, Email)
    VALUES (@SupplierID, @Name, @Address, @Phone, @Email);
END;
-- Láy thông tin của một khách hàng
CREATE PROCEDURE GetCustomerOrders
    @CustomerID VARCHAR(5)
AS
BEGIN
    SELECT O.OrderID, 
           O.OrderDate, 
           O.TotalAmount, 
           O.Status
    FROM Orders O
    WHERE O.CustomerID = @CustomerID;
END;
DROP PROCEDURE GetCustomerOrders;
--Gọi thủ tục thêm đơn hàng mới
CREATE PROCEDURE AddNewOrder
    @OrderID VARCHAR(5),
    @CustomerID VARCHAR(5),
    @OrderDate DATE,
    @TotalAmount DECIMAL(10, 2),
    @Status VARCHAR(50)
AS
BEGIN
    INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
    VALUES (@OrderID, @CustomerID, @OrderDate, @TotalAmount, @Status);
END;
--Thủ tục thêm chi tiết đơn hàng
CREATE PROCEDURE AddOrderDetail
    @OrderDetailID VARCHAR(5),
    @OrderID VARCHAR(5),
    @FoodID VARCHAR(5),
    @Quantity INT,
    @Price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO OrderDetails (OrderDetailID, OrderID, FoodID, Quantity, Price)
    VALUES (@OrderDetailID, @OrderID, @FoodID, @Quantity, @Price);
END;
-- Thủ tục cập nhật thông tin thực phẩm
CREATE PROCEDURE UpdateFoodInfo
    @FoodID VARCHAR(5),
    @Name VARCHAR(255),
    @Category VARCHAR(100),
    @Price DECIMAL(10, 2),
    @SupplierID VARCHAR(5),
    @HarvestDate DATE,
    @ExpirationDate DATE
AS
BEGIN
    UPDATE Food
    SET Name = @Name,
        Category = @Category,
        Price = @Price,
        SupplierID = @SupplierID,
        HarvestDate = @HarvestDate,
        ExpirationDate = @ExpirationDate
    WHERE FoodID = @FoodID;
END;

--Thủ tục kiểm tra chất lượng thực phẩm
CREATE PROCEDURE AddQualityCheck
    @CheckID VARCHAR(5),
    @FoodID VARCHAR(5),
    @CheckDate DATE,
    @Result VARCHAR(50),
    @Remarks TEXT
AS
BEGIN
    INSERT INTO QualityChecks (CheckID, FoodID, CheckDate, Result, Remarks)
    VALUES (@CheckID, @FoodID, @CheckDate, @Result, @Remarks);
END;
-- Thủ tục lấy thông tin về nhà cung cấp và số lượng thực phẩm
CREATE PROCEDURE GetSupplierFoodCount
AS
BEGIN
    SELECT S.SupplierID, 
           S.Name AS SupplierName, 
           COUNT(F.FoodID) AS NumberOfFoods
    FROM Suppliers S
    LEFT JOIN Food F ON S.SupplierID = F.SupplierID
    GROUP BY S.SupplierID, S.Name;
END;
--Thủ tục lấy lịch sử thu hoạch của một loại thực phẩm
CREATE PROCEDURE GetHarvestHistoryForFood
    @FoodID VARCHAR(5)
AS
BEGIN
    SELECT H.HarvestID, 
           H.HarvestDate, 
           H.Quantity
    FROM HarvestHistory H
    WHERE H.FoodID = @FoodID;
END;

--GOI PROCEDURE
EXEC AddNewOrder 
    @OrderID = 'O004', 
    @CustomerID = 'C002', 
    @OrderDate = '2025-03-01', 
    @TotalAmount = 800.00, 
    @Status = 'Chưa giao';

EXEC GetExpiringFood;
EXEC GetCustomerOrders @CustomerID = 'C008';





--TRIGGER
--Trigger kiểm tra đơn hàng có giá trị dưới 100 (không được chấp nhận)
CREATE TRIGGER trg_CheckOrderValue
ON Orders
AFTER INSERT
AS
BEGIN
    DECLARE @TotalAmount DECIMAL(10, 2);
    
    BEGIN TRY
        -- Lấy tổng số tiền của đơn hàng vừa thêm
        SELECT @TotalAmount = TotalAmount FROM INSERTED;

        -- Kiểm tra tổng số tiền đơn hàng
        IF @TotalAmount < 100
        BEGIN
            RAISERROR ('Tổng số tiền đơn hàng phải lớn hơn hoặc bằng 100.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        -- Bắt lỗi và hiển thị thông tin lỗi chi tiết
        PRINT 'Lỗi xảy ra trong trigger: ' + ERROR_MESSAGE();
    END CATCH
END;

DROP TRIGGER trg_CheckOrderValue;
-- Thêm một đơn hàng có tổng số tiền nhỏ hơn 100 để kiểm tra trigger
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES ('O0020', 'C003', '2025-03-01', 50.00, 'Chưa giao');

--Trigger kiểm tra chất lượng thực phẩm khi cập nhật bảng QualityChecks:
--Trigger này sẽ tự động cập nhật FoodStatus của thực phẩm khi có thay đổi kết quả kiểm tra chất lượng.
CREATE TRIGGER trg_UpdateFoodStatusAfterQualityCheck
ON QualityChecks
AFTER UPDATE
AS
BEGIN
    DECLARE @FoodID VARCHAR(5);
    DECLARE @CheckResult VARCHAR(50);

    -- Lấy thông tin từ bảng QualityChecks
    SELECT @FoodID = FoodID, @CheckResult = Result
    FROM INSERTED;

    -- Kiểm tra kết quả kiểm tra chất lượng
    IF @CheckResult = 'Fail'
    BEGIN
        -- Cập nhật trạng thái thực phẩm hoặc thực hiện các hành động khác
        UPDATE Food
        SET ExpirationDate = GETDATE()  -- Cập nhật ngày hết hạn thành ngày hiện tại, ví dụ
        WHERE FoodID = @FoodID;
    END
END;

-- Cập nhật kết quả kiểm tra chất lượng cho thực phẩm có FoodID = 'F002'
UPDATE QualityChecks
SET Result = 'Fail'  -- Đặt kết quả kiểm tra thành 'Fail' để kích hoạt trigger
WHERE FoodID = 'F002';


--Trigger cập nhật số lượng thực phẩm trong bảng HarvestHistory khi có đơn hàng mới:
--Trigger này sẽ tự động giảm số lượng thực phẩm trong bảng HarvestHistory khi có đơn hàng được tạo.
CREATE TRIGGER trg_UpdateHarvestHistoryOnOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
    DECLARE @FoodID VARCHAR(5), @Quantity INT;

    SELECT @FoodID = FoodID, @Quantity = Quantity FROM inserted;

    UPDATE HarvestHistory
    SET Quantity = Quantity - @Quantity
    WHERE FoodID = @FoodID;
END;
-- Thêm đơn hàng mới vào bảng OrderDetails
INSERT INTO OrderDetails (OrderID, FoodID, Quantity)
VALUES (4, 'F001', 10);



--Trigger kiểm tra ngày hết hạn của thực phẩm khi cập nhật bảng Food:
--Trigger này sẽ kiểm tra ngày hết hạn và thông báo nếu thực phẩm đã hết hạn.
CREATE TRIGGER trg_CheckFoodExpiration
ON Food
AFTER UPDATE
AS
BEGIN
    DECLARE @FoodID VARCHAR(5), @ExpirationDate DATE;

    SELECT @FoodID = FoodID, @ExpirationDate = ExpirationDate FROM inserted;

    IF @ExpirationDate < GETDATE()
    BEGIN
        PRINT 'Warning: Food with FoodID ' + @FoodID + ' has expired.';
    END
END;

--Trigger kiểm tra thay đổi trạng thái đơn hàng khi cập nhật bảng Orders:
--Trigger này sẽ tự động kiểm tra trạng thái của đơn hàng khi nó được cập nhật và sẽ in ra thông báo nếu trạng thái thay đổi thành "Đã giao".
CREATE TRIGGER trg_OrderStatusChange
ON Orders
AFTER UPDATE
AS
BEGIN
    DECLARE @OrderID VARCHAR(5), @Status VARCHAR(50);

    SELECT @OrderID = OrderID, @Status = Status FROM inserted;

    IF @Status = 'Đã giao'
    BEGIN
        PRINT 'Order ' + @OrderID + ' has been delivered successfully.';
    END
END;
UPDATE Orders
SET Status = 'Đã giao'
WHERE OrderID = 'O001';


--Trigger kiểm tra số lượng thực phẩm khi thêm vào bảng OrderDetails:
--Trigger này sẽ kiểm tra nếu số lượng thực phẩm trong bảng OrderDetails lớn hơn số lượng thực phẩm có sẵn trong bảng HarvestHistory.
CREATE TRIGGER trg_CheckFoodQuantityInOrder
ON OrderDetails
AFTER INSERT
AS
BEGIN
    DECLARE @FoodID VARCHAR(5), @OrderedQuantity INT, @AvailableQuantity INT;

    SELECT @FoodID = FoodID, @OrderedQuantity = Quantity FROM inserted;

    SELECT @AvailableQuantity = Quantity FROM HarvestHistory WHERE FoodID = @FoodID;

    IF @OrderedQuantity > @AvailableQuantity
    BEGIN
        PRINT 'Warning: Not enough stock for FoodID ' + @FoodID + '.';
    END
END;
INSERT INTO OrderDetails (OrderDetailID, OrderID, FoodID, Quantity, Price)
VALUES ('OD100', 'O001', 'F001', 150, 10.50);

-- Trigger tự động cập nhật tổng số tiền trong đơn hàng khi thay đổi chi tiết đơn hàng
CREATE TRIGGER trg_UpdateOrderTotalAmount
ON OrderDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @OrderID VARCHAR(5), @TotalAmount DECIMAL(10, 2);

    -- Tính toán lại tổng số tiền của đơn hàng
    SELECT @OrderID = OrderID FROM inserted;

    SELECT @TotalAmount = SUM(Quantity * Price)
    FROM OrderDetails
    WHERE OrderID = @OrderID;

    -- Cập nhật tổng số tiền trong bảng Orders
    UPDATE Orders
    SET TotalAmount = @TotalAmount
    WHERE OrderID = @OrderID;
END;
UPDATE OrderDetails
SET Quantity = 8
WHERE OrderDetailID = 'OD001';
--Trigger kiểm tra và tự động thêm kiểm tra chất lượng khi thực phẩm mới được thêm vào
CREATE TRIGGER trg_InsertQualityCheckForNewFood
ON Food
AFTER INSERT
AS
BEGIN
    DECLARE @FoodID VARCHAR(5);

    -- Lấy FoodID của thực phẩm mới thêm
    SELECT @FoodID = FoodID FROM inserted;

    -- Thêm một kiểm tra chất lượng cho thực phẩm mới
    INSERT INTO QualityChecks (CheckID, FoodID, CheckDate, Result, Remarks)
    VALUES (NEWID(), @FoodID, GETDATE(), 'Passed', 'Initial quality check passed');
END;
INSERT INTO Food (FoodID, Name, Price, Category)
VALUES ('F001', 'Cà rốt', 10.50, 100);

--Trigger kiểm tra ngày hết hạn thực phẩm khi cập nhật thông tin thực phẩm
CREATE TRIGGER trg_CheckFoodExpirationDate
ON Food
AFTER UPDATE
AS
BEGIN
    DECLARE @FoodID VARCHAR(5), @ExpirationDate DATE;

    -- Lấy thông tin của thực phẩm đã được cập nhật
    SELECT @FoodID = FoodID, @ExpirationDate = ExpirationDate FROM inserted;

    -- Kiểm tra nếu ngày hết hạn đã qua
    IF @ExpirationDate < GETDATE()
    BEGIN
        -- Thêm một bản kiểm tra chất lượng với kết quả "Expired"
        INSERT INTO QualityChecks (CheckID, FoodID, CheckDate, Result, Remarks)
        VALUES (NEWID(), @FoodID, GETDATE(), 'Expired', 'Food has expired');
    END
END;
-- Trigger ngăn không cho xóa thực phẩm nếu nó đã được bán trong đơn hàng
CREATE TRIGGER trg_PreventFoodDeleteIfInOrder
ON Food
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @FoodID VARCHAR(5);
    DECLARE @Count INT;

    -- Lấy FoodID của thực phẩm muốn xóa
    SELECT @FoodID = FoodID FROM deleted;

    -- Kiểm tra nếu thực phẩm đã được bán trong đơn hàng
    SELECT @Count = COUNT(*)
    FROM OrderDetails
    WHERE FoodID = @FoodID;

    -- Nếu thực phẩm đã có trong đơn hàng, không cho phép xóa
    IF @Count > 0
    BEGIN
        PRINT 'Cannot delete FoodID ' + @FoodID + ' because it is in an order.';
    END
    ELSE
    BEGIN
        -- Nếu không có trong đơn hàng, cho phép xóa
        DELETE FROM Food WHERE FoodID = @FoodID;
    END
END;
DELETE FROM Food WHERE FoodID = 'F001';  -- Giả sử 'F001' đã có trong đơn hàng


--Trigger tự động tạo lịch sử thu hoạch khi thực phẩm được thêm vào
CREATE TRIGGER trg_AutoCreateHarvestHistory
ON Food
AFTER INSERT
AS
BEGIN
    DECLARE @FoodID VARCHAR(5);

    -- Lấy FoodID của thực phẩm mới thêm
    SELECT @FoodID = FoodID FROM inserted;

    -- Tạo một bản ghi thu hoạch mới với số lượng là 0
    INSERT INTO HarvestHistory (HarvestID, FoodID, HarvestDate, Quantity)
    VALUES (NEWID(), @FoodID, GETDATE(), 0);
END;





--- Mã hóa các cột nhạy cảm (Column-level encryption)
-- Tạo một master key trong cơ sở dữ liệu (nếu chưa có)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword123!';

-- Tạo Certificate (Chứng chỉ)
CREATE CERTIFICATE MyCertificate
WITH SUBJECT = 'My Encryption Certificate';

-- Tạo Database Encryption Key
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE MyCertificate;

-- Bật Transparent Data Encryption cho cơ sở dữ liệu
ALTER DATABASE ThucPhamSach
SET ENCRYPTION ON;

-- Tạo một symmetric key để mã hóa và giải mã dữ liệu
CREATE SYMMETRIC KEY EmailKey WITH ALGORITHM = AES_256 ENCRYPTION BY PASSWORD = 'QuangThinhDepTry!';

-- Mở khóa symmetric key để sử dụng
OPEN SYMMETRIC KEY EmailKey DECRYPTION BY PASSWORD = 'QuangThinhDepTry!';

-- Mã hóa cột Email khi chèn dữ liệu vào bảng Customers
INSERT INTO Customers (CustomerID, Name, Phone, Email, Address)
VALUES ('C011', 'Nguyễn Văn A', '0912345678', 
        ENCRYPTBYKEY(KEY_GUID('EmailKey'), 'nguyenquangthinh@gmail.com'), 'Hà Nội');

SELECT * FROM Customers;

-- Xóa dữ liệu trong bảng Customers
DELETE FROM Customers WHERE CustomerID = 'C011';

-- Giải mã dữ liệu khi truy vấn bảng Customers
SELECT CustomerID, Name, Phone, 
       CONVERT(VARCHAR, DECRYPTBYKEY(Email)) AS DecryptedEmail, Address
FROM Customers;

-- Đóng khóa sau khi sử dụng
CLOSE SYMMETRIC KEY EmailKey;


--Tạo lược đồ
CREATE SCHEMA ThucPhamSach;
CREATE TABLE ThucPhamSach.Suppliers (
    SupplierID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE ThucPhamSach.FoodCategories (
    CategoryID VARCHAR(5) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE ThucPhamSach.Food (
    FoodID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    CategoryID VARCHAR(5),
    Price DECIMAL(10, 2) NOT NULL,
    SupplierID VARCHAR(5),
    HarvestDate DATE,
    ExpirationDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES ThucPhamSach.FoodCategories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES ThucPhamSach.Suppliers(SupplierID)
);

CREATE TABLE ThucPhamSach.QualityChecks (
    CheckID VARCHAR(5) PRIMARY KEY,
    FoodID VARCHAR(5),
    CheckDate DATE,
    Result VARCHAR(50),
    Remarks TEXT,
    FOREIGN KEY (FoodID) REFERENCES ThucPhamSach.Food(FoodID)
);

CREATE TABLE ThucPhamSach.HarvestHistory (
    HarvestID VARCHAR(5) PRIMARY KEY,
    FoodID VARCHAR(5),
    HarvestDate DATE,
    Quantity INT,
    FOREIGN KEY (FoodID) REFERENCES ThucPhamSach.Food(FoodID)
);

CREATE TABLE ThucPhamSach.Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE ThucPhamSach.Orders (
    OrderID VARCHAR(5) PRIMARY KEY,
    CustomerID VARCHAR(5),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES ThucPhamSach.Customers(CustomerID)
);

CREATE TABLE ThucPhamSach.OrderDetails (
    OrderDetailID VARCHAR(5) PRIMARY KEY,
    OrderID VARCHAR(5),
    FoodID VARCHAR(5),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES ThucPhamSach.Orders(OrderID),
    FOREIGN KEY (FoodID) REFERENCES ThucPhamSach.Food(FoodID)
);
SELECT name FROM sys.schemas;

-- Phân quyền và cấp quyền
-- Tạo login cho các người dùng
CREATE LOGIN admin WITH PASSWORD = 'password_admin';
CREATE LOGIN manager WITH PASSWORD = 'password_manager';
CREATE LOGIN customer WITH PASSWORD = 'password_customer';

-- Tạo user trong cơ sở dữ liệu
USE ThucPhamSach;  -- Chuyển đến cơ sở dữ liệu ThucPhamSach

CREATE USER admin FOR LOGIN admin;
CREATE USER manager FOR LOGIN manager;
CREATE USER customer FOR LOGIN customer;

-- Cấp quyền db_owner cho admin
ALTER ROLE db_owner ADD MEMBER admin;

-- Cấp quyền db_datareader và db_datawriter cho manager
ALTER ROLE db_datareader ADD MEMBER manager;
ALTER ROLE db_datawriter ADD MEMBER manager;

-- Cấp quyền db_datareader cho customer
ALTER ROLE db_datareader ADD MEMBER customer;

-- Kiểm tra quyền của user
SELECT DP1.name AS DatabaseRole, DP2.name AS DatabaseUser
FROM   sys.database_role_members AS DRM
       RIGHT OUTER JOIN sys.database_principals AS DP1
       ON DP1.principal_id = DRM.role_principal_id
       RIGHT OUTER JOIN sys.database_principals AS DP2
       ON DP2.principal_id = DRM.member_principal_id
WHERE  DP2.name = 'admin';  -- Thay 'admin' bằng tên người dùng khác nếu cần








