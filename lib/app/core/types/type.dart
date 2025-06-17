typedef OnChanged<T> = void Function(T value);

typedef Json = Map<String, dynamic>;

enum FailureType {
  networkError,
  serverError,
  invalidCredentials,
  accessDenied,
  badRequest,
  unknown,
}
