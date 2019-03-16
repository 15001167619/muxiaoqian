package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.ExamQuestion;
import com.ruoyi.system.service.IExamQuestionService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 试题 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-16
 */
@Controller
@RequestMapping("/system/examQuestion")
public class ExamQuestionController extends BaseController
{
    private String prefix = "system/examQuestion";
	
	@Autowired
	private IExamQuestionService examQuestionService;
	
	@RequiresPermissions("system:examQuestion:view")
	@GetMapping()
	public String examQuestion()
	{
	    return prefix + "/examQuestion";
	}
	
	/**
	 * 查询试题列表
	 */
	@RequiresPermissions("system:examQuestion:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ExamQuestion examQuestion)
	{
		startPage();
        List<ExamQuestion> list = examQuestionService.selectExamQuestionList(examQuestion);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出试题列表
	 */
	@RequiresPermissions("system:examQuestion:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ExamQuestion examQuestion)
    {
    	List<ExamQuestion> list = examQuestionService.selectExamQuestionList(examQuestion);
        ExcelUtil<ExamQuestion> util = new ExcelUtil<ExamQuestion>(ExamQuestion.class);
        return util.exportExcel(list, "examQuestion");
    }
	
	/**
	 * 新增试题
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存试题
	 */
	@RequiresPermissions("system:examQuestion:add")
	@Log(title = "试题", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(ExamQuestion examQuestion)
	{		
		return toAjax(examQuestionService.insertExamQuestion(examQuestion));
	}

	/**
	 * 修改试题
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		ExamQuestion examQuestion = examQuestionService.selectExamQuestionById(id);
		mmap.put("examQuestion", examQuestion);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存试题
	 */
	@RequiresPermissions("system:examQuestion:edit")
	@Log(title = "试题", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(ExamQuestion examQuestion)
	{		
		return toAjax(examQuestionService.updateExamQuestion(examQuestion));
	}
	
	/**
	 * 删除试题
	 */
	@RequiresPermissions("system:examQuestion:remove")
	@Log(title = "试题", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(examQuestionService.deleteExamQuestionByIds(ids));
	}
	
}
