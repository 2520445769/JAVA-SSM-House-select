package com.myx.dao;

import com.myx.po.CellInfo;
import com.myx.po.UserInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CellInfoDao {
    List<CellInfo> getAllCellInfo(CellInfo cellInfo);

    CellInfo getCellInfoById(int id);

    int updateCellInfo(CellInfo cellInfo);

    int UpdateUserInfo(UserInfo userInfo);
}
