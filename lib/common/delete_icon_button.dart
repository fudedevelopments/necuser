import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final String dialogMessage;
  final VoidCallback onDelete;

  const DeleteIconButton({
    super.key,
    required this.dialogMessage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 30,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Delete"),
              content: Text(dialogMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    onDelete(); // Trigger the delete callback
                  },
                  child: const Text("Delete"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
