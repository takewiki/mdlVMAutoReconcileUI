#' 自动勾稽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' AutoReconcileUI()
AutoReconcileUI <- function(tabTitle ='自动勾稽',
                         colTitles =c('操作区域','操作区域','显示区域'),
                         widthRates =c(6,6,12),
                         func_left = AutoReconcileUI_left,
                         func_right =AutoReconcileUI_right,
                         func_bottom = AutoReconcileUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AutoReconcileUI_left()
AutoReconcileUI_left <- function() {


  res <- tagList(


    tsui::mdl_text2(id = 'text_AutoReconcile_YearMonth',label = '年月',value = '2026-08') ,

    tsui::mdl_text2(id = 'text_AutoReconcile_DeliveryLocation',label = '发货地点',value = '全部') ,
    tsui::mdl_text2(id = 'text_AutoReconcile_BillNo',label = '单据编号',value = '') ,


    shiny::actionButton('btn_AutoReconcile_view','查询'),
    tsui::mdl_download_button(id ='dl_AutoReconcile_view',label = '导出勾稽结果'),






  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AutoReconcileUI_bottom()
AutoReconcileUI_right <- function() {
  res <- tagList(

    tsui::mdl_text2(id = 'text_AutoReconcile_InvoiceNo',label = '发票号',value = 'INVO:VM2511514/INVO:VM2511514') ,

    shiny::actionButton('btn_AutoReconcile_Operation','手动勾稽'),
    #shiny::actionButton('btn_AutoReconcile_IsExpandKit','展开套件'),


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AutoReconcileUI_bottom()
AutoReconcileUI_bottom <- function() {
  res <- tagList(


    tsui::uiScrollX(DT::dataTableOutput(outputId = 'AutoReconcile_object_dt'))


    #tsui::uiScrollX(tsui::mdl_dataTable(id = 'AutoReconcile_resultView',label ='结果显示' ))

  )
  return(res)

}
