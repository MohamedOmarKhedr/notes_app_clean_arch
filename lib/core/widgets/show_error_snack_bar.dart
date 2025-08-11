import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// كلاس مساعد لإظهار رسائل SnackBar بأنواع وألوان مختلفة.
class ShowCustomSnackBar {
  /// دالة خاصة داخلية لعرض الـ SnackBar.
  /// تتلقى المحتوى، لون الخلفية، ومدة العرض.
  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 4), // مدة افتراضية
  }) {
    // استخدام addPostFrameCallback لضمان أن الـ BuildContext لا يزال صالحًا
    // ولتجنب الأخطاء إذا تم استدعاء الدالة قبل بناء الـ widget بالكامل.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white), // لون النص دائمًا أبيض
        ),
        backgroundColor: backgroundColor, // لون الخلفية حسب نوع الرسالة
        behavior: SnackBarBehavior.floating, // لجعل الـ SnackBar يطفو
        duration: duration, // مدة عرض الـ SnackBar
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // شكل بحواف دائرية
        margin: const EdgeInsets.all(16), // هامش من الحواف
      );

      // إخفاء أي SnackBar معروض حاليًا وعرض الجديد
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    });
  }

  /// لعرض رسالة خطأ (عادةً باللون الأحمر). 🚫
  static void showError({required BuildContext context, required String message,Duration duration = const Duration(seconds: 5)}) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      duration: duration, // مدة أطول للأخطاء
    );
  }

  /// لعرض رسالة تحذير (عادةً باللون البرتقالي أو الأصفر الداكن). ⚠️
  static void showWarning({required BuildContext context, required String message,Duration duration = const Duration(seconds: 5)}) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      duration: duration,
    );
  }

  /// لعرض رسالة نجاح (عادةً باللون الأخضر). ✅
  static void showSuccess({required BuildContext context, required String message,Duration duration = const Duration(seconds: 5)}) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      duration: duration, // مدة أقصر للنجاح
    );
  }

  /// لعرض رسالة معلومات أو تنبيه عام (عادةً باللون الأزرق أو الرمادي الداكن). ℹ️
  static void showInfo({required BuildContext context, required String message,Duration duration = const Duration(seconds: 5)}) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.blueAccent,
      duration: duration,
    );
  }
}