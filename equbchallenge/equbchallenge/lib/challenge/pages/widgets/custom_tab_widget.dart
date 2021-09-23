import 'package:equbchallenge/challenge/pages/widgets/widgets.dart';
import 'package:equbchallenge/challenge/provider/collected_money_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTab extends StatefulWidget {
  @override
  CustomTabState createState() => CustomTabState();
}

class CustomTabState extends State<CustomTab> {
  List<String> titles = [
    "Salary",
    "Travel Stipend",
    "Rent Contract",
    "Equb",
    "Profit",
    "Freelance",
    "Salary",
    "Travel Stipend",
    "Rent Contract",
    "Equb",
    "Profit",
    "Freelance",
    "Salary",
    "Travel Stipend",
    "Rent Contract",
    "Equb",
    "Profit",
    "Freelance"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size(100, 100),
                child: Container(
                  height: 30,
                  child: TabBar(
                    unselectedLabelColor: Colors.green[400],
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green[400]),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: Border.all(color: Colors.green[400], width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Money Collected"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: Border.all(color: Colors.green[400], width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Money Due"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // create widgets for each tab bar here
          SizedBox(
              height: 500,
              child: TabBarView(children: [
                // first tab bar view widget
                Consumer<CollectedMoneysProvider>(
                  builder: (_, state, __) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 500,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              state.collectedPayment.length,
                              (index) => MoneyCard(
                                  collectedMoney: state.collectedPayment[index],
                                  title: titles[index])),
                        ),
                      ),
                    );
                  },
                ),

                // second tab bar viiew widget
                Container(),
              ]))
        ],
      ),
    );
  }
}
