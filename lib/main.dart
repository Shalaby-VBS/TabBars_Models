import 'package:flutter/material.dart';
import 'indicators.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter All TabBar Models',
      theme: ThemeData(useMaterial3: true),
      home: const AllTabBarsScreen(),
    );
  }
}

class AllTabBarsScreen extends StatefulWidget {
  const AllTabBarsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllTabBarsScreenState createState() => _AllTabBarsScreenState();
}

class _AllTabBarsScreenState extends State<AllTabBarsScreen>
    with SingleTickerProviderStateMixin {
  // MARK: - TabController.
  late TabController _tabController;

  // MARK: - Text tabs.
  final List<Tab> _tabs = const [
    Tab(text: 'Home'),
    Tab(text: 'Search'),
    Tab(text: 'Settings'),
  ];

  // MARK: - Icon tabs.
  final List<Tab> _iconTabs = const [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.settings)),
  ];

  // MARK: - Single tab.
  final List<Tab> _singleTab = const [
    Tab(
      icon: Icon(Icons.home),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.search),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Search",
    ),
    Tab(
      icon: Icon(Icons.settings),
      iconMargin: EdgeInsets.only(top: 2),
      text: "Settings",
    ),
  ];

  // MARK: - Tab shape.
  final List<Widget> _bodyTabs = [
    const SingleTabView(
      icon: Icons.home,
      title: 'Home',
    ),
    const SingleTabView(
      icon: Icons.search,
      title: 'Search',
    ),
    const SingleTabView(
      icon: Icons.settings,
      title: 'Settings',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "All TabBar Models",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  // * 1
                  TabBar(
                    controller: _tabController,
                    tabs: _tabs,
                    labelColor: Colors.deepPurple,
                    indicatorColor: Colors.deepPurple,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  // * 2
                  TabBar(
                    controller: _tabController,
                    tabs: _tabs,
                    labelColor: Colors.deepPurple,
                    indicatorColor: Colors.deepPurple,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                  // * 3
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.deepPurple,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const MaterialDesignIndicator(
                      indicatorHeight: 4,
                      indicatorColor: Colors.deepPurple,
                    ),
                    tabs: _tabs,
                  ),
                  // * 4
                  TabBar(
                    controller: _tabController,
                    tabs: _iconTabs,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.deepPurple,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                  ),
                  // * 5
                  TabBar(
                    controller: _tabController,
                    tabs: _tabs,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.deepPurple,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                  ),
                  // * 6
                  Container(
                    height: kToolbarHeight - 8.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.deepPurple,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: _tabs,
                    ),
                  ),
                  // * 7
                  Container(
                    height: kToolbarHeight - 8.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.deepPurple,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: _singleTab,
                    ),
                  ),
                  // * 8
                  Container(
                    height: kToolbarHeight + 8.0,
                    padding: const EdgeInsets.only(
                        top: 16.0, right: 16.0, left: 16.0),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          color: Colors.white),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      tabs: _tabs,
                    ),
                  ),
                ]
                    .map(
                      (item) => Column(
                        children: [
                          item,
                          const Divider(
                            color: Colors.transparent,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: _bodyTabs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTabView extends StatelessWidget {
  const SingleTabView({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.deepPurple,
          ),
          Text(
            "$title contents\nlike image, info or...",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
