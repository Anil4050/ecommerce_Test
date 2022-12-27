import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tsc_tasc/Controller/dashbordController.dart';
import 'package:tsc_tasc/Screens/productDesc.dart';

class Dashbord extends StatelessWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashbordController controler = Get.put(DashbordController());

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: SafeArea(
          child: Scaffold(
            body: Obx(
              () => !controler.isLoading.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.only(top: 30.0, bottom: 20),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            padding: const EdgeInsets.all(15.0),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Stack(
                              children: [
                                Center(
                                  child: SizedBox(
                                    child: Image.network(
                                      controler.productData[1]['image'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 2),
                                              blurRadius: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.16),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      height: 60,
                                      width: 100,
                                      child: const Center(
                                        child: Text(
                                          'Explore',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    bottom: 0,
                                    left: 20,
                                    child: SizedBox(
                                      height: 100,
                                      width: 200,
                                      child: Text(
                                        controler.productData[1]['title'],
                                        style: const TextStyle(
                                            shadows: [
                                              Shadow(
                                                  color: Colors.grey,
                                                  offset: Offset(2, 1),
                                                  blurRadius: 1)
                                            ],
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                    ))
                              ],
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'New Arrivals',
                                style: TextStyle(shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(2, 1),
                                      blurRadius: 1)
                                ], fontWeight: FontWeight.w500, fontSize: 18),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: GridView.builder(
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (itemWidth / itemHeight),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: controler.productData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (() async {
                                    await controler.getProductByID(
                                        controler.productData[index]['id']);
                                    Get.to(ProductDesc(
                                      id: controler.productData[index]['id'],
                                    ));
                                  }),
                                  child: Container(
                                    height: 300,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: 25,
                                            child: Text(
                                              controler.productData[index]
                                                  ['title'],
                                              softWrap: true,
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            )),
                                        Positioned(
                                            bottom: 7,
                                            child: Text(
                                              "\$${controler.productData[index]['price']}",
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            height: 170,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Image.network(controler
                                                .productData[index]['image']),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 80,
                                            right: 10,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {},
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.orange,
                    )),
            ),
          ),
        ));
  }
}
