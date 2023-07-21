package com.choongang.OriMarket.marketmap;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ConnexionRepository extends JpaRepository<Connexion, Long> {
    // 별도의 쿼리문 작성이 필요 없으므로 기본 JpaRepository를 사용합니다.
}