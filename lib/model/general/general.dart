class General<T>{
  T data;
  bool error;
  String messageError;
  
  General({
    required this.data,
    this.error=false,
    this.messageError="",
  });
}