package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExamQuestionMapper;
import com.ruoyi.system.domain.ExamQuestion;
import com.ruoyi.system.service.IExamQuestionService;
import com.ruoyi.common.core.text.Convert;

/**
 * 试题 服务层实现
 * 
 * @author ruoyi
 * @date 2019-03-16
 */
@Service
public class ExamQuestionServiceImpl implements IExamQuestionService 
{
	@Autowired
	private ExamQuestionMapper examQuestionMapper;

	/**
     * 查询试题信息
     * 
     * @param id 试题ID
     * @return 试题信息
     */
    @Override
	public ExamQuestion selectExamQuestionById(Integer id)
	{
	    return examQuestionMapper.selectExamQuestionById(id);
	}
	
	/**
     * 查询试题列表
     * 
     * @param examQuestion 试题信息
     * @return 试题集合
     */
	@Override
	public List<ExamQuestion> selectExamQuestionList(ExamQuestion examQuestion)
	{
	    return examQuestionMapper.selectExamQuestionList(examQuestion);
	}
	
    /**
     * 新增试题
     * 
     * @param examQuestion 试题信息
     * @return 结果
     */
	@Override
	public int insertExamQuestion(ExamQuestion examQuestion)
	{
	    return examQuestionMapper.insertExamQuestion(examQuestion);
	}
	
	/**
     * 修改试题
     * 
     * @param examQuestion 试题信息
     * @return 结果
     */
	@Override
	public int updateExamQuestion(ExamQuestion examQuestion)
	{
	    return examQuestionMapper.updateExamQuestion(examQuestion);
	}

	/**
     * 删除试题对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteExamQuestionByIds(String ids)
	{
		return examQuestionMapper.deleteExamQuestionByIds(Convert.toStrArray(ids));
	}
	
}
