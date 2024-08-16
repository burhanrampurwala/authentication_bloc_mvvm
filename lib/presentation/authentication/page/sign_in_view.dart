import 'package:authentication_bloc_mvvm/common/dimensions/other_constants.dart';
import 'package:authentication_bloc_mvvm/common/functions/text_feild_validation.dart';
import 'package:authentication_bloc_mvvm/common/resources/app_strings.dart';
import 'package:authentication_bloc_mvvm/common/resources/app_styles.dart';
import 'package:authentication_bloc_mvvm/data/models/api_request_model/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/dimensions/paddings.dart';
import '../../../common/resources/app_color.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/toast.dart';
import '../../../di/di.dart';
import '../bloc/authentication_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final AuthenticationBloc _signInBloc = instance<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signInBloc,
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.message.isNotEmpty) {
            Toast.nullableIconToast(
              message: state.message,
              isErrorBooleanOrNull: state.isFailure ? true : false,
            );
          }
        },
        builder: (context, state) {
          return buildSignInLayout(state, context);
        },
      ),
    );
  }

  Widget buildSignInLayout(AuthenticationState state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.authentication_signin_title),
        elevation: cardElevation,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signInBloc.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: topHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: textFieldHPadding),
                child: CustomTextField(
                  isDense: false,
                  focusNode: state.emailFocusNode,
                  borderColor: AppColors.colorPrimaryInverse,
                  controller: state.emailController,
                  hintText: AppStrings.textfield_addEmail_text,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    _signInBloc.add(TriggerTextFieldValidation(
                        inputText: value!, isPassword: false));
                    return validateEmail(value);
                  },
                ),
              ),
               SizedBox(height: widgetBottomPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: textFieldHPadding),
                child: CustomTextField(
                  focusNode: state.passwordFocusNode,
                  isDense: false,
                  borderColor: AppColors.colorPrimaryInverse,
                  controller: state.passwordController,
                  hintText: AppStrings.textfield_addPassword_text,
                  keyboardType: TextInputType.text,
                  isObscure: state.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _signInBloc.add(TriggerPasswordVisibility(
                        isPasswordVisible: state.isPasswordVisible,
                        isPassword: true,
                      ));
                    },
                    child: Icon(
                      state.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  validator: (value) {
                    _signInBloc.add(TriggerTextFieldValidation(
                        inputText: value!, isPassword: true));
                    return validatePassword(value);
                  },
                ),
              ),
               SizedBox(height: spacingBetweenTextFields),
              state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenHPadding,
                        vertical: screenHPadding,
                      ),
                      child: ElevatedButton(
                        style: AppStyles().elevatedWhiteBtnRoundedStyle,
                        onPressed: () async {
                          if (_signInBloc.formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            _signInBloc.add(
                              TriggerOnPressedButton(
                                signInModel: SignInModel(
                                  email: state.emailController.text.trim(),
                                  password:
                                      state.passwordController.text.trim(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          AppStrings.authentication_signin_signinBtn,
                          style: AppStyles()
                              .primaryButtonTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
               SizedBox(height: spacingBetweenTextFields),
            ],
          ),
        ),
      ),
    );
  }
}
