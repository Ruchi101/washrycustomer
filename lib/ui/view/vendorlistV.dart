import 'package:flutter/material.dart';
import 'package:washrycustomer/ui/view/pricelist.dart';

class VendorListV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text("Vendor number $index"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PriceListScreen()));
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
