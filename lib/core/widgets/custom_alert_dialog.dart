import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/extensions/reponsive_extensions.dart';

// هذا هو ويدجت التنبيه المخصص
class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final bool isCancelButton;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmButtonText = 'تأكيد', // نص افتراضي لزر التأكيد
    this.cancelButtonText = 'إلغاء', // نص افتراضي لزر الإلغاء
    required this.onConfirm,
    this.onCancel,
    this.isCancelButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Dialog هو حاوية للويدجت التي تريد عرضها كـ dialog
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor:
          Colors.transparent, // لجعل الخلفية شفافة لرؤية الشكل المخصص
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      constraints: BoxConstraints(
        maxWidth: context.width * (context.deviceType == DeviceType.desktop ? 0.5 : 0.8),
        ),
      decoration: BoxDecoration(
        color: Colors.white, // لون خلفية الـ dialog
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // لجعل العمود يأخذ أقل مساحة ممكنة
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            message,
            style: const TextStyle(fontSize: 16.0, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (isCancelButton)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // إغلاق الـ dialog
                    if(onCancel != null){onCancel!();} // استدعاء دالة الإلغاء المخصصة
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white, // لون النص
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(cancelButtonText ?? 'Cancel'),
                ),
              // زر التأكيد
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // إغلاق الـ dialog
                  onConfirm(); // استدعاء دالة التأكيد المخصصة
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // لون الزر
                  foregroundColor: Colors.white, // لون النص
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                child: Text(confirmButtonText ?? 'Confirm'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لعرض الـ dialog بسهولة
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmButtonText,
    String? cancelButtonText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // المستخدم يجب أن يضغط على زر
      builder: (BuildContext dialogContext) {
        return CustomAlertDialog(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onConfirm: onConfirm,
          onCancel: onCancel,
        );
      },
    );
  }
}
