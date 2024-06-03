part of '../weather_core.dart';

class Tuple<T> {
  final T value1;
  final T value2;

  const Tuple(this.value1, this.value2);

  Tuple<T> copyWith({
    Optional<T>? value1,
    Optional<T>? value2,
  }) {
    return Tuple<T>(
      Optional.getValue(value1, this.value1),
      Optional.getValue(value2, this.value2),
    );
  }

  bool contains(T value) {
    return value1 == value || value2 == value;
  }

  bool get isFullFilled => value1 != null && value2 != null;
  bool get isEmpty => value1 == null && value2 == null;
}

class DateTimeTuple extends Tuple<DateTime?> {
  const DateTimeTuple(super.value1, super.value2);
  const DateTimeTuple.empty() : super(null, null);

  @override
  DateTimeTuple copyWith({
    Optional<DateTime?>? value1,
    Optional<DateTime?>? value2,
  }) {
    return DateTimeTuple(
      Optional.getValue(value1, this.value1),
      Optional.getValue(value2, this.value2),
    );
  }
}
