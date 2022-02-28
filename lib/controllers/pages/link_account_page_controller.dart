import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_collection/services/fire_users_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

part 'link_account_page_controller.freezed.dart';

@freezed
class LinkAccountPageState with _$LinkAccountPageState {
  const factory LinkAccountPageState({
    @Default('') String newEmail,
    @Default('') String newPassword,
    @Default('') String userId,
  }) = _LinkAccountPageState;
}

final linkAccountPageProvider = StateNotifierProvider.autoDispose<
    LinkAccountPageController, LinkAccountPageState>(
  (ref) => LinkAccountPageController(),
);

class LinkAccountPageController extends StateNotifier<LinkAccountPageState> {
  LinkAccountPageController() : super(const LinkAccountPageState());

  void inputEmail(String newEmail) =>
      state = state.copyWith(newEmail: newEmail);

  void inputPassword(String newPassword) =>
      state = state.copyWith(newPassword: newPassword);

  bool ablePassword(String newPassword) {
    final userPassword = state.copyWith(newPassword: newPassword);
    return userPassword.newPassword.length >= 8;
  }

  final _fireUsersService = FireUsersService();


  Future<void> linkEmail(String newEmail, String newPassword) async =>
      _fireUsersService.linkEmail(newEmail, newPassword);

  final btnController = RoundedLoadingButtonController();
}
