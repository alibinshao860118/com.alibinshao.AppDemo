package com.zhonghong.university.zp.entity;

import java.util.Date;

import com.zhonghong.fdp.common.persistence.DataEntity;

import lombok.Data;

@Data
public class ZpjlsxlcVo extends DataEntity<ZpjlsxlcVo>{

	private Integer zpjhId;//招聘计划id
	private String zpjhMc;
	private String jlsxmc;//简历筛选名称(必填)
	private String fbren;
	private String fbrenId;
	private Date fbsj;
	private String fqsj;//发起时间字符型
	private String ssbm;//发起部门或者任聘部门
	private String ssbmId;
	private String htmlStr;
	private String zt;//1暂存2处理中3已完结
	
	private String zpjlid;//招聘简历id
	private String zwxm;//操作人姓名
	private String zwxmid;//操作人ID
	private String czjd;//操作阶段
	private String czjl;//操作结论
	private String czyj;//操作意见
	private Date czsj;//操作时间
	private String czsjStr;//操作时间字符型
	
	private String sxyj;
	//招聘简历信息
	private String username;//
	private String xb;//
	private String rpzhiwei;//
	private String zzmm;//政治面貌
	private String zgxlxw;//最高学历
	private String dyxwlxw;//第一学历

	private Integer zplcid;
	
	private Integer slID;//实例ID
	private Integer hjID;//环节ID
	private Integer xyhjID;//下一环节ID
	private String blr;//办理人
	private String blsj;//办理时间

	private String dqsxzt;//当前筛选状态
	private String zzsxzt;//最终筛选状态
}
