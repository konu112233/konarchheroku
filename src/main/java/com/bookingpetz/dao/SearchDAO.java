/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Search;
import com.bookingpetz.domain.SearchResult;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface SearchDAO {

    public List<SearchResult> resultSearch(Search search);

    public SearchResult getProperty(String code);
}
