import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'dart:convert';
import 'package:project_helpme/detailList.dart';

class gj_AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  gj_AddEditPage({required this.list, required this.index});

  @override
  _gj_AddEditPageState createState() => _gj_AddEditPageState();
}

class _gj_AddEditPageState extends State<gj_AddEditPage> {
  TextEditingController comp = TextEditingController();
  TextEditingController c_code = TextEditingController();
  TextEditingController j_bunho = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fax = TextEditingController();
  TextEditingController usrnm = TextEditingController();
  TextEditingController i_jogun = TextEditingController();
  TextEditingController j_jogun = TextEditingController();
  TextEditingController gunsoo = TextEditingController();
  TextEditingController sryang = TextEditingController();
  TextEditingController jryang = TextEditingController();
  TextEditingController bigo = TextEditingController();
  TextEditingController cdate = TextEditingController();
  TextEditingController cuser = TextEditingController();
  TextEditingController mdate = TextEditingController();
  TextEditingController muser = TextEditingController();

  bool editMode = false;

  List _dataList = [];

  void _crtDataList() async {
    var response = await http.post('http://121.158.192.235/gj_read_d.php',
        body: {'ID': widget.list[widget.index]['ID']});

    setState(() {
      _dataList = json.decode(response.body);
    });
  }

  addUpdateData() {
    if (editMode) {
      var url = 'http://121.158.192.235/gj_edit.php';
      http.post(url, body: {
        'ID': widget.list[widget.index]['ID'],
        'COMP': comp.text,
        'C_CODE': c_code.text,
        'J_BUNHO': j_bunho.text,
        'PHONE': phone.text,
        'FAX': fax.text,
        'USRNM': usrnm.text,
        'I_JOGUN': i_jogun.text,
        'J_JOGUN': j_jogun.text,
        'GUNSOO': gunsoo.text,
        'SRYANG': sryang.text,
        'JRYANG': jryang.text,
        'BIGO': bigo.text,
        'MUESR': muser.text,
      });
    } else {
      var url = 'http://121.158.192.235/gj_add.php';
      try {
        http.post(url, body: {
          'COMP': comp.text,
          'C_CODE': c_code.text,
          'J_BUNHO': j_bunho.text,
          'PHONE': phone.text,
          'FAX': fax.text,
          'USRNM': usrnm.text,
          'I_JOGUN': i_jogun.text,
          'J_JOGUN': j_jogun.text,
          'GUNSOO': gunsoo.text,
          'SRYANG': sryang.text,
          'JRYANG': jryang.text,
          'BIGO': bigo.text,
          'CUESR': cuser.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    // _crtDetailList();
    super.initState();
    if (widget.index != -1) {
      _crtDataList();
      editMode = true;
      comp.text = widget.list[widget.index]['COMP'];
      c_code.text = widget.list[widget.index]['C_CODE'];
      j_bunho.text = widget.list[widget.index]['J_BUNHO'];
      phone.text = widget.list[widget.index]['PHONE'];
      fax.text = widget.list[widget.index]['FAX'];
      usrnm.text = widget.list[widget.index]['USRNM'];
      i_jogun.text = widget.list[widget.index]['I_JOGUN'];
      j_jogun.text = widget.list[widget.index]['J_JOGUN'];
      gunsoo.text = widget.list[widget.index]['GUNSOO'];
      sryang.text = widget.list[widget.index]['SRYANG'];
      jryang.text = widget.list[widget.index]['JRYANG'];
      bigo.text = widget.list[widget.index]['BIGO'];
      cdate.text = widget.list[widget.index]['CDATE'];
      cuser.text = widget.list[widget.index]['CUSER'];
      mdate.text = widget.list[widget.index]['MDATE'];
      muser.text = widget.list[widget.index]['MUSER'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            actions: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      addUpdateData();
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NKFlutter(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save,
                        size: 16.0,
                        color: Colors.green[700],
                      ),
                      Text(
                        '수정내용 저장',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 16.0,
                        color: Colors.green[700],
                      ),
                      Text(
                        '상세내역 추가',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            flexibleSpace: PreferredSize(
              preferredSize: Size.fromHeight(160.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comp.text,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '거래처 코드 : ' + c_code.text,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            cdate.text,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '연락처 : ' + phone.text,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              labelPadding: EdgeInsets.all(10.0),
              tabs: [
                Text('견적 개요'),
                Text('상세내역'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: comp,
                    decoration: InputDecoration(
                      labelText: '거래처명',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: c_code,
                    decoration: InputDecoration(
                      labelText: '거래처 코드',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: j_bunho,
                    decoration: InputDecoration(
                      labelText: '전표번호',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: '전화번호',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: fax,
                    decoration: InputDecoration(
                      labelText: '팩스번호',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usrnm,
                    decoration: InputDecoration(
                      labelText: '의뢰자명',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: i_jogun,
                    decoration: InputDecoration(
                      labelText: '인도조건',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: j_jogun,
                    decoration: InputDecoration(
                      labelText: '지불조건',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: gunsoo,
                    decoration: InputDecoration(
                      labelText: '건수',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: sryang,
                    decoration: InputDecoration(
                      labelText: '수량',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: jryang,
                    decoration: InputDecoration(
                      labelText: '중량',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bigo,
                    decoration: InputDecoration(
                      labelText: '비고',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[400],
                    ),
                    onPressed: () {
                      setState(
                        () {
                          addUpdateData();
                        },
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NKFlutter(),
                        ),
                      );
                    },
                    child: Text(
                      editMode ? '수정된 내용 저장' : '의뢰 추가하기',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ), // 첫번째 탭
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child:
                    // 임시 데이터테이블
                    DataTable(
                  headingRowHeight: 40.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) {
                      return Colors.grey.withOpacity(0.5);
                    },
                  ),
                  headingTextStyle: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  dataTextStyle: TextStyle(
                    fontSize: 11.0,
                    color: Colors.grey[600],
                  ),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('순번'),
                    ),
                    DataColumn(
                      label: Text('품명'),
                    ),
                    DataColumn(
                      label: Text('수량'),
                    ),
                    DataColumn(
                      label: Text('중량'),
                    ),
                  ],
                  rows: _dataList
                      .map((item) => DataRow(cells: <DataCell>[
                            DataCell(Text(item["SEQ"].toString())),
                            DataCell(
                              Text(item["PDNM"].toString()),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailList(
                                      d_list: [],
                                      d_index: 0,
                                    ),
                                  ),
                                );
                              },
                            ),
                            DataCell(Text(item["SRYANG"])),
                            DataCell(Text(item["JRYANG"] + "kg")),
                          ]))
                      .toList(),
                ),
                // 임시 데이터테이블
              ),
            ), // 두번재 탭
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green[700],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '관리메뉴',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My',
            ),
          ],
        ),
      ),
    );
  }
}