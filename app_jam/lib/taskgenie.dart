/*

NOTLAR!

Yapılan uygulamada bazı eksik ve hatalar vardır.
Öncelikle yazım hatası olarak tek bir kontrolcü kullanıldı ve tüm kodlar tek sayfada yazıldı.
tüm sayfaların aslında ayrı dart dosyalarında tutulup birbirine bağlanması gerekiyordu
fakat biz süre kısıtı nedeniyle bunu tek dosyada yazdık.
örneğin renk kodları tek bir class içine alınıp ordan kullanılabilirdi
fakat biz renkleri tek tek yazdık aynı şekilde Appbar da teker teker her sayfa içinde yazıldı
tek bir kontrolcü üzeridne yazlması uygulmananın daha performanslı çalışmasını sağlar.


*TaskListScreen sınıfı, StatefulWidget sınıfından miras almasına rağmen, initState() ve setState()
fonksiyonları kullanılmamıştır. 
Bu fonksiyonlar, sayfa yüklendiğinde veya kullanıcı etkileşimleri sonucunda
yapılacak işlemler için kullanılır.

*TaskListScreen sınıfının oluşturulduğu ve kullanıcı adının aktarıldığı yapıda,
kullanıcı adının bir key olarak kullanılması daha uygun olacaktır.
Böylece farklı kullanıcı adlarına sahip farklı TaskListScreen nesneleri oluşturulduğunda
birbirleriyle karışma ihtimali en aza indirgenmiş olur.

*Bazı stil ve boyut ayarları, hardcoded olarak verilmiştir.
Bu, farklı ekran boyutlarına sahip cihazlarda hatalı sonuçlar verebilir.
Bu nedenle, bazı boyut ve stil ayarları, cihazın ekran boyutuna göre hesaplanmalıdır.

*Kod, belirli bir amaca yönelik olduğu için, kullanıcılar için herhangi
bir veri doğrulama mekanizması veya hata ayıklama işlemleri içermemektedir.
Bu, kodun kullanıcılara sunulmadan önce test edilmesi ve doğru çalıştığından emin olunması gerektiği anlamına gelir.

*/

import 'package:flutter/material.dart';

