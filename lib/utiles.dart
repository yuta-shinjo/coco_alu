import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void loginSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'ログインしました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void registerSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'アカウントを作成しました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void linkSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'アカウントをリンクさせました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void profileSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'プロフィールを登録しました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void editProfileSuccessMassage() {
  Fluttertoast.showToast(
    msg: 'プロフィールを編集しました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void createAlbumSuccessMassage() {
  Fluttertoast.showToast(
    msg: '作成しました',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void errorMassage(RoundedLoadingButtonController controller, Object e) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: e.toString(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void emailErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: 'メールアドレスを入力してください',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void passwordErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: 'パスワードは8文字以上です',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void nameErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: '名前を入力してください',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void profileEditErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: 'ユーザー名またはプロフィール画像を変更してください',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void pictureErrorMassage(RoundedLoadingButtonController controller) {
  loadingError(controller);
  Fluttertoast.showToast(
    msg: '写真を選択してください',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void notAddChip() {
  Fluttertoast.showToast(
    msg: '同じタグがあるため追加できません',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
  );
}

void loadingSuccess(RoundedLoadingButtonController controller) {
  controller.success();
}

void loadingError(RoundedLoadingButtonController controller) {
  controller.error();
}
