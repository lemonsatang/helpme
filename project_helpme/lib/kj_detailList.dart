import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'package:project_helpme/kj_AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

class detailListKJ extends StatefulWidget {
  final List d_list;
  final int d_index;
  final int d_id;
  final int d_pdcod;

  detailListKJ(
      {required this.d_list,
      required this.d_index,
      required this.d_id,
      required this.d_pdcod});

  @override
  _detailListKJState createState() => _detailListKJState();
}

class _detailListKJState extends State<detailListKJ> {
  TextEditingController pdcod = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController seq = TextEditingController();
  TextEditingController pdnm = TextEditingController();
  TextEditingController maker = TextEditingController();
  TextEditingController jaejil = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController choolgo = TextEditingController();
  TextEditingController sryang = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController u_jryang = TextEditingController();
  TextEditingController jryang = TextEditingController();
  TextEditingController danga = TextEditingController();
  TextEditingController udanga = TextEditingController();
  TextEditingController gonggup = TextEditingController();
  TextEditingController booga = TextEditingController();
  TextEditingController hapgye = TextEditingController();
  TextEditingController bigo = TextEditingController();
  TextEditingController cdate = TextEditingController();
  TextEditingController cuser = TextEditingController();
  TextEditingController mdate = TextEditingController();
  TextEditingController muser = TextEditingController();

  bool editMode = false;

  List _detailList = [];

  // void _crtDetailList() async {
  //   var response = await http.post('${root_url}/kj_read_d.php',
  //       body: {'ID': widget.d_list[widget.d_index]['ID']});

  //   setState(() {
  //     _detailList = json.decode(response.body);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    if (widget.d_index != -1) {
      // _crtDetailList();
      editMode = true;
      pdcod.text = widget.d_pdcod.toString();
      seq.text = widget.d_list[widget.d_index]['SEQ'].toString();
      pdnm.text = widget.d_list[widget.d_index]['PDNM'].toString();
      maker.text = widget.d_list[widget.d_index]['MAKER'].toString();
      jaejil.text = widget.d_list[widget.d_index]['JAEJIL'].toString();
      size.text = widget.d_list[widget.d_index]['SIZE'].toString();
      choolgo.text = widget.d_list[widget.d_index]['CHOOLGO'].toString();
      sryang.text = widget.d_list[widget.d_index]['SRYANG'].toString();
      unit.text = widget.d_list[widget.d_index]['UNIT'].toString();
      u_jryang.text = widget.d_list[widget.d_index]['U_JRYANG'].toString();
      jryang.text = widget.d_list[widget.d_index]['JRYANG'].toString();
      danga.text = widget.d_list[widget.d_index]['DANGA'].toString();
      udanga.text = widget.d_list[widget.d_index]['UDANGA'].toString();
      gonggup.text = widget.d_list[widget.d_index]['GONGGUP'].toString();
      booga.text = widget.d_list[widget.d_index]['BOOGA'].toString();
      hapgye.text = widget.d_list[widget.d_index]['HAPGYE'].toString();
      bigo.text = widget.d_list[widget.d_index]['BIGO'].toString();
      cdate.text = widget.d_list[widget.d_index]['CDATE'].toString();
      mdate.text = widget.d_list[widget.d_index]['MDATE'].toString();
      cuser.text = widget.d_list[widget.d_index]['CUSER'].toString();
      muser.text = widget.d_list[widget.d_index]['MUSER'].toString();
    }
  }

  addUpdateDetail() {
    if (editMode) {
      var url = '${root_url}/kj_edit_d.php';
      http.post(url, body: {
        'ID': widget.d_id.toString(),
        'PDCOD': widget.d_pdcod.toString(),
        'PDNM': pdnm.text,
        'MAKER': maker.text,
        'JAEJIL': jaejil.text,
        'SIZE': size.text,
        'CHOOLGO': choolgo.text,
        'SRYANG': sryang.text.toString(),
        'UNIT': unit.text,
        'U_JRYANG': u_jryang.text,
        'JRYANG': jryang.text,
        'DANGA': danga.text.toString(),
        'UDANGA': udanga.text.toString(),
        'GONGGUP': gonggup.text.toString(),
        'BOOGA': booga.text.toString(),
        'HAPGYE': hapgye.text.toString(),
        'BIGO': bigo.text,
        'MUSER': muser.text,
      });
    } else {
      var url = '${root_url}/kj_add_d.php';
      try {
        http.post(url, body: {
          'ID': widget.d_id.toString(),
          'PDNM': pdnm.text,
          'MAKER': maker.text,
          'JAEJIL': jaejil.text,
          'SIZE': size.text,
          'CHOOLGO': choolgo.text,
          'SRYANG': sryang.text.toString(),
          'UNIT': unit.text,
          'U_JRYANG': u_jryang.text,
          'JRYANG': jryang.text,
          'DANGA': danga.text.toString(),
          'UDANGA': udanga.text.toString(),
          'GONGGUP': gonggup.text.toString(),
          'BOOGA': booga.text.toString(),
          'HAPGYE': hapgye.text.toString(),
          'BIGO': bigo.text,
          'CUSER': cuser.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }

  deleteData() {
    var url = '${root_url}/kj_delete_d.php';
    http.post(url, body: {
      'PDCOD': widget.d_pdcod.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('???????????? ?????? / ??????'),
        actions: [
          InkWell(
            onTap: () {
              setState(
                () {
                  addUpdateDetail();
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
                    editMode ? '??????' : '??????',
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
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('?????? ??????'),
                          content: Text('??? ???????????? ????????? ?????????????????????????'),
                          actions: [
                            TextButton(
                              child: Text('??????'),
                              onPressed: () {
                                setState(
                                  () {
                                    deleteData();
                                  },
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NKFlutter(),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              child: Text('??????'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          size: 16.0,
                          color: Colors.green[700],
                        ),
                        Text(
                          '??????',
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
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pdnm,
                decoration: InputDecoration(
                  labelText: '?????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: maker,
                decoration: InputDecoration(
                  labelText: '?????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: jaejil,
                decoration: InputDecoration(
                  labelText: '??????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: size,
                decoration: InputDecoration(
                  labelText: '?????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: choolgo,
                decoration: InputDecoration(
                  labelText: '????????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sryang,
                decoration: InputDecoration(
                  labelText: '??????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: unit,
                decoration: InputDecoration(
                  labelText: '??????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: u_jryang,
                decoration: InputDecoration(
                  labelText: '????????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: jryang,
                decoration: InputDecoration(
                  labelText: '??????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: danga,
                decoration: InputDecoration(
                  labelText: '??????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: udanga,
                decoration: InputDecoration(
                  labelText: '????????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: gonggup,
                decoration: InputDecoration(
                  labelText: '????????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: booga,
                decoration: InputDecoration(
                  labelText: '?????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: hapgye,
                decoration: InputDecoration(
                  labelText: '????????????',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bigo,
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
                      addUpdateDetail();
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
        ),
      ),
    );
  }
}
