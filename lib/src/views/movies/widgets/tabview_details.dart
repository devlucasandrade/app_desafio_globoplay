import 'package:flutter/material.dart';

class TabviewDetails extends StatefulWidget {
  const TabviewDetails({Key? key}) : super(key: key);

  @override
  State<TabviewDetails> createState() => _TabviewDetailsState();
}

class _TabviewDetailsState extends State<TabviewDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Container(
        height: 200,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey.shade600,
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: const [
                  Tab(text: 'ASSISTA TAMBÉM'),
                  Tab(text: 'DETALHES'),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 100,
              child: TabBarView(
                controller: tabController,
                children: const [
                  Center(child: Text('Página 01')),
                  Center(child: Text('Página 02')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
