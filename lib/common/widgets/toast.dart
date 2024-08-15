import 'package:authentication_bloc_mvvm/common/resources/app_color.dart';
import 'package:authentication_bloc_mvvm/common/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bot_toast/bot_toast.dart';
import '../../imports/common.dart';
import '../dimensions/other_constants.dart';
import '../dimensions/paddings.dart';
import '../dimensions/radius.dart';

class  Toast{
   static nullableIconToast({required String message,  String? icon, required bool? isErrorBooleanOrNull, Alignment alignment= Alignment.topCenter} ){
     BotToast.showCustomNotification(
       duration: Duration(seconds: toastDurationInSeconds),
        enableSlideOff: true,
       align: alignment,
       toastBuilder: (cancelFunc) {
         return Card(
           elevation: cardElevation,
           color: isErrorBooleanOrNull == null ? getToastBackgroundColor(toastState: ToastState.info): isErrorBooleanOrNull ? getToastBackgroundColor(toastState: ToastState.fail) : getToastBackgroundColor(toastState: ToastState.success),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(toastBorderRadius),
           ),
           child: ListTile(
             contentPadding:
              EdgeInsets.symmetric(horizontal: screenHPadding, vertical: 2.h),
             title: Row(
               crossAxisAlignment: icon != null? CrossAxisAlignment.start : CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(width: 10.w),
                 Flexible(
                   child: Text(message,
                       maxLines: toastMaxLines,
                       style: AppStyles().subTitleStyle(color: AppColors.colorPrimaryInverse)),
                 )
               ],
             ),
           ),
         );
       },
     );
   }

   static Color getToastBackgroundColor({required ToastState toastState}){
     switch (toastState) {
       case ToastState.success:
         return AppColors.colorSuccess;
       case ToastState.fail:
         return AppColors.colorError;
       case ToastState.info:
         return AppColors.colorWarning;
       default:
         return AppColors.secondaryColor;
     }
   }
}
