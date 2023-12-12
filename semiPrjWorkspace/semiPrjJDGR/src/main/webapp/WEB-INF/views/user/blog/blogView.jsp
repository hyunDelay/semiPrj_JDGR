<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/common/header.jsp" %>

<script>
	// 댓글창
	let ReplyList = false;

	function toggleReplyList() {
    const replyList = document.getElementById('replyList');
    ReplyList = !ReplyList;

    if (ReplyList) {
    	replyList.style.display = 'block';
    } else {
    	replyList.style.display = 'none';
    }
}

    let likeClick = true;
    let plusClick = true;
    let repClick = true;
    let repListClick = true;
    
    // 이미지 변경	
    function clickEvent(mode) {
        switch (mode) {
        
            case 'like' :
                const likeBtn = document.getElementById('like_btn');
                likeClick ? likeBtn.className = "btn_k like" : likeBtn.className = "btn_k un_like";
                likeClick = !likeClick;
                heart();
            break;
                
            case 'follow' :
                const plusBtn = document.getElementById('plus_btn');
                plusClick ? plusBtn.className = "btn_k plus" : plusBtn.className = "btn_k un_plus";
                plusClick = !plusClick;
                follow()
            break;
                
            case 'reply' :
                const repBtn = document.getElementById('rep_btn');
                repClick ? repBtn.className = "btn_k rep" : repBtn.className = "btn_k un_rep";
                repClick = !repClick;
                toggleReplyList()
            break;
                
        }
        
    }
    
    // 신고
    function blame() {
    	const form = document.createElement("form");
        form.action = "/jdgr/user/blame/p_blamepop";
        
        form.method = "POST";
        
        document.body.appendChild(form);
        
        form.submit();
    }
    
//     // 공감
//     function heart() {
//     	const form = document.createElement("form");
//         form.action = "/jdgr/post/heart";
//         form.method = "GET";
        
//         document.body.appendChild(form);
        
//         form.submit();
//     }
    
//     // 구독
//     function follow() {
//     	const form = document.createElement("form");
//         form.action = "/jdgr/post/follow";
//         form.method = "GET";
        
//         document.body.appendChild(form);
        
//         form.submit();
//     }
    
    // ajax 공감
    function heart(){
        
        fetch('/jdgr/post/heart', {
           method : 'get',
        })
        .then(resp => { 
        	if (!resp.ok) {
            	throw new Error('Network response was not ok');
        	}
        	return resp.json(); 
        })
      
        .then( data => {
        	console.log('공감 성공:', data);
        })
        .catch(error => {
            console.error('catch블럭 실행:', error);
        });
     }
    
 	// ajax 구독
    function follow() {
        fetch('/jdgr/post/follow', {
            method: 'GET'
        })
        .then(resp => {
            if (!resp.ok) {
                throw new Error('Network response was not ok');
            }
            return resp.json();
        })
        .then(data => {
            console.log('구독 성공:', data);
            // 받은 데이터를 처리하여 필요한 동작 수행
        })
        .catch(error => {
            console.error('catch블럭 실행:', error);
        });
    }
    
    
</script>

