import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';

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
  TextEditingController phone = TextEditingController();
  TextEditingController fax = TextEditingController();
  TextEditingController usrnm = TextEditingController();
  TextEditingController i_jogun = TextEditingController();
  TextEditingController j_jogun = TextEditingController();
  TextEditingController gunsoo = TextEditingController();
  TextEditingController sryang = TextEditingController();
  TextEditingController jryang = TextEditingController();
  TextEditingController bigo = TextEditingController();
  TextEditingController cuser = TextEditingController();
  TextEditingController muser = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.0.191/edit.php';
      http.post(url, body: {
        'ID': widget.list[widget.index]['ID'],
        'COMP': comp.text,
        'C_CODE': c_code.text,
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
      var url = 'http://192.168.0.191/add.php';
      try {
        http.post(url, body: {
          'COMP': comp.text,
          'C_CODE': c_code.text,
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
    super.initState();
    if (widget.index != -1) {
      editMode = true;
      comp.text = widget.list[widget.index]['COMP'];
      c_code.text = widget.list[widget.index]['C_CODE'];
      phone.text = widget.list[widget.index]['PHONE'];
      fax.text = widget.list[widget.index]['FAX'];
      usrnm.text = widget.list[widget.index]['USRNM'];
      i_jogun.text = widget.list[widget.index]['I_JOGUN'];
      j_jogun.text = widget.list[widget.index]['J_JOGUN'];
      gunsoo.text = widget.list[widget.index]['GUNSOO'];
      sryang.text = widget.list[widget.index]['SRYANG'];
      jryang.text = widget.list[widget.index]['JRYANG'];
      bigo.text = widget.list[widget.index]['BIGO'];
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
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('수정한 내용 저장'),
                      Icon(Icons.save),
                    ],
                  ),
                ),
              ),
            ],
            flexibleSpace: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Center(
                child: Text('Ggieeeeeeeeek'),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              tabs: [
                Text('의뢰 개요'),
                Text('상세정보'),
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
            Center(
              child: Text('Juice Newton - Angel of the Morning'),
            ), // 두번재 탭
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
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
