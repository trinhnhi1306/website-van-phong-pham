package ptithcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ptithcm.dao.AddressDAO;
import ptithcm.entity.Address;
import ptithcm.entity.District;
import ptithcm.entity.Province;
import ptithcm.entity.Ward;

@Service
@Transactional
public class AddressService {

	@Autowired
	AddressDAO addressDAO;
	
	public List<Province> getAllProvinces() {
		
		return addressDAO.getAllProvinces();
	}
	
	public List<District> getAllDistricts() {
		
		return addressDAO.getAllDistricts();
	}
	
	public List<Ward> getAllWards() {
		
		return addressDAO.getAllWards();
	}
	
	public List<District> getDistricts(int provinceId) {
		
		return addressDAO.getDistricts(provinceId);
	}
	
	public List<Ward> getWards(int districtId) {
		
		return addressDAO.getWards(districtId);
	}
	
	public Address getAddressById(int id) {
		return addressDAO.getAddressById(id);
	}
	
	public int addAddress(Address address) {
		return addressDAO.insertAddress(address);
	}
	
	public int editAddress(Address address) {
		return addressDAO.updateAddress(address);
	}
	
}
