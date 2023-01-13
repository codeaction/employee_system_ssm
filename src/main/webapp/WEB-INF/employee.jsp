<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>人员管理</title>
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
<!--时间选择插件-->
<link rel="stylesheet" href="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<!--日期选择插件-->
<link rel="stylesheet" href="js/bootstrap-datepicker/bootstrap-datepicker3.min.css">
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="#!" role="form" onsubmit="return false;">
                  <div class="input-group">
                    <input type="text" class="form-control" id="enameSearch" placeholder="请输入要搜索的姓名" oninput="searchEmployee()" />
                  </div>
                </form>
                <div class="toolbar-btn-action">
                  <button class="btn btn-info btn-sm" onclick="showAddModal()"><i class="mdi mdi-plus"></i> 新增</button>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive" id="all_employee_div">
                
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
        <h4 class="modal-title">添加人员</h4>
      </div>
      <div class="modal-body">
        <form id="addForm" class="form-horizontal" action="#" method="post" onsubmit="return false;">
          <div class="form-group">
            <label class="col-md-3 control-label" for="enameAdd">姓名</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="enameAdd" placeholder="请输入人员姓名">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eageAdd">年龄</label>
            <div class="col-md-7">
              <input class="form-control" type="number" id="eageAdd" placeholder="请输入人员年龄">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eageAdd">性别</label>
            <div class="col-md-7">
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="egenderAdd" value="男" checked="checked"><span>男</span>
              </label>
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="egenderAdd" value="女"><span>女</span>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="ejobAdd">职位</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="ejobAdd" placeholder="请输入人员职位">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eentrydateAdd">入职日期</label>
            <div class="col-md-7">
              <input class="form-control js-datepicker m-b-10" type="text" id="eentrydateAdd" placeholder="请选择入职时间" data-date-format="yyyy年mm月dd日" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="esalaryAdd">薪资</label>
            <div class="col-md-7">
              <input class="form-control" type="number" id="esalaryAdd" placeholder="请输入薪资">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">部门</label>
            <div class="col-md-7">
              <select class="form-control" id="didAdd">
                <!--  挂载模板中的数据 -->
              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="addEmployee()">添加</button>
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
        <h4 class="modal-title">修改人员</h4>
      </div>
      <div class="modal-body">
        <form id="updateForm" class="form-horizontal" action="#" method="post" onsubmit="return false;">
          <input type="hidden" id="eidUpdate">
          <div class="form-group">
            <label class="col-md-3 control-label" for="enameUpdate">姓名</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="enameUpdate" placeholder="请输入人员姓名">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eageUpdate">年龄</label>
            <div class="col-md-7">
              <input class="form-control" type="number" id="eageUpdate" placeholder="请输入人员年龄">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eageUpdate">性别</label>
            <div class="col-md-7">
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="egenderUpdate" value="男"><span>男</span>
              </label>
              <label class="lyear-radio radio-inline radio-primary">
                <input type="radio" name="egenderUpdate" value="女"><span>女</span>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="ejobUpdate">职位</label>
            <div class="col-md-7">
              <input class="form-control" type="text" id="ejobUpdate" placeholder="请输入人员职位">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="eentrydateUpdate">入职日期</label>
            <div class="col-md-7">
              <input class="form-control js-datepicker m-b-10" type="text" id="eentrydateUpdate" placeholder="请选择入职时间" data-date-format="yyyy年mm月dd日" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label" for="esalaryUpdate">薪资</label>
            <div class="col-md-7">
              <input class="form-control" type="number" id="esalaryUpdate" placeholder="请输入薪资">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">部门</label>
            <div class="col-md-7">
              <select class="form-control" id="didUpdate">
                <!--  挂载模板中的数据 -->
              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="updateEmployee()">修改</button>
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
<!-- 引入art-template -->
<script type="text/javascript" src="js/template-web.js"></script>
<!--时间选择插件-->
<script src="js/bootstrap-datetimepicker/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
<!--日期选择插件-->
<script src="js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- 根据需求定义模板 -->
<script type="text/html" id="all_employee">
  <table class="table table-hover table-bordered">
    <thead>
      <tr>
        <th>工号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
        <th>职位</th>
        <th>入职时间</th>
        <th>薪资</th>
        <th>状态</th>
        <th>部门名称</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    {{each data.list}}
      <tr>
        <td>{{$value.eno}}</td>
        <td>{{$value.ename}}</td>
        <td>{{$value.eage}}</td>
        <td>{{$value.egender}}</td>
        <td>{{$value.ejob}}</td>
        <td>{{$value.eentrydate}}</td>
        <td>{{$value.esalary}}</td>
        <td>
          {{if $value.estate == 1}}
            <span class="label label-info">在职</span>
          {{else}}
            <span class="label label-default">离职</span>
          {{/if}}
        </td>
        <td>{{$value.dname}}</td>
        <td>
          {{if $value.estate == 1}}
            <button type="button" class="btn btn-info btn-xs" onclick="findByEid({{$value.eid}}, {{data.pageNum}})">修改</button>
            <button type="button" class="btn btn-danger btn-xs" onclick="delConfirm({{$value.eid}}, {{data.pageNum}})">删除</button>
          {{else}}
            <button type="button" class="btn btn-info btn-xs disabled">修改</button>
            <button type="button" class="btn btn-danger btn-xs disabled">删除</button>
          {{/if}}
        </td>
      </tr>
    {{/each}}
    </tbody>
  </table>
  <nav class="text-center">
    <ul class="pagination pagination-circle">
      <!--
        上一页
        如果没有上一页，上一页无法点击
       -->
      {{if data.hasPreviousPage == true}}
        <li onclick="findByPage('{{data.pageNum-1}}', $('#enameSearch').val())"><a href="javascript:void(0);"><span><i class="mdi mdi-chevron-left"></i></span></a></li>
      {{else}}
        <li class="disabled"><a href="javascript:void(0);"><span><i class="mdi mdi-chevron-left"></i></span></a></li>
      {{/if}}
      <!-- 页码，当前页的数字要高亮-->
      {{each data.navigatepageNums}}
        {{if data.pageNum == $value}}
          <li class="active" onclick="findByPage('{{$value}}', $('#enameSearch').val())"><a href="javascript:void(0);">{{$value}}</a></li>
        {{else}}
          <li onclick="findByPage('{{$value}}', $('#enameSearch').val())"><a href="javascript:void(0);">{{$value}}</a></li>
        {{/if}}
      {{/each}}
      <!--
        下一页
        如果没有下一页，下一页无法点击
       -->
      {{if data.hasNextPage == true}}
        <li onclick="findByPage('{{data.pageNum+1}}', $('#enameSearch').val())"><a href="javascript:void(0);"><span><i class="mdi mdi-chevron-right"></i></span></a></li>
      {{else}}
        <li class="disabled"><a href="javascript:void(0);"><span><i class="mdi mdi-chevron-right"></i></span></a></li>
      {{/if}}
    </ul>
  </nav>
