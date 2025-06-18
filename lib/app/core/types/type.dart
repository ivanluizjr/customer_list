typedef OnChanged<T> = void Function(T value);

typedef Json = Map<String, dynamic>;

enum FailureType {
  timeOutServer,
  serverError,
  invalidCredentials,
  accessDenied,
  badRequest,
  unknown,
}
