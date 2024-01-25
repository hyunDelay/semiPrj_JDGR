## 📝 블로그 서비스 JDGR
![JDGR](https://github.com/hyunDelay/hyunDelay/assets/142950442/bca414b7-a8c6-4a07-a976-a3618a3cac7f)

### 🔍 프로젝트 소개
> 나만의 블로그를 개설하거나 포스트를 쓸 수 있는 블로그 서비스입니다.
* 프로젝트 이름 : **JDGR(좋아요 댓글 구독 알람설정)**
* 프로젝트 기간 : 2023년 11월 1일 ~ 2023년 12월 15일

### 팀원 구성
|현지연|양덕기|김광희|이예지|박범렬|전옥진|
|:---:|:---:|:---:|:---:|:---:|:---:|
|[@hyunDelay](https://github.com/hyunDelay)|[@asd5361](https://github.com/asd5361)|[@KimGwanghui](https://github.com/KimGwanghui)|[@leeyeji803](https://github.com/leeyeji803)|[@ryeol3621](https://github.com/ryeol3621)|[@JEONOKJIN](https://github.com/JEONOKJIN)|
|Leader Developer|DB Manager Developer<br>SCM Developer|Issue Manager Developer||Test Manager Developer|Plan Manager Developer|
|1. 블로그 생성,수정<br>2. 내 블로그 꾸미기<br>3. 포스트 등록,수정,삭제<br>4. 댓글 조회,등록,수정,삭제|1. 관리자<br>2. 고객센터<br>3. [관리자]유저 신고<br>4. [관리자]유저 제재|[사용자] 유저 신고|포스트 리스트 조회|1. 회원가입<br>2. 로그인<br>3. 아이디찾기<br>4. 비밀번호찾기<br>5. 메일인증<br>6. 마이페이지|포스트 상세보기|

### 💻 개발 환경

> **Front**
<div>
<img src="https://img.shields.io/badge/HTML5-e34f26?style=flat&logo=html5&logoColor=white" height="25px" />
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white" height="25px" />
<img src="https://img.shields.io/badge/Jsp-dddddd?style=flat&logo=&logoColor=white" height="25px" />
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=white" height="25px" />
</div><br>

> **Back**
<div>
<img src="https://img.shields.io/badge/JAVA 11 (Servlet)-056db6?style=flat&logo=&logoColor=white" height="25px" />
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=oracle&logoColor=white" height="25px" />
</div><br>

> **Server**
<div>
<img src="https://img.shields.io/badge/Apache tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=white" height="25px" />
</div><br>

> **Using Editors**
<div>
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat&logo=eclipseide&logoColor=white" height="25px" />
<img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat&logo=visualstudiocode&logoColor=white" height="25px" />
</div><br>

> **Operating System**
<div>
<img src="https://img.shields.io/badge/Windows 11-0078D4?style=flat&logo=windows11&logoColor=white" height="25px" />
</div>

<br><br>

### 💡 기능
|사용자|관리자|
|---|---|
|블로그<br>- 카테고리 생성 및 조회<br>- 블로그 사용자 정보 조회<br>- 블로그 설정(수정)<br>- 블로그 생성|블로그 관리 목록 조회<br>블로그 관리 수정|
|포스트<br>- 포스트 작성<br>- 포스트 삭제<br>- 포스트 수정<br>- 전체 포스트 리스트 조회 + 페이징|포스트 관리 목록 조회<br>포스트 관리 수정|
|댓글<br>- 댓글 작성<br>- 댓글 삭제<br>- 댓글 수정||
|공감 조회, 공감 기능||
|구독 수 조회, 구독 기능||
|통합검색 기능||
|신고/제재<br>- 신고하기 기능<br>- 로그인제재 기능|제재 목록 조회<br> 제재 관리|
|고객센터<br>- 공지사항 게시판<br>- 1:1상담 게시판|공지사항 목록 조회<br>공지사항 작성<br>1:1상담 답변기능|
||관리자 계정 목록<br>관리자 계정 수정|


### 🔧 사용한 Api
* 썸머노트


### ⚙️ 담당 개발 내용

#### 블로그 조회 및 카테고리 에 따른 블로그 조회

![blog_view](https://github.com/hyunDelay/hyunDelay/assets/142950442/e59c01f0-d0ec-4150-a7e4-714dbcfd4468)

![blog_category](https://github.com/hyunDelay/hyunDelay/assets/142950442/962097e8-3d8a-4419-9cbb-861158db2613)

> 메인화면에 포스트를 클릭하거나 로그인 시 내 블로그 버튼을 클릭하면 해당 블로그에 맞는 url 경로로 블로그정보가 조회됩니다.

#### **새 블로그 생성 및 대표블로그 설정**

![blog_create](https://github.com/hyunDelay/hyunDelay/assets/142950442/45e252c6-693f-4cb2-ab0c-aba020ab3ca8)

> 한 계정당 3개씩 블로그를 운영할 수 있도록 했습니다. 사용자에게 블로그 이름과 url, 프로필 이미지를 입력받아 blog테이블에 INSERT가 되는 방식으로 만들었습니다. INSERT가 성공적으로 완료되면 모달창에 완료메세지를 띄웠습니다.

#### **블로그 관리(수정) 기능 (블로그 정보, 카테고리, 스킨, 레이아웃 수정)**

![blog_setInfo](https://github.com/hyunDelay/hyunDelay/assets/142950442/829d31cd-97cf-460c-b364-7ac314decc7c)
![blog_setCategory](https://github.com/hyunDelay/hyunDelay/assets/142950442/c928cff4-04b9-4278-a381-e3b27df7d734)
![blog_setLayout](https://github.com/hyunDelay/hyunDelay/assets/142950442/18a89700-7b83-4ed3-aaf2-a3c639e5b7b7)
![blog_setSkin](https://github.com/hyunDelay/hyunDelay/assets/142950442/3c0ef8c3-128e-4f72-9f44-9bd1ef422b67)

> - 블로그의 제목이나 프로필사진을 수정할 수 있습니다.
> - 블로그의 카테고리를 추가하거나 삭제, 수정할 수 있습니다. 추가하기 버튼을 클릭하면 ajax통신방식으로 추가 요청해서 카테고리 테이블에 INSERT됩니다. 카테고리를 클릭하면 해당 카테고리의 이름을 변경할 수 있습니다. 변경 후 저장을 클릭하면 ajax 요청으로 카테고리 테이블의 이름컬럼이 UPDATE 됩니다. 삭제도 같은 방식으로 DELETE가 됩니다.
> - 스킨설정은 블로그의 색을 변경할 수 있습니다. 원하는 색을 고르면 블로그의 전체 색이 변경됩니다. 블로그 테이블에 저장된 스킨컬럼을 UPDATE 하는 방식으로 되어있습니다.
> - 레이아웃 설정은 블로그의 전체 레이아웃을 선택할 수 있습니다. 블로그 테이블에 저장되어 있는 레이아웃 번호가 UPDATE됩니다. 블로그에 추가할 수 있는 위젯도 보이기/안보이기로 수정할 수 있습니다.

#### **포스트 작성하기**

![post_write](https://github.com/hyunDelay/hyunDelay/assets/142950442/27ee0039-fbee-4971-a6b2-c1cc01cd5155)
![post_logic](https://github.com/hyunDelay/hyunDelay/assets/142950442/6751d59d-8c8e-483a-a9eb-9e34c724fc2d)

> - 자신의 블로그에 들어가면 로그인 한 사용자가 블로그 테이블에 저장되어 있는 사용자가 맞는지 확인 후 글쓰기 버튼이 보이도록 했습니다. 글쓰기 버튼을 클릭하면 해당 블로그에 글쓰기 기능을 사용할 수 있습니다. 사용자의 편의성을 위해 summernote라는 텍스트 에디터 api를 사용했습니다.
> - 구분이나 카테고리, 제목을 입력하지 않을 경우 입력하라는 메시지를 모달에 전달해 띄웠습니다.

#### **포스트 수정하기**
https://github.com/hyunDelay/hyunDelay/assets/142950442/48907abf-6990-4dcf-b297-3719f07a4a4e
> - 로그인 한 사용자가 해당 블로그 테이블에 저장되어 있는 사용자가 맞는지 확인 후 수정하기 버튼이 보이도록 했습니다. 수정버튼 클릭 시 작성했던 포스트 번호로 SELECT되어 데이터를 가져와서 보여주도록 했습니다.

#### **포스트 삭제하기**

![post_delete](https://github.com/hyunDelay/hyunDelay/assets/142950442/6a1d6ac7-6a27-4227-80d9-c82e2d9f1804)

> - 로그인 한 사용자가 해당 블로그 테이블에 저장되어 있는 사용자가 맞는지 확인 후 삭제하기 버튼이 보이도록 했습니다. 삭제버튼 클릭 시 포스트가 삭제됩니다.

#### **댓글 작성하기**

![post_reply](https://github.com/hyunDelay/hyunDelay/assets/142950442/cce454b0-818d-47b0-adc9-f309ccac1088)
![post_reply_edit](https://github.com/hyunDelay/hyunDelay/assets/142950442/0029ffda-73f9-4f3c-8d8f-952344f2e10f)

> - 로그인 한 사용자만 댓글을 작성할 수 있도록 했습니다.
> - 작성할 내용을 입력 후 등록버튼 클릭 시 댓글이 작성됩니다. 댓글테이블에 INSERT가 진행됩니다.
> - 대댓글 작성 시 댓글테이블에 해당된 댓글번호를 참조하도록 함께 INSERT 되고 있습니다.
> - 댓글 쓴 사용자와 로그인 사용자를 확인하여 일치하면 수정/삭제 버튼이 보이도록 했습니다. 댓글 수정시 댓글 테이블에 UPDATE 되고 있습니다. 삭제 버튼 클릭시 댓글이 삭제되며 댓글 컬럼에 삭제유무 컬럼에 Y로 UPDATE 되고 있습니다.

#### **어드민 블로그 리스트 조회**

![adminBlog_list](https://github.com/hyunDelay/hyunDelay/assets/142950442/623558df-f789-46ab-bdab-2cb3b8726abb)

> - 관리자 페이지에 모든 사용자의 블로그를 조회할 수 있는 기능을 만들었습니다. 페이징 기능이 적용되어 있습니다.

#### **어드민 블로그 검색**

![adminBlog_search](https://github.com/hyunDelay/hyunDelay/assets/142950442/bd473b4a-1d8d-4b13-9c31-23396757d5fb)

> - 블로그 관리 목록 조회 페이지에서 블로그들을 검색하는 기능을 만들었습니다. 원하는 검색어만 입력하고 검색버튼을 클릭하면 정보에 맞는 결과가 나오게 했습니다.  LIKE 연산자를 사용하여 작업했고, 검색어가 빈 문자열이 아니거나 null값이 아니면 동적으로 쿼리가 적용되도록 작업했습니다.
<br><br>

### ✏️ 성장 경험

#### 팀 리드

전체 팀 일정과 상황에 맞춰 개발의 일정을 조정하고 팀원들과 유대감 형성을 위해 노력하였습니다. <br>
팀원들 모두 웹을 만드는 프로젝트가 처음이었기때문에 웹에 대한 지식이 없어 함께 토론하는 것을 즐겨했습니다.<br>

조금이나마 웹 개발에 대한 지식이 있어서 팀 리더로 나서 프로젝트를 리드했습니다. 우선 프로그램 설계부터 주도적으로 이끌어가며 일정설계, 웹에 대한 전반적인 지식을 공유하고 참여할 수 있도록 독려했습니다. <br><br>

#### 프로젝트 참여 소감

이번 프로젝트에 참여하여 많은 것을 배우고 성장할 수 있는 기회를 가졌습니다.<br>
처음 진행하는 웹 구현 프로젝트였기에 부족한 부분이 많았지만, 실제로 작동하는 웹 프로그램을 직접 만들어 볼 수 있었던 경험이 가장 좋았습니다. 프로젝트 초기에는 새로운 기술과 도구에 대한 학습 곡선이 높았지만, 팀원과의 원활한 협업과 지속적인 노력 덕분에 성공적으로 완료할 수 있었습니다.<br>

개인적으로 어려웠던 부분은 http 요청과 응답할 때 주고받는 파라미터와 session이었습니다. 여러 기능과 결합하기 위해 필요한 파라미터들을 효율적으로 관리하기 어려웠습니다. 이를 해결하기 위해 팀원들과 적극적인 토론과 의견 공유가 이루어졌습니다. 이러한 팀 내 의사소통이 프로젝트의 진행 속도와 결과물 품질에 큰 영향을 미쳤다고 생각합니다.<br>

이 프로젝트를 통해 새로운 기술을 습득하고 팀원들과의 협업 능력을 향상시킬 수 있었습니다. 또한, 개인적으로는 문제 해결과 결정에 대한 책임감을 느낄 수 있는 소중한 경험이었습니다. 앞으로도 이러한 경험을 바탕으로 더 나은 결과물을 만들어내고 싶습니다. 힘들었던 순간들이 있었지만 팀원들과 함께 의미 있는 경험을 나눌 수 있어 기쁘고, 이 소중한 경험을 통해 더 나은 개발자로 성장하고자 합니다. 배운 것들을 다음 프로젝트에서 활용하며, 끊임없는 성장과 발전을 이어가겠습니다.

