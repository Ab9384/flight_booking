import 'package:extended_image/extended_image.dart';
import 'package:flight/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                  tabController!.animateTo(0, curve: Curves.easeInOut);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ExtendedImage.asset(
                          'assets/icons/home_outlined.png',
                          height: 24,
                          width: 24,
                          color: currentIndex != 0
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                        ExtendedImage.asset(
                          'assets/icons/home_filled.png',
                          height: 24,
                          width: 24,
                          color: currentIndex == 0
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 0
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                  tabController!.animateTo(1);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ExtendedImage.asset(
                          'assets/icons/ticket_outlined.png',
                          height: 24,
                          width: 24,
                          color: currentIndex != 1
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                        ExtendedImage.asset(
                          'assets/icons/ticket_filled.png',
                          height: 24,
                          width: 24,
                          color: currentIndex == 1
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      'Tickets',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 1
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                  tabController!.animateTo(2);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ExtendedImage.asset(
                          'assets/icons/history_outlines.png',
                          height: 24,
                          width: 24,
                          color: currentIndex != 2
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                        ExtendedImage.asset(
                          'assets/icons/history_filled.png',
                          height: 24,
                          width: 24,
                          color: currentIndex == 2
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 2
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  tabController!.animateTo(3);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ExtendedImage.asset(
                          'assets/icons/settings_outlined.png',
                          height: 24,
                          width: 24,
                          color: currentIndex != 3
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                        ExtendedImage.asset(
                          'assets/icons/settings_filled.png',
                          height: 24,
                          width: 24,
                          color: currentIndex == 3
                              ? Theme.of(context).textTheme.bodyLarge!.color
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 10,
                        color: currentIndex == 3
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            HomePageScreen(),
            Center(child: Text('Tickets')),
            Center(child: Text('History')),
            Center(child: Text('Profile')),
          ]),
    );
  }
}
