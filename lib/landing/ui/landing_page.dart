// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necuser/common/error_message_screen.dart';
import 'package:necuser/home/ui/home.dart';
import 'package:necuser/landing/landiing_bloc/landing_page_bloc.dart';
import 'package:necuser/landing/userattributesbloc/userattributes_bloc.dart';
import 'package:necuser/permission/ui/permission_page.dart';
import 'package:necuser/userdetials/ui/user_details.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.request_page), label: "Request Permission"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined), label: "Academic Calender"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined), label: "Profile"),
];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserattributesBloc>(context).add(GetUserAttributesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, landingstate) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0), // AppBar height
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue, // Start color
                    Colors.purple, // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo Image
                    Image.asset(
                      'assets/images/logo.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),

                    const Text(
                      'NEC Management',
                      style: TextStyle(
                        fontFamily: 'CustomFont',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<UserattributesBloc, UserattributesState>(
            builder: (context, state) {
              if (state is GetUserAttributesSuccessState) {
                List<Widget> bottomnaviScreen = [
                  HomeScreen(
                    student: state.student,
                  ),
                  PermissionsPage(
                    student: state.student,
                  ),
                  const Text("Index : Academic calender"),
                  UserDetailsPage(
                    student: state.student,
                  )
                ];
                return Center(
                  child: bottomnaviScreen.elementAt(landingstate.tabindex),
                );
              }
              if (state is GetUserAttributesFailureState) {
                return const GradientErrorScreen(message1: "No Student Record Found", message2: "Please Contact the higher Authority");
              } else {
                return const Center(
                  child:
                   CircularProgressIndicator(),
                );
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomnavItem,
            currentIndex: landingstate.tabindex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChangeEvent(tabindex: index));
            },
          ),
        );
      },
    );
  }
}
