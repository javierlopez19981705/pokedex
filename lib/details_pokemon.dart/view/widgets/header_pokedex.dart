import 'package:flutter/material.dart';

class HeaderPokedex extends StatelessWidget {
  const HeaderPokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * .15,
      ),
      painter: HeaderPokedexPainter(),
    );
  }
}

class HeaderPokedexPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawBackground(canvas, size);
    drawBorder(canvas, size);
    drawLightSuperior(canvas, size);
    drawLightRed(canvas, size);
    drawLightYellow(canvas, size);
    drawLightGreen(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawBackground(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 5;

    Offset offset = Offset(size.width * .5, size.height * .5);

    Rect rect = Rect.fromCenter(
      center: offset,
      width: size.width,
      height: size.height,
    );

    canvas.drawRect(rect, paint);
  }

  drawBorder(Canvas canvas, Size size) {
    Paint paintLine = Paint();
    paintLine.color = Colors.black;
    paintLine.style = PaintingStyle.stroke;
    paintLine.strokeCap = StrokeCap.round;
    paintLine.strokeJoin = StrokeJoin.round;
    paintLine.strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height - 2.5),
      Offset(size.width * .3, size.height - 2.5),
      paintLine,
    );

    canvas.drawLine(
      Offset(size.width * .3, size.height),
      Offset(size.width * .4, size.height * .5),
      paintLine,
    );

    canvas.drawLine(
      Offset(size.width * .4, size.height * .5),
      Offset(size.width, size.height * .5),
      paintLine,
    );
  }

  drawLightRed(Canvas canvas, Size size) {
    final radius = size.height * .1;
    final radius2 = size.height * .085;

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    Offset offset = Offset(
      size.width * .4 + radius,
      radius + 10,
    );

    canvas.drawCircle(offset, radius, paint);

    paint = Paint();
    paint.color = Colors.red[900]!;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(offset, radius2, paint);
  }

  drawLightYellow(Canvas canvas, Size size) {
    final radius = size.height * .1;
    final radius2 = size.height * .085;

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    Offset offset = Offset(
      size.width * .48 + radius,
      radius + 10,
    );

    canvas.drawCircle(offset, radius, paint);

    paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.fill;

    canvas.drawCircle(offset, radius2, paint);
  }

  drawLightGreen(Canvas canvas, Size size) {
    final radius = size.height * .1;
    final radius2 = size.height * .085;

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    Offset offset = Offset(
      size.width * .56 + radius,
      radius + 10,
    );

    canvas.drawCircle(offset, radius, paint);

    paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    offset = Offset(
      size.width * .56 + radius,
      radius + 10,
    );

    canvas.drawCircle(offset, radius2, paint);
  }

  drawLightSuperior(Canvas canvas, Size size) {
    final radius = size.height * .35;
    final radius2 = size.height * .33;
    final radius3 = size.height * .29;
    final radius4 = size.height * .27;

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    Offset offset = Offset(
      radius + 10,
      radius + 10,
    );

    canvas.drawCircle(offset, radius, paint);

    paint = Paint();
    paint.color = Colors.white;

    offset = Offset(
      radius + 10,
      radius + 10,
    );

    canvas.drawCircle(offset, radius2, paint);

    paint = Paint();
    paint.color = Colors.black;

    offset = Offset(
      radius + 10,
      radius + 10,
    );

    canvas.drawCircle(offset, radius3, paint);

    paint = Paint();
    paint.color = Colors.blue;

    offset = Offset(
      radius + 10,
      radius + 10,
    );

    canvas.drawCircle(offset, radius4, paint);
  }
}
