// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String Otp1ValueKey = 'otp1';
const String Otp2ValueKey = 'otp2';
const String Otp3ValueKey = 'otp3';
const String Otp4ValueKey = 'otp4';

final Map<String, TextEditingController> _OtpViewTextEditingControllers = {};

final Map<String, FocusNode> _OtpViewFocusNodes = {};

final Map<String, String? Function(String?)?> _OtpViewTextValidations = {
  Otp1ValueKey: null,
  Otp2ValueKey: null,
  Otp3ValueKey: null,
  Otp4ValueKey: null,
};

mixin $OtpView {
  TextEditingController get otp1Controller =>
      _getFormTextEditingController(Otp1ValueKey);
  TextEditingController get otp2Controller =>
      _getFormTextEditingController(Otp2ValueKey);
  TextEditingController get otp3Controller =>
      _getFormTextEditingController(Otp3ValueKey);
  TextEditingController get otp4Controller =>
      _getFormTextEditingController(Otp4ValueKey);

  FocusNode get otp1FocusNode => _getFormFocusNode(Otp1ValueKey);
  FocusNode get otp2FocusNode => _getFormFocusNode(Otp2ValueKey);
  FocusNode get otp3FocusNode => _getFormFocusNode(Otp3ValueKey);
  FocusNode get otp4FocusNode => _getFormFocusNode(Otp4ValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_OtpViewTextEditingControllers.containsKey(key)) {
      return _OtpViewTextEditingControllers[key]!;
    }

    _OtpViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OtpViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OtpViewFocusNodes.containsKey(key)) {
      return _OtpViewFocusNodes[key]!;
    }
    _OtpViewFocusNodes[key] = FocusNode();
    return _OtpViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    otp1Controller.addListener(() => _updateFormData(model));
    otp2Controller.addListener(() => _updateFormData(model));
    otp3Controller.addListener(() => _updateFormData(model));
    otp4Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    otp1Controller.addListener(() => _updateFormData(model));
    otp2Controller.addListener(() => _updateFormData(model));
    otp3Controller.addListener(() => _updateFormData(model));
    otp4Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          Otp1ValueKey: otp1Controller.text,
          Otp2ValueKey: otp2Controller.text,
          Otp3ValueKey: otp3Controller.text,
          Otp4ValueKey: otp4Controller.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _OtpViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OtpViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OtpViewTextEditingControllers.clear();
    _OtpViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get otp1Value => this.formValueMap[Otp1ValueKey] as String?;
  String? get otp2Value => this.formValueMap[Otp2ValueKey] as String?;
  String? get otp3Value => this.formValueMap[Otp3ValueKey] as String?;
  String? get otp4Value => this.formValueMap[Otp4ValueKey] as String?;

  set otp1Value(String? value) {
    this.setData(
      this.formValueMap..addAll({Otp1ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(Otp1ValueKey)) {
      _OtpViewTextEditingControllers[Otp1ValueKey]?.text = value ?? '';
    }
  }

  set otp2Value(String? value) {
    this.setData(
      this.formValueMap..addAll({Otp2ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(Otp2ValueKey)) {
      _OtpViewTextEditingControllers[Otp2ValueKey]?.text = value ?? '';
    }
  }

  set otp3Value(String? value) {
    this.setData(
      this.formValueMap..addAll({Otp3ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(Otp3ValueKey)) {
      _OtpViewTextEditingControllers[Otp3ValueKey]?.text = value ?? '';
    }
  }

  set otp4Value(String? value) {
    this.setData(
      this.formValueMap..addAll({Otp4ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(Otp4ValueKey)) {
      _OtpViewTextEditingControllers[Otp4ValueKey]?.text = value ?? '';
    }
  }

  bool get hasOtp1 =>
      this.formValueMap.containsKey(Otp1ValueKey) &&
      (otp1Value?.isNotEmpty ?? false);
  bool get hasOtp2 =>
      this.formValueMap.containsKey(Otp2ValueKey) &&
      (otp2Value?.isNotEmpty ?? false);
  bool get hasOtp3 =>
      this.formValueMap.containsKey(Otp3ValueKey) &&
      (otp3Value?.isNotEmpty ?? false);
  bool get hasOtp4 =>
      this.formValueMap.containsKey(Otp4ValueKey) &&
      (otp4Value?.isNotEmpty ?? false);

  bool get hasOtp1ValidationMessage =>
      this.fieldsValidationMessages[Otp1ValueKey]?.isNotEmpty ?? false;
  bool get hasOtp2ValidationMessage =>
      this.fieldsValidationMessages[Otp2ValueKey]?.isNotEmpty ?? false;
  bool get hasOtp3ValidationMessage =>
      this.fieldsValidationMessages[Otp3ValueKey]?.isNotEmpty ?? false;
  bool get hasOtp4ValidationMessage =>
      this.fieldsValidationMessages[Otp4ValueKey]?.isNotEmpty ?? false;

  String? get otp1ValidationMessage =>
      this.fieldsValidationMessages[Otp1ValueKey];
  String? get otp2ValidationMessage =>
      this.fieldsValidationMessages[Otp2ValueKey];
  String? get otp3ValidationMessage =>
      this.fieldsValidationMessages[Otp3ValueKey];
  String? get otp4ValidationMessage =>
      this.fieldsValidationMessages[Otp4ValueKey];
}

extension Methods on FormStateHelper {
  setOtp1ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Otp1ValueKey] = validationMessage;
  setOtp2ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Otp2ValueKey] = validationMessage;
  setOtp3ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Otp3ValueKey] = validationMessage;
  setOtp4ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[Otp4ValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    otp1Value = '';
    otp2Value = '';
    otp3Value = '';
    otp4Value = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      Otp1ValueKey: getValidationMessage(Otp1ValueKey),
      Otp2ValueKey: getValidationMessage(Otp2ValueKey),
      Otp3ValueKey: getValidationMessage(Otp3ValueKey),
      Otp4ValueKey: getValidationMessage(Otp4ValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _OtpViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _OtpViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      Otp1ValueKey: getValidationMessage(Otp1ValueKey),
      Otp2ValueKey: getValidationMessage(Otp2ValueKey),
      Otp3ValueKey: getValidationMessage(Otp3ValueKey),
      Otp4ValueKey: getValidationMessage(Otp4ValueKey),
    });
