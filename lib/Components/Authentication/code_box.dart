import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeBox extends StatefulWidget {
  final int length;
  final String? familyId;
  final bool enabled;
  final ValueChanged<String>? onCompleted;
  const CodeBox({super.key, required this.length,  this.familyId, required this.enabled, this.onCompleted,});

  @override
  State<CodeBox> createState() => _CodeBoxState();
}

class _CodeBoxState extends State<CodeBox> {
  late List<TextEditingController> controllers ;
  late List<FocusNode> focusNodes ;

  @override
  void initState() {
    controllers = List.generate(widget.length, (index) => TextEditingController(
        text: widget.familyId?[index]??""
    ));
    focusNodes = List.generate(widget.length, (index) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void onChange(String value,int index){
    if (value.length > 1) { //لو دخل كذا رقم زي كوبي وبيست
      controllers[index].clear(); //هيمسح الي في الخانة
      for (int i = 0; i < value.length && i < widget.length; i++) { //يتاكد ان طول القيمة الي داخلة مثلا 4 نفس عدد البوكسات
        controllers[i].text = value[i]; //هيوزع الارقام على الخانات
      }
      //ده عشان يجيب اخر خانة اتملت
      //كلامب دي هتقص طول الكلمة الي دخلت لعدد الخانات يعني دخل 5 ارقام هتقصها لاول 4 ارقام بس ومنقصين واحد عشان نعرف الخانة الي وقفنا عندها
      int lastIndex = (value.length - 1).clamp(0, widget.length - 1);
      //لو اخر خانة بعد القص بقت زي طول البوكسات
      if (lastIndex == widget.length - 1) {
        focusNodes[lastIndex].unfocus(); //نشيل الفوكس يعني نقفل الكيبورد
        final otp = controllers.map((c) => c.text).join();//هيمشي على خانة خانة من ليستة الكنترولز ياخد قيمتها ويحطها في سترينج واحد
      } else {
        focusNodes[lastIndex + 1].requestFocus();
        //لو طلعت اقل من عدد البوكسات هيرح عند الخانة الي بعد اخر خانة اتملت ويعملها فوكس
      }
      return;
    }
    if (value.length == 1) { //لو دخل قيمة واحدة
      if (index < widget.length - 1) { //لو الخانة الي واقفين عندها مش اخر خانة
        focusNodes[index + 1].requestFocus(); //ينقلنا للخانة الي وراها بالفوكس
      } else {
        focusNodes[index].unfocus(); //لو اخر خانة يقفل الكيبورت
        final code = controllers.map((c) => c.text).join();
        //هيمشي على خانة خانة من ليستة الكنترولز ياخد قيمتها ويحطها في سترينج واحد
        if (code.length == widget.length) {
          widget.onCompleted?.call(code);
        }
      }
    }
  }

  void onKeyEvent(KeyEvent event,int index){
    if (event is KeyDownEvent && //لو داس على الكيبورد على اي زرار
        //ايه الزرار الي داس عليه
        event.logicalKey == LogicalKeyboardKey.backspace && //وكان الزرار الي داس عليه زرار المسح
        controllers[index].text.isEmpty && //الخانة الي واقفين عليها فاضية
        //اننا مش في اخر خانة عشان لو في اخر خانة مش هنعرف نرجع ورا
        index > 0) {
      // focusNodes[index].unfocus(); //هيشيل الفوكس من على الخانة الي واقفين عليها
      focusNodes[index - 1].requestFocus(); //هيحصل الفوكس على الخانة الي قبلها
      controllers[index - 1].clear(); //   هيمسح الكلام من الخانة الي احنا فيها
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.length, (index){
          return SizedBox(
            height: 80,
            width: 60,
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event)=>onKeyEvent(event, index),
              child: TextFormField(
                enabled: widget.enabled,
                style: TextStyle(
                  color: Color(0xFF6E5C52),
                ),
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value)=>onChange(value,index),
              ),
            ),
          );
        }),
      ),
    );
  }
}
