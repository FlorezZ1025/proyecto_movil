import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/controllers/login_state.dart';
import 'package:rappi_u/models/save_user_params.dart';
import 'package:rappi_u/models/sign_in_params.dart';
import 'package:rappi_u/providers/auth_provider.dart';
import 'package:rappi_u/providers/user_provider.dart';

class SignInController extends StateNotifier<SignInState> {
  final Ref ref;

  SignInController(this.ref) : super(const SingInInitialState());

  void login(String email, String password) async {
    state = const SignInLoading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository
          .login(SignInParams(email: email, password: password));
      // if (!mounted) return;
      state = const SignInSuccess();
    } catch (e) {
      state = SignInError(e.toString());
    }
  }

  void register(String email, String password, String name, String lastName,
      String phone, String cc) async {
    state = const SignInLoading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.register(SaveUserParams(
          email: email,
          password: password,
          name: name,
          lastName: lastName,
          phone: phone,
          cc: cc));
      
      await ref.read(userRepositoryProvider).saveUserInSupabase(SaveUserParams(
          email: email,
          password: password,
          name: name,
          lastName: lastName,
          phone: phone,
          cc: cc));

      state = const SignInSuccess();
    } catch (e) {
      state = SignInError(e.toString());
    }
  }

  void logout() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.signOut();
  }
}

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>(
        (ref) => SignInController(ref));
