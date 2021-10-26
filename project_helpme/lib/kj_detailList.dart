import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

class detailListKJ extends StatefulWidget {
  final List d_list;
  final int d_index;
  final int d_id;
  final int d_pdcod;

  detailListKJ({
    required this.d_list,
    required this.d_index,
    required this.d_id,
    required this.d_pdcod,
  });

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

  @override
  void initState() {
    super.initState();
    if (widget.d_index != -1) {
      _crtDetailList();
      editMode = true;
      pdcod.text = widget.d_pdcod.toString();
      seq.text = widget.d_list[widget.d_index]['SEQ'];
      pdnm.text = widget.d_list[widget.d_index]['PDNM'];
      maker.text = widget.d_list[widget.d_index]['MAKER'];
      jaejil.text = widget.d_list[widget.d_index]['JAEJIL'];
      size.text = widget.d_list[widget.d_index]['SIZE'];
      choolgo.text = widget.d_list[widget.d_index]['CHOOLGO'];
      sryang.text = widget.d_list[widget.d_index]['SRYANG'];
      unit.text = widget.d_list[widget.d_index]['UNIT'];
      u_jryang.text = widget.d_list[widget.d_index]['U_JRYANG'];
      jryang.text = widget.d_list[widget.d_index]['JRYANG'];
      danga.text = widget.d_list[widget.d_index]['DANGA'];
      udanga.text = widget.d_list[widget.d_index]['UDANGA'];
      gonggup.text = widget.d_list[widget.d_index]['GONGGUP'];
      booga.text = widget.d_list[widget.d_index]['BOOGA'];
      hapgye.text = widget.d_list[widget.d_index]['HAPGYE'];
      bigo.text = widget.d_list[widget.d_index]['BIGO'];
      cdate.text = widget.d_list[widget.d_index]['CDATE'];
      mdate.text = widget.d_list[widget.d_index]['MDATE'];
      cuser.text = widget.d_list[widget.d_index]['CUSER'];
      muser.text = widget.d_list[widget.d_index]['MUSER'];
      print(pdcod.text);
    }
  }

  void _crtDetailList() async {
    var response = await http.post('${root_url}/kj_read_d.php',
        body: {'ID': widget.d_list[widget.d_index]['ID']});

    setState(() {
      _detailList = json.decode(response.body);
    });
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
        'SRYANG': sryang.text,
        'UNIT': unit.text,
        'U_JRYANG': u_jryang.text,
        'JRYANG': jryang.text,
        'DANGA': danga.text,
        'UDANGA': udanga.text,
        'GONGGUP': gonggup.text,
        'BOOGA': booga.text,
        'HAPGYE': hapgye.text,
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
          'SRYANG': sryang.text,
          'UNIT': unit.text,
          'U_JRYANG': u_jryang.text,
          'JRYANG': jryang.text,
          'DANGA': danga.text,
          'UDANGA': udanga.text,
          'GONGGUP': gonggup.text,
          'BOOGA': booga.text,
          'HAPGYE': hapgye.text,
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
        title: Text('DetailItem'),
        actions: [
          InkWell(
            onTap: () {
              setState(
                () {
                  addUpdateDetail();
                },
              );
              Navigator.pop(context);
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
                    editMode ? '저장' : '추가',
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
                        deleteData();
                      },
                    );
                    Navigator.pop(
                      context,
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
                          '삭제',
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
                  labelText: '상품명',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: maker,
                decoration: InputDecoration(
                  labelText: '메이커',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: jaejil,
                decoration: InputDecoration(
                  labelText: '재질',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: size,
                decoration: InputDecoration(
                  labelText: '사이즈',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: choolgo,
                decoration: InputDecoration(
                  labelText: '출고길이',
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
                controller: unit,
                decoration: InputDecoration(
                  labelText: '단위',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: u_jryang,
                decoration: InputDecoration(
                  labelText: '단위중량',
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
                controller: danga,
                decoration: InputDecoration(
                  labelText: '단가',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: udanga,
                decoration: InputDecoration(
                  labelText: '단위단가',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: gonggup,
                decoration: InputDecoration(
                  labelText: '공급가액',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: booga,
                decoration: InputDecoration(
                  labelText: '부가세',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: hapgye,
                decoration: InputDecoration(
                  labelText: '합계급액',
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
                      addUpdateDetail();
                    },
                  );
                  Navigator.pop(
                    context,
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
        ),
      ),
    );
  }
}
