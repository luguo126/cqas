package com.github.luguo126.cqas.dao;

import com.github.luguo126.cqas.domain.SurfHistory;
import com.github.luguo126.cqas.domain.UserDetail;
import com.github.luguo126.cqas.domain.Answer;
import com.github.luguo126.cqas.domain.Question;
import com.github.luguo126.cqas.domain.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;



public interface UserDao extends BaseDao {
	public User findUser(@Param("user_id") String username,
			@Param("password") String password);

	public void insertUser(User user);

    public void insertQuestion(Question uestion);

    public List<Question> findQuestion();
	public List<Question> findQuestionWithinTwoHours();
	public List<Question> findHotQuestions(@Param("limit_number") int limit_number);


	public void question_like_counter_add_one(
			@Param("like_number")long like_number, @Param("qid")long qid);

	public void question_surf_counter_add_one(
			@Param("qid")long qid);

	public void insertAnswer(Answer answer);


	public List<Answer> findAnswerByUid(@Param("uid") String uid);


	public void updateUserPassword(@Param("password") String password,
		@Param("email") String email);

	public void update_userdetail_headurl_by_uid(@Param("uid") String uid,
		@Param("head_img") String head_img);

	public UserDetail find_user_detail_by_uid(@Param("uid") String uid);

	public void insert_userdetail_headurl(@Param("uid") String uid,
		@Param("head_img") String head_img);

	public void insert_userdetail_uid(@Param("uid") String uid);


	// public SurfHistory find_surf_data(@Param("qid")long qid);

	public void add_surf_data(@Param("qid")long qid, @Param("uid") String uid);
	public SurfHistory find_surf_data_by_qid_uid(@Param("qid")long qid, @Param("uid") String uid);
	public void update_surf_date(@Param("qid")long qid, @Param("uid") String uid);
	public void update_surfhistory_thumbsup_set_true(@Param("qid")long qid, @Param("uid") String uid);
	public void update_surfhistory_answered_set_true(@Param("qid")long qid, @Param("uid") String uid);
	public void add_question_answer_number_one(@Param("qid")long qid);

	public List<Question> findQuestionsBasedOnSurfhistory(@Param("uid") String uid);
	public List<Question> findAnsweredQuestionFromSurfhistory(@Param("uid") String uid);
	public List<Question> findQuestionByTypeNRows(@Param("type") String type, @Param("nrow") long nrow);
	public List<Question> findQuestionByTypeWithMostAnswers(@Param("type") String type, @Param("nrow") long nrow);


}
