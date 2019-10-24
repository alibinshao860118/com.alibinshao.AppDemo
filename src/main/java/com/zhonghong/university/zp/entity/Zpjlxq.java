package com.zhonghong.university.zp.entity;

import java.util.List;

import com.zhonghong.fdp.common.persistence.DataEntity;

import lombok.Data;

/**
 * 招聘简历信息Entity
 * 
 * @author huangqi
 * @version 2017-03-15
 */

@Data
public class Zpjlxq extends DataEntity<Zpjlxq> {

	String id1;
	String zpjhmc; // 招聘计划名称
	String zpjhid; // 招聘计划id
	String zpxqid; // 招聘需求id
	String username; // 姓名
	String password; // 密码
	String userlx; // 用户类型
	String gh; // 工号编号
	String nl; //年龄
	int maxNl;
	int minNl;
	String namepy; // 姓名拼音
	String namecym; // 曾用名
	String ssbm; // 任聘部门
	String ssbmid; // 任聘部门编号
	String rpzhiwei; // 任聘职位
	String rpzhiweiid; // 任聘职位ID
	String xb; // 性别
	String csrq; // 出生日期
	String csd; // 出生地
	String gj; // 国籍
	String jg; // 籍贯
	String mz; // 民族
	String sfzlx; // 证件类型
	String sfzhm; // 证件号码
	String hjlx; // 户籍类型
	String hjdz; // 户籍地址
	String gatjw; // 港澳台侨外
	String zzmm; // 政治面貌
	String rdsj; // 入党团时间
	String zjxy; // 宗教信仰
	String mzdp; // 民主党派
	String hyzk; // 婚姻状况
	String xx; // 血型
	String sg; // 身高
	String tz; // 体重
	String zp; // 照片
	String jkzk; // 健康状况
	String cjgzsj; // 参加工作时间
	String cjsj; // 从教时间
	String bzlx; // 编制类型
	String gwlx; // 岗位类型
	String zw; // 职务
	String zc; // 职称
	String gwdj; // 岗位等级
	String yjsds; // 研究生导师
	String zyzg; // 职称职业资格
	String zyzgsj; // 职称职业资格取得时间
	String ryzt; // 人员状态（离、在）
	String zgxlxw; // 最高学历学位
	List<String> zgxlxws; // 最高学历学位
	String dyxlxw; // 第一学历学位
	List<String> dyxlxws; // 第一学历学位
	String zgxlxx; // 最高学历学校
	String dyxlxx; // 第一学历学校
	String zgxlrxsj; // 最高学历入校时间
	String zgxlbysj; // 最高学历毕业时间
	String dyxlrxsj; // 第一学历入校时间
	String dyxlbysj; // 第一学历毕业时间
	String sxzy; // 最后所学专业
	String dyzy; // 第一学历所学专业
	String xueke; // 当前所属学科
	String dy211; // 第一学历211
	String zg211; // 最高学历211
	String dywy; // 第一外语
	String wyslcd; // 外语熟练程度
	String pthsp; // 普通话水平
	String bgdh; // 办公电话
	String sj; // 手机号码
	String qq; // QQ号码
	String yx; // 邮箱
	String bgdz; // 办公地址
	String jtzz; // 家庭地址
	String txdz; // 通讯地址
	String youbian; // 邮政编码
	String rsdadw; // 人事档案保管单位
	String rsdabh; // 人事档案编号
	String tc; // 特长
	String jianli; // 学习工作简历
	String chengji; // 学习工作业绩
	String bishi; // 笔试
	String mianshi; // 面试
	String khzf; // 考核总分
	String yxbz; // 简历有效标识
	String xcqrbz; // 现场确认标识
	String zgsc; // 资格审查标识
	String dqsxren; // 当前筛选人
	String dqsxrenid; // 当前筛选人id
	String dqsxzt; // 当前筛选状态
	String zzsxzt; // 最终筛选状态
	String saixuanyj; // 筛选记录
	String niluyong; // 拟录用状态
	String shenpi; // 录用审批
	String spren; // 审批人
	String sprenid; // 审批人id
	String ruzhi; // 入职标识
	String beizhu; // 备注信息
	String zzmmMc; // 政治面貌名称
	String dyxlMc; // 最高学历名称
	String zgxlMc; // 第一学历名称
	String mzMc; // 民族名称
	
	String zyyq; //专业要求

	String zpjhBh;
	
	String ids;
	List<String> idList;

}