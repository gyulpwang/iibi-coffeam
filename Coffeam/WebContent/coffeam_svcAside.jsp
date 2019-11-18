<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
                <div class="row box">
                	<table class="table">
			          	<thead>
			          		<tr class="tableTitle">
			          			<th><h3><b>고객센터 서브메뉴</b></h3></th>
			          		</tr>
			          	</thead>
			          	<tbody>
							<tr>
								<td style="color:#af1817">
								<%-- <a href="<%=request.getContextPath()%>/service/coffeam_Notice.jsp"> --%>
								<a href="<%=request.getContextPath()%>/service/ntc-list.do">
								<i class="fa fa-3x fa-fw fa-bullhorn" style="font-size: 18pt"></i>&ensp;<span>공지사항</span></a></td>
							</tr>
							<tr>
								<td style="color:#af1817">
								<a href="<%=request.getContextPath()%>/service/qna-list.do">
								<i class="fa fa-3x fa-fw fa-question" style="font-size: 18pt"></i>&ensp;Q&amp;A</a></td>
							</tr>
							<tr>
								<td style="color:#af1817">
								<a href="<%=request.getContextPath()%>/service/fb-list.do">
								<i class="fa fa-3x fa-fw fa-pencil" style="font-size: 18pt"></i>&ensp;자유게시판</a></td>
							</tr>
			          	</tbody>
					</table>
                </div><!-- row -->
              </div><!-- col-md-12 -->
            </div><!-- row -->
          </div><!-- col-md-3 -->
          <div class="col-md-6">