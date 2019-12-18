import 'package:flutter/material.dart';

class HomeComponents extends StatelessWidget {
  String _value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        new Card(child: Row(children: <Widget>[
          new Container(
            child: new Text('this is 1'),
            ),
          new Expanded(
            child: ListView(
              children: <Widget>[
DropdownButton<String>(
  items:[
    DropdownMenuItem<String>(
child: Text('Item 1'),
value: 'one',
  ),
  DropdownMenuItem<String>(
child: Text('Item 2'),
value: 'two',
  ),
  DropdownMenuItem<String>(
child: Text('Item 0'),
value: 'zero',
  ),
  
  ] ,
  
  hint: Text('Select Item'),
  value: _value,
)
          ],
          ) 
          ,)
        ],
        ),
        ),
        new Card(child: new Text("this is the sexond card"),),
      ],
      ),
    );
  }
}