package net.java_school.user;
import org.springframework.security.access.prepost.PreAuthorize;

public interface UserService {
    
    //회원 가입
    public void addUser(User user);
    
    //로그인
    //public User login(String email, String passwd);
    
    //회원정보 수정
    @PreAuthorize("#user.email == principal.username or hasRole('ROLE_ADMIN')")
    public int editAccount(User user);
    
    //비밀번호 변경
    @PreAuthorize("#email == principal.username or hasRole('ROLE_ADMIN')")
    public int changePasswd(String currentPasswd, String newPasswd, String email);
    
    //탈퇴
    @PreAuthorize("#user.email == principal.username or hasRole('ROLE_ADMIN')")
    public void bye(User user);

    //회원 찾기
    @PreAuthorize("#email == principal.username or hasRole('ROLE_ADMIN')")
    public User getUser(String email);
    
    //회원권한 추가
    public void addAuthority(String email, String authority);        
}