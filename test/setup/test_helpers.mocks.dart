// Mocks generated by Mockito 5.3.2 from annotations
// in stacked_architecture/test/setup/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i9;

import 'package:flutter/material.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i2;
import 'package:stacked_architecture/services/authentication_service.dart'
    as _i7;
import 'package:stacked_architecture/services/local_storage_service.dart'
    as _i8;
import 'package:stacked_architecture/services/user_service.dart' as _i3;
import 'package:stacked_services/stacked_services.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSharedPreferences_0 extends _i1.SmartFake
    implements _i2.SharedPreferences {
  _FakeSharedPreferences_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i3.UserService {
  @override
  _i4.Future<void> loadUserFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #loadUserFromDisk,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<dynamic> updateUserProfile({
    required String? fullName,
    required String? email,
    required bool? emailUpdated,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserProfile,
          [],
          {
            #fullName: fullName,
            #email: email,
            #emailUpdated: emailUpdated,
          },
        ),
        returnValue: _i4.Future<dynamic>.value(),
        returnValueForMissingStub: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i5.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i6.GlobalKey<_i6.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i6.GlobalKey<_i6.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i5.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<T?>? navigateWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i6.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? navigateToView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i6.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i5.Transition? transition,
    _i5.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearStackAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i6.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i4.Future<T?>?);
}

/// A class which mocks [AuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationService extends _i1.Mock
    implements _i7.AuthenticationService {
  @override
  _i4.Future<dynamic> createUserWithEmailAndPassword({
    required String? fullName,
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUserWithEmailAndPassword,
          [],
          {
            #fullName: fullName,
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<dynamic>.value(),
        returnValueForMissingStub: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> loginUser({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<dynamic>.value(),
        returnValueForMissingStub: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<bool> signOutUser() => (super.noSuchMethod(
        Invocation.method(
          #signOutUser,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock
    implements _i8.LocalStorageService {
  @override
  _i2.SharedPreferences get prefs => (super.noSuchMethod(
        Invocation.getter(#prefs),
        returnValue: _FakeSharedPreferences_0(
          this,
          Invocation.getter(#prefs),
        ),
        returnValueForMissingStub: _FakeSharedPreferences_0(
          this,
          Invocation.getter(#prefs),
        ),
      ) as _i2.SharedPreferences);
  @override
  set prefs(_i2.SharedPreferences? _prefs) => super.noSuchMethod(
        Invocation.setter(
          #prefs,
          _prefs,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<bool> saveToLocalStorage({
    required String? key,
    required String? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveToLocalStorage,
          [],
          {
            #key: key,
            #value: value,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String?> getValueFromStorage({required String? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getValueFromStorage,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<String?>.value(),
        returnValueForMissingStub: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<bool> removeValueFromStorage({required String? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeValueFromStorage,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i5.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i5.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i6.Widget Function(
      _i6.BuildContext,
      _i5.DialogRequest<dynamic>,
      dynamic Function(_i5.DialogResponse<dynamic>),
    )?
        builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i5.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i9.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i9.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i5.DialogResponse<dynamic>?>);
  @override
  _i4.Future<_i5.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i4.Future<_i5.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i4.Future<_i5.DialogResponse<T>?>.value(),
      ) as _i4.Future<_i5.DialogResponse<T>?>);
  @override
  _i4.Future<_i5.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    String? confirmationTitle = r'Ok',
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #confirmationTitle: confirmationTitle,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i5.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i5.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogResponse].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogResponse<T> extends _i1.Mock implements _i5.DialogResponse<T> {
  @override
  bool get confirmed => (super.noSuchMethod(
        Invocation.getter(#confirmed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}
