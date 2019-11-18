package notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 0. ���� ������ ������ �Ķ����(cpage) �� �ޱ�
		/* cpage �Ķ���Ͱ� �Ѿ���� �ʴ´ٸ� ������ ����Ʈ �������� 1�� ��������. */
		String cpStr=req.getParameter("cpage");
		if(cpStr==null || cpStr.trim().isEmpty()){
			cpStr="1";
		}
		int cpage=Integer.parseInt(cpStr.trim());
		if(cpage <= 0){	// �Ķ���ͷ� ���� �� �Է� ��
			cpage=1;	// ù �������� �����ش�.
		}
		
		// 1. �޸� ��� ��������
		NoticeDAO ndao = new NoticeDAO();
		
		// 1_2. ����¡ ó���� ���� �� �Խñ� ���� �����´�.
		int totalCount=ndao.getTotalCount();
		
		// 1_3. �� �������� ������ ��� ���� ���ϱ�
		int pageSize=3;
		
		// 1_4. ������ �� ���ϱ�
		/* totalCount	pageSize	pageCount
		 *  1 ~ 10			10			1
		 * 11 ~ 20						2
		 * 21 ~ 30						3*/
		int pageCount=0;
		// ��� 1
		/* if(totalCount%pageSize==0)	pageCount=totalCount/pageSize;
		   else							pageCount=totalCount/pageSize+1; */
		// ��� 2
		/* pageCount2 = (totalCount+(pageSize-1))/pageSize; */
		// ��� 3
		pageCount = (totalCount-1)/pageSize+1;
		
		if(cpage > pageCount){	// �Ķ���ͷ� �ʰ��� ������ �Է� ��
			cpage=pageCount;	// ������ �������� �����ش�.
		}
		
		// 1_5. DB���� 5�� ������ ������� ���� ����
		int end = cpage * pageSize;
		int start = end-(pageSize-1);
		
		ArrayList<NoticeVO> arr=ndao.selectAllNotice(start, end);
		// start�� end���� �Ű������� �־��ش�.

		// 2. req�� �����ϱ�
		req.setAttribute("NTCList", arr);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("cpage", cpage);
		
		// 3. ���������� �̵���� ����
		this.setViewPage("coffeam_Notice.jsp");
	}
}
