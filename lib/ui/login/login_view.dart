import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/login/login_view.form.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/layout/auth_layout.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_field.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_label.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';
import 'package:stacked_architecture/utils/no_glow_scroll.dart';

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
      builder: (context, model, child) => GestureDetector(
        onTap: model.hideSoftKeyboard,
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    AuthLayout(
                      form: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const InputLabel(
                              label: 'Email',
                            ),
                            InputField(
                              controller: emailController,
                              hintText: 'Enter your email address',
                            ),
                            verticalSpaceMedium,
                            const InputLabel(
                              label: 'Password',
                            ),
                            InputField(
                              controller: passwordController,
                              isPassword: true,
                              hintText: 'Enter your password',
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
                      isBusy: model.isBusy,
                      showTermsText: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
