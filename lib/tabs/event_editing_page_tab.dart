import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:take_me_out/pages/components/input_field.dart';
import 'package:take_me_out/pages/homepage.dart';
import 'package:take_me_out/tabs/components/event_comp/event_editing_background.dart';


class EventEditingPage extends StatefulWidget {
  const EventEditingPage({super.key});

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  //final EventController _eventController = Get.put(EventController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return EventEditingBackground(
      child: Container(
        margin: const EdgeInsets.only(top: 70.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () => Get.to(const HomePage()),
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const SizedBox(height: 20.0),
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
                controller: _titleController,
              ),
              MyInputField(
                title: "Description",
                hint: "Add Description",
                controller: _descriptionController,
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
                    ),
                  ),
                  Expanded(
                    child: MyInputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(Icons.access_time_rounded),
                        color: const Color(0xff805600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    _categorySelection(),
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
                      onPressed: () => _validateData(),
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

  _validateData() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      //add to database
     // _addEventToDb();
      //Get.back();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Color(0xff690005),
        ),
        duration: const Duration(seconds: 2),
        colorText: Color(0xffffb4ab),
      );
    }
  }

  // _addEventToDb() async{
  //   //event we want to add to the DB(passing data to our model)
  //   int value = await _eventController.addEvent(
  //     event: Event(
  //       description: _descriptionController.text,
  //       title: _titleController.text,
  //       date: DateFormat.yMd().format(_selectedDate),
  //       startTime: _startTime,
  //       endTime: _endTime,
  //       category: _selectedCategory,
  //       isComplete: 0,
  //     )
  //   );
  //   print("$value");
  // }

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
                _selectedCategory = index;
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
                child: _selectedCategory == index
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
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
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
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or something is wrong");
    }
  }
}
