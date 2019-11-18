<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, notice.model.*, java.text.*"%>
    
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="ndao" class="notice.model.NoticeDAO" scope="session"/>

<% 	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); %>

                <div class="row box">
                	<table class="table">
			          	<thead>
			          		<tr class="tableTitle">
			          		<!-- 
			          		http://getbootstrap.com/components/
			          		http://www.w3schools.com/bootstrap/bootstrap_glyphicons.asp
			          		을 참고하여 글립콘을 사용해보자! -->
			          			<td width="45%"><h3><b>공지사항</b></h3></td>
								<td align="right" width="55%">
									<%-- <h5><a href="<%=request.getContextPath()%>/service/coffeam_Notice.jsp">more</a></h5> --%>
									<a href="<%=request.getContextPath()%>/service/ntc-list.do">
										<i class="fa fa-3x fa-fw fa-bars" style="color:#fff; font-size:16px"></i>
									</a>
								</td>			          			
			          		</tr>
			          	</thead>
			          	<tbody>
			          	<%	ArrayList<NoticeVO> arr = ndao.listAllNotice();
							//System.out.println("arr="+arr);
							if(arr == null || arr.size() == 0){
								%><tr><td colspan = '2'>서버 오류이거나 데이터가 없습니다.</td></tr><%
							}else{
				          		%><tr>
				          			<th width="30%" style="text-align:center">작성일</th>
				          			<th style="text-align:center">게시글 제목</th>
				          		</tr><%
								// 반복문 돌 부분 ---------------------------
								Iterator<NoticeVO> it = arr.iterator();
								NoticeVO ntc = new NoticeVO();
								int i=0;
								while(it.hasNext()){
									ntc = it.next(); 
									if(i<5){%>
						          		<tr>
						          			<td style="text-align: center"><%=sdf.format(ntc.getWdate())%></td>
						          			<td><a href="" style="color:black;"><%=ntc.getTitle()%></a></td>
						          		</tr>
			          				<%i++;
									}else{
										break;
									}
								}
							} %>
			          	</tbody>
					</table>
                </div><!-- row box-->
	          </div><!-- col-md-3 -->
            </div><!-- row -->
            </div><!-- container -->
          <div class="col-md-6">
