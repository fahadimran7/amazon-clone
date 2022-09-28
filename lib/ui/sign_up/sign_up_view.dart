import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/shared/auth_layout.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_field.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_label.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';
import 'package:stacked_architecture/ui/sign_up/sign_up_viewmodel.dart';
import 'package:stacked_architecture/utils/no_glow_scroll.dart';
import './sign_up_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password')
])
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => SignUpViewModel(),
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
                              label: 'Full name',
                            ),
                            InputField(
                              controller: fullNameController,
                              hintText: 'Your name',
                            ),
                            verticalSpaceMedium,
                            const InputLabel(
                              label: 'Email',
                            ),
                            InputField(
                              controller: emailController,
                              hintText: 'Your email address',
                            ),
                            verticalSpaceMedium,
                            const InputLabel(
                              label: 'Password',
                            ),
                            InputField(
                              controller: passwordController,
                              isPassword: true,
                              hintText: 'At least 6 characters',
                            ),
                          ],
                        ),
                      ),
                      title: 'Create Account',
                      mainButtonText: 'Create Account',
                      onMainButtonTapped: model.saveData,
                      validationMessage: model.validationMessage,
                      secondaryButtonText: 'Already have an account?',
                      onLoginTapped: model.navigateToLogin,
                      isBusy: model.isBusy,
                      showTermsText: true,
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
