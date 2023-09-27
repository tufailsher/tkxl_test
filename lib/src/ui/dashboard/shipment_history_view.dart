import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/app_assets.dart';

class ShipmentHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShipList(),
    );
  }
}

class ShipList extends StatefulWidget {
  ShipList({super.key});

  @override
  _ShipListState createState() => _ShipListState();
}

class _ShipListState extends State<ShipList> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5,
        vsync: this); // Change the length to the number of tabs you want
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
        backgroundColor: Colors.deepPurple[600]!,
        title: Text('Shipment History'),
        bottom: TabBar(
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: Colors.yellow[800]!, strokeAlign: 10, width: 3)),
          indicatorColor: Colors.yellow[800]!,
          // labelColor: Colors.deepPurple[600]!,

          controller: _tabController,
          isScrollable: true,
          // Make the tabs scrollable
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
            Tab(text: 'In progress'),
            Tab(text: 'Pending Order'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Replace these with your tab content widgets
          ShipmentHistory(),
          Center(child: Text('Tab 2 Content')),
          Center(child: Text('Tab 23 Content')),
          Center(child: Text('Tab 4 Content')),
          Center(child: Text('Tab 5 Content')),
        ],
      ),
    );
  }
}

class ShipmentHistory extends StatelessWidget {
  const ShipmentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Shipments',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 22,
                      // color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 20,),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.loop,
                                color: Colors.green,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'in-progress',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'Arriving Today!',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Your delivery, #NEJ34534',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          'From Atlanta, is arriving today',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$650 USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 14,
                                      color: Colors.deepPurple[600]!,
                                      fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  shape: BoxShape.circle),
                            ),
                            Text(
                              'Sep 20, 2023 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      AppAssets.colorBox,
                      height: 80,
                      width: 80,
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
