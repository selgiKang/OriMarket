//package com.choongang.OriMarket.pay;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("/payment")
//@RequiredArgsConstructor
//public class KakaoPayController {
//
//    private final KakaoPayService kakaoPayService;
//
//    /**
//     * 결제요청
//     */
//    @PostMapping("/ready")
//    public ResponseEntity<KakaoReadyResponse> readyToKakaoPay() {
//        KakaoReadyResponse kakaoReadyResponse = kakaoPayService.kakaoPayReady();
//        return new ResponseEntity<>(kakaoReadyResponse, HttpStatus.OK);
//    }
//
//    /**
//     * 결제 성공 처리
//     */
//    @PostMapping("/success")
//    public ResponseEntity<String> afterPayRequest(@RequestParam("pg_token") String pgToken) {
//        KakaoApproveResponse kakaoApproveResponse = kakaoPayService.approveResponse(pgToken);
//
//        if (kakaoApproveResponse != null && kakaoApproveResponse.getAid() != null) {
//            // 결제 승인이 정상적으로 이루어진 경우
//            // 이후 처리 로직을 추가하시면 됩니다.
//            // 예를 들어, 결제 완료 페이지로 이동하거나 결제 정보를 데이터베이스에 저장하는 등의 작업을 수행합니다.
//
//            // 여기에서는 단순히 "Payment success!" 메시지를 반환합니다.
//            return new ResponseEntity<>("Payment success!", HttpStatus.OK);
//        } else {
//            // 결제 승인이 실패한 경우
//            // 실패 처리 로직을 추가하시면 됩니다.
//            // 예를 들어, 실패 페이지로 이동하거나 실패 원인에 대한 메시지를 반환하는 등의 작업을 수행합니다.
//
//            // 여기에서는 단순히 "Payment failed." 메시지를 반환합니다.
//            return new ResponseEntity<>("Payment failed.", HttpStatus.BAD_REQUEST);
//        }
//    }
//
//    /**
//     * 결제 진행 중 취소
//     */
//    @GetMapping("/cancel")
//    public ResponseEntity<String> cancel() {
//        // 취소에 대한 로직 추가
//        return new ResponseEntity<>("Payment cancelled successfully.", HttpStatus.OK);
//    }
//
//    /**
//     * 결제 실패
//     */
//    @GetMapping("/fail")
//    public ResponseEntity<String> fail() {
//        // 실패에 대한 로직 추가
//        return new ResponseEntity<>("Payment failed.", HttpStatus.BAD_REQUEST);
//    }
//
//    /**
//     * 결제 승인 처리
//     */
//    @PostMapping("/approve")
//    public ResponseEntity<KakaoApproveResponse> approvePayment(@RequestParam("pg_token") String pgToken) {
//        KakaoApproveResponse kakaoApproveResponse = kakaoPayService.approveResponse(pgToken);
//        return new ResponseEntity<>(kakaoApproveResponse, HttpStatus.OK);
//    }
//}
