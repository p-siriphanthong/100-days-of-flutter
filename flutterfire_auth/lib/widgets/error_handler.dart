import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutterfire_auth/controllers/error_controller.dart';
import 'package:flutterfire_auth/widgets/info_dialog.dart';

class ErrorHandler extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  ErrorHandler({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);

  @override
  _ErrorHandlerState createState() => _ErrorHandlerState();
}

class _ErrorHandlerState extends State<ErrorHandler> {
  final ErrorController error = Get.put(ErrorController());
  bool _isShowingErrorDialog = false;

  void _showAlertDialog() {
    final navigatorContext = widget.navigatorKey.currentState?.overlay?.context;

    if (navigatorContext != null && !_isShowingErrorDialog) {
      showDialog(
        context: navigatorContext,
        builder: (BuildContext context) => InfoDialog(
          title: error.message,
          onClose: () {
            widget.navigatorKey.currentState!.pop('dialog');
            error.clearError();

            setState(() {
              _isShowingErrorDialog = false;
            });
          },
        ),
      );

      setState(() {
        _isShowingErrorDialog = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (error.message == '') return widget.child;

      return FutureBuilder(
        builder: (context, snapshot) => widget.child,
        future: Future.delayed(Duration.zero, _showAlertDialog),
      );
    });
  }
}
