function goList(curPage) {
    var form = document.getElementById("listForm");
    form.curPage.value = curPage;
    form.submit();
}

function goView(articleNo) {
    var form = document.getElementById("viewForm");
    form.articleNo.value = articleNo;
    form.submit();
}

//상세보기 안의 목록의 제목링크
$('#list-table a').click(function() {
    var $articleNo = this.title;
    goView($articleNo);
    return false;
});
//페이징 처리
$('#paging a').click(function() {
    var $curPage = this.title;
    goList($curPage);
    return false;
});
//검색 버튼 위의 새글쓰기 버튼
$('#list-menu input').click(function() {
    $('#writeForm').submit();
});