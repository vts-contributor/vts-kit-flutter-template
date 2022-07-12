import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/caches/settings.dart';
import 'package:flutter_core/network/download.dart';
import 'package:flutter_core/caches/caches.dart';
import 'package:flutter_core/bases/bases.dart';
import 'package:dio/dio.dart';
import 'package:sample/sample/models/sample.dart';
import 'package:sample/sample/repositories/repos.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleInitial()) {
    on<SampleEvent>((event, emit) async {
      if(event is GetSampleDataEvent) {
        emit(GetSampleDataProgress());
        try {
          final result = await ApiRepository.sampleRepo.getSampleData();
            emit(GetSampleDataSuccess(result));
        }on Exception catch(e) {
          emit(GetSampleDataFailed(exception: e.toString()));
        }
      } else if(event is GetExternalLocalizeEvent) {
        emit(GetExternalLocalizeProgress());
        try {
          final result = await downloadExternalLocalization();
          if (result) {
            emit(GetExternalLocalizeSuccess());
          } else {
            emit(GetExternalLocalizeFailed());
          }
        }on Exception {
          emit(GetExternalLocalizeFailed());
        }
      }
    });
  }

  Future<bool> downloadExternalLocalization() async {
    String savePath = await Storage.internalStoragePath;
    String url = 'http://10.60.110.24:8000/flutter/languages.zip';
    debugPrint('start download language from: $url');
    CancelToken? _cancelDownloadLanguages;
    if (_cancelDownloadLanguages?.isCancelled == false) {
      _cancelDownloadLanguages?.cancel('prevent duplicated request');
    }
    _cancelDownloadLanguages = CancelToken();
    try {
      File file = await download(
        url,
        '$savePath/languages.zip',
        cancelToken: _cancelDownloadLanguages,
        onReceiveProgress: (count, total) {
          final progress = count.toDouble() / total * 100 * 0.3;
        },
      );
      await Storage.extractZipFile(file.path.split('/').last);
      AppSetting.reloadCurrentLanguage();
      await Future.delayed(const Duration(seconds: 2));
      return true;
    }on Exception {
      Future.delayed(const Duration(seconds: 2));
      return false;
    }
  }
}
