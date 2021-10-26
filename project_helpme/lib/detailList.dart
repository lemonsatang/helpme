import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

class detailList extends StatefulWidget {
  final List d_list;
  final int d_index;
  final int d_id;
  final int d_pdcod;
  detailList(
      {required this.d_list,
      required this.d_index,
      required this.d_id,
      required this.d_pdcod});

  @override
  _detailListState createState() => _detailListState();
}

class _detailListState extends State<detailList> {
  TextEditingController pdcod = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController seq = TextEditingController();
  TextEditingController comp = TextEditingController();
  TextEditingController c_code = TextEditingController();
  TextEditingController pdnm = TextEditingController();
  TextEditingController maker = TextEditingController();
  TextEditingController jaejil = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController choolgo = TextEditingController();
  TextEditingController sryang = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController u_jryang = TextEditingController();
  TextEditingController jryang = TextEditingController();
  TextEditingController bigo = TextEditingController();
  TextEditingController cdate = TextEditingController();
  TextEditingController cuser = TextEditingController();
  TextEditingController mdate = TextEditingController();
  TextEditingController muser = TextEditingController();

  bool editMode = false;

  List _detailList = [];

  void _crtDetailList() async {
    print(widget.d_list[widget.d_index]['PDCOD']);
    var response = await http.post('${root_url}/read_d_data.php', body: {
      'PDCOD': widget.d_list[widget.d_index]['PDCOD'],
    });
    _detailList = json.decode(response.body);
    print(_detailList);
    print(_detailList[0]['COMP']);
    comp.text = _detailList[0]['COMP'];
    c_code.text = _detailList[0]['C_CODE'];
    pdnm.text = _detailList[0]['PDNM'];
    maker.text = _detailList[0]['MAKER'];
    jaejil.text = _detailList[0]['JAEJIL'];
    size.text = _detailList[0]['SIZE'];
    choolgo.text = _detailList[0]['CHOOLGO'];

    setState(() {
      _detailList = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.d_index != -1) {
      _crtDetailList();
      print(_detailList);
      editMode = true;
      id.text = widget.d_list[widget.d_index]['ID'];
      pdcod.text = widget.d_list[widget.d_index]['PDCOD'];
      seq.text = widget.d_list[widget.d_index]['SEQ'];
      sryang.text = widget.d_list[widget.d_index]['SRYANG'];
      unit.text = widget.d_list[widget.d_index]['UNIT'];
      u_jryang.text = widget.d_list[widget.d_index]['U_JRYANG'];
      jryang.text = widget.d_list[widget.d_index]['JRYANG'];
      bigo.text = widget.d_list[widget.d_index]['BIGO'];
      cdate.text = widget.d_list[widget.d_index]['CDATE'];
      mdate.text = widget.d_list[widget.d_index]['MDATE'];
      cuser.text = widget.d_list[widget.d_index]['CUSER'];
      muser.text = widget.d_list[widget.d_index]['MUSER'];
    }
  }

  addUpdateDetail() {
    if (editMode) {
      var url = '${root_url}/edit_d.php';
      http.post(url, body: {
        'ID': id.text,
        'PDCOD': widget.d_pdcod.toString(),
        'SEQ': seq.text,
        'COMP': comp.text,
        'C_CODE': c_code.text,
        'PDNM': pdnm.text,
        'MAKER': maker.text,
        'JAEJIL': jaejil.text,
        'SIZE': size.text,
        'CHOOLGO': choolgo.text,
        'SRYANG': sryang.text,
        'UNIT': unit.text,
        'U_JRYANG': u_jryang.text,
        'JRYANG': jryang.text,
        'BIGO': bigo.text,
        'MUSER': muser.text,
      });
    } else {
      var url = '${root_url}/add_d.php';
      try {
        http.post(url, body: {
          'ID': widget.d_id.toString(),
          'COMP': comp.text,
          'C_CODE': c_code.text,
          'PDNM': pdnm.text,
          'MAKER': maker.text,
          'JAEJIL': jaejil.text,
          'SIZE': size.text,
          'CHOOLGO': choolgo.text,
          'SRYANG': sryang.text,
          'UNIT': unit.text,
          'U_JRYANG': u_jryang.text,
          'JRYANG': jryang.text,
          'BIGO': bigo.text,
          'CUSER': cuser.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }

  deleteDetail() {
    var url = '${root_url}/delete_d.php';
    http.post(url, body: {
      'ID': id.text,
      'SEQ': seq.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('상세내역 수정 / 추가'),
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
                        deleteDetail();
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
                  Navigator.pop(context);
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
