// Firebase Authentication利用時の日本語エラーメッセージ
class AuthenticationError {
  // ログイン時の日本語エラーメッセージ
  String loginErrorMsg(String errorCode) {
    String errorMsg;

    if (errorCode == 'ERROR_INVALID_EMAIL') {
      errorMsg = '有効なメールアドレスを入力してください。';
    } else if (errorCode == 'ERROR_USER_NOT_FOUND') {
      // 入力されたメールアドレスが登録されていない場合
      errorMsg = 'メールアドレスかパスワードが間違っています。';
    } else if (errorCode == 'ERROR_WRONG_PASSWORD') {
      // 入力されたパスワードが間違っている場合
      errorMsg = 'メールアドレスかパスワードが間違っています。';
    } else if (errorCode == 'error') {
      // メールアドレスかパスワードがEmpty or Nullの場合
      errorMsg = 'メールアドレスとパスワードを入力してください。';
    } else {
      errorMsg = errorCode;
    }

    return errorMsg;
  }

  // アカウント登録時の日本語エラーメッセージ
  String registerErrorMsg(String errorCode) {
    String errorMsg;

    if (errorCode == 'ERROR_INVALID_EMAIL') {
      errorMsg = '有効なメールアドレスを入力してください。';
    } else if (errorCode == 'error') {
      // メールアドレスかパスワードがEmpty or Nullの場合
      errorMsg = 'メールアドレスとパスワードを入力してください。';
    } else {
      errorMsg = errorCode;
    }

    return errorMsg;
  }
}
