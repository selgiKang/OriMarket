<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/store/delivery_pickup.css">
</head>

<body>

<div class="main-container">
  <h3>리뷰 관리</h3>
  <div class="tabs">
    <input type="radio" id="tab1" name="tab-control" checked>
    <input type="radio" id="tab2" name="tab-control">
    <ul>
      <li title="배달"><label for="tab1" role="button"><span>배달</span></label></li>
      <li title="포장"><label for="tab2" role="button"><span>포장</span></label></li>
    </ul>
    <div class="slider">
      <div class="indicator"></div>
    </div>
    <div class="content">
      <section>
        <div class="inside_tabs">
          <div role="inside_tablist">
            <button id="tab-1" aria-selected="true" aria-controls="tab-panel-1" role="tab" type="button" tabindex="0">
              작성 가능한 리뷰(__)
            </button>
            <button id="tab-2" aria-selected="false" aria-controls="tab-panel-2" role="tab" type="button" tabindex="-1">
              작성한 리뷰(__)
            </button>
          </div>
          <div id="tab-panel-1" aria-labelledby="tab-1" role="tabpanel" tabindex="0" >
            배달탭에서 작성 가능한 리뷰
          </div>
          <div id="tab-panel-2" aria-labelledby="tab-2" role="tabpanel" tabindex="-1" >
            배달탭에서 작성한 리뷰
          </div>
        </div>
      </section>
      <section>
        <div class="inside_tabs">
          <div role="inside_tablist">
            <button id="tab-3" aria-selected="true" aria-controls="tab-panel-3" role="tab" type="button" tabindex="0">
              작성 가능한 리뷰(__)
            </button>
            <button id="tab-4" aria-selected="false" aria-controls="tab-panel-4" role="tab" type="button" tabindex="-1">
              작성한 리뷰(__)
            </button>
          </div>
          <div id="tab-panel-3" aria-labelledby="tab-3" role="tabpanel" tabindex="0">
            포장탭에서 작성 가능한 리뷰
          </div>
          <div id="tab-panel-4" aria-labelledby="tab-4" role="tabpanel" tabindex="-1" hidden>
            포장탭에서 작성한 리뷰
          </div>
        </div>
      </section>
    </div>
  </div>
</div>
<script src="../../js/store/delivery_pickup.js"></script>
</body>
</html>
