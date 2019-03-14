package kr.or.ddit.user.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.or.ddit.user.model.UserVo;

public class UserVoValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVo.class.isAssignableFrom(clazz);
	}
//검증할 객체를 스프링이 넘겨줌 로직 작성
	@Override
	public void validate(Object target, Errors errors) {
		UserVo userVo= (UserVo)target;
		//비밀번호는 8자리 이상이여야한다.
		if(userVo.getPass().length()<8){
			errors.rejectValue("pass","passLen");
			
		}
		//사용자 아이디 검증 (반값이면 안된다.)
		if(userVo.getUserId().equals(""))
			errors.rejectValue("userId","required");
		
		//사용자 아이디는 6자리 이상이여야합니다.
		if(userVo.getUserId().length()<6)
			errors.rejectValue("userId", "userIdLen");
	}

}
