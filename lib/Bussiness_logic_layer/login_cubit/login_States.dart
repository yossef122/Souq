abstract class login_states {}

class loginIntialStates extends login_states{}

class loginLoadingState extends login_states{}

class loginSuccessState extends login_states{
  final String? uid;
  loginSuccessState(this.uid);
}
class loginerrorState extends login_states{
  final String error;
  loginerrorState(this.error);
}

class SignOutLoadingState extends login_states{}

class SignOutSuccessState extends login_states{}
class SignOuterrorState extends login_states{
  final String error;
  SignOuterrorState(this.error);
}
