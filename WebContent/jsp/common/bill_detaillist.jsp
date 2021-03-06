<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/user/reset.css?ver=${version}"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/user/popupbox.css?ver=${version}"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/user/box.css?ver=${version}"/>
<script type="text/javascript" src="${baseUrlStatic}/js/jquery-1.8.3.js"></script>
<title>${LANG['bizconf.jsp.common.bill_detaillist.res1']}</title>
<script type="text/javascript">
	function exportBilling(){
		$("input[name=isExport]").val("true");
		$("#queryDetail").submit();
		$("input[name=isExport]").val("false");
	}
	
	
	function exportExcel(){
		var url = "/common/billing/showTelDetail?isExport=true";
		url +="&year="+$("input[name=year]").val();
		url +="&month="+$("input[name=month]").val();
		url +="&userId="+$("input[name=userId]").val();
		url +="&id="+$("input[name=id]").val();
		window.location = url;
	}
</script>
</head>
<body onload="loaded()">
<table class="overlay-panel" border="0" cellpadding="0" cellspacing="0" >
  <tbody>
    <tr class="no-header">
      <td class="overlay-hdL"></td>
      <td class="overlay-hdC"></td>
      <td class="overlay-hdR"></td>
    </tr>
    <tr>
      <td class="overlay-bdL"></td>
      <td class="overlay-content">
        <div class="First_Steps_quick_e" style=" background:#FFF;">
          <div class="First_Steps_title_e"> <a href="javascript:closeDialog();"></a>
            <h3 class="tit_a">${LANG['bizconf.jsp.common.bill_detaillist.res1']}</h3>
            <p class="tit_b">${LANG['bizconf.jsp.common.bill_detaillist.res2']}</p>
          </div>
          <div style=" background:#fff"><img class="toa_quick" src="${baseUrlStatic}/images/min.jpg" width="560" height="1" /></div>
          <div class="First_Steps_top" style=" background:#FFF"> </div>
          <div class="First_Steps_main_quick" >
            <table cellpadding="0" cellspacing="0" border="0" class="chaxun_top">
              <tr class="cx01">
                <td style="font-weight:bold;">
                	<c:choose>
			  	 	<c:when test="${site.chargeMode eq 1 }">
			  	 		name host
			  	 	</c:when>
			  	 	<c:when test="${site.chargeMode eq 2 }">
			  	 		active users
			  	 	</c:when>
			  	 	<c:when test="${site.chargeMode eq 3 }">
			  	 		seats
			  	 	</c:when>
			  	 	<c:when test="${site.chargeMode eq 4 }">
			  	 		meeting time
			  	 	</c:when>
			  	 	<c:when test="${site.chargeMode eq 5 }">
			  	 		user time
			  	 	</c:when>
			  	 </c:choose>
                </td>
                <td align="right"><strong style=" color:#F00">${LANG['bizconf.jsp.admin.mybilling_list.res8']}<fmt:formatNumber value="${fee}" pattern="0.00" type="number"/>${LANG['bizconf.jsp.admin.mybilling_list.res9']}</strong></td>
              </tr>
              <tr class="cx01">
              	<td align="right" colspan="2">
					<div style="float: left; width: 18%;" class="button_common" align="right;">
						<a href="javascript:exportExcel();">
						<img width="17" height="14" align="absmiddle" style=" margin-right:5px; margin-left:5px;" src="${baseUrlStatic}/images/back.png">
							${LANG['bizconf.jsp.conflogs.res1']}
						</a>
					</div>
              	</td>
              </tr>
            </table>
             
            <form id="queryDetail" action="/common/billing/showTelDetail" method="post">
            <input type="hidden" name="isExport" value="false"/>
			<input type="hidden" name="userId" value="${userId}" />
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="year" value="${year}" />
			<input type="hidden" name="month" value="${month}" />
            <div class="div_overflow" style="width: 600px;height: 400px;overflow-y:auto;overflow-x: hidden">
            <c:if test="${fn:length(pageModel.datas)<=0}">
			           <div align="center" style="height: 35px;width: 100%;"> ${LANG['website.common.msg.list.nodata']}</div>
			</c:if>
			<c:forEach var="confBill" items="${pageModel.datas}" varStatus="status">
              <table cellpadding="0" cellspacing="0" border="0" class="chaxun_top">
                <c:if test="${status.index != 0 }">
                <tr>
                  <td style=" font-weight:bold;"></td>
                  <td></td>
                </tr>
                </c:if>
                <tr class="cx02">
                  <td align="left" width="160">
                  	<div style="width:160px;height:30px;line-height:30px;overflow: hidden;white-space:nowrap; ">
                  		<span style="font-weight: bold;">${LANG['bizconf.jsp.conf_invite_recv.res6']}</span>${confBill.conf.confName}
                  	</div>
                  </td>
                  <td align="left" width="145"> <span style="font-weight: bold;">${LANG['bizconf.jsp.common.bill_detaillist.res3']}</span>${confBill.confHwid}</td>
                  <td align="left" colspan="2"><span style="font-weight: bold;">${LANG['com.bizconf.jsp.datafee.totaltime']}：</span>${confBill.showDuration }
                  </td>
                  <td align="right">${LANG['bizconf.jsp.common.bill_detaillist.res8']}:<span style="font-weight: bold;"> <fmt:formatNumber value="${confBill.sum}" pattern="0.00" type="number"/></span>${LANG['bizconf.jsp.admin.mybilling_list.res9']} </td>
                </tr>
              </table>
              <table cellpadding="0" cellspacing="0" border="0" class="chaxun_main">
              <tr class="cx03">
                  <td align="center" >${LANG['bizconf.jsp.admin.arrange_org_user.res8']}</td>
                  <td align="center">${LANG['bizconf.jsp.common.bill_detaillist.res6']}</td>
                  <td align="center">${LANG['bizconf.jsp.common.bill_detaillist.res7']}</td>
                  <td align="center">${LANG['com.bizconf.jsp.datafee.entertype']}</td>
                  <td align="center">${LANG['bizconf.jsp.common.bill_detaillist.res4']}</td>
                  <td align="center">${LANG['bizconf.jsp.common.bill_detaillist.res8']}</td>
               </tr>
              <c:if test="${confBill.billings !=null}">
                <c:forEach  var="bill" items="${confBill.billings}" varStatus="status">
	                <tr class="cx04">
	                  <td align="center">${bill.userName}</td>
