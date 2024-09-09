import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necuser/common/error_unknown.dart';
import 'package:necuser/home/bloc/homebloc_bloc.dart';
import 'package:necuser/home/ui/annoucement_list.dart';
import 'package:necuser/home/ui/event_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showEvents = true;



  final List<String> bannerImages = [
    'https://m.media-amazon.com/images/S/pv-target-images/3f45cfea260e9fd092200a204f7694477381851324d915bcfc24fd4311a31b19._SX1080_FMjpg_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLGgAXif2avEaT21tq-b3ov-3pb1FLChgQ0A&s',
    'https://images.collegedunia.com/public/college_data/images/appImage/14420_NANDHA.jpg?h=260&w=360&mode=crop',
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeblocBloc>(context).add(HomePageQueryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Announcements & Events',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<HomeblocBloc, HomeblocState>(
        builder: (context, state) {
          if (state is HomePageQuerySuccessState) {
            return Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                ),
                items: bannerImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showEvents = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              showEvents ? Colors.white : Colors.blue,
                          backgroundColor:
                              showEvents ? Colors.blue : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.blue),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Events'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showEvents = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              !showEvents ? Colors.white : Colors.blue,
                          backgroundColor:
                              !showEvents ? Colors.blue : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.blue),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Announcements'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              showEvents == true
                  ? EventListScreen(events: state.events)
                  : AnnouncementsPage()
            ]);
          }
          if (state is HomepagequeryLoadingstate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return const ErrorUnkown();
          }
        },
      ),
    );
  }
}
