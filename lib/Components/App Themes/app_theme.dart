import 'package:flutter/material.dart';


class AppTheme{

  AppTheme();

  static ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF4EA),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return Icon(Icons.arrow_back_ios_new);
          },
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            titleTextStyle: TextStyle(
              color: Color(0xFF9B4747),
              fontSize: 24,
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Color(0xFFC4B7A6),
          fontSize: 12
        ),
        labelStyle: TextStyle(
          color: Color(0xFF308983),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF308983),
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Color(0xffD1D3D4)
          ),

        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF379C95).withOpacity(0.7),
                width: 1
            ),
            borderRadius: BorderRadius.circular(16.0)
        )
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateColor.resolveWith((states){
            if(states.contains(MaterialState.pressed)){
              return Color(0xFF9B4747);
            }
            else{
              return Colors.white;
            }
          }),
          maximumSize: WidgetStatePropertyAll(Size(double.infinity,double.infinity))
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
                  color: Color(0xFFC4B7A6),
                  fontSize: 12
          ),
          suffixIconColor:Color(0xFF308983),
          floatingLabelBehavior: FloatingLabelBehavior.always

        )
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Color(0xFFFFF4EA),
        headerForegroundColor: Color(0xFFC96868) ,
        todayForegroundColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Colors.white;
          }
          if(states.contains(MaterialState.disabled)){
            return Colors.grey;
          }
          else{
            return Color(0xff6E5C52);}
        }),
        todayBackgroundColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Color(0xFFC96868);
          }
          // else if(states.contains(MaterialState.focused)){
          // return Color(0xFFC96868);
          // }
          else{
            return Colors.transparent;
          }
        }),
        // dayOverlayColor: WidgetStateColor.resolveWith((states){
        //   return Colors.white;
        // }),
        dayForegroundColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Colors.white;
          }
          else if(states.contains(MaterialState.disabled)){
            return Colors.grey;
          }
          else{
            return Color(0xff6E5C52);
          }
        },),
        dayBackgroundColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Color(0xFFC96868);
          }
          // else if(states.contains(MaterialState.focused)){
          // return Color(0xFFC96868);
          // }
          else{
            return Colors.transparent;
          }
        }),
        yearBackgroundColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Color(0xFFC96868);
          }
          // else if(states.contains(MaterialState.focused)){
          // return Color(0xFFC96868);
          // }
          else{
            return Colors.transparent;
          }
        }),
        // yearShape: WidgetStateOutlinedBorder.resolveWith((states){
        //   return RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16),
        //   );
        // }),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: Color(0xFF696666),
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: Color(0xFFC96868),
        ),

      ),
      timePickerTheme: TimePickerThemeData(
              backgroundColor: Color(0xFFFFF4EA),
              cancelButtonStyle: TextButton.styleFrom(
                foregroundColor: Color(0xFF696666),
              ),
              confirmButtonStyle: TextButton.styleFrom(
                foregroundColor: Color(0xFFC96868),
              ),
              dayPeriodTextColor: WidgetStateColor.resolveWith((states){
                if(states.contains(MaterialState.selected)){
                  return Color(0xFFC96868);
                }
                else{
                  return Color(0xFF696666);
                }
              },),
              dialHandColor: Color(0xFFC96868),
              dialBackgroundColor: Colors.white,
              timeSelectorSeparatorColor: WidgetStatePropertyAll<Color>(Color(0xff6E5C52)),
              hourMinuteColor: WidgetStateColor.resolveWith((states){
                if(states.contains(MaterialState.selected)){
                  return Color(0xFFC96868).withOpacity(0.2) ;
                }
                else{
                  return Colors.white;
                }
              }),
              hourMinuteTextColor: WidgetStateColor.resolveWith((states){
                if(states.contains(MaterialState.selected)){
                  return Color(0xFFC96868);
                }
                else{
                  return Colors.black;
                }
              }),
              dayPeriodColor: Color(0xFFC96868).withOpacity(0.2),
              hourMinuteTextStyle: TextStyle(
                  fontSize: 32
              ),
              hourMinuteShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFC96868),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              )
          ),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        iconColor: Color(0xFF35383F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: Color(0xFFFFF4EA),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: BorderRadius.circular(16),
        selectedColor: Color(0xFF308983),
        selectedBorderColor: Color(0xFF308983),
        fillColor: Color(0xFF308983).withOpacity(0.2),

      ),
      sliderTheme: SliderThemeData(
          allowedInteraction: SliderInteraction.slideThumb,
          thumbColor: Color(0xFF016B61),
          activeTrackColor: Color(0xFF016B61),
          inactiveTrackColor: Color(0xFF308983).withOpacity(0.5),
          trackHeight: 8,
          valueIndicatorColor: Color(0xFF016B61)
      ),
      searchBarTheme: SearchBarThemeData(
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(Color(0xFFFFF4EA)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF016B61),width: 1.5,strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(16)
        )),
        // textStyle: WidgetStateTextStyle.resolveWith((states){})
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearTrackColor: Color(0xFF308983).withOpacity(0.2),
        color: Color(0xFF308983),
        borderRadius: BorderRadius.circular(16),

      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: Color(0xFFFFF4EA),
        dividerColor:Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
      ),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(Color(0xFF9B4747)),
        thumbColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Colors.white;
          }
          else{
            return Color(0xFF9B4747);
          }
        }),
        trackColor: WidgetStateColor.resolveWith((states){
          if(states.contains(MaterialState.selected)){
            return Color(0xFF9B4747);
          }
          else{
            return Colors.white;
          }
        })
      ),




      // dropdownMenuTheme: DropdownMenuThemeData(
      //   inputDecorationTheme: InputDecorationTheme(
      //     hintStyle: TextStyle(
      //         color: Color(0xFFC4B7A6),
      //         fontSize: 12
      //     ),
      //   )
      // ),
    );
  }


  static ThemeData get darkTheme {
    return ThemeData(
        // scaffoldBackgroundColor: Color(0xFFFFF4EA),
        // actionIconTheme: ActionIconThemeData(
        //   backButtonIconBuilder: (context) {
        //     return Icon(Icons.arrow_back_ios_new);
        //   },
        // ),
        // appBarTheme: AppBarTheme(
        //     backgroundColor: Colors.transparent,
        //     centerTitle: false,
        //     titleTextStyle: TextStyle(
        //       color: Color(0xFF9B4747),
        //       fontSize: 24,
        //     )
        // )
    );
  }
}
