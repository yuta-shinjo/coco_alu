import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void loginSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'ログインしました',
    toastLength: Toast.LENGTH_LONG,
  );
}

void registerSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'アカウントを作成しました',
    toastLength: Toast.LENGTH_LONG,
  );
}

void profileSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'プロフィールを登録しました',
    toastLength: Toast.LENGTH_LONG,
  );
}

void editProfileSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'プロフィールを編集しました',
    toastLength: Toast.LENGTH_LONG,
  );
}

void errorMassage(RoundedLoadingButtonController controller, Object e) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: e.toString(),
    toastLength: Toast.LENGTH_LONG,
  );
}

void emailErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: 'メールアドレスを入力してください',
    toastLength: Toast.LENGTH_LONG,
  );
}

void passwordErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: 'パスワードは8文字以上です',
    toastLength: Toast.LENGTH_LONG,
  );
}

void nameErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: '名前を入力してください',
    toastLength: Toast.LENGTH_LONG,
  );
}

void loadingSuccess(RoundedLoadingButtonController controller) {
  controller.success();
}

void loadingError(RoundedLoadingButtonController controller) {
  controller.error();
}
