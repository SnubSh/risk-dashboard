import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Dashboard'.toUpperCase(), style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
            //SfCartesianChart()
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text('Frecuencia')
                ),
                
                Column(
                  children: [
                    _ColumnColors(
                      name: 'insignificante',
                      colors: [
                        Colors.orange,
                        Colors.orange,
                        Colors.redAccent,
                        Colors.redAccent,
                        Colors.redAccent,
                      ],
                    ),
                    
                  ],
                ),
                _ColumnColors(
                  name: 'menor',
                  colors: [
                Colors.green,
                Colors.yellow.shade600,
                Colors.orange,
                Colors.redAccent,
                Colors.redAccent,
                  ],
                ),
                _ColumnColors(
                  name: 'Moderado',
                  colors: [
                Colors.green,
                Colors.yellow.shade600,
                Colors.yellow.shade600,
                Colors.orange,
                Colors.redAccent,
                  ],
                ),
                _ColumnColors(
                  name: 'Mayor',
                  colors: [
                Colors.green,
                Colors.green,
                Colors.yellow.shade600,
                Colors.yellow.shade600,
                Colors.orange,
                  ],
                ),
                _ColumnColors(
                  name: 'Catastrófico',
                  colors: [
                Colors.green,
                Colors.green,
                Colors.green,
                Colors.yellow.shade600,
                Colors.orange,
                  ],
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}

class _ColumnColors extends StatelessWidget {
  const _ColumnColors({
    required this.colors, 
    required this.name
  });
  final List<Color> colors;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _ContainerColor(color: colors[0]),
          _ContainerColor(color: colors[1]),
          _ContainerColor(color: colors[2]),
          _ContainerColor(color: colors[3]),
          _ContainerColor(color: colors[4]),
          RotatedBox(
            quarterTurns: 3,
            child: Text(name)
          ),
        ],
      ),
    );
  }
}

class _ContainerColor extends StatelessWidget {
  const _ContainerColor({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5)
      ),
      width: 50,
      height: 30,
    );
  }
}