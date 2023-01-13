package tech.code2048.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 员工表
 * @TableName employee
 */
public class EmployeeVo {
    /**
     * 主键
     */
    private Long eid;

    /**
     * 工号
     */
    private String eno;

    /**
     * 姓名
     */
    private String ename;

    /**
     * 年龄
     */
    private Integer eage;

    /**
     * 性别
     */
    private String egender;

    /**
     * 工种
     */
    private String ejob;

    /**
     * 入职时间
     */
    @JsonFormat(pattern = "yyyy年MM月dd日", timezone = "GMT+8")
    private Date eentrydate;

    /**
     * 基本薪资
     */
    private BigDecimal esalary;

    /**
     * 在职状态(1.在职 2.离职)
     */
    private Integer estate;

    /**
     * 部门编号
     */
    private Integer did;

    /**
     * 部门名称
     */
    private String dname;

    public EmployeeVo() {
    }

    public EmployeeVo(Long eid, String eno, String ename, Integer eage, String egender, String ejob, Date eentrydate, BigDecimal esalary, Integer estate, Integer did, String dname) {
        this.eid = eid;
        this.eno = eno;
        this.ename = ename;
        this.eage = eage;
        this.egender = egender;
        this.ejob = ejob;
        this.eentrydate = eentrydate;
        this.esalary = esalary;
        this.estate = estate;
        this.did = did;
        this.dname = dname;
    }

    public Long getEid() {
        return eid;
    }

    public void setEid(Long eid) {
        this.eid = eid;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Integer getEage() {
        return eage;
    }

    public void setEage(Integer eage) {
        this.eage = eage;
    }

    public String getEgender() {
        return egender;
    }

    public void setEgender(String egender) {
        this.egender = egender;
    }

    public String getEjob() {
        return ejob;
    }

    public void setEjob(String ejob) {
        this.ejob = ejob;
    }

    public Date getEentrydate() {
        return eentrydate;
    }

    public void setEentrydate(Date eentrydate) {
        this.eentrydate = eentrydate;
    }

    public BigDecimal getEsalary() {
        return esalary;
    }

    public void setEsalary(BigDecimal esalary) {
        this.esalary = esalary;
    }

    public Integer getEstate() {
        return estate;
    }

    public void setEstate(Integer estate) {
        this.estate = estate;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    @Override
    public String toString() {
        return "EmployeeVo{" +
                "eid=" + eid +
                ", eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", eage=" + eage +
                ", egender='" + egender + '\'' +
                ", ejob='" + ejob + '\'' +
                ", eentrydate=" + eentrydate +
                ", esalary=" + esalary +
                ", estate=" + estate +
                ", did=" + did +
                ", dname='" + dname + '\'' +
                '}';
    }
}