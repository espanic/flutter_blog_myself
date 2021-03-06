import 'package:validators/validators.dart';

Function validateUserName() {
  return (String? value) {
    if (value!.isEmpty) {
      return "ID를 기입하십시오.";
    } else if (!isAlphanumeric(value)) {
      return "ID는 영문과 숫자만 가능합니다.";
    } else if (value.length > 12) {
      return "아이디는 12자 이하로 해주십시오.";
    } else {
      return null;
    }
  };
}

Function validatePassWorld() {
  return (String? value) {
    if (value!.isEmpty) {
      return "Password를 기입하십시오.";
    } else if (!isAlphanumeric(value)) {
      return "비밀번호는 영문과 숫자만 가능합니다.";
    } else if (value.length > 15) {
      return "비밀번호는 15자 이하로 해주십시오.";
    } else if (value.length < 5) {
      return "비밀번호는 5자 이상으로 해주십시오.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "Email을 기입하십시오.";
    } else if (!isEmail(value)) {
      return "이메일 형식이 아닙니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목이 너무 깁니다. 30자 이하로 쓰세요.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "글 분량을 초과했습니다. 500자 이하";
    } else {
      return null;
    }
  };
}
