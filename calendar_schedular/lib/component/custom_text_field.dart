import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime; // true면 시간 false면 내용
  final FormFieldSetter<String> onSaved;

  const CustomTextField({required this.onSaved, required this.isTime, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w600),
        ),
        if (isTime) renderTextField(),
        if (!isTime) Expanded(child: renderTextField()),
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      // null이 리턴되면 에러가 없다.
      // 에러가 있으면 에러를 스트링 값으로 리턴해준다.
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTime) {
          int time = int.parse(val);

          if (time < 0) {
            return '0이상의 숫자를 입력해주세요';
          }
          if (time > 24) {
            return '24이하의 숫자를 입력해주세요';
          }
        } else {
          if(val.length> 500){
            return '500자 이하의 글을 입력해주세요';
          }
        }
        return null;
      },
      cursorColor: Colors.grey,
      expands: !isTime,

      maxLength: isTime? null : 500,
      maxLines: isTime ? 1 : null,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
