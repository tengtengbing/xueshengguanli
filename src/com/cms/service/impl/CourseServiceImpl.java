package com.cms.service.impl;

import java.text.NumberFormat;
import java.util.List;

import com.cms.dao.ScoreDao;
import com.cms.dto.ScoreVo;
import com.cms.entity.Score;
import com.cms.vo.CourseScoreAnalyseDetailVO;
import com.cms.vo.CourseScoreAnalyseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cms.dao.CourseDao;
import com.cms.entity.Course;
import com.cms.service.CourseService;
import com.cms.utils.page.Pagination;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private ScoreDao scoreDao;
	
	@Override
	public int getTotalItemsCount(String searchKey) {
		return courseDao.getTotalItemsCount(searchKey);
	}

	@Override
	public List<Course> getCourseList(Pagination<Course> page, String searchKey) {
		return courseDao.getCourseList(page, searchKey);
	}

	@Override
	public int addCourse(Course course) {
		if (course.getStartDate() != null && course.getStartDate().equals("")) {
			course.setStartDate(null);
		}
		if (course.getEndDate() != null && course.getEndDate().equals("")) {
			course.setEndDate(null);
		}
		return courseDao.insertSelective(course);
	}

	@Override
	public int updateCourse(Course course) {
		return courseDao.updateByPrimaryKeySelective(course);
	}

	@Override
	public int deleteCourse(Course c) {
		return courseDao.deleteByPrimaryKey(c.getId());
	}

	@Override
	public int deleteCourse(List<Integer> list) {
		return courseDao.deleteInList(list);
	}

	@Override
	public int getTotalItemsCountByTid(String id) {
		return courseDao.getTotalItemsCountByTid(id);
	}

	@Override
	public int getTotalItemsCountByTid2(String id) {
		return courseDao.getTotalItemsCountByTid2(id);
	}

	@Override
	public List<Course> getCourseListByTid(Pagination<Course> page, String id) {
		return courseDao.getCourseListByTid(page, id);
	}

	@Override
	public int getTotalItemsCountBySid(int isAll, String searchKey, String id) {
		return courseDao.getTotalItemsCountBySid(isAll, searchKey, id);
	}

	@Override
	public List<Course> getCourseListBySid(Pagination<Course> page, int isAll, 
			String searchKey, String id) {
		return courseDao.getCourseListBySid(page, isAll, searchKey, id);
	}

	@Override
	public int completeCourse(Course course) {
		Course c = new Course();
		c.setId(course.getId());
		c.setComplete(1);
		return courseDao.updateByPrimaryKeySelective(c);
	}

	@Override
	public int revokeCourse(Course course) {
		Course c = new Course();
		c.setId(course.getId());
		c.setComplete(0);
		return courseDao.updateByPrimaryKeySelective(c);
	}

	@Override
	public CourseScoreAnalyseVO findCourseScoreAnalyse(Integer courseId) {
		//获取课程信息
		Course course = this.courseDao.selectByPrimaryKey(courseId);
		if(null == course){
			return null;
		}
		//返回对象封装
		CourseScoreAnalyseVO result = new CourseScoreAnalyseVO();
		//课程允许最大人数
		result.setCourseMaxPerson(course.getStudentNum());
		//报名人数
		result.setSignNum(course.getChoiceNum());
		//课程成绩封装
		List<ScoreVo> scoreList = scoreDao.getCourseScoreList(courseId);
		if(null != scoreList && scoreList.size() > 0){
			result.setAvgScore(avgScore(scoreList));
			//优秀
			result.setExcellent(courseScoreAnalyse(scoreList, 90, 999));
			//良好
			result.setGood(courseScoreAnalyse(scoreList, 80, 90));
			//中等
			result.setAverage(courseScoreAnalyse(scoreList, 70, 80));
			//及格
			result.setPass(courseScoreAnalyse(scoreList, 60, 70));
			//不及格
			result.setFailed(courseScoreAnalyse(scoreList, 0, 60));
		}
		return result;
	}

	/**
	 * 获取平均成绩
	 * @author admin
	 * @date 2022/3/4 18:32
	 */
	private String avgScore(List<ScoreVo> scoreList){
		int scoreSum = 0;
		for(int i = 0; i < scoreList.size(); i++){
			ScoreVo scoreVo = scoreList.get(i);
			scoreSum = scoreSum + scoreVo.getScore();
		}
		return String.valueOf(scoreSum/scoreList.size());
	}

	/**
	 * 获取成绩阶段统计分析
	 * @author admin
	 * @date 2022/3/4 18:32
	 */
	private CourseScoreAnalyseDetailVO courseScoreAnalyse(
			List<ScoreVo> scoreList,
			Integer startScore,
			Integer endScore){
		int personNum = 0;
		int totalPeople = scoreList.size();
		for(ScoreVo scoreVo : scoreList){
			if(scoreVo.getScore() >= startScore && scoreVo.getScore() <= endScore){
				personNum++;
			}
		}
		CourseScoreAnalyseDetailVO result = new CourseScoreAnalyseDetailVO();
		result.setPersonNum(personNum);
		result.setPer(getPercent(personNum, totalPeople));
		return result;
	}

	/**
	 * 计算获得百分比
	 * @author admin
	 * @date 2022/3/4 18:42
	 */
	private String getPercent(Integer num, Integer totalPeople ){
		String percent;
		Double p3 = 0.0;
		if (totalPeople == 0) {
			p3 = 0.0;
		} else {
			p3 = num * 1.0 / totalPeople;
		}
		NumberFormat nf = NumberFormat.getPercentInstance();
		//控制保留小数点后几位，2：表示保留2位小数点
		nf.setMinimumFractionDigits(2);
		percent = nf.format(p3);
		return percent;
	}
}
