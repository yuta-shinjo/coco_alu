import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/pages/home_page/src/public_map_page.dart';
import 'package:my_collection/ui/pages/home_page/src/public_memory_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HolderPageState createState() => _HolderPageState();
}

class _HolderPageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: tabs.length, initialIndex: currentIndex, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace & Columnによって、appBarの良い位置にTabBarを配置
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              tabs: tabs,
              controller: tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textDisable,
              indicatorColor: AppColors.primary,
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          PublicMemoryPage(),
          PublicMapPage(),
        ],
      ),
    );
  }

  List<Tab> tabs = <Tab>[
    Tab(
      key: const Key('holder_createId'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.public),
          SizedBox(width: 20),
          Text('みんなの思い出', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
    Tab(
      key: const Key('holder_boughtId'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.location_on),
          SizedBox(width: 20),
          Text('みんなのマップ', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  ];
}
