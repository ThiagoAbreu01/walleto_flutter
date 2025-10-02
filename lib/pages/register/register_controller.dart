import 'package:bloc/bloc.dart';
import '../../app/core/exceptions/failure.dart';
import '../../app/core/exceptions/invalid_credentials_exception.dart';
import '../../app/core/exceptions/invalid_email_exception.dart';
import '../../app/core/exceptions/user_did_not_accepted_politics_exception.dart';
import '../../app/core/exceptions/user_exists_exception.dart';
import '../../app/core/exceptions/weak_password_exception.dart';
import '../../app/core/logger/logger.dart';
import '../../app/core/rest_client/rest_client_exception.dart';
import '../../app/data/auth/service/auth_service.dart';
import 'register_state.dart';
import 'view_models/register_view_model.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthService authService;
  final Logger log;

  RegisterController({required this.authService, required this.log})
      : super(
          RegisterState(
            status: RegisterStatus.initial,
            isTermosSelected: false,
          ),
        );

  Future<void> register(RegisterViewModel registerViewModel) async {
    try {
      emit(state.copyWith(
          status: RegisterStatus.loading,
          errorMessage: null,
          registerViewModel: registerViewModel));
      await authService.register(registerViewModel);
      emit(state.copyWith(status: RegisterStatus.success, errorMessage: null));
    } on RestClientException catch (e) {
      log.error(e.message);
      emit(state.copyWith(
          status: RegisterStatus.error, errorMessage: e.message));
    } on UserExistsException catch (e) {
      log.error(e.message);

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    } on InvalidEmailException catch (e) {
      log.error(e.message);

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    } on WeakPasswordException catch (e) {
      log.error(e.message);

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    } on Failure catch (e, s) {
      log.error(e.message.toString(), s);

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    } on UserDidNotAcceptedPoliticsException catch (e) {
      log.error(e.message.toString());

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    } on InvalidCredentialsException catch (e) {
      log.error(e.message.toString());

      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.message,
        ),
      );
    }
  }

  Future<void> changeIsTermosSelected(bool newVal) async {
    emit(state.copyWith(isTermosSelected: newVal));
  }
}
