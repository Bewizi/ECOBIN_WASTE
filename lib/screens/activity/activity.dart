import 'package:ecobin/screens/pickup_details/pickup_details_details.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/text_format.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(
                headingText: 'Your Waste Activity',
                color: Color.fromRGBO(28, 32, 42, 1),
              ),
              SubText(
                text: 'Here’s how you’re helping the planet',
                color: Color.fromRGBO(87, 94, 108, 1),
              ),

              SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Recycled
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(245, 247, 250, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.restore_from_trash,
                              size: 20,
                              color: Color.fromRGBO(87, 94, 108, 1),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Total Recycled',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(87, 94, 108, 1),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        RichText(
                          text: TextSpan(
                            text: '23KG  ',
                            children: [
                              TextSpan(
                                text: 'this month',
                                style: TextStyle(
                                  color: Color.fromRGBO(116, 124, 141, 1),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Pickup Completed
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(245, 247, 250, 1),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              size: 20,
                              color: Color.fromRGBO(87, 94, 108, 1),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Total Recycled',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(87, 94, 108, 1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: '4 ',
                            children: [TextSpan(text: 'pickups')],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Carbon dioxide CO2
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 247, 250, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Color.fromRGBO(87, 94, 108, 1),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'CO₂ Saved',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(87, 94, 108, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '18 kg of CO₂ emissions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //   Pickup Summary
              HeaderText(
                headingText: 'Pickup Summary',
                color: Color.fromRGBO(28, 32, 42, 1),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7FA), // background color like design
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                      30,
                    ), // green background for active tab
                  ),
                  labelColor: Color(0xFF34A853),
                  unselectedLabelColor: Color(0xFF1C202A),
                  labelStyle: TextStyle(fontSize: 18),
                  tabs: [
                    Tab(child: Text("Week")),
                    Tab(child: Text("Month")),
                    Tab(child: Text("All Time")),
                  ],
                ),
              ),

              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: Text('hello')),
                    Center(child: Text('Month')),
                    Center(child: Text('All Time')),
                  ],
                ),
              ),

              SizedBox(height: 20),

              CompleteButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PickupDetailsDetails();
                      },
                    ),
                  );
                },
                'Request new pickup',
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Navbar(''),
    );
  }
}
