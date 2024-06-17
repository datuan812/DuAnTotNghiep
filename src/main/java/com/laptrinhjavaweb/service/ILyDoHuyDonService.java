package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.response.LyDoHuyDonReponse;
import com.laptrinhjavaweb.resquest.LyDoHuyDonResquest;

public interface ILyDoHuyDonService {

    LyDoHuyDonReponse insert(LyDoHuyDonResquest lyDoHuyDonResquest);
}
