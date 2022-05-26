typedef R LetCallback<T, R>(final T it);
typedef Future<R> FutureLetCallback<T, R>(final T it);

extension Let<T, R> on T {
  R let<R>(LetCallback<T, R> callback) {
    return callback(this);
  }

  Future<R> asyncLet<R>(FutureLetCallback<T, R> callback) {
    return callback(this);
  }
}

typedef bool TakeIfCallback<T>(final T it);
extension TakeIf<T> on T {
  T? takeIf(TakeIfCallback<T> callback) {
    if (callback(this)) {
      return this;
    }
    return null;
  }
}

extension NullOrEmpty on dynamic {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    }
    if (this is Iterable) {
      final Iterable it = this;
      return it.isEmpty;
    }
    if (this is Map) {
      final Map it = this;
      return it.isEmpty;
    }
    if (this is String) {
      final String it = this;
      return it.isEmpty;
    }
    return false;
  }
}