<%--	                  <td>${bill.enterNumber }</td>--%>
<%--	                  <td>${bill.callNumber }</td>--%>
	                  <td align="center" ><fmt:formatDate value="${bill.startDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
	                  <td align="center">${bill.showDuration}</td>
	                  <td align="center">
	                  	<c:choose>
	                  		<c:when test="${bill.eventType eq 1}">
	                  			${LANG['com.bizconf.jsp.datafee.entertypeout']}
	                  		</c:when>
	                  		<c:otherwise>
	                  			${LANG['com.bizconf.jsp.datafee.entertypein']}
	                  		</c:otherwise>
	                  	</c:choose>
	                  </td>
	                  <td align="center">${bill.enterNumber }</td>
	                  <td align="center"><fmt:formatNumber value=" ${bill.totalFee}" pattern="0.00" type="number"/>${LANG['bizconf.jsp.admin.mybilling_list.res9']}</td>
	                </tr>
				</c:forEach>
				</c:if>
              </table>
		    </c:forEach>
            </div>
            </form>
<%--            <div class="but160" style=" margin-bottom:70px;"><span class="button_common"><a href="javascript:closeDialog();"><img src="${baseUrlStatic}/images/right.png" width="16" height="14" align="absmiddle" style=" margin-right:5px; margin-left:5px"/>${LANG['bizconf.jsp.common.bill_detaillist.res10']}</a></span></div>--%>
          </div>
        </div>
      </td>
      <td class="overlay-bdR"></td>
    </tr>
    <tr>
      <td class="overlay-ftL"></td>
      <td class="overlay-ftC"></td>
      <td class="overlay-ftR"></td>
    </tr>
  </tbody>
</table>
</body>
</html>
<script type="text/javascript">
function loaded() {
	var frame = parent.$("#billingView");
	frame.trigger("loaded");
}
function closeDialog(result) {
	var dialog = parent.$("#billingView");
	if(result){
		dialog.trigger("closeDialog", [result]);
	} else {
		dialog.trigger("closeDialog");	
	}
}
</script>
