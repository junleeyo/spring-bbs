function goView(articleNo) {
    var form = document.getElementById("viewForm");
    form.articleNo.value = articleNo;
    form.submit();
}

function goList(curPage) {
    var form = document.getElementById("listForm");
    form.curPage.value = curPage;
    form.submit();
}

$(document).ready(function() {
  $('#file-list a.download').click(function() {
    var $attachFileNo = this.title;
    $('#downloadForm input[name*=attachFileNo]').val($attachFileNo);
    $('#downloadForm').submit();
    
    return false;
  });
  
  $('#file-list a:not(.download)').click(function() {
    var chk = confirm("정말로 삭제하시겠습니까?");
    
    if (chk == true) {
      var $attachFileNo = this.title;
      $('#deleteAttachFileForm input[name*=attachFileNo]').val($attachFileNo);
      $('#deleteAttachFileForm').submit();
    }
    
    return false;
  });
  
  //댓글반복
  $('.comments').click(function(e) {
      if ($(e.target).is('.comment-toggle')) {
          var $form = $(e.target).parent().parent().find('.modify-comment');
          var $p = $(e.target).parent().parent().find('.view-comment');
          if ($form.is(':hidden') == true) {
              $form.show();
              $p.hide();
          } else {
              $form.hide();
              $p.show();
          }
          return false;
      } else if ($(e.target).is('.comment-delete')) {
          var chk = confirm("정말로 삭제하시겠습니까?");
          if (chk == true) {
              var $commentNo = $(e.target).attr('title');
              $('#deleteCommentForm input[name*=commentNo]').val($commentNo);
              $('#deleteCommentForm').submit();
          }
          return false;
      }
  });
  //form 안의 수정하기 링크
  $('.modify-comment a:contains("수정하기")').click(function(e) {
      $(e.target).parent().parent().submit();
      return false;
  });
  //form 안의 취소 링크
  $('.modify-comment a:contains("취소")').click(function(e) {
      var $form = $(e.target).parent().parent();
      var $p = $(e.target).parent().parent().parent().find('.view-comment');
      if ($form.is(':hidden') == true) {
          $form.show();
          $p.hide();
      } else {
          $form.hide();
          $p.show();
      }
      return false;
  });
  //다음, 이전글
  $('#next-prev a').click(function() {
	    var $articleNo = this.title;
	    goView($articleNo);
	    return false;
	});
//	수정 버튼
  $('#goModify').click(function() {
      $('#modifyForm').submit();
  });
  //삭제 버튼
  $('#goDelete').click(function() {
      var chk = confirm('정말로 삭제하시겠습니까?');
      if (chk == true) {
          $('#delForm').submit();
      }
  });
//목록버튼
  $('#goList').click(function() {
      $('#listForm').submit();
  });
  //새글쓰기 버튼
  $('#goWrite').click(function() {
      $('#writeForm').submit();
  });
  
});