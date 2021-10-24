import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

class detailList extends StatefulWidget {
  final List d_list;
  final int d_index;
  detailList({required this.d_list, required this.d_index});

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

  @override
  void initState() {
    super.initState();
    if (widget.d_index != -1) {
      _crtDetailList();
      editMode = true;
      pdcod.text = widget.d_list[widget.d_index]['PDCOD'];
      seq.text = widget.d_list[widget.d_index]['SEQ'];
      comp.text = widget.d_list[widget.d_index]['COMP'];
      c_code.text = widget.d_list[widget.d_index]['C_CODE'];
      pdnm.text = widget.d_list[widget.d_index]['PDNM'];
      maker.text = widget.d_list[widget.d_index]['MAKER'];
      jaejil.text = widget.d_list[widget.d_index]['JAEJIL'];
      size.text = widget.d_list[widget.d_index]['SIZE'];
      choolgo.text = widget.d_list[widget.d_index]['CHOOLGO'];
      sryang.text = widget.d_list[widget.d_index]['SRYANG'];
      unit.text = widget.d_list[widget.d_index]['UNIT'];
      u_jryang.text = widget.d_list[widget.d_index]['U_JRYANG'];
      jryang.text = widget.d_list[widget.d_index]['JRYANG'];
      bigo.text = widget.d_list[widget.d_index]['BIGO'];
      cdate.text = widget.d_list[widget.d_index]['CDATE'];
      mdate.text = widget.d_list[widget.d_index]['MDATE'];
      cuser.text = widget.d_list[widget.d_index]['CUSER'];
      muser.text = widget.d_list[widget.d_index]['MUSER'];
      print(pdcod.text);
    }
  }

  void _crtDetailList() async {
    var response = await http.post('http://221.164.17.115/read_d.php',
        body: {'ID': widget.d_list[widget.d_index]['ID']});

    setState(() {
      _detailList = json.decode(response.body);
    });
  }

  addUpdateDetail() {
    if (editMode) {
      var url = 'http://221.164.17.115/edit_d.php';
      http.post(url, body: {
        'ID': widget.d_list[widget.d_index]['ID'],
        'PDCOD': pdcod.text,
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
      var url = 'http://221.164.17.115/add_d.php';
      try {
        http.post(url, body: {
          'PDCOD': pdcod.text,
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
          'CUSER': muser.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('DetailItem'),
        actions: [
          InkWell(
            onTap: () {},
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
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pdcod,
                decoration: InputDecoration(
                  labelText: '상품번호',
                ),
              ),
            ),
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
        ),
      ),
    );
  }
}
