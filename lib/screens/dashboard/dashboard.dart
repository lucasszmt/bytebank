import 'package:bytebank/components/feature_item.dart';
import 'package:bytebank/http/transactions.dart';
import 'package:bytebank/screens/contacts/list.dart';
import 'package:bytebank/screens/transaction/list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'images/bytebank_logo.png',
            ),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeatureItem(
                    'Transfer',
                    Icons.monetization_on,
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactsList(),
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeatureItem('Transaction ', Icons.description,
                      onClick: () {/*
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TransferList()));*/
                        findAll().then((value) => print(value));
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
