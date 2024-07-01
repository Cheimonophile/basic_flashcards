/// Interface for mapping objects to and from maps
abstract class Mappable<T> {
  Map<String, Object?> toMap();

  T fromMap(Map<String, Object?> map);
}
