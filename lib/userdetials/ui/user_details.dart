// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:necuser/common/error_unknown.dart';
import 'package:necuser/common/errorscreen.dart';
import 'package:necuser/common/skelecton_loading_indicator.dart';
import 'package:necuser/models/Student.dart';
import 'package:necuser/userdetials/bloc/userdetails_bloc.dart';

class UserDetailsPage extends StatefulWidget {
   final Student student;

  const UserDetailsPage({
    super.key,
    required this.student,
  });

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserdetailsBloc>(context)
        .add(GetAllUserDataEvent(student: widget.student));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: BlocBuilder<UserdetailsBloc, UserdetailsState>(
        builder: (context, state) {
          if (state is GetUserDataSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.student.studentname!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, 
                            overflow: TextOverflow
                                .ellipsis, 
                          ),
                          Text(
                            widget.student.email!,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        buildElevatedListTile(
                            'Classroom : ${widget.student.classRoom ?? "No user is assigned"}'),
                        buildElevatedListTile(
                            'Proctor : ${widget.student.proctor ?? "No user is assigned"}'),
                        buildElevatedListTile(
                            'Academic Coordinator : ${state.ac!.acname ?? "No user is assigned"}'),
                        buildElevatedListTile(
                            'HOD : ${state.hod!.hodname ?? "No user is assigned"}'),
                        buildLogoutButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is GetUserDataLoadingState) {
            return const SkeletonLoadingScreen();
          }
          if (state is GetUserDataFailureState) {
            return const ErrorScreen();
          } else {
            return const ErrorUnkown();
          }
        },
      ),
    );
  }

  Widget buildElevatedListTile(String title) {
    return Card(
      elevation: 3,
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  // Function to create a logout button
  Widget buildLogoutButton(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.red[100], // Light red background for the logout button
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: const Text(
          'Logout',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
        trailing: const Icon(Icons.logout, color: Colors.red),
        onTap: () {
          // Handle logout logic
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text('Logout'),
                  onPressed: () {
                    // Perform logout action
                    Navigator.of(context).pop();
                    // Redirect or perform any other action after logout
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
