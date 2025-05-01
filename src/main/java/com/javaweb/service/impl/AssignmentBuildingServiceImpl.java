package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override
    @Transactional
    public void deleteByBuildings(Long[] ids) {
        for (Long id : ids) {
            BuildingEntity buildingEntity = buildingRepository.findById(id).orElse(null);
            if (buildingEntity != null) {
                assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
            }
        }
    }
}
