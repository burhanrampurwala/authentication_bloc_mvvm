
import 'package:get_it/get_it.dart';

import '../presentation/authentication/bloc/authentication_bloc.dart';

final instance = GetIt.instance;


Future<void> initAuthenticationModule() async {
  if (!GetIt.I.isRegistered<AuthenticationBloc>()) {
    instance.registerFactory<AuthenticationBloc>(() => AuthenticationBloc());
  }
}