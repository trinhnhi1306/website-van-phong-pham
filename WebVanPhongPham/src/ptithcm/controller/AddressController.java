package ptithcm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Category;
import ptithcm.entity.District;
import ptithcm.entity.Province;
import ptithcm.entity.Ward;
import ptithcm.service.AddressService;

@Controller
@RequestMapping("/api/address")
public class AddressController {

	@Autowired
	AddressService addressService;
	
	@RequestMapping(value = "province", method = RequestMethod.GET)
	public List<Province> getProvinces() {
		return addressService.getAllProvinces();
	}
	
	@RequestMapping(value = "district/{provinceID}.htm", method = RequestMethod.GET)
	public List<District> getDistricts(@PathVariable("provinceID") Integer id) {
		return addressService.getDistricts(id);
	}
	
	@RequestMapping(value = "ward/{districtID}.htm", method = RequestMethod.GET)
	public List<Ward> getWards(@PathVariable("districtID") Integer id) {
		return addressService.getWards(id);
	}
}
