

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/difference_screens/difference_screens.dart';
import 'package:sample/sample/blocs/sample_bloc.dart';
import 'package:flutter_core/localizations/localizations.dart';

import 'localizations/generated/language.dart';

class SampleScreen extends StatelessWidget with AdaptivePage {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc()..add(GetExternalLocalizeEvent()),
      child: BlocListener<SampleBloc, SampleState>(
        listener: (context, state) {
          if(state is GetSampleDataProgress || state is GetExternalLocalizeProgress) {
            LoadingDialog.show(context);
          } else if(state is GetExternalLocalizeSuccess) {
            LoadingDialog.hide(context);
            final externalLocalizations = ExternalLocalizations.of(context);
            String message = externalLocalizations?.getString('message') ?? '';
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('External localization result: $message')));
          } else if(state is GetExternalLocalizeFailed) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('External localization failed')));
          } else if(state is GetSampleDataSuccess) {
            LoadingDialog.hide(context);
          } else if(state is GetSampleDataFailed) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.exception ?? ''}')));
          }
        } ,
        child: Scaffold(
          body: adaptiveBody(context),
        ),
      ),
    );
  }

  @override
  Widget landscapeBody(BuildContext context, Size size) {
    final language = Language.of(context);
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [ Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(language?.exampleLandscape ?? ''),
            const SizedBox(width: 20,),
            ElevatedButton(onPressed: () => context.read<SampleBloc>().add(GetSampleDataEvent()), child: const Text("Get list data"))
          ],
        ),
          const SizedBox(height: 20,),
          BlocBuilder<SampleBloc, SampleState>(
              buildWhen: (previous, current) => current is GetSampleDataSuccess,
              builder: (context, state) {
                if(state is GetSampleDataSuccess) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) =>
                          Center(child: Text("id: ${state.list[index].id}, name: ${state.list[index].name}"))
                  );
                }
                return const SizedBox();
              })
      ]
      ),
    );
  }

  @override
  Widget portraitBody(BuildContext context, Size size) {
    final language = Language.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(language?.examplePortrait ?? ''),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: () => context.read<SampleBloc>().add(GetSampleDataEvent()), child: const Text("Get list data")),
          const SizedBox(height: 20,),
          BlocBuilder<SampleBloc, SampleState>(
              buildWhen: (previous, current) => current is GetSampleDataSuccess,
              builder: (context, state) {
                if(state is GetSampleDataSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) =>
                        Center(child: Text("id: ${state.list[index].id}, name: ${state.list[index].name}"))
                      );
                }
                return const SizedBox();
              })
        ],
      ),
    );
  }
}



class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          color: Colors.transparent,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(12.0),
          child: const RepaintBoundary(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
