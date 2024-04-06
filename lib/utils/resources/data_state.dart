abstract class DataState<T> {
  final T? data;
  final String error;
  const DataState({this.data, this.error = ''});
}

class DataSuccess<T> extends DataState<T> {
  final T data;
  const DataSuccess({required this.data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required String error}) : super(error: error);
}
