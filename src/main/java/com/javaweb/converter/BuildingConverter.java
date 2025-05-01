package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO convertToDto(BuildingEntity entity) {
        BuildingDTO buildingDTO = modelMapper.map(entity, BuildingDTO.class);

        if (entity.getTypeCode() != null && !entity.getTypeCode().trim().isEmpty()) {
            List<String> typeList = Arrays.asList(entity.getTypeCode().split(","));
            buildingDTO.setTypeCode(typeList);
        } else {
            buildingDTO.setTypeCode(new ArrayList<>());
        }

        if (entity.getDistrict() != null && !entity.getDistrict().trim().isEmpty()) {
            String district = entity.getDistrict();
            if (district.startsWith("QUAN_")) {
                district = "Quận " + district.substring(5);
            }
            buildingDTO.setDistrict(district);
        }

        if (entity.getRentAreas() != null && !entity.getRentAreas().isEmpty()) {
            String rentAreaStr = entity.getRentAreas().stream()
                    .map(r -> String.valueOf(r.getValue()))
                    .collect(Collectors.joining(","));
            buildingDTO.setRentArea(rentAreaStr);
        }

        return buildingDTO;
    }


    public BuildingEntity convertToEntity(BuildingDTO dto) {
        BuildingEntity entity = modelMapper.map(dto, BuildingEntity.class);

        if (dto.getTypeCode() != null && !dto.getTypeCode().isEmpty()) {
            String typeString = String.join(",", dto.getTypeCode());
            entity.setTypeCode(typeString);
        } else {
            entity.setTypeCode(null);
        }

        if (dto.getDistrict() != null && !dto.getDistrict().trim().isEmpty()) {
            String district = dto.getDistrict();
            if (district.startsWith("Quận ")) {
                district = "QUAN_" + district.substring(5).trim();
            }
            entity.setDistrict(district);
        }

        return entity;
    }


    public BuildingEntity convertToEntityForUpdate(BuildingDTO dto, BuildingEntity existingEntity) {
        modelMapper.map(dto, existingEntity);

        if (dto.getTypeCode() != null && !dto.getTypeCode().isEmpty()) {
            existingEntity.setTypeCode(String.join(",", dto.getTypeCode()));
        } else {
            existingEntity.setTypeCode(null);
        }

        if (dto.getDistrict() != null && !dto.getDistrict().trim().isEmpty()) {
            String district = dto.getDistrict();
            if (district.startsWith("Quận ")) {
                district = "QUAN_" + district.substring(5).trim();
            }
            existingEntity.setDistrict(district);
        }

        return existingEntity;
    }


    public BuildingSearchResponse convertToSearchResponse(BuildingEntity entity) {
        BuildingSearchResponse response = modelMapper.map(entity, BuildingSearchResponse.class);

        String district = entity.getDistrict();
        if (district != null && district.startsWith("QUAN_")) {
            district = "Quận " + district.substring(5);
        }
        response.setAddress(entity.getStreet() + ", " + entity.getWard() + ", " + district);

        if (entity.getRentAreas() != null && !entity.getRentAreas().isEmpty()) {
            String rentAreaStr = entity.getRentAreas().stream()
                    .map(r -> String.valueOf(r.getValue()))
                    .collect(Collectors.joining(","));
            response.setRentArea(rentAreaStr);
        }

        return response;
    }


}
