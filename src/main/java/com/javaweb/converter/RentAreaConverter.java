package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

@Component
public class RentAreaConverter {

    public RentAreaEntity toRentAreaEntity(BuildingDTO dto, Long value) {
        RentAreaEntity rentAreaEntity = new RentAreaEntity();
        rentAreaEntity.setValue(value.intValue());

        BuildingEntity buildingEntity = new BuildingEntity();
        buildingEntity.setId(dto.getId());
        rentAreaEntity.setBuildingEntity(buildingEntity);

        return rentAreaEntity;
    }
}
