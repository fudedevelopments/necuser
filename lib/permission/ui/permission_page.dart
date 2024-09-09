import 'package:flutter/material.dart';
import 'package:necuser/permission/ui/events_permission.dart';
import 'package:necuser/utils.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigationpush(context, const ElegantForm());
      },
      tooltip: "Make a Permission Request", child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
