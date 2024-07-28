import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class QCard extends StatelessWidget {
  final BestQuotes item;
  final Function delete;
  QCard(
      {required this.item,
      required this.delete,
      });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(11),
      color: Color.fromARGB(255, 71, 82, 179),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      delete(item);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 27,
                    )),
                Text(
                  item.author,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
