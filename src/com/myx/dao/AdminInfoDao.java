package com.myx.dao;

import com.myx.po.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminInfoDao {
    Admin findAdminByName(String a_name);

    List<HouseSource> getAllHouse();
    List<CellInfo> gatAllCell(CellInfo cellInfo);
    List<User> getAllUser(User user);
    List<UserInfo> getAllUserInfo(User user);

    HouseSource getHouseById(int id);
    int updateHouse(HouseSource houseSource);
    int updateCellInfo(CTools cTools);

    int deleteHouse(int id);
    List<CellInfo> getCellInfoByCellName(String cellname);

    CellInfo getCellInfoById(int id);

    CellInfo getCellById(int id);

    List<CellInfo> getAllUserNotInCell();
    int deleteCellById(int id);
    int updateUserInfoByUsername(CellInfo cellInfo);
    int updateUserInfoByUsername1(String OldName);
    int updateCellById(CellInfo cellInfo);

    List<CellInfo> gatAllCellNotUser();

    int updateUserInfo(UserInfo userInfo);

    CellInfo getCellInfoByUserName(String username);

    int updateCellInfoSelect(UserInfo userInfo);

    int updateCellInfoById(int cell_id);

    int deleteUserInfoById(int id);
    int deleteUserById(int id);

    UserInfo getUserInfoById(int id);

    int updateCellByIds(int id_s);

    int insertHouse(HouseSource houseSource);


    int insertCell(CellInfo cellInfo);

    int insertUser(UserInfo userInfo);
    int insertUserInfo(UserInfo userInfo);
}
