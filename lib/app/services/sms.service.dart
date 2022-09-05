import 'package:flutter_sms/flutter_sms.dart' as sms;

class SMSService {
  Future<String> sendSMS(String message, List<String> recipients) async {
    if (await sms.canSendSMS()) {
      return await sms.sendSMS(
        message: message,
        recipients: recipients,
        sendDirect: true,
      );
    }

    throw Exception('O dispositivo não pode enviar SMS');
  }
}
