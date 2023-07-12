package com.choongang.OriMarket.RealTimeStatus;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
@Slf4j
public class RealTimeController {

    @Autowired
    private final RealTimeService rtsService;

}
