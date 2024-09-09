// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necuser/home/ui/home.dart';
import 'package:necuser/landing/landiing_bloc/landing_page_bloc.dart';
import 'package:necuser/permission/ui/permission_page.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.request_page), label: "Request Permission"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined), label: "Academic Calender"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined), label: "Profile"),
];

List<Widget> bottomnaviScreen = [
  const HomeScreen(),
  const PermissionsPage(),
  const Text("Index : Academic calender"),
  const Text("Index : profile"),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
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
          body: Center(
            child: bottomnaviScreen.elementAt(state.tabindex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomnavItem,
            currentIndex: state.tabindex,
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
