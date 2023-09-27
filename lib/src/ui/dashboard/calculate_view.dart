import 'package:flutter/material.dart';

class CalculateView extends StatefulWidget {
  CalculateView({super.key});

  @override
  _CalculateViewState createState() => _CalculateViewState();
}

class _CalculateViewState extends State<CalculateView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple[600]!,
            title: Text('Calculate'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DestinationWidget(),
              PackingWidget(),
              CategoriesWidget(),
            ],
          ),
        ));
  }
}

class PackingWidget extends StatelessWidget {
  PackingWidget({Key? key}) : super(key: key);

  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Packing',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 22,
                // color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'What are you sending?',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  // color: Colors.white,
                ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            margin: EdgeInsets.only(right: 20, top: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                          padding: EdgeInsets.zero,
                          isDense: true,
                          isExpanded: true,
                          value: selectedValue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              isDense: true,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.sensor_door,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 20,
                                    width: 1,
                                  )
                                ],
                              )),
                          items: ['Option 1', 'Option 2', 'Option 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {}),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidget();
}

class _CategoriesWidget extends State<CategoriesWidget> {
  final List<String> _options = [
    'Document',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 22,
                // color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'What are you sending?',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  // color: Colors.white,
                ),
          ),
          Column(
            children: [
              Wrap(
                children: _options
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  side: MaterialStatePropertyAll(
                                      BorderSide(width: .5))),
                              onPressed: () {},
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.black),
                              )),
                        ))
                    .toList(),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 60,

            margin: EdgeInsets.only(top: 20,bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(30)

            ),
            child: Text('Calculate',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          )
        ],
      ),
    );
  }
}

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Destination',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 22,
                    // color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: '2972 Westheimer, Illin',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.outbox_rounded,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 20,
                          width: 1,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Receiver location',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.move_to_inbox,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 20,
                          width: 1,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Approx weight',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.hourglass_bottom,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 20,
                          width: 1,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
