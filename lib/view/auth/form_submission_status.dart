abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  // baslangic durumu
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {} // bekleme durumu

class SubmissionSuccess extends FormSubmissionStatus {} // basarili olma durumu

class SubmissionFailed extends FormSubmissionStatus {
  // hatali olma durumu
  final Object exception;
  SubmissionFailed(this.exception);
}
