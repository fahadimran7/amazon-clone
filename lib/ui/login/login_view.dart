import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/login/login_view.form.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/auth_layout.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                AuthLayout(
                  form: Form(
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          controller: passwordController,
                        ),
                      ],
                    ),
                  ),
                  title: 'Welcome Back',
                  mainButtonText: 'Continue',
                  onMainButtonTapped: model.saveData,
                  validationMessage: model.validationMessage,
                  secondaryButtonText: 'Don\'t have an account?',
                  onSignUpTapped: model.navigateToSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
