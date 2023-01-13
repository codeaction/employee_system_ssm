<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>部门管理</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<!--对话框-->
<link rel="stylesheet" href="js/jconfirm/jquery-confirm.min.css">
</head>
  
<body data-theme="dark">
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <%-- 引入公共的部分 --%>
    <jsp:include page="common.jsp" />
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5">
            <div class="card">
              <div class="card-toolbar clearfix">
                <div class="toolbar-btn-action">
                  <button class="btn btn-info btn-sm" onclick="showAddModal()"><i class="mdi mdi-plus"></i> 新增</button>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive" id="all_department_div">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<!-- 添加模态框 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加部门</h4>
      </div>
      <div class="modal-body">
        <form id="addForm" class="form-horizontal" action="#" method="post" onsubmit="return false;">
          <div class="form-group">
            <label class="col-md-3 control-label" for="dnameAdd">部门名称</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="dnameAdd" placeholder="请输入部门名称">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="dlocationAdd">部门位置</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="dlocationAdd" placeholder="请输入部门位置">
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="addDepartment()">添加</button>
      </div>
    </div>
  </div>
</div>
<!-- End 添加模态框 -->

<!-- 修改模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改部门</h4>
      </div>
      <div class="modal-body">
        <form id="updateForm" class="form-horizontal" action="#" method="post" onsubmit="return false;">
          <input type="hidden" id="didUpdate" />
          <div class="form-group">
            <label class="col-md-3 control-label" for="dnameUpdate">部门名称</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="dnameUpdate" placeholder="请输入部门名称">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="dlocationUpdate">部门位置</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="dlocationUpdate" placeholder="请输入部门位置">
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="updateDepartment()">修改</button>
      </div>
    </div>
  </div>
</div>
<!-- End 修改模态框 -->

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<!--对话框-->
<script src="js/jconfirm/jquery-confirm.min.js"></script>
<!--消息提示-->
<script src="js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/lightyear.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<%-- 引入art-template --%>
<script type="text/javascript" src="js/template-web.js"></script>
<%-- 根据需求定义模板 --%>
<script type="text/html" id="all_department">
  <table class="table table-bordered table-hover">
    <thead>
    <tr>
      <th>编号</th>
      <th>名称</th>
      <th>位置</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody>
    {{each data}}
      <tr>
        <td>{{$value.did}}</td>
        <td>{{$value.dname}}</td>
        <td>{{$value.dlocation}}</td>
        <td>
          <button type="button" class="btn btn-info btn-xs" onclick="showUpdateModal({{$value.did}})">修改</button>
          <button type="button" class="btn btn-danger btn-xs" onclick="showDelConfirm({{$value.did}})">删除</button>
        </td>
      </tr>
    {{/each}}
    </tbody>
  </table>
</script>
<script>
  //显示修改的模态框
  function showUpdateModal(did) {
    //发送Ajax请求根据ID查询部门
    $.ajax({
      url: "admin/department/did/" + did,
      type: "GET",
      dataType: "json",
      success: function (resp) {
        if(resp.code == 10000) {
          //设置修改模态框中的数据
          $("#didUpdate").val(resp.data.did);
          $("#dnameUpdate").val(resp.data.dname);
          $("#dlocationUpdate").val(resp.data.dlocation);
          //显示修改模态框
          $("#updateModal").modal('show');
        }
      }
    })
  }
  
  //修改部门
  function updateDepartment() {
    //发送Ajax请求完成修改
    $.ajax({
      url: "admin/department/",
      type: "PUT",
      data: JSON.stringify({did:$("#didUpdate").val(), dname:$("#dnameUpdate").val(), dlocation:$("#dlocationUpdate").val()}),
      contentType: "application/json;charset=utf-8",
      dataType: "JSON",
      success: (resp) => {
        if(resp.code == 10000) {
          lightyear.notify('修改成功', 'success', 900, 'mdi mdi-emoticon-happy', 'top', 'center');
          //隐藏模态框
          $("#updateModal").modal('hide');
          //查询所有
          findAll();
        } else {
          lightyear.notify(resp.msg, 'danger', 1000, 'mdi mdi-emoticon-sad', 'top', 'center');
        }
      }
    })
  }
  
  //查询所有部门
  function findAll() {
    $.ajax({
      url: "admin/department/list",
      type: "GET",
      dataType: "JSON",
      success: (resp) => {
        if(resp.code == 10000) {
          //resp.data是返回的数据，将服务器返回的数据在模板中渲染
          let html = template('all_department', {data:resp.data});
          //将渲染完成的数据挂载在页面上
          $('#all_department_div').html(html);
        }
      }
    })
  }
  
  //显示添加模态框
  function showAddModal() {
    //通过jQuery代码显示模态框
    $("#addModal").modal("show");
  }
  
  //添加部门
  function addDepartment() {
    lightyear.loading('show');
    $.ajax({
      url: "admin/department/",
      type: "POST",
      data: JSON.stringify({dname: $("#dnameAdd").val(), dlocation:$("#dlocationAdd").val()}), //dname=aaa&dlocation=qd 模拟form表单提交数据 不是JSON
      contentType: "application/json;charset=utf-8",
      dataType: "json",
      success: (resp) => {
        lightyear.loading('hide');
        if(resp.code == 10000) {
          lightyear.notify('添加成功', 'success', 900, 'mdi mdi-emoticon-happy', 'top', 'center');
          //隐藏模态框
          $("#addModal").modal('hide');
          //清空模态框中表单的内容
          $("#addForm")[0].reset();
          //查询所有
          findAll();
        } else {
          lightyear.notify(resp.msg, 'danger', 1000, 'mdi mdi-emoticon-sad', 'top', 'center');
        }
      }
    })
  }
  
  //显示删除的确认框
  function showDelConfirm(did) {
    $.alert({
      title: '删除确认',
      content: '您确认要删除该部门吗?',
      buttons: {
        confirm: {
          text: '确认',
          btnClass: 'btn-primary',
          action: function(){ //点击确认按钮之后调用的函数
            //发送Ajax请求删除
            $.ajax({
              url: "admin/department/" + did,
              type: "DELETE",
              dataType: "json",
              success: (resp) => {
                if(resp.code == 10000) {
                  lightyear.notify('删除成功', 'success', 1000, 'mdi mdi-emoticon-sad', 'top', 'center');
                  findAll();
                } else {
                  lightyear.notify(resp.msg, 'danger', 1000, 'mdi mdi-emoticon-sad', 'top', 'center');
                }
              }
            });
          }
        },
        cancel: {
          text: '取消'
        }
      }
    });
  }
  
  $(function () {
    //查询所有部门
    findAll();
  })
</script>
</body>
</html>