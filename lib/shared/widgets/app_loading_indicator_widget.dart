import 'package:flutter/material.dart';

import '../../application/app_view/app_view.dart';

class AppLoadingIndicator extends StatelessWidget {
  final bool centered;

  const AppLoadingIndicator({Key? key, this.centered = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return centered
        ? const Center(child: _AppLoadingIndicator())
        : const _AppLoadingIndicator();
  }
}

class _AppLoadingIndicator extends StatelessWidget {
  const _AppLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 1.5,
      backgroundColor: ColorsMg.grey10,
      valueColor: AlwaysStoppedAnimation(ColorsMg.primary),
    );
  }
}

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({Key? key, this.onUserDismiss}) : super(key: key);
  final Future<bool> Function()? onUserDismiss;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onUserDismiss ?? () => Future.value(false),
      child: const Scaffold(
        backgroundColor: Colors.black45,
        body: AppLoadingIndicator(centered: true),
      ),
    );
  }
}
