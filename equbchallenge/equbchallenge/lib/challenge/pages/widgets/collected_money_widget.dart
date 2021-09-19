import 'package:equbchallenge/challenge/models/collected_money_model.dart';
import 'package:equbchallenge/challenge/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MoneyCard extends StatefulWidget {
  final CollectedMoneyModel collectedMoney;
  final String title;
  MoneyCard({Key? key, required this.collectedMoney, required this.title})
      : super(key: key);

  @override
  State<MoneyCard> createState() => _MoneyCardState();
}

class _MoneyCardState extends State<MoneyCard> {
  Map<String, bool> bookmark = {
    "Salary": true,
    "Travel Stipend": true,
    "Rent Contract": true,
    "Equb": true,
    "Profit": true,
    "Freelance": true,
    "NSalary": true,
    "NTravel Stipend": true,
    "NRent Contract": true,
    "NEqub": true,
    "NProfit": true,
    "NFreelance": true,
    "NNSalary": true,
    "NNTravel Stipend": true,
    "NNRent Contract": true,
    "NNEqub": true,
    "NNProfit": true,
    "NNFreelance": true
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            horizontalTitleGap: 5,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 15),
            ),
            subtitle: CustomRow(
              text: freq(widget.collectedMoney.frequency),
              iconData: Icons.watch_later,
              leftPadding: 0,
              fontWeight: FontWeight.w300,
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.monetization_on,
                color: Colors.green,
                size: 35,
              ),
            ),
          ),
          CustomRow(
            iconData: Icons.alarm,
            text: "7 Earnings",
          ),
          SizedBox(
            height: 2,
          ),
          CustomRow(
              iconData: Icons.monetization_on,
              text: "ETB ${widget.collectedMoney.amount}"),
          CustomRow(
            iconData: Icons.people_alt,
            text: "${widget.collectedMoney.membersCount} Members",
            iconData2: bookmark[widget.title]!
                ? Icons.bookmark_outline
                : Icons.bookmark,
            onPressed: () {
              setState(() {
                if (bookmark[widget.title]!) {
                  bookmark[widget.title] = false;
                  print('saved');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Bookmarked ${widget.collectedMoney.amount} payment')));
                } else {
                  bookmark[widget.title] = true;
                }
              });
            },
          )
        ],
      ),
    );
  }
}

String freq(int frequency) {
  String fr = "";
  frequency % 2 == 0
      ? fr = "Monthly"
      : frequency % 3 == 0
          ? fr = "Weekly"
          : fr = "Annual";
  return fr;
}
