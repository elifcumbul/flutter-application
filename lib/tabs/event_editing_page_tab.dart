import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:take_me_out/pages/components/input_field.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/tabs/components/event_comp/event_editing_background.dart';
import 'package:take_me_out/tabs/components/profile_comp/profile_body.dart';
import 'package:take_me_out/tabs/home_page_tab.dart';

import '../contollers/add_event_controller.dart';


class EventEditingPage extends StatefulWidget {
  const EventEditingPage({super.key});

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  AddEventController addEventController = Get.put(AddEventController());


  late String categoryName = "";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _selectedCategory = "";
  int _selectedIndex = 0;
  

 @override
  void initState() {
    addEventController.categoryIdController = TextEditingController();
    addEventController.nameController = TextEditingController();
    addEventController.descriptionController = TextEditingController();
    addEventController.eventDateController = TextEditingController();
    addEventController.eventTimeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addEventController.categoryIdController.dispose();
    addEventController.nameController.dispose();
    addEventController.eventDateController.dispose();
    addEventController.descriptionController.dispose();
    addEventController.eventTimeController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return EventEditingBackground(
      child: Container(
        margin: const EdgeInsets.only(top: 70.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(height: 44.0),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  "Take Me Out",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 14, 17, 43),
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              MyInputField(
                title: "Title",
                hint: "Add Title",
                controller: addEventController.nameController,
              ),
              MyInputField(
                title: "Description",
                hint: "Add Description",
                controller: addEventController.descriptionController,
              ),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    color: const Color(0xff805600),
                    onPressed: () {
                      _getDateFromUser();
                    }),
                //controller: addEventController.eventDateController,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(Icons.access_time_rounded),
                        color: const Color(0xff805600),
                      ),
                      //controller: addEventController.eventTimeController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                 margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 180.0),
                child: const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff805600),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 180.0),
                child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      iconEnabledColor: Color(0xff805600),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(20),
                      hint: Text("Art"),
                      items: const [
                        DropdownMenuItem(child: Text("Art"), value: "050a0e67-560b-4095-e037-08db65163e3c"),
                        DropdownMenuItem(child: Text("Sport"), value: "4623a530-197d-4dc4-e039-08db65163e3c"),
                        DropdownMenuItem(child: Text("Music"), value: "1a864f26-2c56-475a-e038-08db65163e3c"),
                        DropdownMenuItem(child: Text("Theatre"), value: "cfd679d9-270b-443f-e03a-08db65163e3c")
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          addEventController.categoryIdController.text = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
                
              ),
              
              const SizedBox(
                height: 30.0,
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 18.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 14, 17, 43)),
                      ),
                      onPressed: () {
                        addEventController.addEvent();
                        Get.to(()=> HomePageTab());
                      },
                      child: const Text(
                        "Add Event",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 228, 174, 88),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _categorySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Category",
          style: TextStyle(
            fontSize: 20.0,
            color: const Color(0xff805600),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
            children: List<Widget>.generate(4, (index) {
          return GestureDetector(
            onTap: (() {
              setState(() {
                if(index==0){
                  categoryName = "art";
                }else if(index==1){
                  categoryName = "sport";
                }else if(index==2){
                  categoryName = "music";
                }else if(index==3){
                  categoryName = "theatre";
                }
                _selectedIndex = index;
                _selectedCategory = categoryName;
              });
            }),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: (CircleAvatar(
                radius: 20,
                backgroundImage: index == 0
                    ? const AssetImage('assets/categories/painting.png')
                    : index == 1
                        ? const AssetImage('assets/categories/sports.png')
                        : index == 2
                            ? const AssetImage('assets/categories/vinyl.png')
                            : const AssetImage('assets/categories/theatre.png'),
                child: _selectedIndex == index
                    ? const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xff805600),
                      )
                    : Container(),
              )),
            ),
          );
        })),
      ],
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);

    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        addEventController.eventTimeController.text = _formatedTime;
      });
    } 
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            //_startTime -> 10:30 AM (string)
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );

    if (_pickerDate != null) {
      setState(() {
        addEventController.eventDateController.text = DateFormat.yMd().format(_pickerDate).toString();
      });
    } else {
      print("it's null or something is wrong");
    }
  }
}
