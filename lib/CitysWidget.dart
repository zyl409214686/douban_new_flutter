import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitysWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CityWidgetState();
  }
}

class CityWidgetState extends State<CitysWidget> {
  @override
  Widget build(BuildContext context) {
    var cityName = ModalRoute.of(context)!.settings.arguments;
    List<String> hotCitys = [
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '武汉',
      '杭州',
      '厦门',
      '天津',
      '重庆',
      '长沙',
      '福州',
      '郑州',
      '南京',
    ];
    return Scaffold(
      backgroundColor: Color(0xE3FFFFFF),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title:
            Text('选择城市', style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(text: '国内'),
                      Tab(
                        text: '国外',
                      )
                    ],
                  )),
              Expanded(
                child: Container(
                  child: TabBarView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 50,
                                child: TextField(
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                      hintText: '输入城市查询',
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.black38),
                                      filled: true,
                                      fillColor: Colors.white),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                'GPS定位城市',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 5, left: 20),
                                child: MaterialButton(
                                  child: Container(
                                    width: 50,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 14,
                                          color: Colors.green,
                                        ),
                                        Text(cityName.toString())
                                      ],
                                    ),
                                  ),
                                  color: Colors.white,
                                  elevation: 0,
                                  onPressed: () {},
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 20),
                              child: Text(
                                '热门城市',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: 2.6,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 50),
                                      itemCount: hotCitys.length,
                                      itemBuilder: (context, index) {
                                        return MaterialButton(
                                          child: Text(hotCitys[index]),
                                          color: Colors.white,
                                          elevation: 0,
                                          onPressed: () {
                                            Navigator.pop(context, hotCitys[index]);
                                          },
                                        );
                                      }),
                                ))
                          ]),
                      Center(child: Text('国外城市'))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
