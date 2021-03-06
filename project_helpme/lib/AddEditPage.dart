import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'dart:convert';
import 'dart:async';
import 'package:project_helpme/detailList.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({required this.list, required this.index});

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
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

  List d_dataList = [];

  void _crtDataList() async {
    var response = await http.post('${root_url}/read_d.php',
        body: {'ID': widget.list[widget.index]['ID'].toString()});

    setState(() {
      d_dataList = json.decode(response.body);
    });
  }

  addUpdateData() {
    if (editMode) {
      var url = '${root_url}/edit.php';
      http.post(url, body: {
        'ID': widget.list[widget.index]['ID'].toString(),
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
        'MUSER': muser.text,
      });
    } else {
      var url = '${root_url}/add.php';
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
          'CUSER': cuser.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
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
      gunsoo.text = widget.list[widget.index]['GUNSOO'].toString();
      sryang.text = widget.list[widget.index]['SRYANG'].toString();
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
            title: Text('?????? ????????????'),
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
                        editMode ? '???????????? ??????' : '????????????',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              editMode
                  ? InkWell(
                      onTap: () {
                        setState(
                          () {
                            addUpdateData();
                          },
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailList(
                                d_list: [],
                                d_index: -1,
                                d_id: widget.list[widget.index]['ID'],
                                d_pdcod: 0),
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
                              Icons.add,
                              size: 16.0,
                              color: Colors.green[700],
                            ),
                            Text(
                              '???????????? ??????',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
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
                            '????????? ?????? : ' + c_code.text,
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
                            '????????? : ' + phone.text,
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
                Text('?????? ??????'),
                Text('????????????'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: comp,
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: c_code,
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: '????????? ??????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: j_bunho,
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: phone,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: fax,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: usrnm,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: i_jogun,
                    maxLength: 128,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: j_jogun,
                    maxLength: 128,
                    decoration: InputDecoration(
                      labelText: '????????????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: gunsoo,
                    maxLength: 8,
                    decoration: InputDecoration(
                      labelText: '??????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: sryang,
                    maxLength: 8,
                    decoration: InputDecoration(
                      labelText: '??????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: jryang,
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: '??????',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: TextField(
                    controller: bigo,
                    maxLength: 128,
                    decoration: InputDecoration(
                      labelText: '??????',
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
                      editMode ? '????????? ?????? ??????' : '????????????',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ), // ????????? ???
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  showCheckboxColumn: false,
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
                      label: Text('??????'),
                    ),
                    DataColumn(
                      label: Text('??????'),
                    ),
                    DataColumn(
                      label: Text('??????'),
                    ),
                    DataColumn(
                      label: Text('??????'),
                    ),
                  ],
                  rows: d_dataList
                      .map(
                        (item) => DataRow(
                          onSelectChanged: (bool) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailList(
                                  d_list: d_dataList,
                                  d_index:
                                      int.parse(item["NUM"].toString()) - 1,
                                  d_id: int.parse(item["ID"].toString()),
                                  d_pdcod: int.parse(item["PDCOD"].toString()),
                                ),
                              ),
                            );
                          },
                          cells: <DataCell>[
                            DataCell(Text(item["SEQ"].toString())),
                            DataCell(Text(item["PDNM"].toString())),
                            DataCell(Text(item["SRYANG"].toString())),
                            DataCell(Text(item["JRYANG"])),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ), // ????????? ???
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
              label: '???',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '????????????',
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
