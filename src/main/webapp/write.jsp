<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글쓰기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-bottom: 50px;
        }
    </style>
</head>
<body class="py-4">

<h1 class="fw-bold">게시물 추가</h1>

<div class="container bg-white p-4 rounded shadow-sm" style="max-width: 700px;">

    <form action="write_ok.jsp" method="post">

        <div class="row mb-3">
            <label for="title" class="col-sm-2 col-form-label fw-bold">제목:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" />
            </div>
        </div>

        <div class="row mb-3">
            <label for="writer" class="col-sm-2 col-form-label fw-bold">작성자:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="writer" name="writer" />
            </div>
        </div>

        <div class="row mb-3">
            <label for="category" class="col-sm-2 col-form-label fw-bold">카테고리:</label>
            <div class="col-sm-10">
                <select class="form-select" id="category" name="category">
                    <option value="notice">공지사항</option>
                    <option value="free">자유게시판</option>
                    <option value="qna">질문답변</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <label for="content" class="col-sm-2 col-form-label fw-bold">내용:</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="content" name="content" style="height: 150px;"></textarea>
            </div>
        </div>

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label fw-bold">공개글:</label>
            <div class="col-sm-10 d-flex align-items-center">

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="isPublic" name="is_public" checked />
                    <label class="form-check-label" for="isPublic">
                        이 글을 공개로 설정합니다.
                    </label>
                </div>
            </div>
        </div>

        <hr class="my-4">

        <div class="d-grid gap-2">
            <input type="submit" class="btn btn-primary btn-lg" value="저장하기" />
        </div>

    </form>

</div>
</body>
</html>