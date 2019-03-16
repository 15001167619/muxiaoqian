package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 试题表 exam_question
 * 
 * @author ruoyi
 * @date 2019-03-16
 */
public class ExamQuestion extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键id */
	private Integer id;
	/** 试题类型 */
	private Integer type;
	/** 试题内容 */
	private String question;
	/** 限时 */
	private Integer timeLimit;
	/** 试题状态 */
	private Integer status;
	/** 答案 */
	private String answerContent;
	/** 题目解析 */
	private String analyze;
	/** 难度 */
	private Integer level;
	/** 创建时间 */
	private Date createTime;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setType(Integer type) 
	{
		this.type = type;
	}

	public Integer getType() 
	{
		return type;
	}
	public void setQuestion(String question) 
	{
		this.question = question;
	}

	public String getQuestion() 
	{
		return question;
	}
	public void setTimeLimit(Integer timeLimit) 
	{
		this.timeLimit = timeLimit;
	}

	public Integer getTimeLimit() 
	{
		return timeLimit;
	}
	public void setStatus(Integer status) 
	{
		this.status = status;
	}

	public Integer getStatus() 
	{
		return status;
	}
	public void setAnswerContent(String answerContent) 
	{
		this.answerContent = answerContent;
	}

	public String getAnswerContent() 
	{
		return answerContent;
	}
	public void setAnalyze(String analyze) 
	{
		this.analyze = analyze;
	}

	public String getAnalyze() 
	{
		return analyze;
	}
	public void setLevel(Integer level) 
	{
		this.level = level;
	}

	public Integer getLevel() 
	{
		return level;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("question", getQuestion())
            .append("timeLimit", getTimeLimit())
            .append("status", getStatus())
            .append("answerContent", getAnswerContent())
            .append("analyze", getAnalyze())
            .append("level", getLevel())
            .append("createTime", getCreateTime())
            .toString();
    }
}