<!-- main -->
<main>
    <div class="inner">

        <!-- blog_layout -->
        <div class="blog_layout">

            <%@ include file="/WEB-INF/views/user/blog/blogSide.jsp" %>

            <!-- 포스트 목록 및 내용 및 댓글 -->
            <div class="blog_right">

                <!-- 전체목록 -->
                <div class="b_post_list">
                    <a href="" class="tit">
                        <strong>전체보기</strong>
                        <span>4개의 글</span>
                    </a>
                    <table>
                        <colgroup>
                            <col width="*">
                            <col width="12%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">글 제목</th>
                                <th scope="col">조회수</th>
                                <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div class="paging_box">
                    </div>
                </div>

                <!-- 포스트 상세보기 -->
                <div class="b_post_detail">
					<%@ include file="/WEB-INF/views/user/post/detail.jsp" %>
                </div>

                <!-- 
                    포스트 댓글
                    댓글버튼 :: li에 reply class 추가됨 reply_inp_box class에 display block
                    댓글취소 :: li에 reply class 제거됨 reply_inp_box class에 display none
                    수정하기 :: li에 edit class 추가됨 reply_edit class에 display block / 나머지 none
                    수정취소 :: li에 edit class 제거됨 reply_edit class에 display none / 나머지 block
                    삭제하기 :: li에 delete class 추가됨 blind div태그 추가됨
                -->
                <div id="replyList" class="b_post_reply" style="display : none">
                    <ul>
                        <li>
                            <div class="reply_pop">
                                <a href=""></a>
                                <div class="pop_content">
                                    <a href="" class="edit">수정하기</a>
                                    <a href="" class="delete">삭제하기</a>
                                </div>
                            </div>
                            <div class="user_nick">
                                <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                <strong>댓글 단 유저의 닉네임</strong>
                            </div>
                            <div class="reply_content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뭔데</div>
                            <div class="reply_edit">
                                <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                <div>
                                    <button>취소</button>
                                    <button>수정</button>
                                </div>
                            </div>
                            <div class="reply_info">
                                <span class="date">2023.11.12 15:12</span>
                                <a href="/jdgr/user/blame/r_blamepop" class="modal_open" data-target="#pop_email">신고</a>
                            </div>
                            <div class="btn_area">
                                <button>댓글</button>
                            </div>
                            <div class="reply_inp_box">
                                <div class="user_nick">
                                    <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                    <strong>유저닉네임</strong>
                                </div>
                                <div class="reply_inp">
                                    <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                </div>
                                <div class="reply_footer">
                                    <div class="count">
                                        <span>0</span>
                                        <span>/ 3000</span>
                                    </div>
                                    <div class="reply_btn">
                                        <button>등록</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="rreply">
                            <div class="reply_pop">
                                <a href=""></a>
                                <div class="pop_content">
                                    <a href="" class="edit">수정하기</a>
                                    <a href="" class="delete">삭제하기</a>
                                </div>
                            </div>
                            <div class="user_nick">
                                <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                <strong>댓글 단 유저의 닉네임</strong>
                            </div>
                            <div class="reply_content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뭔데</div>
                            <div class="reply_edit">
                                <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                <div>
                                    <button>취소</button>
                                    <button>수정</button>
                                </div>
                            </div>
                            <div class="reply_info">
                                <span class="date">2023.11.12 15:12</span>
                                <a href="">신고</a>
                            </div>
                            <div class="reply_inp_box">
                                <div class="user_nick">
                                    <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                    <strong>유저닉네임</strong>
                                </div>
                                <div class="reply_inp">
                                    <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                </div>
                                <div class="reply_footer">
                                    <div class="count">
                                        <span>0</span>
                                        <span>/ 3000</span>
                                    </div>
                                    <div class="reply_btn">
                                        <button>등록</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="rreply">
                            <div class="reply_pop">
                                <a href=""></a>
                                <div class="pop_content">
                                    <a href="" class="edit">수정하기</a>
                                    <a href="" class="delete">삭제하기</a>
                                </div>
                            </div>
                            <div class="user_nick">
                                <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                <strong>댓글 단 유저의 닉네임</strong>
                            </div>
                            <div class="reply_content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뭔데</div>
                            <div class="reply_edit">
                                <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                <div>
                                    <button>취소</button>
                                    <button>수정</button>
                                </div>
                            </div>
                            <div class="reply_info">
                                <span class="date">2023.11.12 15:12</span>
                                <a href="">신고</a>
                            </div>
                            <div class="reply_inp_box">
                                <div class="user_nick">
                                    <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                    <strong>유저닉네임</strong>
                                </div>
                                <div class="reply_inp">
                                    <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                </div>
                                <div class="reply_footer">
                                    <div class="count">
                                        <span>0</span>
                                        <span>/ 3000</span>
                                    </div>
                                    <div class="reply_btn">
                                        <button>등록</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="reply_pop">
                                <a href=""></a>
                                <div class="pop_content">
                                    <a href="" class="edit">수정하기</a>
                                    <a href="" class="delete">삭제하기</a>
                                </div>
                            </div>
                            <div class="user_nick">
                                <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                <strong>댓글 단 유저의 닉네임</strong>
                            </div>
                            <div class="reply_content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ뭔데</div>
                            <div class="reply_edit">
                                <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                <div>
                                    <button>취소</button>
                                    <button>수정</button>
                                </div>
                            </div>
                            <div class="reply_info">
                                <span class="date">2023.11.12 15:12</span>
                                <a href="">신고</a>
                            </div>
                            <div class="btn_area">
                                <button>댓글</button>
                            </div>
                            <div class="reply_inp_box">
                                <div class="user_nick">
                                    <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                                    <strong>유저닉네임</strong>
                                </div>
                                <div class="reply_inp">
                                    <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                                </div>
                                <div class="reply_footer">
                                    <div class="count">
                                        <span>0</span>
                                        <span>/ 3000</span>
                                    </div>
                                    <div class="reply_btn">
                                        <button>등록</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="paging_box">
                        <ul>
                            <li class="prev_all"><a href="" title="최신페이지로 이동"></a></li>
                            <li class="prev"><a href="" title="이전페이지로 이동"></a></li>
                            <li class="on"><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                            <li><a href="">5</a></li>
                            <li><a href="">6</a></li>
                            <li><a href="">7</a></li>
                            <li><a href="">8</a></li>
                            <li><a href="">9</a></li>
                            <li><a href="">10</a></li>
                            <li class="next"><a href="" title="다음페이지로 이동"></a></li>
                            <li class="next_all"><a href="" title="마지막페이지로 이동"></a></li>
                        </ul>
                    </div>
                    <div class="reply_inp_box">
                        <div class="user_nick">
                            <div class="img"><img src="/jdgr/resources/user/images/content/img_main01.png" alt=""></div>
                            <strong>유저닉네임</strong>
                        </div>
                        <div class="reply_inp">
                            <textarea placeholder="타인에게 불쾌감을 주는 욕설과 악플은 삭제될 수 있습니다."></textarea>
                        </div>
                        <div class="reply_footer">
                            <div class="count">
                                <span>0</span>
                                <span>/ 3000</span>
                            </div>
                            <div class="reply_btn">
                                <button>등록</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- //blog_layout -->

    </div>
    
   
