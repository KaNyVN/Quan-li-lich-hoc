# Better Phenikaa Schedule — Bài tập Generics trong Flutter

Ứng dụng quản lý **lịch học và lịch thi** dành cho sinh viên Phenikaa University, phát triển bằng **Flutter/Dart**.

Repository này là môi trường làm việc trên nhánh `feature/qldt-intake-khanh`, tập trung vào chức năng **lấy và chuẩn hóa dữ liệu từ QLĐT**. Bài tập Generics được áp dụng trực tiếp lên các đối tượng dữ liệu của dự án, không xây dựng một ví dụ không liên quan.

## 1. Mục tiêu bài tập

**Câu 1:** Xây dựng lớp Generic `QldtEntity<T>` mô tả đặc điểm chung của các đối tượng trong ứng dụng.

**Câu 2:** Cho các lớp dữ liệu hiện có kế thừa (`extends`) từ lớp Generic; sử dụng `Object` và `runtimeType` để xử lý, nhận biết kiểu đối tượng một cách tổng quát.

Mục đích: tái sử dụng thuộc tính và phương thức chung, hạn chế khai báo trùng lặp và giúp mã nguồn dễ mở rộng.

> Trong Dart, `Object` là kiểu gốc của các đối tượng không-null; `runtimeType` trả về một giá trị `Type`. Dart không sử dụng lớp `Class<?>` như Java.

## 2. Đối tượng trong project

| Lớp | Ý nghĩa | Thông tin chính |
|---|---|---|
| `UserDto` | Sinh viên | Mã sinh viên, họ tên |
| `SemesterDto` | Học kỳ | Mã, tên, ngày bắt đầu/kết thúc |
| `ClassDto` | Buổi học | Mã, môn học, phòng, giảng viên, thời gian |
| `ExamDto` | Lịch thi | Mã, môn học, phòng thi, thời gian |
| `QldtImportPayload` | Gói dữ liệu đồng bộ | Sinh viên, học kỳ, lịch học, lịch thi, thời điểm đồng bộ |

### Thiết kế Generics dự kiến

```text
                  QldtEntity<T>
                  - id: T
                  + thongTin(): String
                         |
           +-------------+-------------+
           |             |             |
        UserDto      SemesterDto     ClassDto      ExamDto
```

Các DTO kế thừa `QldtEntity<String>` để dùng chung định danh và phương thức hiển thị thông tin. `UserDto` vẫn giữ `studentId` phục vụ nghiệp vụ QLĐT.

**Lưu ý trạng thái:** Bảng và sơ đồ trên mô tả thiết kế của bài tập. Việc các file Generics đã được thêm vào code hay chưa cần được xác nhận bằng commit và kết quả chạy kiểm thử; README không thay thế bằng chứng thực thi.

## 3. Các file của bài tập

| Đường dẫn | Nội dung |
|---|---|
| `lib/core/contracts/qldt_entity.dart` | Lớp cha Generic `QldtEntity<T>` (cần bổ sung) |
| `lib/core/contracts/models.dart` | Các DTO của dự án; chỉnh sửa để kế thừa lớp Generic |
| `test/qldt_generics_test.dart` | Test minh họa Generics, `extends`, `Object`, `runtimeType` (cần bổ sung) |
| `lib/core/contracts/repositories.dart` | Các interface trao đổi dữ liệu, giữ nguyên trong bài tập |

## 4. Ví dụ sử dụng

Sau khi áp dụng thay đổi ở mục 3, có thể tạo nhiều đối tượng và xử lý chung:

```dart
final sinhVien = UserDto(
  studentId: 'SV01',
  displayName: 'Nguyen Van A',
);

final buoiHoc = ClassDto(
  id: 'LH01',
  subjectCode: 'INT123',
  subjectName: 'Lap trinh di dong',
  room: 'A2-301',
  lecturer: 'Giang vien A',
  startAt: DateTime(2026, 10, 19, 7),
  endAt: DateTime(2026, 10, 19, 9),
);

final List<QldtEntity<String>> danhSach = [sinhVien, buoiHoc];

for (final Object doiTuong in danhSach) {
  print('Kieu: ${doiTuong.runtimeType}');
  if (doiTuong is QldtEntity<String>) {
    print(doiTuong.thongTin());
  }
}
```

**Giải thích:** `<T>` cho phép khai báo kiểu dữ liệu dùng chung; `extends` tái sử dụng mã nguồn lớp cha; `Object` chứa tham chiếu đến các kiểu đối tượng khác nhau; `runtimeType` cho biết kiểu thực tế khi chạy.

## 5. Cách chạy và kiểm tra

Mở Codespaces trên đúng nhánh làm việc, sau đó chạy:

```bash
bash tool/setup.sh
flutter analyze
flutter test
```

Để chạy riêng bài tập Generics **sau khi tạo file test**:

```bash
flutter test test/qldt_generics_test.dart -r expanded
```

Kết quả mong đợi là `No issues found!` và `All tests passed!`. Chỉ ghi nhận hoàn thành khi terminal thực tế trả về các kết quả này.

## 6. Minh chứng nộp bài

- **Link commit:** lấy URL commit thực tế sau khi hoàn thành và push code lên GitHub.
- **Link README:** trang README của nhánh hiện tại.
- **Code chính:** `qldt_entity.dart`, `models.dart`, `qldt_generics_test.dart`.
- **Ảnh chụp:** mã nguồn lớp Generic, các lớp `extends` và terminal chạy test thành công.

Không đưa ảnh chụp chứa mật khẩu, token, cookie hoặc thông tin đăng nhập QLĐT thật.

## 7. Tiếp tục phát triển bài tập lớn

Phần Generics chỉ thay đổi cách tổ chức các DTO. Các chức năng tiếp theo của TV1 vẫn là đăng nhập QLĐT/Microsoft chính thức, quản lý phiên đăng nhập, lấy dữ liệu, parser lịch học/lịch thi và tạo `QldtImportPayload`. Phần lưu SQLite và tích hợp với TV3 sẽ được đối chiếu khi hai bên hoàn thiện.

Không tự ý merge vào nhánh tích hợp của nhóm khi chưa thống nhất.

## 8. Thông tin dự án

- **Sinh viên thực hiện phần QLĐT:** Đặng Văn Nam Khánh
- **MSSV:** 24100041
- **Công nghệ:** Flutter, Dart
- **Nhánh làm việc:** `feature/qldt-intake-khanh`

Tài liệu dự án: [Kiến trúc](docs/ARCHITECTURE.md) · [Quy trình làm việc](docs/WORKFLOW.md) · [Quy tắc bảo mật](SECURITY.md).
