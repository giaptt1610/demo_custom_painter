import 'package:flutter/material.dart';
import 'package:ticket_shape/ticket_painter.dart';

class Voucher extends StatelessWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          child: CustomPaint(
            painter: TicketPainter(
              background: Colors.blue.shade300,
              // dashLen: 10.0,
              // dashSpacing: 6.0,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(width: 100.0),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Item 1'),
                      Text('Item 2'),
                      Text('Item 3'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
