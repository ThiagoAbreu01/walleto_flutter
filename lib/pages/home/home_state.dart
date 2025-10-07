// ignore_for_file: public_member_api_docs, sort_constructors_first
enum HomeStatus { initial, loading, successMessage, errorMessage }

class HomeState {
  final HomeStatus status;
  final String? successMessage;
  final String? errorMessage;

  HomeState({
    required this.status,
    this.successMessage,
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? successMessage,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }
}
