import 'package:bytebank/screens/contacts/list.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.name, this.icon, {@required this.onClick})
      : assert(icon != null),
        assert(name != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell
        (
        onTap: () => onClick(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
