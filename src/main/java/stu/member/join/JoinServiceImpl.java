package stu.member.join;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	// 이메일 인증 설정
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    } 
	
	// 회원가입
	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		joinDAO.insertMember(map);
	}
	
	// 아이디 중복 체크
	@Override
	public int selectIdCheck(String MEMBER_ID) throws Exception {
		return joinDAO.selectIdCheck(MEMBER_ID);
	}
	
	// 이메일 중복 체크
	@Override
	public int selectEmailCheck(String MEMBER_EMAIL) throws Exception {
		return joinDAO.selectEmailCheck(MEMBER_EMAIL);
	}
	
	// 이메일 인증
	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {

		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);

			if (filePath != null) {
				File file = new File(filePath);
				if (file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}

			javaMailSender.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	
	
}
