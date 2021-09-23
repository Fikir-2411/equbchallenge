import 'package:equbchallenge/challenge/models/due_payments_model.dart';
import 'package:equbchallenge/challenge/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DuePaymentCard extends StatelessWidget {
  final DuePaymentModel duePaymentModel;
  final String name;
  DuePaymentCard({Key? key, required this.duePaymentModel, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
            )
          ]),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            child: Image.asset('images/image${duePaymentModel.id}.jpg'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(name),
          CustomRow(
            topPadding: 10,
            bottomPadding: 3,
            leftPadding: 0,
            color: Colors.red,
            text: duePaymentModel.owedAmount.toString(),
            iconData: Icons.monetization_on,
          ),
          CustomRow(
            bottomPadding: 10,
            leftPadding: 0,
            text: differenceChecker(duePaymentModel.dueDate),
            iconData: Icons.watch_later,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 100, height: 25),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Paid ${duePaymentModel.owedAmount} to $name')));
              },
              child: const Text(
                "Pay",
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side:
                      MaterialStateProperty.all(BorderSide(color: Colors.red)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
            ),
          )
        ],
      ),
    );
  }
}

String differenceChecker(time) {
  String timeLeft = "";
  time.difference(DateTime.now()).inDays != 0
      ? timeLeft = "${time.difference(DateTime.now()).inDays} days"
      : time.difference(DateTime.now()).inHours != 0
          ? timeLeft = "${time.difference(DateTime.now()).inHours} hours"
          : timeLeft = "${time.difference(DateTime.now()).inMinutes} minutes";
  return timeLeft;
}
