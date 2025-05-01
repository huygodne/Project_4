package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.modelmapper.ModelMapper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import com.javaweb.converter.BuildingConverter;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private AssignmentBuildingService assignBuildingService;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = buildingEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity userEntity : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(userEntity.getFullName());
            staffResponseDTO.setStaffId(userEntity.getId());
            staffResponseDTO.setChecked(staffAssignment.contains(userEntity) ? "checked" : "");
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter
                .toBuildingSearchBuilder(buildingSearchRequest, typeCode);

        List<BuildingEntity> buildingEntities = buildingRepositoryCustom.findAll(buildingSearchBuilder);

        return buildingEntities.stream()
                .map(buildingConverter::convertToSearchResponse)
                .collect(Collectors.toList());
    }

    private void setRentAreas(BuildingDTO dto, BuildingEntity entity) {
        if (dto.getRentArea() != null && !dto.getRentArea().trim().isEmpty()) {
            String[] areas = dto.getRentArea().split(",");
            List<RentAreaEntity> rentAreas = Arrays.stream(areas)
                    .filter(s -> !s.trim().isEmpty())
                    .map(String::trim)
                    .map(s -> {
                        RentAreaEntity ra = new RentAreaEntity();
                        ra.setValue(Integer.parseInt(s));
                        ra.setBuildingEntity(entity);
                        return ra;
                    })
                    .collect(Collectors.toList());
            entity.setRentAreas(rentAreas);
        } else {
            entity.setRentAreas(new ArrayList<>());
        }
    }

    @Override
    public BuildingDTO addBuilding(BuildingDTO buildingDTO) {
        BuildingEntity newEntity = buildingConverter.convertToEntity(buildingDTO);
        setRentAreas(buildingDTO, newEntity);
        BuildingEntity savedEntity = buildingRepository.save(newEntity);
        return buildingConverter.convertToDto(savedEntity);
    }

    @Override
    @Transactional
    public BuildingDTO updateBuilding(BuildingDTO dto) {
        BuildingEntity existingEntity = buildingRepository.findById(dto.getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tòa nhà với id " + dto.getId()));
        existingEntity = buildingConverter.convertToEntityForUpdate(dto, existingEntity);
        rentAreaRepository.deleteByBuildingEntity(existingEntity);
        setRentAreas(dto, existingEntity);
        BuildingEntity savedEntity = buildingRepository.save(existingEntity);
        return buildingConverter.convertToDto(savedEntity);
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity entity = buildingRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tòa nhà với id " + id));
        return buildingConverter.convertToDto(entity);
    }

    @Override
    @Transactional
    public void deleteBuilding(List<Long> ids) {
        Long[] idArray = ids.toArray(new Long[0]);
        rentAreaService.deleteByBuildings(idArray);
        assignBuildingService.deleteByBuildings(idArray);
        for (Long id : ids) {
            buildingRepository.deleteById(id);
        }
    }


}
