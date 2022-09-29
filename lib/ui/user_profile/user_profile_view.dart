import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/shared/layout/app_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_field.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_label.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_view.form.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_viewmodel.dart';
import '../shared/widgets/busy_button.dart';
import 'user_profile_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
])
class UserProfileView extends StatelessWidget with $UserProfileView {
  UserProfileView({Key? key, required this.userProfileDetails})
      : super(key: key);

  final User userProfileDetails;

  void onInitialValues() {
    fullNameController.text = userProfileDetails.fullName!;
    emailController.text = userProfileDetails.email;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        onInitialValues();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTopBarSecondary(
                    title: 'Update Profile',
                    onBackPressed: model.navigateBack,
                  ),
                  verticalSpaceRegular,
                  const InputLabel(
                    label: 'Full name',
                  ),
                  InputField(
                    controller: fullNameController,
                    hintText: 'Enter your name',
                  ),
                  verticalSpaceMedium,
                  const InputLabel(
                    label: 'Email',
                  ),
                  InputField(
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),
                  Column(
                    children: [
                      if (model.validationMessage != null) ...[
                        verticalSpaceRegular,
                        Text(
                          model.validationMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ]
                    ],
                  ),
                  const Spacer(),
                  BusyButton(
                    busy: model.buttonBusy,
                    mainButtonText: 'Update Profile',
                    onMainButtonTapped: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      FocusScope.of(context).unfocus();
                      return model.updateProfile(
                        userId: userProfileDetails.id!,
                        email: userProfileDetails.email,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
