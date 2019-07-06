package com.github.luguo126.cqas.dao;

import com.github.luguo126.cqas.domain.Answer;
import com.github.luguo126.cqas.domain.User;
import com.github.luguo126.cqas.domain.Question;
// import com.github.luguo126.cqas.domain.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseDao {
    public List<Question> findQuestionByUid(@Param("uid") String uid);
    public Question findQuestionByQid(@Param("qid") long qid);

    public User findUserByUid(@Param("uid") String uid);

    public List<Question> findQuestions();

    public List<Question> findAllQuestions();

    public void delete_question_by_qid(@Param("qid") long qid);

    public void update_question(Question question);

    public void update_user_password(User user);

    public List<Answer> findAnswerByQid(@Param("qid") long qid);


}
