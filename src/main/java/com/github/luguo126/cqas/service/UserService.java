package com.github.luguo126.cqas.service;

import com.github.luguo126.cqas.domain.SurfHistory;
import com.github.luguo126.cqas.domain.UserDetail;
import com.github.luguo126.cqas.domain.Answer;
import com.github.luguo126.cqas.domain.Question;
// import org.apache.ibatis.annotations.Param;


// import com.github.luguo126.cqas.dao.UserDao;
import com.github.luguo126.cqas.domain.User;

import java.util.List;


public interface UserService extends BaseService {

    public User findUser(String username,String password);
	public void insertUser(User user);
    public void insertQuestion(Question uestion);

    public List<Question> findQuestion();
    public List<Question> findQuestionWithinTwoHours();
    public List<Question> findHotQuestions(int limit_number);

    // public List<Question> findQuestionByUid(String uid);

    public void question_like_counter_add_one(long like_number, long qid);
    public void question_surf_counter_add_one(long qid);

    public void insertAnswer(Answer answer);

    public List<Answer> findAnswerByUid(String uid);

    public void updateUserPassword(String password, String email);

    public void update_userdetail_headurl_by_uid(String uid,String head_img);

    public UserDetail find_user_detail_by_uid(String uid);

    public void insert_userdetail_uid(String uid);

    public void add_surf_data(long qid, String uid);
    public SurfHistory find_surf_data_by_qid_uid(long qid, String uid);
	public void update_surf_date(long qid, String uid);
	public void update_surfhistory_thumbsup_set_true(long qid, String uid);
    public void add_question_answer_number_one(long qid);
    public void update_surfhistory_answered_set_true(long qid, String uid);
	public List<Question> findQuestionsBasedOnSurfhistory(String uid);
    public List<Question> findQuestionByTypeNRows(String type, long nrow);
    public List<Question> findQuestionByTypeWithMostAnswers(String type, long nrow);

    public List<Question> findAnsweredQuestionFromSurfhistory(String uid);

}
