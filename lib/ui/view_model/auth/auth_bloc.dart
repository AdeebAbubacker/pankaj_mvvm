import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panakj_app/core/model/auth_response/auth_response.dart';
import 'package:panakj_app/core/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  AuthBloc(this.authService) : super(_Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(AuthState.loading());
      try {
        final user = await authService.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        if (user != null) {
          emit(AuthState.authsuccess(user: user));

          // Store access token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', user.accessToken.toString());

      String accessToken =
              prefs.getString('accessToken') ?? 'Access Token empty';
      } else {
          emit(const AuthState.authError(message: 'Login failed'));
        }
      } catch (e) {
        emit(AuthState.authError(message: 'An error occurred: $e'));
      }
    });
  }
}
