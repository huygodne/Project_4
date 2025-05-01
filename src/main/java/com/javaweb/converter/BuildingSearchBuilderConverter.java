package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest request, List<String> typeCode) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(request.getName())
                .setWard(request.getWard())
                .setFloorArea(request.getFloorArea())
                .setAreaFrom(request.getAreaFrom())
                .setAreaTo(request.getAreaTo())
                .setDistrict(request.getDistrict())
                .setManagerName(request.getManagerName())
                .setManagerPhone(request.getManagerPhone())
                .setNumberOfBasement(request.getNumberOfBasement())
                .setRentPriceFrom(request.getRentPriceFrom())
                .setRentPriceTo(request.getRentPriceTo())
                .setStaffId(request.getStaffId())
                .setStreet(request.getStreet())
                .setTypeCode(typeCode)
                .build();
        return buildingSearchBuilder;
    }
}
