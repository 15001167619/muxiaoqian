package com.ruoyi.system.service;

import com.ruoyi.system.domain.ExamQuestion;
import java.util.List;

/**
 * 试题 服务层
 * 
 * @author ruoyi
 * @date 2019-03-16
 */
public interface IExamQuestionService 
{
	/**
     * 查询试题信息
     * 
     * @param id 试题ID
     * @return 试题信息
     */
	public ExamQuestion selectExamQuestionById(Integer id);
	
	/**
     * 查询试题列表
     * 
     * @param examQuestion 试题信息
     * @return 试题集合
     */
	public List<ExamQuestion> selectExamQuestionList(ExamQuestion examQuestion);
	
	/**
     * 新增试题
     * 
     * @param examQuestion 试题信息
     * @return 结果
     */
	public int insertExamQuestion(ExamQuestion examQuestion);
	
	/**
     * 修改试题
     * 
     * @param examQuestion 试题信息
     * @return 结果
     */
	public int updateExamQuestion(ExamQuestion examQuestion);
		
	/**
     * 删除试题信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteExamQuestionByIds(String ids);
	
}
