import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'register_page_controller.freezed.dart';

@freezed
class RegisterPageState with _$RegisterPageState {
  const factory RegisterPageState({
    @Default('') String newEmail,
    @Default('') String newPassword,
    @Default('') String userId,
  }) = _RegisterPageState;
}

final registerPageProvider = StateNotifierProvider.autoDispose<
    RegisterPageController, RegisterPageState>(
  (ref) => RegisterPageController(),
);

class RegisterPageController extends StateNotifier<RegisterPageState> {
  RegisterPageController() : super(const RegisterPageState());

  void inputEmail(String newEmail) =>
      state = state.copyWith(newEmail: newEmail);

  void inputPassword(String newPassword) =>
      state = state.copyWith(newPassword: newPassword);

  bool ablePassword(String newPassword) {
    final userPassword = state.copyWith(newPassword: newPassword);
    return userPassword.newPassword.length >= 8;
  }

  final _fireUsersService = FireUsersService();

  Future<void> isRegister(String newEmail, String newPassword) async =>
      _fireUsersService.registerUser(newEmail, newPassword);

  final btnController = RoundedLoadingButtonController();
}
