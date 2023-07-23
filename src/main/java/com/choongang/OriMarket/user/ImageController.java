package com.choongang.OriMarket.user;

import com.choongang.OriMarket.user.ImageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Controller
public class ImageController {

    private static final String UPLOAD_DIR = "/path/to/upload/directory"; // 이미지를 저장할 디렉토리 경로

    @GetMapping("/picturetest")
    public String picturetest(){
        return "user/picturetest";
    }

    @PostMapping("/upload")
    public String uploadImages(@RequestPart("files") MultipartFile[] files, RedirectAttributes redirectAttributes) {
        // 업로드된 이미지들을 처리하는 로직을 여기에 구현합니다.
        // 예를 들어, 업로드된 이미지들을 서버에 저장하고, 엔티티에 이미지 경로를 저장하는 등의 작업을 수행합니다.

        // 이미지를 업로드할 디렉토리가 존재하지 않으면 생성합니다.
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 업로드된 각 이미지들을 순회하며 처리합니다.
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    // 서버에 저장될 이미지 파일 이름을 랜덤으로 생성합니다.
                    String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

                    // 이미지를 업로드할 경로를 생성합니다.
                    File serverFile = new File(uploadDir.getAbsolutePath() + File.separator + fileName);

                    // 이미지를 서버에 저장합니다.
                    file.transferTo(serverFile);

                    // 엔티티에 이미지 경로를 저장하는 로직을 추가하세요.
                    // 이 예시에서는 엔티티가 없으므로 생략합니다.

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        // 업로드가 성공적으로 완료되면 uploadSuccess.jsp로 리다이렉트하며, 업로드된 이미지들의 정보를 전달합니다.
        redirectAttributes.addFlashAttribute("message", "이미지 업로드가 성공적으로 완료되었습니다.");
        return "user/picturetest";
    }
}
