package com.alibinshao.zhonghong.university.zp.entity;

import java.util.Date;

import com.alibinshao.zhonghong.fdp.common.persistence.DataEntity;




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
	
	public Integer getZpjhId() {
		return zpjhId;
	}
	public void setZpjhId(Integer zpjhId) {
		this.zpjhId = zpjhId;
	}
	public String getZpjhMc() {
		return zpjhMc;
	}
	public void setZpjhMc(String zpjhMc) {
		this.zpjhMc = zpjhMc;
	}
	public String getJlsxmc() {
		return jlsxmc;
	}
	public void setJlsxmc(String jlsxmc) {
		this.jlsxmc = jlsxmc;
	}
	public String getFbren() {
		return fbren;
	}
	public void setFbren(String fbren) {
		this.fbren = fbren;
	}
	public String getFbrenId() {
		return fbrenId;
	}
	public void setFbrenId(String fbrenId) {
		this.fbrenId = fbrenId;
	}
	public Date getFbsj() {
		return fbsj;
	}
	public void setFbsj(Date fbsj) {
		this.fbsj = fbsj;
	}
	public String getFqsj() {
		return fqsj;
	}
	public void setFqsj(String fqsj) {
		this.fqsj = fqsj;
	}
	public String getSsbm() {
		return ssbm;
	}
	public void setSsbm(String ssbm) {
		this.ssbm = ssbm;
	}
	public String getSsbmId() {
		return ssbmId;
	}
	public void setSsbmId(String ssbmId) {
		this.ssbmId = ssbmId;
	}
	public String getHtmlStr() {
		return htmlStr;
	}
	public void setHtmlStr(String htmlStr) {
		this.htmlStr = htmlStr;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public String getZpjlid() {
		return zpjlid;
	}
	public void setZpjlid(String zpjlid) {
		this.zpjlid = zpjlid;
	}
	public String getZwxm() {
		return zwxm;
	}
	public void setZwxm(String zwxm) {
		this.zwxm = zwxm;
	}
	public String getZwxmid() {
		return zwxmid;
	}
	public void setZwxmid(String zwxmid) {
		this.zwxmid = zwxmid;
	}
	public String getCzjd() {
		return czjd;
	}
	public void setCzjd(String czjd) {
		this.czjd = czjd;
	}
	public String getCzjl() {
		return czjl;
	}
	public void setCzjl(String czjl) {
		this.czjl = czjl;
	}
	public String getCzyj() {
		return czyj;
	}
	public void setCzyj(String czyj) {
		this.czyj = czyj;
	}
	public Date getCzsj() {
		return czsj;
	}
	public void setCzsj(Date czsj) {
		this.czsj = czsj;
	}
	public String getCzsjStr() {
		return czsjStr;
	}
	public void setCzsjStr(String czsjStr) {
		this.czsjStr = czsjStr;
	}
	public String getSxyj() {
		return sxyj;
	}
	public void setSxyj(String sxyj) {
		this.sxyj = sxyj;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getRpzhiwei() {
		return rpzhiwei;
	}
	public void setRpzhiwei(String rpzhiwei) {
		this.rpzhiwei = rpzhiwei;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getZgxlxw() {
		return zgxlxw;
	}
	public void setZgxlxw(String zgxlxw) {
		this.zgxlxw = zgxlxw;
	}
	public String getDyxwlxw() {
		return dyxwlxw;
	}
	public void setDyxwlxw(String dyxwlxw) {
		this.dyxwlxw = dyxwlxw;
	}
	public Integer getZplcid() {
		return zplcid;
	}
	public void setZplcid(Integer zplcid) {
		this.zplcid = zplcid;
	}
	public Integer getSlID() {
		return slID;
	}
	public void setSlID(Integer slID) {
		this.slID = slID;
	}
	public Integer getHjID() {
		return hjID;
	}
	public void setHjID(Integer hjID) {
		this.hjID = hjID;
	}
	public Integer getXyhjID() {
		return xyhjID;
	}
	public void setXyhjID(Integer xyhjID) {
		this.xyhjID = xyhjID;
	}
	public String getBlr() {
		return blr;
	}
	public void setBlr(String blr) {
		this.blr = blr;
	}
	public String getBlsj() {
		return blsj;
	}
	public void setBlsj(String blsj) {
		this.blsj = blsj;
	}
	public String getDqsxzt() {
		return dqsxzt;
	}
	public void setDqsxzt(String dqsxzt) {
		this.dqsxzt = dqsxzt;
	}
	public String getZzsxzt() {
		return zzsxzt;
	}
	public void setZzsxzt(String zzsxzt) {
		this.zzsxzt = zzsxzt;
	}
}
