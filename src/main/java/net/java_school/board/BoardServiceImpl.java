package net.java_school.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.java_school.commons.PagingHelper;
import net.java_school.mybatis.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardMapper boardMapper;
  private PagingHelper pagingHelper; //페이징 처리 유틸리티 클래스

  //목록 
  public List<Article> getArticleList(String boardCd, String searchWord) {
    Integer startRownum = pagingHelper.getStartRecord();
    Integer endRownum = pagingHelper.getEndRecord();
    HashMap<String, String> hashmap = new HashMap<String, String>();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    hashmap.put("start", startRownum.toString());
    hashmap.put("end", endRownum.toString());

    return boardMapper.selectListOfArticles(hashmap);
  }
    
  //총 레코드 
  public int getTotalRecord(String boardCd, String searchWord) {
    HashMap<String,String> hashmap = new HashMap<String,String>();
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);
    
    return boardMapper.selectCountOfArticles(hashmap);
  }
    
  //글쓰기 
  public int addArticle(Article article) {
    return boardMapper.insert(article);
  }

  //첨부 파일 추가 
  public void addAttachFile(AttachFile attachFile) {
    boardMapper.insertAttachFile(attachFile);
  }

  //글 수정 
  public void modifyArticle(Article article) {
    boardMapper.update(article);
  }

  //글 삭제
  public void removeArticle(int articleNo) {
    boardMapper.delete(articleNo);
  }

  //조회 수 증가 
  public void increaseHit(int articleNo) {
    boardMapper.updateHitPlusOne(articleNo);
  }

  //상세보기 
  public Article getArticle(int articleNo) {
    return boardMapper.selectOne(articleNo);
  }

  //다음 글 
  public Article getNextArticle(int articleNo, String boardCd, String searchWord) {
    HashMap<String, String> hashmap = new HashMap<String, String>();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectNextOne(hashmap);
  }

  //이전 글 
  public Article getPrevArticle(int articleNo, String boardCd, String searchWord) {
    HashMap<String, String> hashmap = new HashMap<String, String>();
    Integer no = articleNo;
    hashmap.put("articleNo", no.toString());
    hashmap.put("boardCd", boardCd);
    hashmap.put("searchWord", searchWord);

    return boardMapper.selectPrevOne(hashmap);
  }

  //첨부 파일 리스트 
  public List<AttachFile> getAttachFileList(int articleNo) {
    return boardMapper.selectListOfAttachFiles(articleNo);
  }

  //첨부 파일 삭제 
  public void removeAttachFile(int attachFileNo) {
    boardMapper.deleteFile(attachFileNo);
  }

  //게시판 이름 
  public String getBoardNm(String boardCd) {
    return boardMapper.selectOneBoardName(boardCd);
  }

  //댓글 쓰기 
  public void addComment(Comment comment) {
    boardMapper.insertComment(comment);
  }

  //댓글 수정 
  public void modifyComment(Comment comment) {
    boardMapper.updateComment(comment);
  }

  //댓글 삭제 
  public void removeComment(int commentNo) {
    boardMapper.deleteComment(commentNo);
  }

  //댓글 리스트 
  public List<Comment> getCommentList(int articleNo) {
    return boardMapper.selectListOfComments(articleNo);
  }

  //첨부 파일 찾기 
  public AttachFile getAttachFile(int attachFileNo) {
    return boardMapper.selectOneAttachFile(attachFileNo);
  }

  //댓글 찾기 
  public Comment getComment(int commentNo) {
    return boardMapper.selectOneComment(commentNo);
  }

  public int getListItemNo() {
    return pagingHelper.getListItemNo(); 
  }

  public int getPrevPage() {
    return pagingHelper.getPrevPage();
  }

  public int getFirstPage() {
    return pagingHelper.getFirstPage();
  }

  public int getLastPage() {
    return pagingHelper.getLastPage();
  }

  public int getNextPage() {
    return pagingHelper.getNextPage();
  }

  public void setPagingHelper(PagingHelper pagingHelper) {
    this.pagingHelper = pagingHelper;
  }
    
}