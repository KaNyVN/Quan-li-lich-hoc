# BÀI TẬP GENERICS – BETTER PHENIKAA SCHEDULE

## 1. Giới thiệu

Bài tập áp dụng kiến thức **Generics, kế thừa (extends), Object và runtimeType** trong ngôn ngữ Dart vào các đối tượng dữ liệu của project Better Phenikaa Schedule – ứng dụng quản lý lịch học và lịch thi cho sinh viên.

## 2. Nội dung thực hiện

### Câu 1: Xây dựng lớp Generic chung

Tạo lớp `QldtEntity<T>` trong file:

`lib/core/contracts/qldt_entity.dart`

Lớp có nhiệm vụ:

- Sử dụng kiểu dữ liệu tổng quát `<T>`.
- Khai báo thuộc tính `id` dùng chung.
- Xây dựng phương thức `thongTin()` để hiển thị thông tin đối tượng.
- Cho phép các lớp khác kế thừa và sử dụng lại code.

### Câu 2: Áp dụng kế thừa và tổng quát hóa

Chỉnh sửa các đối tượng trong file:

`lib/core/contracts/models.dart`

Các lớp áp dụng kế thừa:

- `UserDto`: Quản lý thông tin sinh viên.
- `SemesterDto`: Quản lý thông tin học kỳ.
- `ClassDto`: Quản lý thông tin lịch học.
- `ExamDto`: Quản lý thông tin lịch thi.

Các lớp sử dụng `extends QldtEntity<String>` để kế thừa thuộc tính và phương thức chung, hạn chế việc khai báo code trùng lặp.

Đồng thời, sử dụng:

- `Object`: Quản lý các đối tượng thuộc nhiều lớp khác nhau.
- `runtimeType`: Xác định kiểu thực tế của đối tượng khi chương trình chạy.
- `List<QldtEntity<String>>`: Lưu trữ và xử lý các đối tượng kế thừa cùng lớp Generic.

## 3. Kiểm thử

File kiểm thử:

`test/qldt_generics_test.dart`

Nội dung kiểm thử:

- Khởi tạo các đối tượng dữ liệu.
- Kiểm tra khả năng kế thừa lớp Generic.
- Truy cập thuộc tính và phương thức dùng chung.
- Kiểm tra kiểu đối tượng bằng `Object` và `runtimeType`.

Lệnh chạy:

```bash
flutter analyze
flutter test
```

## 4. Kết quả và ý nghĩa

Việc áp dụng Generics giúp:

- Giảm trùng lặp trong khai báo thuộc tính và phương thức.
- Tái sử dụng code thông qua kế thừa.
- Quản lý nhiều loại đối tượng bằng một kiểu dữ liệu chung.
- Giúp mã nguồn dễ đọc, dễ mở rộng và bảo trì.

## 5. Các file liên quan

| File | Chức năng |
|---|---|
| `qldt_entity.dart` | Khai báo lớp Generic chung |
| `models.dart` | Các lớp dữ liệu kế thừa Generic |
| `qldt_generics_test.dart` | Kiểm thử Generics và kế thừa |

**Sinh viên thực hiện:** Đặng Văn Nam Khánh

**MSSV:** 24100041
