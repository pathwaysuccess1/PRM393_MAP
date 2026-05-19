import 'package:flutter/material.dart';

class ProvinceCountChart extends StatelessWidget {
  const ProvinceCountChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Số lượng tỉnh thành (1975–2025)',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: _ChartPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  static const _turningPoints = <int, int>{
    1975: 66,
    1976: 38,
    1991: 38,
    1997: 61,
    2008: 63,
    2025: 34,
  };

  static const int _startYear = 1975;
  static const int _endYear = 2025;
  static const int _minCount = 30;
  static const int _maxCount = 70;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF2D5A8E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x442D5A8E), Color(0x002D5A8E)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final dotPaint = Paint()
      ..color = const Color(0xFF378ADD)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final gridPaint = Paint()
      ..color = const Color(0xFF9AA0B0).withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    final textStyle = TextStyle(
      color: const Color(0xFF9AA0B0),
      fontSize: 9,
    );

    // Draw horizontal grid lines
    for (int count = _minCount; count <= _maxCount; count += 10) {
      final y = _countToY(count, size.height);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);

      final tp = TextPainter(
        text: TextSpan(text: '$count', style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(-2, y - tp.height - 2));
    }

    // Build path through all years
    final path = Path();
    final fillPath = Path();
    bool first = true;

    final sortedYears = _turningPoints.keys.toList()..sort();

    for (int i = 0; i < sortedYears.length; i++) {
      final year = sortedYears[i];
      final count = _turningPoints[year]!;
      final x = _yearToX(year, size.width);
      final y = _countToY(count, size.height);

      if (first) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
        first = false;
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    // Close fill path
    final lastYear = sortedYears.last;
    fillPath.lineTo(_yearToX(lastYear, size.width), size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    // Draw turning-point markers
    for (final entry in _turningPoints.entries) {
      final x = _yearToX(entry.key, size.width);
      final y = _countToY(entry.value, size.height);

      canvas.drawCircle(Offset(x, y), 5, dotPaint);
      canvas.drawCircle(Offset(x, y), 5, borderPaint);

      // Year label
      final yearTp = TextPainter(
        text: TextSpan(text: '${entry.key}', style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      yearTp.paint(canvas, Offset(x - yearTp.width / 2, size.height + 2));

      // Count label
      final countTp = TextPainter(
        text: TextSpan(
          text: '${entry.value}',
          style: textStyle.copyWith(
            color: const Color(0xFF378ADD),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      countTp.paint(canvas, Offset(x - countTp.width / 2, y - countTp.height - 6));
    }
  }

  double _yearToX(int year, double width) {
    return ((year - _startYear) / (_endYear - _startYear)) * width;
  }

  double _countToY(int count, double height) {
    return height - ((count - _minCount) / (_maxCount - _minCount)) * height;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
