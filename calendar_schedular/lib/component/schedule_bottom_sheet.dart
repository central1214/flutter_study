import 'package:calendar_schedular/component/custom_text_field.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int? startTime;
  int? endTime;
  String? content;


  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery
        .of(context)
        .viewInsets
        .bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery
              .of(context)
              .size
              .height / 2 + bottomInset,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 16.0,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Time(onStartSaved: (String? val) {
                      startTime = int.parse(val!);
                    },
                      onEndSaved: (String? val) {
                        endTime = int.parse(val!);
                      },),
                    SizedBox(height: 16.0),
                    _Contents(onSaved: (String? val) {
                      content = val;
                    },),
                    SizedBox(height: 16.0),
                    _ColorPicker(),
                    SizedBox(height: 16.0),
                    _SaveButton(
                      onPressed: onSavePressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      print('에러가 없습니다');
      formKey.currentState!.save();
      print('------------');
      print('startTime: $startTime');
      print('endTime: $endTime');
      print('content: $content');

    } else {
      print('에러가 있습니다');
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;

  const _Time({required this.onEndSaved, required this.onStartSaved, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Expanded(
            child: CustomTextField(
              onSaved: onStartSaved,
              label: '시작 시간',
              isTime: true,
            )),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: CustomTextField(
              onSaved: onEndSaved,
              label: '마감 시간',
              isTime: true,
            )),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  final FormFieldSetter<String> onSaved;

  const _Contents({required this.onSaved, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        onSaved: onSaved,
        label: '내용',
        isTime: false,
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: [
        renderColor(Colors.red),
        renderColor(Colors.orange),
        renderColor(Colors.yellow),
        renderColor(Colors.green),
        renderColor(Colors.blue),
        renderColor(Colors.indigo),
        renderColor(Colors.purple),
      ],
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                child: Text('저장'))),
      ],
    );
  }
}
