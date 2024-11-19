import 'package:flutter/material.dart';

onFailure(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      content: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
