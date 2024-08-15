import 'dart:async';

import 'package:authentication_bloc_mvvm/data/models/api_request_model/sign_in_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/resources/app_strings.dart';
import 'authentication_handlers.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthenticationBloc() : super(AuthenticationState.initial()) {
    on<TriggerPasswordVisibility>(_onTriggerPasswordVisibilityCheck);
    on<TriggerTextFieldValidation>(_onTriggerValidation);
    on<TriggerOnPressedButton>(_onTriggerOnPressBtn);
  }

  FutureOr<void> _onTriggerPasswordVisibilityCheck(
      TriggerPasswordVisibility event, Emitter<AuthenticationState> emit) {
    handlePasswordVisibility(
      event: event,
      emit: emit,
      state: state,
    );
  }

  FutureOr<void> _onTriggerValidation(
      TriggerTextFieldValidation event, Emitter<AuthenticationState> emit) {
    handleTextFieldValidation(
      event: event,
      emit: emit,
      state: state,
    );
  }

  FutureOr<void> _onTriggerOnPressBtn(
      TriggerOnPressedButton event, Emitter<AuthenticationState> emit) async {
    await handleSignInEvent(event: event, emit: emit, state: state);
  }
}