</script>
<script type="text/html" id="all_department">
  <option disabled hidden selected>----请选择----</option>
  {{each data}}
    <option value="{{$value.did}}">{{$value.dname}}</option>
  {{/each}}
</script>
<script>
  var currentPageUpdate = 0;
  
  //搜索员工
  function searchEmployee() {
    findByPage(1, $("#enameSearch").val());
  }
  
  //修改员工
  function updateEmployee() {
    lightyear.loading('show');
    //发送Ajax
    $.ajax({
      url: "admin/employee/",
      type: "PUT",
      data: JSON.stringify({eid:$("#eidUpdate").val(),
        ename: $("#enameUpdate").val(),
        eage: $("#eageUpdate").val(),
        egender: $("input[name='egenderUpdate']:checked").val(),
        ejob: $("#ejobUpdate").val(),
        eentrydate: $("#eentrydateUpdate").val(),
        esalary: $("#esalaryUpdate").val(),
        did: $("#didUpdate").val()
      }),
      contentType: "application/json;charset=utf-8",
      dataType: "JSON",
      success: (resp) => {
        lightyear.loading('hide');
        //显示结果
        lightyear.notify('修改成功', 'success', 900, 'mdi mdi-emoticon-happy', 'top', 'center');
        //隐藏模态框
        $("#updateModal").modal('hide');
        //清空模态框
        $("#updateForm")[0].reset();
        //分页查询 - 被修改的元素在那一页，就要去哪一页
        findByPage(currentPageUpdate, $('#enameSearch').val());
      }
    })
  }
  //根据ID查询员工
  function findByEid(eid, currentPage) {
    currentPageUpdate = currentPage;
    /*
    * 1.查询所有的部门
    * 2.查询当前员工的信息
    * */
    //发送ajax请求，获取所有的部门
    $.ajax({
      url: "admin/department/list",
      type: "GET",
      contentType: "application/json;charset=utf-8",
      dataType: "JSON",
      success: (resp) => {
          // 设置表示部门的下拉列表
          //resp.data是返回的数据，将服务器返回的数据在模板中渲染
          let html = template('all_department', {data:resp.data});
          //将渲染完成的数据挂载在页面上
          $('#didUpdate').html(html);
          //查询当前员工的信息
          $.ajax({
            url: "admin/employee/id/" + eid,
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: (resp) => {
              //设置模态框中的员工信息
              $("#eidUpdate").val(resp.data.eid);
              $("#enameUpdate").val(resp.data.ename);
              $("#eageUpdate").val(resp.data.eage);
              if(resp.data.egender == '男') {
                $("input[name='egenderUpdate'][value='男']").prop('checked', true);
              } else {
                $("input[name='egenderUpdate'][value='女']").prop('checked', true);
              }
              $("#ejobUpdate").val(resp.data.ejob);
              $("#eentrydateUpdate").val(resp.data.eentrydate);
              $("#esalaryUpdate").val(resp.data.esalary);
              $("#didUpdate").val(resp.data.did);
              //显示模态框
              $("#updateModal").modal('show');
            }
          })
        }
    })
  }
  //删除
  function delConfirm(eid, currentPage) {
    //弹出确认框
    $.alert({
      title: '删除确认',
      content: '您确认要删除该员工吗?',
      buttons: {
        confirm: {
          text: '确认',
          btnClass: 'btn-primary',
          action: function(){ //点击确认按钮之后调用的函数
            //发送Ajax请求删除
            $.ajax({
              url: "admin/employee/" + eid,
              type: "DELETE",
              contentType: "application/json;charset=utf-8",
              dataType: "json",
              success: (resp) => {
                lightyear.notify('删除成功', 'success', 1000, 'mdi mdi-emoticon-sad', 'top', 'center');
                findByPage(currentPage, $('#enameSearch').val());
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
  //添加
  function addEmployee() {
    lightyear.loading('show');
    //发送Ajax
    $.ajax({
      url: "admin/employee/",
      type: "POST",
      data: JSON.stringify({ename: $("#enameAdd").val(),
        eage: $("#eageAdd").val(),
        egender: $("input[name='egenderAdd']:checked").val(),
        ejob: $("#ejobAdd").val(),
        eentrydate: $("#eentrydateAdd").val(),
        esalary: $("#esalaryAdd").val(),
        did: $("#didAdd").val()
      }),
      contentType: "application/json;charset=utf-8",
      dataType: "JSON",
      success: (resp) => {
        lightyear.loading('hide');
        //显示结果
        lightyear.notify('添加成功', 'success', 900, 'mdi mdi-emoticon-happy', 'top', 'center');
        //隐藏模态框
        $("#addModal").modal('hide');
        //清空模态框
        $("#addForm")[0].reset();
        //分页查询
        findByPage(1, $('#enameSearch').val());
      }
    })

  }
  //显示新增模态框
  function showAddModal() {
    //发送ajax请求，获取所有的部门
    $.ajax({
      url: "admin/department/list",
      type: "GET",
      contentType: "application/json;charset=utf-8",
      dataType: "JSON",
      success: (resp) => {
        if(resp.code == 10000) {
          // 设置表示部门的下拉列表
          //resp.data是返回的数据，将服务器返回的数据在模板中渲染
          let html = template('all_department', {data:resp.data});
          //将渲染完成的数据挂载在页面上
          $('#didAdd').html(html);
          //显示模态框
          $("#addModal").modal('show');
        }
      }
    })
  }
  //查询所有
  function findByPage(currentPage, enameSearch) {
    $.ajax({
      type: "GET",
      url: "admin/employee/page",
      data: {currentPage:currentPage, ename:enameSearch},
      contentType: "application/json;charset=utf-8",
      dataType: "json",
      success: (resp) => {
        //resp.data是返回的数据，将服务器返回的数据在模板中渲染
        let html = template('all_employee', {data:resp.data});
        //将渲染完成的数据挂载在页面上
        $('#all_employee_div').html(html);
      }
    });
  }
  
  $(function () {
    findByPage(1, $('#enameSearch').val());
  })
</script>
</body>
</html>