import 'dart:async';
import 'dart:io';

import 'package:csgostats/csgostats/domain/api_client/api_client.dart';
import 'package:csgostats/csgostats/domain/data_providers/session_data_provider.dart';
import 'package:csgostats/csgostats/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage =
              'Сервер недоступен, проверьте подключение к интернету';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Неправильный логин или пароль';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'Произошла ошибка, попробуйте еще раз';
          break;
      }
    }

    if (_errorMessage != null) {
      _isAuthProgress = false;
      notifyListeners();
      return;
    }

    if (sessionId == null && errorMessage == null) {
      _errorMessage = 'Неизвестная ошибка';
      _isAuthProgress = false;
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Неизвестная ошибка';
      _isAuthProgress = false;
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    _isAuthProgress = false;
    notifyListeners();
    unawaited(
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainScreen),
    );
  }
}

///

///

// class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
//   final Model model;
//   const NotifierProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.model;
//   }

//   static Model? read<Model extends ChangeNotifier>(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
//         ?.widget;
//     return widget is NotifierProvider<Model> ? widget.model : null;
//   }
// }
