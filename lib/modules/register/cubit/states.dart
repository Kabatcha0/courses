abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String e;
  RegisterErrorState({required this.e});
}

class CreateRegisterErrorState extends RegisterStates {}

class CreateRegisterNotificationSuccessState extends RegisterStates {}

class CreateRegisterNotificationErrorState extends RegisterStates {}
