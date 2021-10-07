import 'package:flutter/material.dart';

class PayList extends StatefulWidget {
  const PayList({Key? key}) : super(key: key);
  @override
  _PayListState createState() => _PayListState();
}

class _PayListState extends State<PayList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: const [
                            Expanded(
                              flex: 5,
                              child: Text(
                                "£150",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Worked for 8 hours including a 30min break.",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // subtitle: Text('2nd Line',
                    //     style: TextStyle(),
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
