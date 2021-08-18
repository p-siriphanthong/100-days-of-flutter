import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_auth/widgets/platform_widget.dart';

class InfoDialog extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final String title;
  final String? description;
  final void Function() onClose;

  const InfoDialog({
    Key? key,
    required this.title,
    required this.onClose,
    this.description,
  }) : super(key: key);

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: description != null ? Text(description!) : null,
      actions: [
        TextButton(
          child: Text('OK'),
          style: TextButton.styleFrom(primary: Colors.blue),
          onPressed: onClose,
        ),
      ],
    );
  }

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: description != null ? Text(description!) : null,
      actions: [
        TextButton(
          child: Text('OK'),
          style: TextButton.styleFrom(primary: Colors.blue),
          onPressed: onClose,
        ),
      ],
    );
  }
}
