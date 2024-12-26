package com.myx.dao;

import com.myx.po.HouseSource;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface HouseDao {
    List<HouseSource> getAllHouseSource(HouseSource houseSource);

    List<HouseSource> getAllCellName();

}
