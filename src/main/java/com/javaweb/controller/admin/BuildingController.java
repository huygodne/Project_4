package com.javaweb.controller.admin;


import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.enums.districtCode;
import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);

        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);

        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
        buildingSearchResponse.setListResult(responseList);
        buildingSearchResponse.setTotalItem(responseList.size());

        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdits(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }

    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdits(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");

        BuildingDTO buildingDTO = buildingService.findById(id);

        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }
}