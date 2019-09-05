/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.UserServiceDAO;
import com.bookingpetz.domain.Pet;
import com.bookingpetz.domain.Profile;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserServiceDAO userServiceDAO;

    @Override
    public List<Pet> getMyPets(String code) {
        return userServiceDAO.getMyPets(code);
    }

    @Override
    public boolean addPet(Pet pet, String code) {
        return userServiceDAO.addPet(pet, code);
    }

    @Override
    public boolean removePet(String petId, String code) {
        return userServiceDAO.removePet(petId, code);
    }

    @Override
    public Profile getProfile(String code) {
        return userServiceDAO.getProfile(code);
    }
}
