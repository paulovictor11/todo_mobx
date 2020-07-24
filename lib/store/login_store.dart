import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool visible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggle() => visible = !visible;

  @action
  Future login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @action
  void logout() {
    loggedIn = false;
  }

  @computed
  bool get isEmailValid => email.length > 6;

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  Function get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login : null;
}