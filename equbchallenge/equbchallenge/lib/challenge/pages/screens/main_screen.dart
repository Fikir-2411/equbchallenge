import 'package:equbchallenge/challenge/pages/widgets/widgets.dart';
import 'package:equbchallenge/challenge/provider/collected_money_provider.dart';
import 'package:equbchallenge/challenge/provider/due_payments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Provider.of<DuePaymentsPageProvider>(context, listen: false)
        .setDuePayments();
    Provider.of<CollectedMoneysProvider>(context, listen: false)
        .setCollectedMoneys();
    super.initState();
  }

  List<String> titles = [
    "Salary",
    "Travel Stipend",
    "Rent Contract",
    "Equb",
    "Profit",
    "Freelance",
    "NSalary",
    "NTravel Stipend",
    "NRent Contract",
    "NEqub",
    "NProfit",
    "NFreelance",
    "NNSalary",
    "NNTravel Stipend",
    "NNRent Contract",
    "NNEqub",
    "NNProfit",
    "NNFreelance"
  ];
  List<String> bankNames = ["Dashen", "Abyssinia", "Enat"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const CircleAvatar(
          backgroundColor: Colors.black12,
        ),
        actions: const [
          Icon(
            Icons.bookmark_add_outlined,
            color: Colors.grey,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ExpansionWidget(),
            Consumer<DuePaymentsPageProvider>(builder: (_, state, __) {
              return Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DuePaymentCard(
                          duePaymentModel: state.duePayments[index],
                          name: bankNames[index]);
                    },
                    itemCount: state.duePayments.length,
                  ));
            }),
            Consumer<CollectedMoneysProvider>(
              builder: (_, state, __) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 500,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: 1,
                        ),
                        itemCount: state.collectedPayment.length,
                        itemBuilder: (context, index) {
                          return MoneyCard(
                              collectedMoney: state.collectedPayment[index],
                              title: titles[index]);
                        }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
