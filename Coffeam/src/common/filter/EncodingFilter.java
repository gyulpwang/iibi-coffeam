package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {

    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/* request를 보내기 전에 사전 처리할 코드가 있다면 이 곳에서 구현한다.
		또한 response를 보낸 후에 사후 처리할 코드가 있다면 역시 여기서 구현한다.
		우리는 모든 요청이 처리되기 전에 한글 인코딩 처리를 필터에서 할 예정 */
 		request.setCharacterEncoding("UTF-8");
 		System.out.println("EncodingFilter로 한글 처리함");

 		// 체인이 여러 개일 경우 이 체인을 끝낸 후 다음 체인으로 패스하여 다음 체인 수행
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
