package com.javaweb.service.impl;

import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentAreaServiceImpl implements RentAreaService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Override
    public void deleteByBuildings(Long[] ids) {
        for (Long id : ids) {
            BuildingEntity buildingEntity = buildingRepository.findById(id).get();
            rentAreaRepository.deleteByBuildingEntity(buildingEntity);
        }
    }


}
