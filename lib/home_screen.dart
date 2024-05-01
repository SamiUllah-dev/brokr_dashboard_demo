import 'package:brokr_dashboard_demo/core/theme/app_theme.dart';
import 'package:brokr_dashboard_demo/features/payouts/presentation/screens/payout_screen.dart';
import 'package:flutter/material.dart';

// Note This is just a dummy app
// For production app, Strings should not
// be hardcoded like this and colors should be
// used from the theme instead of hardcoding
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // dummy selection index
  int selectedIndex = 4;
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insights',
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: const Color(0xff676A6F),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          controller: _tabController,
          tabAlignment: TabAlignment.fill,
          tabs: const [
            Tab(text: 'Performance'),
            Tab(text: 'Earnings'),
            Tab(text: 'Payouts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _dummyScreenText(context, 'Performance...'),
          _dummyScreenText(context, 'Earnings...'),
          const PayoutScreen(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          // splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: context.colorScheme.primary,
          unselectedItemColor: const Color(0xff9E9E9E),
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: context.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: context.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Center _dummyScreenText(BuildContext context, String text) {
    return Center(
      child: Text(
        text,
        style: context.textTheme.bodyLarge?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
