import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpansionWidget extends StatelessWidget {
  const ExpansionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(flex: 1, child: EntryItem(data));
  }
}

class Entry {
  Entry(this.title, this.widget);
  final String title;
  final Widget widget;
}

Entry data = Entry('Hi alem', const Charts());

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    return ExpansionTile(
      maintainState: true,
      initiallyExpanded: false,
      title: Text(root.title),
      key: PageStorageKey<Entry>(root),
      children: [root.widget],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: _buildTiles(entry));
  }
}

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<DebtData> data = [
    DebtData('Abyssinia Bank', 10),
    DebtData('Dashen Bank', 20),
    DebtData('Commercial Bank of Ethiopia', 25),
    DebtData('Berhan Bank', 8),
    DebtData('Enat Bank', 12),
    DebtData('Wegagen Bank', 23),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      palette: const <Color>[
        Colors.orange,
        Colors.red,
        Colors.purple,
        Colors.blue,
        Colors.green,
        Colors.yellow
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          horizontalAlignment: ChartAlignment.center,
          widget: Container(
              child: const Text(
            'ETB 2000',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
          )),
        ),
        CircularChartAnnotation(
          horizontalAlignment: ChartAlignment.center,
          verticalAlignment: ChartAlignment.near,
          widget: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Dashen Bank',
                style: TextStyle(fontSize: 11, color: Colors.black),
              )),
        )
      ],
      onDataLabelTapped: (DataLabelTapDetails args) {
        // print(args.seriesIndex);
      },
      legend: Legend(
        isVisible: true,
        position: LegendPosition.left,
        // toggleSeriesVisibility: true,
        // opacity: 0.5),
      ),
      series: <DoughnutSeries<DebtData, String>>[
        DoughnutSeries<DebtData, String>(
            explode: true,
            dataSource: data,
            xValueMapper: (DebtData data, _) => data.bankName,
            yValueMapper: (DebtData data, _) => data.debt,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              useSeriesColor: false,
              textStyle: TextStyle(color: Colors.white, fontSize: 12),
              labelPosition: ChartDataLabelPosition.inside,
            ),
            legendIconType: LegendIconType.circle,
            radius: '95%',
            innerRadius: '75%')
      ],
    );
  }
}

class DebtData {
  final String bankName;
  final double debt;

  DebtData(this.bankName, this.debt);
}
