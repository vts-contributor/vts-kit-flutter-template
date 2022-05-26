import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/bases/exceptions.dart';
import 'package:flutter_core/localizations/localizations.dart';

extension MultiLangugeException on Exception {
  Exception parseMultiLanguage(BuildContext context) {
    final appLocalization = CoreLocalizations.of(context);

    Exception returnException = this;
    if (appLocalization != null) {
      try {
        throw (this);
      } on DioError {
        final DioError dioError = this as DioError;
        final rootException = dioError.error;
        if (rootException is Exception) {
          return rootException.parseMultiLanguage(context);
        }
        //bo qua neu khong xac dinh duoc exception duoc giau trong DioError
      } on SocketException {
        returnException =
            CoreSocketException('${appLocalization.socketException}');
      } on TimeoutException {
        returnException =
            CoreTimeoutException('${appLocalization.timeoutException}');
      } on AuthorizationException {
        returnException =
            AuthorizationException('${appLocalization.authorizationException}');
      } on NotFoundException {
        returnException =
            NotFoundException('${appLocalization.notFoundException}');
      } on UnsupportedLanguageException {
        UnsupportedLanguageException ex = this as UnsupportedLanguageException;
        String languageName = ex.language?.name ?? '';
        returnException = UnsupportedLanguageException(
            '${appLocalization.unsupportedLanguageException(languageName)}',
            ex.language);
      } on NotEnabledBioSecurityException {
        return NotEnabledBioSecurityException(
            appLocalization.bioSecurityNotEnabled);
      } on ServerResponseError {
        //bo qua neu la message tu server
      } on Exception {
        returnException = Exception('${appLocalization.commonException}');
      } on NoSuchMethodError {
        returnException = Exception('${appLocalization.noSuchMethodException}');
      }
    }
    return returnException;
  }
}
