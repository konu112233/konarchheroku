/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.domain.Pet;
import com.bookingpetz.domain.Profile;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface UserService {

    public List<Pet> getMyPets(String code);

    public boolean addPet(Pet pet, String code);

    public boolean removePet(String petId, String code);

    public Profile getProfile(String code);
}
