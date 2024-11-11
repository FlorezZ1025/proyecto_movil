import 'package:equatable/equatable.dart';

class SignInState extends Equatable{
  const SignInState();

  @override
  List<Object> get props => [];
}

class SingInInitialState extends SignInState{
  const SingInInitialState();
}

class SignInLoading extends SignInState{
  const SignInLoading();
}
class SignInSuccess extends SignInState{
  const SignInSuccess();
}
class SignInError extends SignInState{
  final String message;

  const SignInError(this.message);
}