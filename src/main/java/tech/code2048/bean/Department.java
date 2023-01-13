package tech.code2048.bean;

import java.io.Serializable;

/**
 * 部门表
 * @TableName department
 */
public class Department implements Serializable {
    /**
     * 主键
     */
    private Integer did;

    /**
     * 部门名称
     */
    private String dname;

    /**
     * 部门位置
     */
    private String dlocation;

    public Department() {
    }

    public Department(Integer did, String dname, String dlocation) {
        this.did = did;
        this.dname = dname;
        this.dlocation = dlocation;
    }

    /**
     * 获取
     * @return did
     */
    public Integer getDid() {
        return did;
    }

    /**
     * 设置
     * @param did
     */
    public void setDid(Integer did) {
        this.did = did;
    }

    /**
     * 获取
     * @return dname
     */
    public String getDname() {
        return dname;
    }

    /**
     * 设置
     * @param dname
     */
    public void setDname(String dname) {
        this.dname = dname;
    }

    /**
     * 获取
     * @return dlocation
     */
    public String getDlocation() {
        return dlocation;
    }

    /**
     * 设置
     * @param dlocation
     */
    public void setDlocation(String dlocation) {
        this.dlocation = dlocation;
    }

    public String toString() {
        return "Department{did = " + did + ", dname = " + dname + ", dlocation = " + dlocation + "}";
    }
}