import 'package:PayTrackr/config/theme.dart';
import 'package:PayTrackr/widgets/pay_card.dart';
import 'package:PayTrackr/widgets/settings.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      await prefs.setBool('seen', false);
    } else {
      await prefs.setBool('seen', true);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Center(child: Text("PayTrackr")),
              content: Text(
                  "Welcome to PayTrackr, an easy way to track your hours worked, money earnt and tax."),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

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
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => const Settings(),
            );
          },
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
                              ? Center(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Current Pay Period Stats',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('£1000'),
                                          SizedBox(width: 10),
                                          Text('100 Hours')
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'All Time Stats',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('£1000'),
                                          SizedBox(width: 10),
                                          Text('100 Hours')
                                        ],
                                      ),
                                    ],
                                  ),
                                )
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
