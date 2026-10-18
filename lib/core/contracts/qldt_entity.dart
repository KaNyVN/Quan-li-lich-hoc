abstract class QldtEntity<T> {
  const QldtEntity(this.id);

  final T id;

  String thongTin() {
    return 'Loai: $runtimeType - ID: $id';
  }
}
