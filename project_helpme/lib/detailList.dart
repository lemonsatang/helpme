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

  // void _crtDetailList() async {
  //   var response = await http.post('${root_url}/read_d_data.php', body: {
  //     'PDCOD': widget.d_list[widget.d_index]['PDCOD'],
  //   });
  //   _detailList = json.decode(response.body);
  //   comp.text = _detailList[0]['COMP'];
  //   c_code.text = _detailList[0]['C_CODE'];
  //   pdnm.text = _detailList[0]['PDNM'];
  //   maker.text = _detailList[0]['MAKER'];
  //   jaejil.text = _detailList[0]['JAEJIL'];
  //   size.text = _detailList[0]['SIZE'];
  //   choolgo.text = _detailList[0]['CHOOLGO'];

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
      id.text = widget.d_list[widget.d_index]['ID'].toString();
      pdcod.text = widget.d_list[widget.d_index]['PDCOD'].toString();
      seq.text = widget.d_list[widget.d_index]['SEQ'].toString();
      comp.text = widget.d_list[widget.d_index]['COMP'].toString();
      c_code.text = widget.d_list[widget.d_index]['C_CODE'].toString();
      pdnm.text = widget.d_list[widget.d_index]['PDNM'].toString();
      maker.text = widget.d_list[widget.d_index]['MAKER'].toString();
      jaejil.text = widget.d_list[widget.d_index]['JAEJIL'].toString();
      size.text = widget.d_list[widget.d_index]['SIZE'].toString();
      choolgo.text = widget.d_list[widget.d_index]['CHOOLGO'].toString();
      sryang.text = widget.d_list[widget.d_index]['SRYANG'].toString();
      unit.text = widget.d_list[widget.d_index]['UNIT'].toString();
      u_jryang.text = widget.d_list[widget.d_index]['U_JRYANG'].toString();
      jryang.text = widget.d_list[widget.d_index]['JRYANG'].toString();
      bigo.text = widget.d_list[widget.d_index]['BIGO'].toString();
      cdate.text = widget.d_list[widget.d_index]['CDATE'].toString();
      mdate.text = widget.d_list[widget.d_index]['MDATE'].toString();
      cuser.text = widget.d_list[widget.d_index]['CUSER'].toString();
      muser.text = widget.d_list[widget.d_index]['MUSER'].toString();
    }
  }

  addUpdateDetail() {
    if (editMode) {
      var url = '${root_url}/edit_d.php';
      http.post(url, body: {
        'ID': widget.d_id.toString(),
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
                    editMode ? '저장' : '등록',
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
                          title: Text('삭제 경고'),
                          content: Text('이 아이템을 정말로 삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              child: Text('삭제'),
                              onPressed: () {
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
                            ),
                            TextButton(
                              child: Text('취소'),
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
                  editMode ? '수정된 내용 저장' : '등록하기',
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
