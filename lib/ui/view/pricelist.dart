import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washrycustomer/models/ServiceList.dart';

class PriceListScreen extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<PriceListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blueAccent,
          title: new Text(
            "Dry Clean Pricing",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: FutureBuilder(
          future: fetchList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return listViewWidget(snapshot.data);
            }
          },
        ),
      ),
    );
  }

  static String base_url = "https://mart-bazaar.000webhostapp.com/api/";
  static final String MEN_URL = (base_url + "menshoes.php");

  Future fetchList() async {
    List<CartPojo> cartPojo;
    var requestFromServer = await http.post(
      MEN_URL,
    );
    var message = jsonDecode(requestFromServer.body);
    var response = message['response'];
    if (response == "success") {
      var rest = message['men_data'] as List;
      cartPojo = rest.map<CartPojo>((json) => CartPojo.fromJson(json)).toList();
    } else {
      print('Something went wrong');
    }
    return cartPojo;
  }

  Widget listViewWidget(serviceList) {
    if (serviceList == null) {
      return null;
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: serviceList.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () => _onTapItem(context, serviceList[position]),
            child: Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Text(
                          '${serviceList[position].productName}',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Text(
                          'By ${serviceList[position].brandName}',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey, fontSize: 17.0),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Text(
                          '${serviceList[position].productPrice}',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 15.5),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Text(
                          '${serviceList[position].productPrice}',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 15.5),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: ButtonTheme(
                              minWidth: 28.0,
                              height: 23.0,
                              child: RaisedButton.icon(
                                icon: Icon(
                                  Icons.mode_edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                onPressed: () {},
                                label: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void _onTapItem(BuildContext context, List serviceList) {
    //todo: open item
  }
}
