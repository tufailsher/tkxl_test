import 'package:flutter/material.dart';

class SearchShipsPage extends StatelessWidget {
  final List<SearchShips> searchingList = [
    SearchShips(name: "Ship 1", number: "12345", status: "Active"),
    SearchShips(name: "Ship 2", number: "67890", status: "Inactive"),
    SearchShips(name: "Ship 3", number: "54321", status: "Active"),
    // Add more ships to the list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShipList(searchingList: searchingList),
    );
  }
}

class ShipList extends StatefulWidget {
  final List<SearchShips> searchingList;

  ShipList({required this.searchingList});

  @override
  _ShipListState createState() => _ShipListState();
}

class _ShipListState extends State<ShipList> {
  TextEditingController searchController = TextEditingController();
  List<SearchShips> filteredList = [];

  @override
  void initState() {
    filteredList = widget.searchingList;
    super.initState();
  }

  void filterShips(String query) {
    setState(() {
      filteredList = widget.searchingList
          .where(
              (ship) => ship.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(
          controller: searchController,
          onChanged: filterShips,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(filteredList[index].name),
                      Text(
                          'Number: ${filteredList[index].number}\nStatus: ${filteredList[index].status}'),
                      Divider(
                        endIndent: 20,
                        indent: 20,
                      )
                    ]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarWidget extends StatelessWidget {
  final TextEditingController controller;
  void Function(String)? onChanged;

  AppBarWidget({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.deepPurpleAccent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search items...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.yellow[800],
                          child: Icon(
                            Icons.qr_code_2,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchShips {
  final String name;
  final String number;
  final String status;

  SearchShips({required this.name, required this.number, required this.status});
}
