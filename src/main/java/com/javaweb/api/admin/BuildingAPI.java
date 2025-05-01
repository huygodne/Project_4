package com.javaweb.api.admin;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private ModelMapper modelMapper;

    @PostMapping
    public ResponseEntity<BuildingDTO> saveBuilding(@RequestBody BuildingDTO buildingDTO) {
        BuildingDTO savedBuilding;
        if (buildingDTO.getId() == null) {
            savedBuilding = buildingService.addBuilding(buildingDTO);
        } else {
            savedBuilding = buildingService.updateBuilding(buildingDTO);
        }
        return ResponseEntity.ok(savedBuilding);
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<String> deleteBuilding(@PathVariable List<Long> ids) {
        buildingService.deleteBuilding(ids);
        return ResponseEntity.ok("Xóa thành công");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.listStaffs(id);
        return responseDTO;
    }

    @PostMapping("/assignment")
    public void updateAssignment (@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        System.out.println("OK");
    }

}
