# ![ORI](https://github.com/OriMarket/OriMarket/assets/136297801/9f13fb00-8067-421e-ab92-1e488218faa2)Ori Market

Spring Data JPA_전통 시장 배달

## 프로젝트 소개
현재 위치 기반 가까운 전통 시장 내 가게들에서 다양한 물건을 한 번의 배달비로 집에서 받아보자!

###### 이 프로젝트는 사용자의 위치 정보를 활용하여 가까운 전통 시장 내 가게들에서 다양한 상품들을 선택하여 배달 받을 수 있는 서비스를 제공합니다. <br>주문한 상품들은 한 번의 배달비로 편리하게 집으로 배달되며, 전통 시장의 다양한 맛과 상품을 직접 느끼면서도 편리한 배달 서비스를 즐길 수 있습니다. <br> 아래 PPT를 통해 더 자세한 내용을 확인하실 수 있습니다.
[PPT 참조](https://docs.google.com/presentation/d/e/2PACX-1vRcu09h3-Z9pwHBeSAKwisxrpgAVIlceL65s4pws59pdqO7qdeR5oUJSoJhWo62Ag/pub?start=true&loop=false&delayms=3000)
## 주요기능
#### 1. 시장 검색 및 상품 선택
사용자는 원하는 시장을 검색하여 해당 시장에서 판매되는 다양한 상품들을 둘러볼 수 있습니다.
각 시장 내 가게에서 판매되는 상품들을 선택하고 장바구니에 추가할 수 있습니다.

#### 2.배달 서비스
사용자는 선택한 상품들을 주문하여 배달 받을 수 있습니다.
주문한 상품들을 사용자의 배달지로 배송해줍니다.
 
#### 3.배달 가능 지역 확인
사용자는 배달 가능한 지역과 불가능한 지역을 확인할 수 있습니다.
배달 주소와 시장 위치 사이의 거리를 기준으로 배달 가능 여부를 판단합니다.
 
#### 4.가까운 시장 탐색
현재 사용자의 위치를 기반으로 가까운 시장을 빠르게 찾을 수 있습니다.
가까운 시장에서 판매되는 상품들을 확인할 수 있습니다.
 
#### 5.시장 내 다양한 가게 물품 한 번에 주문
같은 시장 내의 다양한 가게에서 상품들을 한 번에 주문할 수 있습니다.
여러 가게의 상품을 선택하여 장바구니에 추가하고 한 번에 주문할 수 있습니다.
 
#### 6.상품 및 가게 검색
사용자는 원하는 상품이나 특정 가게를 검색하여 빠르게 찾을 수 있습니다.
키워드나 카테고리로 상품을 검색할 수 있습니다.
 
#### 7.배달지 관리
사용자는 배달 주소를 여러게 등록하고 관리할 수 있습니다
배달 주소를 선택하여 주문할 때 사용할 수 있습니다

#### 8.장바구니 기능
사용자는 상품을 선택하여 장바구니에 추가하고, 한 번에 주문할 수 있습니다.
여러 상품을 묶어서 편리하게 주문할 수 있습니다.

#### 9.다양한 배달 서비스 관련 기능
배달 예상 시간 확인, 주문 상태 추적, 결제 옵션 등의 서비스를 제공합니다.
이러한 주요 기능들을 갖춘 '오리마켓' 어플은 사용자에게 다양한 편의성과 선택의 폭을 제공하며, 시장 내 가게들과 사용자 간의 손쉬운 소통과 거래를 도와주는 역할을 합니다

#### 10. 사업자 가게 관리와 온라인 판매 기능
- #### 사업자 가게 관리 및 운영
사업자는 '가게 관리' 기능을 통해 가게를 원하는 시점에 오픈하거나 클로즈할 수 있습니다. 또한, 원하는 물품을 가게에 등록하고, 필요한 경우 수정하거나 삭제할 수 있습니다. 이를 통해 사업자는 가게 운영을 효율적으로 관리하면서 상품 정보를 업데이트할 수 있습니다.

- #### 리뷰 답글 작성과 온라인 판매 기회 제공
사용자가 작성한 리뷰에 사업자는 답글을 작성할 수 있어서 더 나은 서비스와 응답을 제공할 수 있습니다. 또한, '오리마켓'은 현재 시장에서 활동하는 상인에게도 기회를 제공합니다. 상인은 가게 등록을 통해 온라인으로 상품을 판매할 수 있습니다. 이를 통해 상인은 더 넓은 고객층에게 접근하고 자신의 상품을 홍보하며 성장할 수 있습니다.

- #### 주문 및 배달 관리의 용이함
주문 및 배달 관리는 시장 내 매니저가 중개 역할을 해주어 자신의 가게 운영에만 집중할 수 있습니다. 매니저가 주문을받고 픽업하고 라이더에게 배달을 요청함으로써 사업자는 상품 제조 및 서비스에 더욱 집중할 수 있습니다.

- #### 정산 내역과 매출 현황 확인
사업자는 '정산 내역' 기능을 통해 매출 현황을 손쉽게 확인할 수 있습니다. 주문 건수와 매출 금액 등을 통계적으로 살펴볼 수 있어 경영상의 중요한 결정을 내릴 때에도 도움이 됩니다. 이를 통해 사업자는 자신의 영업 성과를 더욱 명확하게 파악하고 계획을 수립할 수 있습니다.

##### 이러한 특징을 통해 '오리마켓'은 사업자들에게도 간편한 가게 운영과 온라인 판매의 기회를 제공하여, 시장 내의 상호 협력을 촉진하고 상업 활동을 더욱 효율적으로 진행할 수 있도록 도와줍니다.

## 기술스택
1. MySQL
2. Hibernate
3. Spring Data JPA
4. Spring Boot
5. Java
6. JSP (JavaServer Pages)
7. CSS (Cascading Style Sheets)
8. JavaScript
9. JSTL (JavaServer Pages Standard Tag Library)
10. Kakao 지도 API

## 개발 환경 (Development Environment) 및 도구:
1. IDE (Integrated Development Environment) - IntelliJ
2. 데이터베이스 관리 시스템 - MySQL
3. 웹 개발을 위한 프론트엔드 기술 - HTML, CSS, JavaScript, Ajax
4. 백엔드 개발 프레임워크 - Spring, Spring Boot
5. 협업 도구 - Slack, GitHub, Git (버전 관리 시스템)
6. ERD (Entity-Relationship Diagram)
7. 어노테이션 (Annotation)

## 향후계획
현재는 지식과 경험이 부족하여 실제 서비스 배포 및 모바일 앱화에는 도전하지 못한 아쉬움이 있습니다. 그러나 이러한 부족함을 극복하기 위해 끊임없이 공부하고 연습하며 나아가려고 합니다.

앞으로의 향후 계획은 다음과 같습니다.

#### 어플리케이션 확장 및 배포
프로젝트를 실제 환경에서 배포하는 것을 목표로 합니다. 클라우드 플랫폼을 활용하여 어플리케이션을 배포하고 안정성을 높이는 과정을 연습하고, 사용자들이 원활한 서비스를 경험할 수 있도록 노력하겠습니다.

#### API화 
어플리케이션을 API 형태로 개발하여 모바일 앱과의 연동을 준비합니다. RESTful API 디자인을 통해 사용자와의 상호작용을 개선하고, 더 나은 사용자 경험을 제공할 계획입니다.

#### UI/UX 개선 
사용자 경험을 중요시 여기며, UI/UX 디자인을 개선하고 완성도 있는 어플리케이션으로 발전시킬 것입니다. 사용자의 피드백을 수렴하며 더 효율적이고 직관적인 디자인을 추구하겠습니다.

#### 보안 및 성능 최적화
보안을 강화하고 어플리케이션의 성능을 최적화하여 사용자 데이터의 안전성을 확보하고 더 빠른 서비스 제공을 목표로 합니다.

##### 위의 계획들을 통해 지식을 더욱 확장하고 경험을 쌓아, 더 나은 어플리케이션과 더욱 성장한 개발자로 거듭나겠습니다.


## 개발 기간
2023.06.14 ~ 2023.08.03

