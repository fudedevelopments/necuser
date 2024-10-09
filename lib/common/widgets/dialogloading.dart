import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


 loadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent, // Make background transparent
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 70.0,
              ),
            ),
          ),
        );
      },
    );
  }
