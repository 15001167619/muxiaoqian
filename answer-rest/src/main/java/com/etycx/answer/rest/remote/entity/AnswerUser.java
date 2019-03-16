package com.etycx.answer.rest.remote.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
public class AnswerUser extends Model<AnswerUser> {

    @TableId(value="id", type= IdType.AUTO)
    private Integer id;

    private String phone;
    private String openId;
    private String unionId;
    private String nickName;
    private String head;
    private Integer grade;
    private Integer status;
    private Integer empiricalValue;
    private Float coin;
    private Date createTime;


    public AnswerUser(){}

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
