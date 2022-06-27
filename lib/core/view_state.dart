enum ResponseState { EMPTY, LOADING, COMPLETE, ERROR }

class ViewState<T> {
  ResponseState state;
  T? data;
  String? exception;

  ViewState({required this.state, this.data, this.exception});

  static ViewState<T> empty<T>() {
    return ViewState(state: ResponseState.EMPTY);
  }

  static ViewState<T> loading<T>() {
    return ViewState(state: ResponseState.LOADING);
  }

  static ViewState<T> complete<T>(T data) {
    return ViewState(state: ResponseState.COMPLETE, data: data);
  }

  static ViewState<T> error<T>(String exception) {
    return ViewState(state: ResponseState.ERROR, exception: exception);
  }
}
