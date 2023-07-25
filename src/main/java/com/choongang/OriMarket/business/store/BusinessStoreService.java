package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class BusinessStoreService {

    @Autowired
    private final BusinessStoreRepository businessStoreRepository;
    private final BusinessUserRepository businessUserRepository;
    private final MarketRepository marketRepository;


    public void save(BusinessStore businessStore, HttpSession session, Model model, String s){
        // 세션에서 사업자 번호 가져오기
        Object buUserNumber = session.getAttribute("buUserNumber");

        // 가게 정보에 맞는 Market 조회
        Long marketSeq = Long.valueOf((session.getAttribute("marketSeq")).toString());
        Market byId = marketRepository.findById(marketSeq).orElseThrow();
        businessStore.setMarket(byId);

        // BusinessUser 조회 및 가게 정보 설정
        BusinessUser businessUser = businessUserRepository.findById((Long)buUserNumber).orElseThrow();
        businessStore.setBusinessUser(businessUser);
        businessStore.setBuStoreImageUrl(s);

        // 가게 정보를 데이터베이스에 저장
        BusinessStore save = businessStoreRepository.save(businessStore);
        //System.out.println("aaaaaa"+save.getBuStoreImageUrl());
        model.addAttribute("save",save);



        //사업자가 가지고있는 가게들 출력해본거
        List<BusinessStore> businessStores = save.getBusinessUser().getBusinessStores();

        for(BusinessStore businessStores1:businessStores){
            System.out.println("가게이름:"+businessStores1.getBuStoreName());
        }

    }

    public BusinessStore findReview(BusinessStore businessStore, BusinessUser businessUser,HttpSession session){
        Long buUserNumbers = Long.valueOf((session.getAttribute("buUserNumber")).toString());
        businessUser.setBuUserNumber(buUserNumbers);
        //사업자 번호로 해당 가게 찾기
        BusinessStore buStore = businessStoreRepository.findByBusinessUser(businessUser);

        return buStore;
    }

    public List<BusinessStore> searchStore(String searchKeyword){
        List<BusinessStore> byStoreName = businessStoreRepository.findByBuStoreName(searchKeyword);

        /*if(byStoreName.isEmpty()){
            return byStoreName;
        }else {
            return byStoreName;
        }*/
        //이거 왜안들어갈까요?
        return byStoreName;
    }
}
