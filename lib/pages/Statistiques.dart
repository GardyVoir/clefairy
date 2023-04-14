import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

class StatGauge extends StatelessWidget {
  final String label;
  final int? value;
  final int maxValue;

  const StatGauge({
    Key? key,
    required this.label,
    required this.value,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = (value?.toDouble() ?? 0) / maxValue.clamp(1, maxValue).toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(201, 45, 54, 0.9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Statistiques extends StatefulWidget {
  const Statistiques({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;
  @override
  State<Statistiques> createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    final stats = widget.pokemon.stats;
    if (stats == null || stats.isEmpty) {
      return const Text("No stats found");
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 2),
                          for (var stat in stats)
                            StatGauge(
                              label: stat.stat?.name ?? '',
                              value: stat.baseStat!.toDouble().toInt(),
                              maxValue: 120,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