var selectedMonthIndex = DateTime.now().month;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Genie',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(15, 56, 122, 1),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Genie',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(15, 56, 122, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/taskgenie.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Giriş yap'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(15, 56, 122, 1),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Kayıt ol'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(15, 56, 122, 1),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ContinueWithoutRegistrationScreen()),
                      );
                    },
                    child: Text('Kayıt olmadan devam et'),
                    style: TextButton.styleFrom(
                      primary: Color.fromRGBO(15, 56, 122, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset(
              'assets/oua_logo.png',
              width: 200,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  final String userName;

  TaskListScreen({required this.userName});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> _tasks = [
    {
      'title':
          'Flutter Hazırlık Eğitimlerini ve Flutter ilk 7 modülünü(%30) tamamla.(ZORUNLU)',
      'month': 'Ocak'
    },
    {
      'title':
          'Teknoloji Girişimciliği Eğitimlerinin %50’sini tamamla. Tüm eğitimler toplamda 12 saat, 6 saatini tamamla.(ZORUNLU)',
      'month': 'Ocak'
    },
    {
      'title':
          'Flutter Eğitimlerinin 8-12 arası modüllerini(%55) tamamla. (ZORUNLU)',
      'month': 'Şubat'
    },
    {
      'title':
          'Google Proje Yönetimi Eğitimlerinin 2. ve 3. kursunu tamamla. (ZORUNLU)',
      'month': 'Şubat'
    },
    {
      'title':
          'Flutter Eğitimlerinin 13-17 arası modüllerini(%80) tamamla. (ZORUNLU)',
      'month': 'Mart'
    },
    {
      'title':
          'Google Proje Yönetimi Eğitimlerinin 4.kursunu tamamla.(ZORUNLU)',
      'month': 'Mart'
    },
    {'title': 'Flutter Eğitimlerini %100 tamamla.(ZORUNLU)', 'month': 'Nisan'},
    {
      'title':
          'Google Proje Yönetimi Eğitimlerinin 5.kursunu tamamla.(ZORUNLU)',
      'month': 'Nisan'
    },
    {
      'title':
          'Google Proje Yönetimi Eğitimlerinin 6.kursunu tamamla.(ZORUNLU)',
      'month': 'Mayıs'
    },
    {
      'title': 'Eksik kalan tüm eğitimlerini tamamla! Rozetlerini al',
      'month': 'Mayıs'
    },
    {'title': 'BOOTCAMP’i tamamla.', 'month': 'Haziran'},
    {'title': 'Mezuniyet Törenine katıl.', 'month': 'Haziran'},
    {'title': 'Task 7', 'month': 'Temmuz'},
    {'title': 'Task 8', 'month': 'Ağustos'},
    {'title': 'Task 9', 'month': 'Eylül'},
    {'title': 'Task 10', 'month': 'Ekim'},
    {'title': 'Task 11', 'month': 'Kasım'},
    {'title': 'Task 12', 'month': 'Aralık'},
  ];
  var turkishMonthNames = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık'
  ];

  Map<String, List<String>> _groupedTasks = {};

  @override
  void _groupTasks() {
    for (int i = 0; i < _tasks.length; i++) {
      final task = _tasks[i];
      final monthIndex = turkishMonthNames.indexOf(task['month']);
      final month = turkishMonthNames[monthIndex];
      if (_groupedTasks.containsKey(month)) {
        _groupedTasks[month]!.add(task['title']);
      } else {
        _groupedTasks[month] = [task['title']];
      }
    }

    for (final month in turkishMonthNames) {
      if (!_groupedTasks.containsKey(month)) {
        _groupedTasks[month] = [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 56, 122, 1),
        title: Text(
          'Task Genie - ${widget.userName}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _groupedTasks.length,
        itemBuilder: (context, index) {
          final month = _groupedTasks.keys.elementAt(index);
          final tasks = _groupedTasks[month]!;
          return ExpansionTile(
            title: Text(month),
            children: tasks.map((task) {
              final taskIndex = _tasks.indexWhere((t) => t['title'] == task);
              final isChecked = _tasks[taskIndex]['isChecked'] ?? false;
              return ListTile(
                title: Text(task),
                leading: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      _tasks[taskIndex]['isChecked'] = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {});
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTaskTitle = '';
              String selectedMonth = 'Ocak';

              return AlertDialog(
                title: Text('Yeni Görev Ekle'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Görev Adı',
                      ),
                      onChanged: (value) {
                        newTaskTitle = value;
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedMonth,
                      hint: Text('Ay Seçin'),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value!;
                        });
                      },
                      items: turkishMonthNames.map((monthName) {
                        return DropdownMenuItem<String>(
                          value: monthName,
                          child: Text(monthName),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('İptal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tasks.add(
                            {'title': newTaskTitle, 'month': selectedMonth});
                        _groupTasks();
                      });

                      Navigator.pop(context);
                    },
                    child: Text('Ekle'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(15, 56, 122, 1),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(15, 56, 122, 1),
      ),
    );
  }
}

class ContinueWithoutRegistrationScreen extends StatefulWidget {
  @override
  _ContinueWithoutRegistrationScreenState createState() =>
      _ContinueWithoutRegistrationScreenState();
}

class _ContinueWithoutRegistrationScreenState
    extends State<ContinueWithoutRegistrationScreen> {
  String _userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 56, 122, 1),
        title: Text('Kayıt Olmadan Devam Et'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(15, 56, 122, 1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskListScreen(userName: _userName),
                  ),
                );
              },
              child: Text('Devam Et'),
            ),
          ],
        ),
      ),
    );
  }
}
