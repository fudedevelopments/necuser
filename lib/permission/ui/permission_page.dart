import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:necuser/common/skelecton_loading_indicator.dart';
import 'package:necuser/permission/bloc/permisson_bloc.dart';
import 'package:necuser/permission/ui/events_permission.dart';
import 'package:necuser/utils.dart';

class PermissionsPage extends StatefulWidget {
  final List<String> userattributes;
  const PermissionsPage({
    super.key,
    required this.userattributes,
  });

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PermissonBloc>(context)
        .add(GetStudentUsingAttributes(email: widget.userattributes[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PermissonBloc, PermissonState>(
          builder: (context, state) {
            if (state is GetStudentUsingAttributesSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Make a Request',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(0.4),
                              Colors.lightBlueAccent.withOpacity(0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: ${state.student.studentname}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Email: ${state.student.email}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      navigationpush(
                                        context,
                                        ElegantForm(
                                          student: state.student,
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.add_outlined),
                                    tooltip: 'Add Request',
                                    iconSize: 30.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Your Requests :',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        itemCount: state.ondutylist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.grey[300]!,
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16.0),
                                    title: Text(
                                      state.ondutylist[index].ondutyname!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Date: ${state.ondutylist[index].date}"),
                                        Text(
                                            "Location: ${state.ondutylist[index].location}"),
                                        const Row(
                                          children: [
                                            Text("Proctor Approval : "),
                                            
                                            Icon(
                                              Ionicons.checkmark_circle,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text("Ac Approval         : "),
                                            Icon(
                                              Ionicons.checkmark_circle,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text("Hod Approval      : "),
                                            Icon(
                                              Ionicons.checkmark_circle,
                                              color: Colors.green,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
            } else if (state is GetStudentUsingAttributesLoadingState) {
              return const Center(child: SkeletonLoadingScreen());
            } else {
              return const Center(child: Text("No data found"));
            }
          },
        ),
      ),
    );
  }
}
