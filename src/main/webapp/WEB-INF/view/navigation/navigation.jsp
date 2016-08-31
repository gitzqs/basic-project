<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspf/taglibs.jsp" %>
<aside class="Hui-aside">
<input runat="server" id="divScrollValue" type="hidden" value="" />
<div class="menu_dropdown bk_2">

		<c:forEach items="${parentList}" var="list" varStatus="status">
			<dl id="menu-article">
				<dt><i class="Hui-iconfont">${list.ICON}</i> ${list.NAME}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<c:forEach items="${list.childList}" var="cList" varStatus="status">
							<li><a _href="${ctx}${cList.URL}/" data-title="${cList.NAME}" href="javascript:void(0)">${cList.NAME}</a></li>
						</c:forEach>
						
					</ul>
				</dd>
			</dl>
		</c:forEach>
	</div>
</aside>