import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:my_collection/ui/projects/authentication_error.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'login_page_controller.freezed.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    @Default('') String loginEmail,
    @Default('') String loginPassword,
    @Default('') String infoText,
  }) = _LoginPageState;
}

final loginPageProvider =
    StateNotifierProvider.autoDispose<LoginPageController, LoginPageState>(
  (ref) => LoginPageController(),
);

class LoginPageController extends StateNotifier<LoginPageState> {
  LoginPageController() : super(const LoginPageState());

  void inputEmail(String loginEmail) =>
      state = state.copyWith(loginEmail: loginEmail);

  void inputPassword(String loginPassword) =>
      state = state.copyWith(loginPassword: loginPassword);

  bool ablePassword(String loginPassword) {
    final userPassword = state.copyWith(loginPassword: loginPassword);
    return userPassword.loginPassword.length >= 8;
  }

  final _fireUsersService = FireUsersService();

  Future<void> emailLogin(String loginEmail, String loginPassword) async =>
      _fireUsersService.emailLogin(loginEmail, loginPassword);

  Future<UserCredential> googleLogin() async => _fireUsersService.googleLogin();

  final authError = AuthenticationError();

  final btnController = RoundedLoadingButtonController();
}