</main>
<!-- //main -->




<script>
    // 파라미터 가져오기
    const currentUrl = window.location.href;
    const url = new URL(currentUrl);
    const urlParams = url.searchParams;
    const blogUrl = urlParams.get("url");
    const groupNo = urlParams.get("GroupNo");
    const pNo = urlParams.get("pNo");
    
    let pnumCnt = urlParams.get("pnum");

    
    function getPostList(pnum, blogurl, groupno, pno){
    	
        fetch('/jdgr/post/list?pnum=' + pnum + "&categoryNo=" + groupno + "&url=" + blogurl + "&pNo=" + pno)
//         fetch('/jdgr/post/list?pNo=' + pNo)
        .then(resp => resp.json())
        .then(data => {
            // 서버 응답 처리
            const pvo = data.pvo;
            const postVoList = data.postVoList;

            const tbody = document.querySelector('.b_post_list table tbody');

            // 기존 tr 제거
            tbody.innerHTML = '';

            //
            for (let i = 0; i < postVoList.length; i++) {
                const post = postVoList[i];
                const tr = document.createElement('tr');

                // td 추가
                const titleCell = document.createElement('td');
                titleCell.textContent = post.postTitle;
                tr.appendChild(titleCell);

                const inquiryCell = document.createElement('td');
                inquiryCell.textContent = post.inquiry;
                tr.appendChild(inquiryCell);

                const dateCell = document.createElement('td');
                dateCell.textContent = post.enrollDate;
                tr.appendChild(dateCell);

                // 클릭 이벤트 추가
                tr.onclick = function() {
                    location.href = '/jdgr/post/detail?pNo=' + post.postNo;
                };

                // tbody에 행 추가
                tbody.appendChild(tr);
            }
            
            const pagingBox = document.querySelector('.paging_box');
            const pagingUl = document.createElement('ul');

            // 이전 페이지 링크
            if (pvo.startPage < pvo.currentPage) {
                const prevLi = document.createElement('li');
                const prevLiBtn = document.createElement('a');
                prevLiBtn.href = '/jdgr/post/detail?pnum=' + (pvo.currentPage - 1) + '&&url=' + data.PblogUrl + '&&categoryNo=' + data.PgroupNo;
                prevLi.classList.add('prev');
                prevLi.appendChild(prevLiBtn);
                pagingUl.appendChild(prevLi);
            }

            // 중간 페이지 링크
            for (let i = pvo.startPage; i < pvo.endPage + 1; i++) {
                const pagingLi = document.createElement('li');
                const pagingLiBtn = document.createElement('a');
                if (pvo.currentPage === i) {
                    pagingLi.classList.add('on');
                    pagingLiBtn.href = '#';  // 현재 페이지는 링크를 비활성화
                } else {
                    pagingLiBtn.href = '/jdgr/post/detail?pnum=' + i + '&&url=' + data.PblogUrl + '&&categoryNo=' + data.PgroupNo;
                }
                pagingLiBtn.textContent = i;
                pagingLi.appendChild(pagingLiBtn);
                pagingUl.appendChild(pagingLi);
            }

            // 다음 페이지 링크
            if (pvo.endPage > pvo.currentPage) {
                const nextLi = document.createElement('li');
                const nextLiBtn = document.createElement('a');
                nextLiBtn.href = '/jdgr/post/detail?pnum=' + (pvo.currentPage + 1) + '&&url=' + data.PblogUrl + '&&categoryNo=' + data.PgroupNo;
                nextLi.classList.add('next');
                nextLi.appendChild(nextLiBtn);
                pagingUl.appendChild(nextLi);
            }

            pagingBox.appendChild(pagingUl);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    
    if(pnumCnt === null){
        pnumCnt = 1;
    }
    getPostList(pnumCnt, blogUrl, groupNo, pNo);

    // function getReplyList(refNo){
    //     fetch("/app99/board/reply/list?refNo=" + refNo)
    //     .then( (resp) => { return resp.json() } )
    //     .then( (data) => { console.log(data) } )
    //     .catch(() => { alert("댓글불러오기 실패") });
    // }
    // getReplyList(1);
</script>

<%@ include file="/WEB-INF/views/user/common/footer.jsp" %>