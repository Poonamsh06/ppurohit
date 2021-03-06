import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pujapurohit/Pages/new_pandit_home.dart';
import 'package:pujapurohit/Pages/PanditSection/Controllers/pujan_vidhi_controller.dart';
import 'package:pujapurohit/Pages/PanditSection/Widgets/responsive.dart';
import 'package:pujapurohit/Widgets/loader.dart';
import 'package:pujapurohit/Widgets/texts.dart';
import 'package:pujapurohit/Widgets/newbottombar.dart';

import 'widgets/category_card.dart';

class PujaVidhi extends StatefulWidget {
  @override
  _PujaVidhiState createState() => _PujaVidhiState();
}

class _PujaVidhiState extends State<PujaVidhi> {
  String stateName = 'Bihar';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final PujanVidhiController pujanVidhiController =
        Get.put(PujanVidhiController());
    final TextLanguageController textLanguageController =
        Get.put(TextLanguageController());
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          height * 0.099,
        ),
        child: TopTabs(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.055,
                          ),
                          Text5(
                            data1: 'Pujan Vidhi',
                            data2: '???????????? ????????????',
                            data3: '???????????? ????????????',
                            data4: '??????????????? ????????????',
                            data5: '??????????????? ????????????',
                            data6: '???????????? ????????????',
                            data7: '???????????? ????????????',
                            data8: '???????????? ????????????',
                            data9: '???????????? ????????????',
                            data10: '?????????????????? ????????????',
                            max: 30,
                            min: 28,
                            clr: Colors.black54,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: size.width * .45,
                            height: size.height *
                                0.15, // it just take 60% of total width
                            child: Text5(
                              data1:
                                  'Here you can find all listed puja steps by step and complete it with vedic mantra',
                              data2:
                                  '???????????? ?????? ????????? ???????????????????????? ???????????? ??????????????? ?????? ????????????????????? ??????????????? ?????? ?????? ???????????? ????????? ?????? ????????? ??????????????? ??????????????? ?????? ????????? ???????????? ?????? ???????????? ?????????',
                              data3:
                                  '??????????????? ???????????? ???????????? ???????????? ????????????????????????????????? ??????????????? ???????????? ????????????????????? ??????????????? ???????????? ??????????????? ????????? ??????????????? ?????????????????? ??????????????? ????????? ???????????????????????? ???????????? ???????????????',
                              data4:
                                  '??????????????? ????????????????????? ????????????????????????????????????????????? ????????????????????? ???????????? ?????????????????????????????? ??????????????????????????????????????? ????????????????????? ????????????????????? ????????? ????????? ??????????????????????????????????????? ?????????????????????????????????',
                              data5:
                                  '??????????????? ???????????? ?????????????????? ????????????????????? ??????????????? ????????? ??????????????? ??????????????????????????? ????????????????????????????????? ??????????????? ?????????????????? ????????? ???????????????????????? ?????????????????? ????????????????????????',
                              data6:
                                  '???????????? ????????? ???????????? ???????????????????????? ???????????? ????????? ??????????????????????????? ???????????? ???????????? ????????? ??????????????? ???????????????????????? ??????????????? ????????? ????????????',
                              data7:
                                  '???????????? ????????? ???????????? ???????????????????????? ????????????????????? ??????????????? ??????????????? ?????????????????? ???????????? ????????? ?????? ????????? ???????????? ??????????????? ????????????????????? ??????????????? ????????? ????????? ??????',
                              data8:
                                  '??????????????? ????????? ??????????????? ????????????????????????????????? ???????????? ????????????????????????????????? ??????????????????????????????????????? ??????????????????????????? ????????? ??????????????? ?????????????????? ?????????????????? ???????????? ??????????????????????????? ??????????????????????????? |',
                              data9:
                                  '???????????? ??????????????? ???????????? ????????????????????? ???????????? ????????? ?????? ????????? ????????? ???????????? ?????? ????????? ??????????????? ??????????????? ???????????? ????????? ???????????? ?????? ???????????? ??????',
                              data10:
                                  '??????????????? ???????????? ??????????????? ??????????????? ??????????????? ??????????????? ??????????????????????????? ????????? ????????????????????? ???????????????????????? ??????????????? ?????????????????? ????????? ??????????????????????????? ?????????????????????????????????????????????',
                              max: 12,
                              min: 11,
                              clr: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.2,
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? size.width * 0.4
                            : size.width * 0.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/swastik13-8242d.appspot.com/o/NewAppFiles%2Ftopbars%2FProcessing-rafiki%20(2).png?alt=media&token=dc2c3e8a-22f7-4ac3-bb5d-58d02fbab3e9'),
                      ),
                    ],
                  ),

                  StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .doc('inventories/listed_puja')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Loader();
                        }
                        List<dynamic> mainSamagriList =
                            snapshot.data!.get("listed_samagri");
                        List<Map> pujas = []..shuffle();

                        for (var i in snapshot.data!.get('listed_puja')) {
                          pujas.add(i);
                        }

                        return Expanded(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GridView.builder(
                                //physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: ResponsiveWidget
                                                .isSmallScreen(context)
                                            ? 2
                                            : ResponsiveWidget.isMediumScreen(
                                                    context)
                                                ? 3
                                                : 4,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        childAspectRatio: ResponsiveWidget
                                                .isSmallScreen(context)
                                            ? 0.85
                                            : ResponsiveWidget.isMediumScreen(
                                                    context)
                                                ? 1
                                                : 1.5),
                                shrinkWrap: true,
                                itemCount: pujas.length,
                                itemBuilder: (_, index) {
                                  List<dynamic> samgris =
                                      pujas[index]['samagri']['${stateName}'];
                                  List<dynamic> samagriIdList = [];
                                  List<Samagiri> pujanSamagri = [];
                                  samgris.forEach((element) {
                                    pujanSamagri.add(
                                      Samagiri(
                                          name: SamagiriDetails.Samagiri(
                                                      mainListOfSamagri:
                                                          mainSamagriList,
                                                      samagriId: element["id"])
                                                  .details["name"][
                                              textLanguageController
                                                  .langData.value.dataCode],
                                          img: SamagiriDetails.Samagiri(mainListOfSamagri: mainSamagriList, samagriId: element["id"])
                                              .details["image"],
                                          quantity: element['quantity'],
                                          description: SamagiriDetails.Samagiri(
                                                  mainListOfSamagri: mainSamagriList,
                                                  samagriId: element["id"])
                                              .details["description"][textLanguageController.langData.value.dataCode]),
                                    );
                                  });

                                  return Obx(() {
                                    return CategoryCard(
                                      clr: "${pujas[index]['bg']}",
                                      title:
                                          "${pujas[index]['name'][textLanguageController.langData.value.dataCode]}",
                                      svgSrc: "${pujas[index]['image']}",
                                      press: () {
                                        pujanVidhiController.updateName(
                                            '${pujas[index]['keyword']}',
                                            '${pujas[index]['name'][textLanguageController.langData.value.dataCode]}',
                                            '${pujas[index]['image']}',
                                            '${pujas[index]['avgDuration']}',
                                            '${pujas[index]['description'][textLanguageController.langData.value.dataCode]}',
                                            '${pujas[index]['bg']}',
                                            '$stateName');
                                        pujanVidhiController
                                            .updateSamagri(pujanSamagri);
                                        Get.toNamed('/pujanvidhidetail');
                                        print(samgris);
                                      },
                                    );
                                  });
                                },
                              ),
                              ResponsiveWidget.isSmallScreen(context)
                                  ? MobileBottomBar()
                                  : NewBottomBar(),
                            ],
                          ),
                        ));
                      }),
                  //ResponsiveWidget.isSmallScreen(context)?MobileBottomBar():NewBottomBar(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SamagiriDetails {
  final List<dynamic> mainListOfSamagri;
  final String samagriId;

  SamagiriDetails.Samagiri(
      {required this.mainListOfSamagri, required this.samagriId});

  Map<dynamic, dynamic> get details {
    List<dynamic> samagriList = [];
    mainListOfSamagri.forEach((element) {
      samagriList.add(element["sid"]);
    });
    if (samagriList.contains(samagriId)) {
      int index = samagriList.indexOf(samagriId);
      return mainListOfSamagri[index];
    }
    return {};
  }
}

class Samagiri {
  final name;
  final img;
  final quantity;
  final description;
  Samagiri(
      {required this.name,
      required this.img,
      required this.quantity,
      required this.description});
}
