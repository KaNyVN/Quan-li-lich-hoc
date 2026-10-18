import 'package:better_phenikaa_schedule/core/contracts/models.dart';
import 'package:better_phenikaa_schedule/core/contracts/qldt_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Generic va ke thua trong QLDT', () {
    final sinhVien = UserDto(studentId: 'SV01', displayName: 'Nguyen Van A');

    final monHoc = ClassDto(
      id: 'LH01',
      subjectCode: 'INT123',
      subjectName: 'Lap trinh di dong',
      room: 'A2-301',
      lecturer: 'Giang vien A',
      startAt: DateTime(2026, 10, 19, 7),
      endAt: DateTime(2026, 10, 19, 9),
    );

    final List<QldtEntity<String>> danhSach = [sinhVien, monHoc];

    for (final Object doiTuong in danhSach) {
      final Type loai = doiTuong.runtimeType;
      print('Loai doi tuong: $loai');

      if (doiTuong is QldtEntity<String>) {
        print(doiTuong.thongTin());
      }
    }

    expect(danhSach.length, 2);
    expect(sinhVien.id, 'SV01');
    expect(monHoc.id, 'LH01');
    expect(monHoc.subjectName, 'Lap trinh di dong');
  });
}
