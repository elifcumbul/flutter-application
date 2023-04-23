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
              const MyInputField(title: "Title", hint: "Add Title"),
              const MyInputField(title: "Description", hint: "Add Description"),
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 14, 17, 43)),
                      ),
                      onPressed: () {},
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

// import 'package:take_me_out/utils/utils_date_editing.dart';
// import 'package:take_me_out/modals/event_details.dart';
// import 'package:flutter/material.dart';
// import 'package:take_me_out/provider/event_provider.dart';
// import 'package:provider/provider.dart';

// class EventEditingPage extends StatefulWidget {
//   final Event? event;

//   const EventEditingPage({
//     Key? key,
//     this.event,
//   }) : super(key: key);

//   @override
//   State<EventEditingPage> createState() => _EventEditingPageState();
// }

// class _EventEditingPageState extends State<EventEditingPage> {
//   final _formKey = GlobalKey<FormState>();
//   final titleController = TextEditingController();
//   late DateTime fromDate;
//   late DateTime toDate;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.event == null) {
//       fromDate = DateTime.now();
//       toDate = DateTime.now().add(Duration(hours: 2));
//     } else {
//       final event = widget.event!;

//       titleController.text = event.title;
//       fromDate = event.from;
//       toDate = event.to;
//     }
//   }

//   @override
//   void dispose() {
//     titleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => EventProvider(),
//         child: Scaffold(
//           appBar: AppBar(
//             leading: const Padding(
//               padding: EdgeInsets.only(top: 20.0, right: 8.0),
//               child: CloseButton(),
//             ),
//             actions: buildEditingActions(),
//             title: const Text(
//               'Take Me Out',
//               style: TextStyle(fontSize: 35),
//             ),
//           ),
//           body: SingleChildScrollView(
//             padding: EdgeInsets.all(12),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   buildTitle(),
//                   SizedBox(height: 12),
//                   buildDateTimePickers(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );

List<Widget> buildEditingActions() => [
      Padding(
        padding: const EdgeInsets.only(top: 18.0, right: 20.0),
        child: IconButton(
          icon: Image.asset('assets/images/add.png'),
          onPressed: () {},
        ),
      ),
    ];

//   Widget buildTitle() => TextFormField(
//         style: const TextStyle(fontSize: 24),
//         decoration: const InputDecoration(
//           hoverColor: Color.fromARGB(255, 63, 16, 117),
//           border: UnderlineInputBorder(),
//           hintText: 'Add Title',
//         ),
//         onFieldSubmitted: (_) =>
//             saveForm(), // klavyede ok bastıktan sonra kaydediyor sanırım değiştirilebilir {} koyarak =>
//         //saveForm() yerine
//         validator: (title) =>
//             title != null && title.isEmpty ? 'Title cannot be empty.' : null,
//         controller: titleController,
//       );

//   Widget buildDateTimePickers() => Column(
//         children: [
//           buildFrom(),
//           buildTo(),
//         ],
//       );

//   Widget buildFrom() => buildHeader(
//         header: 'FROM',
//         child: Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: buildDropdownField(
//                 text: Utils.toDate(fromDate),
//                 onClicked: () => pickFromDateTime(pickDate: true),
//               ),
//             ),
//             Expanded(
//               child: buildDropdownField(
//                   text: Utils.toTime(fromDate),
//                   onClicked: () => pickFromDateTime(pickDate: false)),
//             ),
//           ],
//         ),
//       );

//   Widget buildTo() => buildHeader(
//         header: 'TO',
//         child: Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: buildDropdownField(
//                 text: Utils.toDate(toDate),
//                 onClicked: () => pickToDateTime(pickDate: true),
//               ),
//             ),
//             Expanded(
//               child: buildDropdownField(
//                   text: Utils.toTime(toDate),
//                   onClicked: () => pickToDateTime(pickDate: false)),
//             ),
//           ],
//         ),
//       );

//   Future pickToDateTime({required bool pickDate}) async {
//     final date = await pickDateTime(
//       toDate,
//       pickDate: pickDate,
//       firstDate: pickDate ? fromDate : null,
//     );
//     if (date == null) return;

//     setState(() => toDate = date);
//   }

//   Future pickFromDateTime({required bool pickDate}) async {
//     final date = await pickDateTime(fromDate, pickDate: pickDate);
//     if (date == null) return;

//     // from'un to'dan sonra olmasını kontrol ediyor
//     if (date.isAfter(toDate)) {
//       toDate =
//           DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
//     }

//     setState(() => fromDate = date);
//   }

//   Future<DateTime?> pickDateTime(
//     DateTime initialDate, {
//     required bool pickDate,
//     DateTime? firstDate,
//   }) async {
//     if (pickDate) {
//       final date = await showDatePicker(
//         context: context,
//         initialDate: initialDate,
//         firstDate: firstDate ?? DateTime(2015, 8),
//         lastDate: DateTime(2101),
//       );
//       if (date == null) return null;

//       final time =
//           Duration(hours: initialDate.hour, minutes: initialDate.minute);

//       return date.add(time);
//     } else {
//       final timeOfDay = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.fromDateTime(initialDate),
//       );
//       if (timeOfDay == null) return null;
//       final date =
//           DateTime(initialDate.year, initialDate.month, initialDate.day);
//       final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

//       return date.add(time);
//     }
//   }

//   Widget buildDropdownField({
//     required String text,
//     required onClicked,
//     // required VoidCallback onClicked,
//   }) =>
//       ListTile(
//         title: Text(text),
//         trailing: const Icon(
//           Icons.arrow_drop_down,
//         ),
//         onTap: onClicked,
//       );

//   Widget buildHeader({
//     required String header,
//     required Widget child,
//   }) =>
//       Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAligment.start,
//           children: [
//             Text(
//               header,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 191, 186, 197),//from to renk
//               ),
//             ),
//             child,
//           ],
//         ),
//       );

//   Future saveForm() async {
//     final isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       final event = Event(
//         title: titleController.text,
//         description: 'Description',
//         from: fromDate,
//         to: toDate,
//         isAllDay: false,
//       );
//       final isEditing = widget.event != null;

//       final provider = Provider.of<EventProvider>(context,
//           listen: true); //listen false ? true emin değilim

//       if (isEditing) {
//         provider.editEvent(event, widget.event!);

//         Navigator.of(context).pop();
//       } else {
//         provider.addEvent(event);
//       }
//       Navigator.of(context).pop();
//     }
//   }
// }
