package com.laptrinhjavaweb.api;

import com.laptrinhjavaweb.resquest.PnsRequest;
import com.laptrinhjavaweb.service.IFCMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PushNotificationAPI {

    @Autowired
    private IFCMService fcmService;

    @PostMapping("/api/notification")
    public String sendSampleNotification(@RequestBody PnsRequest pnsRequest) {
        return fcmService.pushNotification(pnsRequest);
    }
}
