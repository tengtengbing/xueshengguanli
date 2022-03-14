package com.cms.vo;

/**
 *  课程成绩分析报表返回对象
 *
 * @author admin
 * @date 2022/3/4 17:43
 */
public class CourseScoreAnalyseVO {
    /**
     * 该课程最大人数
     */
    private Integer courseMaxPerson;
    /**
     * 该课程报名人数
     */
    private Integer signNum;
    /**
     * 该课程平均分数
     */
    private String avgScore;
    /**
     * 优秀分析 (90以上)
     */
    private CourseScoreAnalyseDetailVO excellent;
    /**
     * 良好分析 (80-90)
     */
    private CourseScoreAnalyseDetailVO good;
    /**
     * 中等分析（70-80）
     */
    private CourseScoreAnalyseDetailVO average;
    /**
     * 及格分析（60-70）
     */
    private CourseScoreAnalyseDetailVO pass;
    /**
     * 不及格分析（60分以下）
     */
    private CourseScoreAnalyseDetailVO failed;

    public Integer getCourseMaxPerson() {
        return courseMaxPerson;
    }

    public void setCourseMaxPerson(Integer courseMaxPerson) {
        this.courseMaxPerson = courseMaxPerson;
    }

    public Integer getSignNum() {
        return signNum;
    }

    public void setSignNum(Integer signNum) {
        this.signNum = signNum;
    }

    public String getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(String avgScore) {
        this.avgScore = avgScore;
    }

    public CourseScoreAnalyseDetailVO getExcellent() {
        return excellent;
    }

    public void setExcellent(CourseScoreAnalyseDetailVO excellent) {
        this.excellent = excellent;
    }

    public CourseScoreAnalyseDetailVO getGood() {
        return good;
    }

    public void setGood(CourseScoreAnalyseDetailVO good) {
        this.good = good;
    }

    public CourseScoreAnalyseDetailVO getAverage() {
        return average;
    }

    public void setAverage(CourseScoreAnalyseDetailVO average) {
        this.average = average;
    }

    public CourseScoreAnalyseDetailVO getPass() {
        return pass;
    }

    public void setPass(CourseScoreAnalyseDetailVO pass) {
        this.pass = pass;
    }

    public CourseScoreAnalyseDetailVO getFailed() {
        return failed;
    }

    public void setFailed(CourseScoreAnalyseDetailVO failed) {
        this.failed = failed;
    }
}
