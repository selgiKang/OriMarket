var posts = []; // 게시글 정보를 저장할 배열

function previewImage(event) {
    var imageUpload = event.target;
    var imageFile = imageUpload.files[0];
    var imagePreview = document.getElementById("image-preview");

    var reader = new FileReader();
    reader.onload = function (e) {
        var img = document.createElement("img");
        img.src = e.target.result;
        img.style.maxWidth = "100%";
        img.style.height = "auto";
        imagePreview.innerHTML = "";
        imagePreview.appendChild(img);
    };

    reader.readAsDataURL(imageFile);
}

function uploadPost() {
    var imageUpload = document.getElementById("image-upload");
    var imageFile = imageUpload.files[0];
    var postContent = document.querySelector(".board .content textarea").value;

    var post = {
        content: postContent,
        image: imageFile,
        date: new Date(),
        isNotice: true, // 최신 게시글은 공지로 표시
    };

    posts.unshift(post); // 배열의 맨 앞에 게시글 정보 추가

    // 게시글을 생성하여 화면에 표시
    var boardDiv = document.querySelector(".storecare .board");
    var newPostDiv = document.createElement("div");
    newPostDiv.className = "post";

    var titleDiv = document.createElement("div");
    titleDiv.className = "title";

    if (post.isNotice) {
        var noticeDiv = document.createElement("div");
        noticeDiv.className = "notice";
        noticeDiv.innerText = "공지";
        titleDiv.appendChild(noticeDiv);
    }

    var dateDiv = document.createElement("div");
    dateDiv.className = "date";
    dateDiv.style.float = "right";
    dateDiv.innerText = post.date.toLocaleString();
    titleDiv.appendChild(dateDiv);

    newPostDiv.appendChild(titleDiv);

    var contentDiv = document.createElement("div");
    contentDiv.className = "content";

    if (imageFile) {
        var img = document.createElement("img");
        img.src = URL.createObjectURL(imageFile);
        img.style.maxWidth = "100%";
        img.style.height = "auto";
        contentDiv.appendChild(img);
    }


    contentDiv.innerHTML += postContent;
    newPostDiv.appendChild(contentDiv);
    boardDiv.prepend(newPostDiv);

    // 게시글 업로드 후 입력 내용 초기화
    imageUpload.value = "";
    document.querySelector(".board .content textarea").value = "";
    document.getElementById("image-preview").innerHTML = "";

    // 이전 게시글에서 공지 표시 제거
    for (var i = 1; i < posts.length; i++) {
        var otherPostElement = document.querySelectorAll(".storecare .board .post")[i];
        var otherNoticeDiv = otherPostElement.querySelector(".notice");
        if (otherNoticeDiv) {
            otherNoticeDiv.remove();
        }
    }
}








function showInputData() {
    var logoUpload = document.getElementById("logo-upload");
    var storeNameInput = document.getElementById("store-name-input");
    var storeNumberInput = document.getElementById("store-number-input");
    var storeCategoryInput = document.getElementById("store-category-input");
    var storeLocationInput = document.getElementById("store-location-input");

    var logoPreview = document.getElementById("logo-preview");
    var storeName = storeNameInput.value;
    var storeNumber = storeNumberInput.value;
    var storeCategory = storeCategoryInput.value;
    var storeLocation = storeLocationInput.value;

    // 첨부한 로고 이미지만 표시하고, 텍스트 박스는 보이지 않게 함
    logoUpload.style.display = "none";
    storeNameInput.style.display = "none";
    storeNumberInput.style.display = "none";
    storeCategoryInput.style.display = "none";
    storeLocationInput.style.display = "none";

    logoPreview.style.display = "block";
    logoPreview.style.marginBottom = "10px";

    // 입력한 데이터만 표시
    logoPreview.innerText = ""; // 기존에 보여주던 로고 이미지 삭제
    if (logoPreview.firstChild) {
        logoPreview.removeChild(logoPreview.firstChild);
    }

    if (logoUpload.files.length > 0) {
        var img = document.createElement("img");
        img.src = URL.createObjectURL(logoUpload.files[0]);
        img.style.maxWidth = "100%";
        img.style.height = "auto";
        logoPreview.appendChild(img);
    }

    // 텍스트 박스의 값을 표시하기 위해 새로운 엘리먼트를 생성하여 추가
    var storeNameText = document.createElement("h4");
    storeNameText.innerText = storeName;
    storeNameInput.parentNode.appendChild(storeNameText);

    var storeNumberText = document.createElement("h4");
    storeNumberText.innerText = storeNumber;
    storeNumberInput.parentNode.appendChild(storeNumberText);

    var storeCategoryText = document.createElement("h4");
    storeCategoryText.innerText = storeCategory;
    storeCategoryInput.parentNode.appendChild(storeCategoryText);

    var storeLocationText = document.createElement("h4");
    storeLocationText.innerText = storeLocation;
    storeLocationInput.parentNode.appendChild(storeLocationText);

    // 텍스트 박스는 삭제
    storeNameInput.parentNode.removeChild(storeNameInput);
    storeNumberInput.parentNode.removeChild(storeNumberInput);
    storeCategoryInput.parentNode.removeChild(storeCategoryInput);
    storeLocationInput.parentNode.removeChild(storeLocationInput);

    // 수정 버튼으로 변경
    var editButton = document.querySelector(".storecare button");
    editButton.innerText = "수정";
}


/*탭*/
const labels = document.querySelectorAll('.label');
labels.forEach((label) => {
    label.addEventListener('click', () => {
        const panel = label.nextElementSibling;
        const isOpen = panel.style.display === 'block';

        if (isOpen) {
            panel.style.display = 'none';
        } else {
            panel.style.display = 'block';
        }
    });
});