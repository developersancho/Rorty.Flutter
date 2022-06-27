extension ListExtensions on List<Object>? {
  List<Object> orEmpty() {
    return this ?? List.empty();
  }
}

// public inline fun <T> List<T>?.orEmpty(): List<T> = this ?: emptyList()