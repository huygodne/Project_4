package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Service;

public interface RentAreaService {
    void deleteByBuildings(Long[] ids);
}
