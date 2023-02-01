import 'package:flutter/material.dart';

class BottomPokedex extends StatelessWidget {
  const BottomPokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * .2,
      ),
      painter: BottomPokedexPainter(),
    );
  }
}

class BottomPokedexPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    drawCircle(canvas, size);
    _drawButtonFlat(canvas, size);
    _drawButtonFlatBlue(canvas, size);
    _drawDisplayMini(canvas, size);
    _drawControl(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawCircle(Canvas canvas, Size size) {
    final radius = size.width * .075;
    final radius2 = size.width * .065;

    Paint paint = Paint();
    paint.color = Color.fromARGB(255, 15, 15, 15);
    paint.style = PaintingStyle.fill;

    Offset offset = Offset(
      radius + 20,
      radius + 20,
    );

    canvas.drawCircle(offset, radius, paint);

    paint = Paint();
    paint.color = Color.fromARGB(255, 35, 35, 35);
    paint.style = PaintingStyle.fill;

    offset = Offset(
      radius + 20,
      radius + 20,
    );

    canvas.drawCircle(offset, radius2, paint);
  }

  _drawButtonFlat(Canvas canvas, Size size) {
    Paint paintLine = Paint();
    paintLine.color = Colors.black;
    paintLine.style = PaintingStyle.stroke;
    paintLine.strokeCap = StrokeCap.round;
    paintLine.strokeJoin = StrokeJoin.round;
    paintLine.strokeWidth = 15;

    canvas.drawLine(
      Offset(size.width * .3, size.height * .15),
      Offset(size.width * .4, size.height * .15),
      paintLine,
    );

    paintLine.strokeWidth = 10;
    paintLine.color = Colors.red[900]!;

    canvas.drawLine(
      Offset(size.width * .3, size.height * .15),
      Offset(size.width * .4, size.height * .15),
      paintLine,
    );
  }

  _drawButtonFlatBlue(Canvas canvas, Size size) {
    Paint paintLine = Paint();
    paintLine.color = Colors.black;
    paintLine.style = PaintingStyle.stroke;
    paintLine.strokeCap = StrokeCap.round;
    paintLine.strokeJoin = StrokeJoin.round;
    paintLine.strokeWidth = 15;

    canvas.drawLine(
      Offset(size.width * .5, size.height * .15),
      Offset(size.width * .6, size.height * .15),
      paintLine,
    );

    paintLine.strokeWidth = 10;
    paintLine.color = Colors.blue[900]!;

    canvas.drawLine(
      Offset(size.width * .5, size.height * .15),
      Offset(size.width * .6, size.height * .15),
      paintLine,
    );
  }

  _drawDisplayMini(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color.fromARGB(255, 0, 0, 0);

    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    Rect rect = Rect.fromLTWH(
      size.width * .29,
      (size.height * .15) * 2,
      size.width * .33,
      size.height * .4,
    );

    canvas.drawRect(rect, paint);

    paint.color = Color.fromARGB(255, 138, 155, 140);
    rect = Rect.fromLTWH(
      size.width * .3,
      (size.height * .16) * 2,
      size.width * .31,
      size.height * .36,
    );
    canvas.drawRect(rect, paint);
  }

  _drawControl(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    Offset offset = Offset(
      (size.width * .85),
      size.height * .5,
    );

    Rect rect = Rect.fromCenter(
      center: offset,
      width: size.height * .18,
      height: size.height * .5,
    );

    canvas.drawRect(rect, paint);

    Paint paint2 = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    Offset offset2 = Offset(
      (size.width * .85),
      size.height * .5,
    );

    Rect rect2 = Rect.fromCenter(
      center: offset2,
      width: size.height * .5,
      height: size.height * .18,
    );

    canvas.drawRect(rect2, paint2);
  }

  _drawBackground(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    Offset offset = Offset(size.width * .5, size.height * .5);

    Rect rect = Rect.fromCenter(
      center: offset,
      width: size.width,
      height: size.height,
    );

    canvas.drawRect(rect, paint);
  }
}
