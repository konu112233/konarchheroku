/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface SearchDAO {

    public List<Hotel> resultSearch(Search search);
}
