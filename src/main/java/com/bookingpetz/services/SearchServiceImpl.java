/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.SearchDAO;
import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author burakzengin
 */
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<Hotel> resultSearch(Search search) {
        return searchDAO.resultSearch(search);
    }

}
