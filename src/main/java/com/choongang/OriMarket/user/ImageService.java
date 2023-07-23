package com.choongang.OriMarket.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ImageService {

    @Autowired
    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    @Transactional
    public void saveReviewImageUrl(Long imageSeq, String imageUrl) {
        // 리뷰 ID에 해당하는 엔티티를 데이터베이스에서 조회합니다.
        Image image = imageRepository.findById(imageSeq).orElseThrow(() -> new RuntimeException("리뷰를 찾을 수 없습니다."));

        // 이미지 경로를 엔티티에 저장합니다.
        image.setImageUrl(imageUrl);

        // 엔티티를 데이터베이스에 저장합니다.
        imageRepository.save(image);
    }
}
