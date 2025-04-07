import 'dart:async';

import 'package:catalyst_builder/catalyst_builder.dart';

import 'package:project_laundry_flutter/src/domain/usecases/auth/register_email_usecase.dart';

@Service(lifetime: ServiceLifetime.transient)
class RegisterBloc {
  final RegisterEmailUsecase _registerEmailUsecase;
  RegisterBloc(this._registerEmailUsecase);

  Future registerEmail(String email, String password, String username) {
    return _registerEmailUsecase.execute(email, password, username);
  }
}
