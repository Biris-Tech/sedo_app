// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String RecoverynumValueKey = 'recoverynum';
const String DestinationnumValueKey = 'destinationnum';

final Map<String, TextEditingController> _CourierViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CourierViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CourierViewTextValidations = {
  RecoverynumValueKey: null,
  DestinationnumValueKey: null,
};

mixin $CourierView {
  TextEditingController get recoverynumController =>
      _getFormTextEditingController(RecoverynumValueKey);
  TextEditingController get destinationnumController =>
      _getFormTextEditingController(DestinationnumValueKey);

  FocusNode get recoverynumFocusNode => _getFormFocusNode(RecoverynumValueKey);
  FocusNode get destinationnumFocusNode =>
      _getFormFocusNode(DestinationnumValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CourierViewTextEditingControllers.containsKey(key)) {
      return _CourierViewTextEditingControllers[key]!;
    }

    _CourierViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CourierViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CourierViewFocusNodes.containsKey(key)) {
      return _CourierViewFocusNodes[key]!;
    }
    _CourierViewFocusNodes[key] = FocusNode();
    return _CourierViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    recoverynumController.addListener(() => _updateFormData(model));
    destinationnumController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    recoverynumController.addListener(() => _updateFormData(model));
    destinationnumController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          RecoverynumValueKey: recoverynumController.text,
          DestinationnumValueKey: destinationnumController.text,
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

    for (var controller in _CourierViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CourierViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CourierViewTextEditingControllers.clear();
    _CourierViewFocusNodes.clear();
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

  String? get recoverynumValue =>
      this.formValueMap[RecoverynumValueKey] as String?;
  String? get destinationnumValue =>
      this.formValueMap[DestinationnumValueKey] as String?;

  set recoverynumValue(String? value) {
    this.setData(
      this.formValueMap..addAll({RecoverynumValueKey: value}),
    );

    if (_CourierViewTextEditingControllers.containsKey(RecoverynumValueKey)) {
      _CourierViewTextEditingControllers[RecoverynumValueKey]?.text =
          value ?? '';
    }
  }

  set destinationnumValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DestinationnumValueKey: value}),
    );

    if (_CourierViewTextEditingControllers.containsKey(
        DestinationnumValueKey)) {
      _CourierViewTextEditingControllers[DestinationnumValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasRecoverynum =>
      this.formValueMap.containsKey(RecoverynumValueKey) &&
      (recoverynumValue?.isNotEmpty ?? false);
  bool get hasDestinationnum =>
      this.formValueMap.containsKey(DestinationnumValueKey) &&
      (destinationnumValue?.isNotEmpty ?? false);

  bool get hasRecoverynumValidationMessage =>
      this.fieldsValidationMessages[RecoverynumValueKey]?.isNotEmpty ?? false;
  bool get hasDestinationnumValidationMessage =>
      this.fieldsValidationMessages[DestinationnumValueKey]?.isNotEmpty ??
      false;

  String? get recoverynumValidationMessage =>
      this.fieldsValidationMessages[RecoverynumValueKey];
  String? get destinationnumValidationMessage =>
      this.fieldsValidationMessages[DestinationnumValueKey];
}

extension Methods on FormStateHelper {
  setRecoverynumValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RecoverynumValueKey] = validationMessage;
  setDestinationnumValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DestinationnumValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    recoverynumValue = '';
    destinationnumValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      RecoverynumValueKey: getValidationMessage(RecoverynumValueKey),
      DestinationnumValueKey: getValidationMessage(DestinationnumValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CourierViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CourierViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      RecoverynumValueKey: getValidationMessage(RecoverynumValueKey),
      DestinationnumValueKey: getValidationMessage(DestinationnumValueKey),
    });
