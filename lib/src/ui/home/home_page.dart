import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/app_assets.dart';
import 'package:flutter_application_1/src/ui/dashboard/search_ships.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TrackingWidget(),
                  AvailableVehicles(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.deepPurpleAccent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),

                      // backgroundImage: AssetImage('assets/avatar.png'), // You can replace this with your avatar image
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Lorem Ipsem',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications_rounded,
                    color: Colors.black,
                  ),
                  // backgroundImage: AssetImage('assets/avatar.png'), // You can replace this with your avatar image
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchShipsPage()));
              },
              child: TextField(

                enabled: false, // controller: searchController,
                decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search items...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    // icon: Icon(Icons.qr_code_2,color: Colors.yellow[800],),
                    icon: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.yellow[800],
                      child: Icon(
                        Icons.qr_code_2,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // searchController.clear();
                      // Clear the search text and update the list as needed
                    },
                  ),
                ),
                onChanged: (value) {
                  // Handle search text changes and update the list accordingly
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrackingWidget extends StatelessWidget {
  const TrackingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tracking',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 24, // color: Colors.white,
                        fontWeight: FontWeight.w400)),
                Icon(Icons.add)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 300,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sender',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            'NEJSWFCSDF56XX',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 17),
                          ),
                        ],
                      ),
                      Icon(Icons.fire_truck)
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.2),
                              shape: BoxShape.circle),
                          child: Icon(Icons.outbox_rounded),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sender',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              'Atlanta,43',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            Text(
                              '2 day - 3 days',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(.2),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.move_to_inbox_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reciever',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              'Shicago,43',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          'Waiting to collect',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 17),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  // thickness: 1,
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.yellow[800],
                    ),
                    Text(
                      'Add stop',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 17, color: Colors.yellow[800]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableVehicles extends StatelessWidget {
  const AvailableVehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Avaiable Vehicles',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 24, // color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,

            itemCount: 4,
            itemBuilder: (context,index) {
              return Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(top: 15, left: 10,right: 10,bottom: 5),
                height: 190,

                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,


                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ocean Freight',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 20, // color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'International',
                          style:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                          ),
                        ),

                    ],),
                    Image.asset(AppAssets.mindTree,scale: 10,)
                  ],
                ),
              );
            }
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
