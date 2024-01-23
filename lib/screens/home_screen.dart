import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/pages/pages.dart';
import 'package:flutter_chatapp/theme.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
   final ValueNotifier<String> title = ValueNotifier('Message');

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];
  final pageTitles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

   void _onNavigationItemSelected(index){
     title.value = pageTitles[index];
     pageIndex.value = index;
   }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.textLight,
                  )
              );
            },
          ),
        ),
      ),

      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
        return pages[value];
      }),
        bottomNavigationBar: _BottomNavgationBar(
          onItemSelected:_onNavigationItemSelected,
        ) ,
    );
  }

}

class _BottomNavgationBar extends StatefulWidget {
  const _BottomNavgationBar({
   Key? key,
    required this.onItemSelected,
  }) : super(key: key);


  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavgationBar> createState() => _BottomNavgationBarState();
}

class _BottomNavgationBarState extends State<_BottomNavgationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
   widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            index: 0,
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            lable: 'Messages',
            isSelected: selectedIndex == 0,
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 1,
            icon: CupertinoIcons.bell_fill,
            lable: 'Notifications',
            isSelected: selectedIndex == 1,
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 2,
            icon: CupertinoIcons.phone_fill,
            lable: 'Calls',
            isSelected: selectedIndex == 2,
            onTap: handleItemSelected,
          ),
          _NavigationBarItem(
            index: 3,
            icon: CupertinoIcons.person_2_fill,
            lable: 'Contacts',
            isSelected: selectedIndex == 3,
            onTap: handleItemSelected,
          ),
        ],
      )
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.lable,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key:key);

  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
       onTap(index);
      },
      child: SizedBox(
        height:70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Icon(icon,
             size:20,
             color: isSelected? AppColors.secondary : null,
           ),
           const SizedBox(height:8),
           Text(lable,
             style:isSelected?
             const TextStyle(
               fontSize: 11,
               color: AppColors.secondary,
               fontWeight: FontWeight.bold,
             ) : const TextStyle(fontSize: 11),),
          ],
        ),
      ),
    );
  }
}
