package com.cms.vo;

/**
 * 课程成绩分析报表详情返回对象()
 * @author admin
 * @date 2022/3/4 17:52
 */
public class CourseScoreAnalyseDetailVO {
    /**
        该阶段人数
     */
    private Integer personNum;
    /**
      该阶段占总人数百分比
    */
    private String per;

    public Integer getPersonNum() {
        return personNum;
    }

    public void setPersonNum(Integer personNum) {
        this.personNum = personNum;
    }

    public String getPer() {
        return per;
    }

    public void setPer(String per) {
        this.per = per;
    }
}
