import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSearchClicked = false;

  void _onSearchClicked() {
    setState(() {
      _isSearchClicked = !_isSearchClicked;
    });
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        var size = MediaQuery.of(context).size;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: size.width * 0.2,
                height: 8,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 68, 68, 68),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text(
                  'Invite',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt),
                title: Text(
                  'Add member',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(Icons.group_add_outlined),
                title: Text(
                  'Add Group',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 10,
              shadowColor: Colors.black,
              leading: IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(36, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              backgroundColor: Color.fromARGB(255, 192, 14, 1),
              pinned: true,
              expandedHeight: size.height * 0.35,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    title: top > 100
                        ? null
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 5),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/weekend2.jpg'),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'The Weekend',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Community +11k Members',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, right: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(36, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.more_vert_rounded,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      bottomSheet();
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/weekend2.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'The Weekend',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Community +11k Members',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 1.5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.share_sharp,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    collapseMode: CollapseMode.parallax,
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (!_isSearchClicked)
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReadMoreText(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            moreStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                labelChip("Outdoor"),
                                labelChip("Outdoor"),
                                labelChip("Outdoor"),
                                labelChip("+1"),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Media, docs and links',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(6, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    'assets/weekend2.jpg',
                                    width: 80,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: 20),
                          SwitchListTile(
                            title: Text('Mute notification'),
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          ListTile(
                            leading: Icon(Icons.delete_outlined),
                            title: Text('Clear chat'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.lock_outline_rounded),
                            title: Text('Encryption'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.exit_to_app_outlined,
                              color: Colors.red,
                            ),
                            title: Text(
                              'Exit Community',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.report,
                              color: Colors.red,
                            ),
                            title: Text(
                              'Report',
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  if (_isSearchClicked == false)
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Members",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: _onSearchClicked,
                            icon: Icon(
                              Icons.search,
                              weight: 20,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color.fromARGB(255, 220, 220, 220),
                              ),
                              child: TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'Search member',
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 46, 46, 46),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: _onSearchClicked,
                          ),
                        ],
                      ),
                    ),
                  Column(
                    children: List.generate(
                      10,
                      (index) {
                        return listp();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget labelChip(String label) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.pink)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Text(label),
      ),
    ),
  );
}

Widget listp() {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/weekend1.jpg'),
    ),
    title: Text('Yashika'),
    subtitle: Text('29, India'),
    trailing: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(const Color.fromARGB(255, 250, 63, 125)),
      ),
      onPressed: () {},
      child: Text(
        'Add',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
