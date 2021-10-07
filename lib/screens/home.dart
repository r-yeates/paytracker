import 'package:PayTrackr/config/theme.dart';
import 'package:PayTrackr/widgets/pay_card.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayTrackr',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: themeDark.colorScheme.primary,
            )),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          iconSize: 25,
          icon: Icon(
            Icons.settings,
            color: themeDark.colorScheme.secondary,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              iconSize: 25,
              icon: Icon(
                Icons.auto_graph,
                color: themeDark.colorScheme.secondary,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 15,
            color: Colors.grey[850],
            thickness: 2.5,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 100,
            child: Swiper(
              itemCount: 2,
              viewportFraction: 0.9,
              scale: 0.95,
              loop: false,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: themeDark.colorScheme.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          index == 0
                              ? Text('Current Pay Range Stats')
                              : Text('All Time Stats')
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 15,
            color: Colors.grey[850],
            thickness: 2.5,
            indent: 20,
            endIndent: 20,
          ),
          PayList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) =>
                Container(height: 250, child: Text('Add new hours')),
          );
        },
      ),
    );
  }
}
