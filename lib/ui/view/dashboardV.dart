import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:washrycustomer/ui/view/loginV.dart';
import 'package:washrycustomer/ui/view/vendorlistV.dart';

class DashboardV extends StatefulWidget {
  @override
  _DashboardVState createState() => _DashboardVState();
}

class _DashboardVState extends State<DashboardV> {
  @override
  Widget build(BuildContext context) {
//    Widget image_carousel = new Container(
//      height: 345.0,
//      child: CarouselSlider(
//        height: 400.0,
//        items: [
//          'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
//          'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
//          'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
//          'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
//        ].map((i) {
//          return Builder(
//            builder: (BuildContext context) {
//              return Container(
//                  width: MediaQuery.of(context).size.width,
//                  margin: EdgeInsets.symmetric(horizontal: 5.0),
//                  decoration: BoxDecoration(color: Colors.amber),
//                  child: GestureDetector(
//                      child: Image.network(i, fit: BoxFit.fill),
//                      onTap: () {
//                        Navigator.push<Widget>(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => LoginV(),
//                          ),
//                        );
//                      }));
//            },
//          );
//        }).toList(),
//      ),
//    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 290,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.brickinc.net/chainfiles/75/creative/201803/636565616750671282-headers_1600x670-drycleaning.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.eucalan.com/application/files/8114/2237/3275/handwash.png'),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://embassycleaners.com/wp-content/uploads/2016/05/ironing-board-shirt.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    Icons.local_laundry_service,
                    size: 30,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('tapped');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VendorListV()));
              },
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: GridTile(
                      child: Center(
                        child: Text('item $index'),
                      ),
                      footer: Text(
                        'Kilogram',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
