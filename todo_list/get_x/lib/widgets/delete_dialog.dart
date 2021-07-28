import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo_list/widgets/platform_widget.dart';

class DeleteDialog extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final String title;
  final void Function() onDelete;
  final void Function() onCancel;

  const DeleteDialog({
    Key? key,
    required this.title,
    required this.onDelete,
    required this.onCancel,
  }) : super(key: key);

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(title),
      actions: [
        TextButton(
          child: Text('Cancel'),
          style: TextButton.styleFrom(primary: Colors.black54),
          onPressed: onCancel,
        ),
        TextButton(
            child: Text('Delete'),
            style: TextButton.styleFrom(primary: Colors.red),
            onPressed: onDelete),
      ],
    );
  }

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(
      content: Text(title),
      actions: [
        TextButton(
          child: Text('Cancel'),
          style: TextButton.styleFrom(primary: Colors.grey),
          onPressed: onCancel,
        ),
        TextButton(
            child: Text('Delete'),
            style: TextButton.styleFrom(primary: Colors.red),
            onPressed: onDelete),
      ],
    );
  }
}
