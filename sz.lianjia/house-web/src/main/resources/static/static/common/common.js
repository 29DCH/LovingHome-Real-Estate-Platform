function successmsg(title, content) {
    toastr.success(content, title, {
        "timeOut": "1500",
        "iconClass": "toast toast-success",
        "closeButton": true,
        "positionClass": "toast-top-right"
    })
    return false;
}

function errormsg(title, content) {
    toastr.error(content, title, {
        "timeOut": "8000",
        "iconClass": "toast toast-error",
        "closeButton": true,
        "positionClass": "toast-top-right"
    })
    return false;
}


function nextPage(pageNum, pageSize) {

    if ($('#searchForm').length != 0) {
        var url = $('#searchForm').attr('action');
        var data = "?pageNum=" + pageNum + "&pageSize=" + pageSize + "&" + $('#searchForm').serialize();
        window.location.href = url + data;
    } else {
        var url = window.location.href;
        url = url.split('?')[0];
        var data = "?pageNum=" + pageNum + "&pageSize=" + pageSize;
        window.location.href = url + data;
    }
}


function commonAjax(url, data) {
    var code = 0;
    if (data) {
        data = '_=' + $.now() + '&' + data;
    } else {
        data = '_=' + $.now();
    }
    var jsonObj;
    $.ajax({
        url: url,
        type: 'POST',
        data: data,
        cache: false,
        timeout: 60000
    })
        .done(function (ret) {
            jsonObj = ret;
            var msg;
            if (jsonObj.errorMsg) {
                msg = jsonObj.errorMsg;
                errormsg("error!", msg ? msg : "Operation Failed");
            } else {
                msg = jsonObj.successMsg;
                if (msg) {
                    successmsg("success!", msg);
                }

            }
        })
        .fail(function (jqXHR, textStatus, errorThrown) {
            if (textStatus && textStatus == 'error') {
                errormsg("error!", 'System Error')
            }
            ;
            if (textStatus && textStatus == 'timeout') {
                successmsg("error!", 'Response Timeout')
            }
            ;
        })
}

