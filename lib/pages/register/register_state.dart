import 'view_models/register_view_model.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

class RegisterState {
  final RegisterStatus status;
  RegisterViewModel? registerViewModel;
  final String? errorMessage;
  final bool? isTermosSelected;

  RegisterState({
    required this.status,
    this.errorMessage,
    this.registerViewModel,
    this.isTermosSelected,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
    RegisterViewModel? registerViewModel,
    bool? isTermosSelected,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      registerViewModel: registerViewModel ?? this.registerViewModel,
      isTermosSelected: isTermosSelected ?? this.isTermosSelected,
    );
  }
}
