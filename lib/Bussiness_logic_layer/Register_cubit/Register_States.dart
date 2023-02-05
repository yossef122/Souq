abstract class RegisterState {}

class RegisterIntialStates extends RegisterState{}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{
  final String? uid;
  RegisterSuccessState(this.uid);
}

class RegisterErrorState extends RegisterState{
  final String? error;
  RegisterErrorState(this.error);
}