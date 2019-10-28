package com.zhonghong.university.zp.entity;

import java.util.List;

import com.zhonghong.fdp.common.persistence.DataEntity;



/**
 * 招聘简历信息Entity
 * 
 * @author huangqi
 * @version 2017-03-15
 */


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
	public String getId1() {
		return id1;
	}
	public void setId1(String id1) {
		this.id1 = id1;
	}
	public String getZpjhmc() {
		return zpjhmc;
	}
	public void setZpjhmc(String zpjhmc) {
		this.zpjhmc = zpjhmc;
	}
	public String getZpjhid() {
		return zpjhid;
	}
	public void setZpjhid(String zpjhid) {
		this.zpjhid = zpjhid;
	}
	public String getZpxqid() {
		return zpxqid;
	}
	public void setZpxqid(String zpxqid) {
		this.zpxqid = zpxqid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserlx() {
		return userlx;
	}
	public void setUserlx(String userlx) {
		this.userlx = userlx;
	}
	public String getGh() {
		return gh;
	}
	public void setGh(String gh) {
		this.gh = gh;
	}
	public String getNl() {
		return nl;
	}
	public void setNl(String nl) {
		this.nl = nl;
	}
	public int getMaxNl() {
		return maxNl;
	}
	public void setMaxNl(int maxNl) {
		this.maxNl = maxNl;
	}
	public int getMinNl() {
		return minNl;
	}
	public void setMinNl(int minNl) {
		this.minNl = minNl;
	}
	public String getNamepy() {
		return namepy;
	}
	public void setNamepy(String namepy) {
		this.namepy = namepy;
	}
	public String getNamecym() {
		return namecym;
	}
	public void setNamecym(String namecym) {
		this.namecym = namecym;
	}
	public String getSsbm() {
		return ssbm;
	}
	public void setSsbm(String ssbm) {
		this.ssbm = ssbm;
	}
	public String getSsbmid() {
		return ssbmid;
	}
	public void setSsbmid(String ssbmid) {
		this.ssbmid = ssbmid;
	}
	public String getRpzhiwei() {
		return rpzhiwei;
	}
	public void setRpzhiwei(String rpzhiwei) {
		this.rpzhiwei = rpzhiwei;
	}
	public String getRpzhiweiid() {
		return rpzhiweiid;
	}
	public void setRpzhiweiid(String rpzhiweiid) {
		this.rpzhiweiid = rpzhiweiid;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getCsd() {
		return csd;
	}
	public void setCsd(String csd) {
		this.csd = csd;
	}
	public String getGj() {
		return gj;
	}
	public void setGj(String gj) {
		this.gj = gj;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getSfzlx() {
		return sfzlx;
	}
	public void setSfzlx(String sfzlx) {
		this.sfzlx = sfzlx;
	}
	public String getSfzhm() {
		return sfzhm;
	}
	public void setSfzhm(String sfzhm) {
		this.sfzhm = sfzhm;
	}
	public String getHjlx() {
		return hjlx;
	}
	public void setHjlx(String hjlx) {
		this.hjlx = hjlx;
	}
	public String getHjdz() {
		return hjdz;
	}
	public void setHjdz(String hjdz) {
		this.hjdz = hjdz;
	}
	public String getGatjw() {
		return gatjw;
	}
	public void setGatjw(String gatjw) {
		this.gatjw = gatjw;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getRdsj() {
		return rdsj;
	}
	public void setRdsj(String rdsj) {
		this.rdsj = rdsj;
	}
	public String getZjxy() {
		return zjxy;
	}
	public void setZjxy(String zjxy) {
		this.zjxy = zjxy;
	}
	public String getMzdp() {
		return mzdp;
	}
	public void setMzdp(String mzdp) {
		this.mzdp = mzdp;
	}
	public String getHyzk() {
		return hyzk;
	}
	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}
	public String getXx() {
		return xx;
	}
	public void setXx(String xx) {
		this.xx = xx;
	}
	public String getSg() {
		return sg;
	}
	public void setSg(String sg) {
		this.sg = sg;
	}
	public String getTz() {
		return tz;
	}
	public void setTz(String tz) {
		this.tz = tz;
	}
	public String getZp() {
		return zp;
	}
	public void setZp(String zp) {
		this.zp = zp;
	}
	public String getJkzk() {
		return jkzk;
	}
	public void setJkzk(String jkzk) {
		this.jkzk = jkzk;
	}
	public String getCjgzsj() {
		return cjgzsj;
	}
	public void setCjgzsj(String cjgzsj) {
		this.cjgzsj = cjgzsj;
	}
	public String getCjsj() {
		return cjsj;
	}
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
	public String getBzlx() {
		return bzlx;
	}
	public void setBzlx(String bzlx) {
		this.bzlx = bzlx;
	}
	public String getGwlx() {
		return gwlx;
	}
	public void setGwlx(String gwlx) {
		this.gwlx = gwlx;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public String getZc() {
		return zc;
	}
	public void setZc(String zc) {
		this.zc = zc;
	}
	public String getGwdj() {
		return gwdj;
	}
	public void setGwdj(String gwdj) {
		this.gwdj = gwdj;
	}
	public String getYjsds() {
		return yjsds;
	}
	public void setYjsds(String yjsds) {
		this.yjsds = yjsds;
	}
	public String getZyzg() {
		return zyzg;
	}
	public void setZyzg(String zyzg) {
		this.zyzg = zyzg;
	}
	public String getZyzgsj() {
		return zyzgsj;
	}
	public void setZyzgsj(String zyzgsj) {
		this.zyzgsj = zyzgsj;
	}
	public String getRyzt() {
		return ryzt;
	}
	public void setRyzt(String ryzt) {
		this.ryzt = ryzt;
	}
	public String getZgxlxw() {
		return zgxlxw;
	}
	public void setZgxlxw(String zgxlxw) {
		this.zgxlxw = zgxlxw;
	}
	public List<String> getZgxlxws() {
		return zgxlxws;
	}
	public void setZgxlxws(List<String> zgxlxws) {
		this.zgxlxws = zgxlxws;
	}
	public String getDyxlxw() {
		return dyxlxw;
	}
	public void setDyxlxw(String dyxlxw) {
		this.dyxlxw = dyxlxw;
	}
	public List<String> getDyxlxws() {
		return dyxlxws;
	}
	public void setDyxlxws(List<String> dyxlxws) {
		this.dyxlxws = dyxlxws;
	}
	public String getZgxlxx() {
		return zgxlxx;
	}
	public void setZgxlxx(String zgxlxx) {
		this.zgxlxx = zgxlxx;
	}
	public String getDyxlxx() {
		return dyxlxx;
	}
	public void setDyxlxx(String dyxlxx) {
		this.dyxlxx = dyxlxx;
	}
	public String getZgxlrxsj() {
		return zgxlrxsj;
	}
	public void setZgxlrxsj(String zgxlrxsj) {
		this.zgxlrxsj = zgxlrxsj;
	}
	public String getZgxlbysj() {
		return zgxlbysj;
	}
	public void setZgxlbysj(String zgxlbysj) {
		this.zgxlbysj = zgxlbysj;
	}
	public String getDyxlrxsj() {
		return dyxlrxsj;
	}
	public void setDyxlrxsj(String dyxlrxsj) {
		this.dyxlrxsj = dyxlrxsj;
	}
	public String getDyxlbysj() {
		return dyxlbysj;
	}
	public void setDyxlbysj(String dyxlbysj) {
		this.dyxlbysj = dyxlbysj;
	}
	public String getSxzy() {
		return sxzy;
	}
	public void setSxzy(String sxzy) {
		this.sxzy = sxzy;
	}
	public String getDyzy() {
		return dyzy;
	}
	public void setDyzy(String dyzy) {
		this.dyzy = dyzy;
	}
	public String getXueke() {
		return xueke;
	}
	public void setXueke(String xueke) {
		this.xueke = xueke;
	}
	public String getDy211() {
		return dy211;
	}
	public void setDy211(String dy211) {
		this.dy211 = dy211;
	}
	public String getZg211() {
		return zg211;
	}
	public void setZg211(String zg211) {
		this.zg211 = zg211;
	}
	public String getDywy() {
		return dywy;
	}
	public void setDywy(String dywy) {
		this.dywy = dywy;
	}
	public String getWyslcd() {
		return wyslcd;
	}
	public void setWyslcd(String wyslcd) {
		this.wyslcd = wyslcd;
	}
	public String getPthsp() {
		return pthsp;
	}
	public void setPthsp(String pthsp) {
		this.pthsp = pthsp;
	}
	public String getBgdh() {
		return bgdh;
	}
	public void setBgdh(String bgdh) {
		this.bgdh = bgdh;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getYx() {
		return yx;
	}
	public void setYx(String yx) {
		this.yx = yx;
	}
	public String getBgdz() {
		return bgdz;
	}
	public void setBgdz(String bgdz) {
		this.bgdz = bgdz;
	}
	public String getJtzz() {
		return jtzz;
	}
	public void setJtzz(String jtzz) {
		this.jtzz = jtzz;
	}
	public String getTxdz() {
		return txdz;
	}
	public void setTxdz(String txdz) {
		this.txdz = txdz;
	}
	public String getYoubian() {
		return youbian;
	}
	public void setYoubian(String youbian) {
		this.youbian = youbian;
	}
	public String getRsdadw() {
		return rsdadw;
	}
	public void setRsdadw(String rsdadw) {
		this.rsdadw = rsdadw;
	}
	public String getRsdabh() {
		return rsdabh;
	}
	public void setRsdabh(String rsdabh) {
		this.rsdabh = rsdabh;
	}
	public String getTc() {
		return tc;
	}
	public void setTc(String tc) {
		this.tc = tc;
	}
	public String getJianli() {
		return jianli;
	}
	public void setJianli(String jianli) {
		this.jianli = jianli;
	}
	public String getChengji() {
		return chengji;
	}
	public void setChengji(String chengji) {
		this.chengji = chengji;
	}
	public String getBishi() {
		return bishi;
	}
	public void setBishi(String bishi) {
		this.bishi = bishi;
	}
	public String getMianshi() {
		return mianshi;
	}
	public void setMianshi(String mianshi) {
		this.mianshi = mianshi;
	}
	public String getKhzf() {
		return khzf;
	}
	public void setKhzf(String khzf) {
		this.khzf = khzf;
	}
	public String getYxbz() {
		return yxbz;
	}
	public void setYxbz(String yxbz) {
		this.yxbz = yxbz;
	}
	public String getXcqrbz() {
		return xcqrbz;
	}
	public void setXcqrbz(String xcqrbz) {
		this.xcqrbz = xcqrbz;
	}
	public String getZgsc() {
		return zgsc;
	}
	public void setZgsc(String zgsc) {
		this.zgsc = zgsc;
	}
	public String getDqsxren() {
		return dqsxren;
	}
	public void setDqsxren(String dqsxren) {
		this.dqsxren = dqsxren;
	}
	public String getDqsxrenid() {
		return dqsxrenid;
	}
	public void setDqsxrenid(String dqsxrenid) {
		this.dqsxrenid = dqsxrenid;
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
	public String getSaixuanyj() {
		return saixuanyj;
	}
	public void setSaixuanyj(String saixuanyj) {
		this.saixuanyj = saixuanyj;
	}
	public String getNiluyong() {
		return niluyong;
	}
	public void setNiluyong(String niluyong) {
		this.niluyong = niluyong;
	}
	public String getShenpi() {
		return shenpi;
	}
	public void setShenpi(String shenpi) {
		this.shenpi = shenpi;
	}
	public String getSpren() {
		return spren;
	}
	public void setSpren(String spren) {
		this.spren = spren;
	}
	public String getSprenid() {
		return sprenid;
	}
	public void setSprenid(String sprenid) {
		this.sprenid = sprenid;
	}
	public String getRuzhi() {
		return ruzhi;
	}
	public void setRuzhi(String ruzhi) {
		this.ruzhi = ruzhi;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getZzmmMc() {
		return zzmmMc;
	}
	public void setZzmmMc(String zzmmMc) {
		this.zzmmMc = zzmmMc;
	}
	public String getDyxlMc() {
		return dyxlMc;
	}
	public void setDyxlMc(String dyxlMc) {
		this.dyxlMc = dyxlMc;
	}
	public String getZgxlMc() {
		return zgxlMc;
	}
	public void setZgxlMc(String zgxlMc) {
		this.zgxlMc = zgxlMc;
	}
	public String getMzMc() {
		return mzMc;
	}
	public void setMzMc(String mzMc) {
		this.mzMc = mzMc;
	}
	public String getZyyq() {
		return zyyq;
	}
	public void setZyyq(String zyyq) {
		this.zyyq = zyyq;
	}
	public String getZpjhBh() {
		return zpjhBh;
	}
	public void setZpjhBh(String zpjhBh) {
		this.zpjhBh = zpjhBh;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public List<String> getIdList() {
		return idList;
	}
	public void setIdList(List<String> idList) {
		this.idList = idList;
	}

}