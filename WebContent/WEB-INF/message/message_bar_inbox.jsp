<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ----------------------------------------------------------------------- -->
			<div class="col-md-3">
              <%@ include file="message_bar_post.jsp" %>
                
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">12</span></a></li>
                    <li><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
                    <li><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 </a></li>
                    <li><a href="#"><i class="fa fa-filter"></i> 스팸 쪽지함 <span class="label label-waring pull-right">65</span></a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
             </div>
             