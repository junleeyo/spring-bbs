package net.java_school.user.spring;

/*import java.net.URLEncoder;
import javax.servlet.http.HttpSession;*/

import java.security.Principal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;


import net.java_school.commons.WebContants;
import net.java_school.exception.AuthenticationException;
import net.java_school.user.PasswordVO;
import net.java_school.user.User;
import net.java_school.user.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
@RequestMapping("/users")
public class UsersController {
    
  @Autowired
  private UserService userService;

  @RequestMapping(value="/signUp", method=RequestMethod.GET)
  public String signUp(Model model) {
	model.addAttribute(WebContants.USER_KEY, new User());
    return "users/signUp";
  }

  @RequestMapping(value="/signUp", method=RequestMethod.POST)
  public String signUp(@Valid User user, BindingResult bindingResult) {
	  
	//유효성 검사
	if (bindingResult.hasErrors()) {
	    return "users/signUp";
	}

    userService.addUser(user);
    
    String authority = "ROLE_USER";
    userService.addAuthority(user.getEmail(), authority);
    
    return "redirect:/users/welcome";
  }

  @RequestMapping(value="/welcome", method=RequestMethod.GET)
  public String welcome() {
    return "users/welcome";
  }

  
  
  @RequestMapping(value="/login", method=RequestMethod.GET)
  public String login() {
    return "users/login";
  }
  
  /*
  @RequestMapping(value="/login", method=RequestMethod.POST)
  public String login(String email, String passwd, String url, HttpSession session) {
    User user = userService.login(email, passwd);
        
    if (user == null) {
      return "redirect:/users/login?url=" + url + "&msg=Login-Failed";
    } else {
      session.setAttribute(WebContants.USER_KEY, user);
      if (!url.equals("")) {
        return "redirect:" + url;
      }
      
      return "redirect:/";
    }        
  }
  */
        
  @RequestMapping(value="/editAccount", method=RequestMethod.GET)
  public String editAccount(Principal principal, Model model) throws Exception {
	 User user = userService.getUser(principal.getName());
	 model.addAttribute(WebContants.USER_KEY, user);

    return "users/editAccount";
  }
    
  @RequestMapping(value="/editAccount", method=RequestMethod.POST)
  public String editAccount(@Valid User user, BindingResult bindingResult, Principal principal) {
	//유효성 검사
    if (bindingResult.hasErrors()) {
        return "users/editAccount";
    }
	    
	user.setEmail(principal.getName());

    int check = userService.editAccount(user);
    if (check < 1) {
        throw new RuntimeException(WebContants.EDIT_ACCOUNT_FAIL);
    } 

    return "users/changePasswd";
        
  }
    
  @RequestMapping(value="/changePasswd", method=RequestMethod.GET)
  public String changePasswd(Principal principal, Model model) throws Exception {
	User user = userService.getUser(principal.getName());

    model.addAttribute(WebContants.USER_KEY, user);
    
    PasswordVO passwordVO = new PasswordVO();
    passwordVO.setCurrentPasswd(user.getPasswd());    
    model.addAttribute("passwordVO", passwordVO);
        
    return "users/changePasswd";
  }
    
  @RequestMapping(value="/changePasswd", method=RequestMethod.POST)
  public String changePasswd(@Valid PasswordVO passwordVO,
	        BindingResult bindingResult,
	        Model model, Principal principal) {            

	  if (bindingResult.hasErrors()) {
        User user = userService.getUser(principal.getName());
        model.addAttribute(WebContants.USER_KEY, user);
        return "users/changePasswd";
	  }
  
	int check = userService.changePasswd(passwordVO.getCurrentPasswd(), passwordVO.getNewPasswd(), principal.getName());
	  
    if (check < 1) {
        throw new AuthenticationException(WebContants.CHANGE_PASSWORD_FAIL);
    } 
    
    return "redirect:/users/changePasswd_confirm";
        
  }
    
  @RequestMapping(value="/changePasswd_confirm", method=RequestMethod.GET)
  public String changePasswd_confirm() {
    return "users/changePasswd_confirm";
  }
    
  @RequestMapping(value="/bye", method=RequestMethod.GET)
  public String bye(HttpServletRequest req, Principal principal) throws Exception {          
    /*if (principal.getName() == null) {
      //로그인 후 다시 돌아오기 위해
      String url = req.getServletPath();
      String query = req.getQueryString();
      if (query != null) url += "?" + query;
      //로그인 페이지로 리다이렉트
      url = URLEncoder.encode(url, "UTF-8");
      
      return "redirect:/users/login?url=" + url;
    }*/
        
    return "users/bye";
  }

  @RequestMapping(value="/bye", method=RequestMethod.POST)
  public String bye(String email, String passwd, HttpServletRequest req) throws ServletException {        
	User user = new User();
	user.setEmail(email);
	user.setPasswd(passwd);
	    
    userService.bye(user);
    req.logout();
    
    return "redirect:/users/bye_confirm";
        
  }
  
  @RequestMapping(value="/bye_confirm", method=RequestMethod.GET)
  public String bye_confirm() {
  
    return "users/bye_confirm";      
  } 
  
  /*
  @RequestMapping(value="/logout", method=RequestMethod.GET)
  public String logout(HttpSession session) {
    session.removeAttribute(WebContants.USER_KEY);

    return "redirect:/";
  }
  */

}
