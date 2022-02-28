package cn.xy.crm.service;

import cn.xy.crm.domain.CheckIn;
import cn.xy.crm.page.PageResult;
import cn.xy.crm.query.QueryObject;

import java.util.List;

public interface ICheckInService {

    //往数据库中插入数据
    int save(CheckIn checkIn);

    //往数据库中更新数据
    int update(CheckIn checkIn);

    //从数据库中查询数据
    CheckIn get(Long id);


    //从数据库中查询出所有数据
    List<CheckIn> listAll();

    PageResult queryByCondition(QueryObject qo);

    /**
     * 普通员工考勤查询
     * @param id
     * @return
     */
    PageResult queryCheckInByEid(Long id);

    /**
     * 签到
     *
     * @param checkIn 签到信息
     * @param id 登录用户id
     * @return
     */
    int signIn(CheckIn checkIn, Long id);

    /**
     * 签退
     * @param checkIn
     * @param id 当前登录用户id
     * @return
     */
    int signOut(CheckIn checkIn, Long id);

    int AddCheckIn(CheckIn checkIn, Long id);


}
