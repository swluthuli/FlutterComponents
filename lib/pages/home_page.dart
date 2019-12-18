import '../fragments/first_fragment.dart';
import '../fragments/second_fragment.dart';
import '../fragments/third_fragment.dart';
import 'package:flutter/material.dart';


class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.rss_feed),
    new DrawerItem("Profile", Icons.local_pizza),
    new DrawerItem("History", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  int _selectedFromLocation;
  int _selectedToLocation;
  
  List<DropdownMenuItem<int>> locationList = [];

  void loadGenderList() {
    locationList = [];
    locationList.add(new DropdownMenuItem(
      child: new Text('Taxi Rank'),
      value: 0,
    ));
    locationList.add(new DropdownMenuItem(
      child: new Text('Down Town'),
      value: 1,
    ));
    locationList.add(new DropdownMenuItem(
      child: new Text('Ekasi'),
      value: 2,
    ));
  }


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePageState();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

     loadGenderList();
        return new Scaffold(
          appBar: new AppBar(
            // here we display the title corresponding to the fragment
            // you can instead choose to have a static title
            title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
            backgroundColor: Colors.orange,
          ),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                    accountName: new Text("John Doe"), accountEmail: Text("JohnDoe@hjykkl.cn")),
                new Column(children: drawerOptions)
              ],
            ),
          ),
          body: 
         Card( child: 
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
       
       ListTile(
            leading: Icon(Icons.album),
            title: Column(
             children: getFormWidget(),
             
            ), 
            
          ),
        //  new ListView(
        //   children: getFormWidget(),
        // ),
      
        ],),),

    );
 
   
  }
    List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

  formWidget.add(new DropdownButton(
      hint: new Text('Please choose location'),
      items: locationList,
      value: _selectedFromLocation,
      onChanged: (value) {
        setState(() {
          _selectedFromLocation = value;
        });
      },
      isExpanded: true,
    ),
    );
     formWidget.add(new DropdownButton(
      hint: new Text('Please choose location'),
      items: locationList,
      value: _selectedToLocation,
      underline: Container(
      height: 2,
      color: Colors.white,
    ),
      onChanged: (value) {
        setState(() {
          _selectedToLocation = value;
        });
      },
      isExpanded: true,
    ),
    );
    
    return formWidget;
  }

}