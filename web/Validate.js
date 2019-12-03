
function checkFormDN() {
    var sdt = document.getElementById('std').value;
    var mk = document.getElementById('mk').value;
    if (sdt == ''){
        alert('Bạn chưa nhập tên đăng nhập');
    }
    else if (mk == '')
    {
        alert('Bạn chưa nhập mật khẩu');
    }
    else{ 
        return true;
    }
    return false;
}

function checkNull(item) {
    if (item.value == "") {
        alert("Phải nhập " + item.name);
        item.focus();
        return false;
    }
    return true;
}

function checkIDNo(item) {
    if (isNaN(item.value) || item.value < 0 || item.value.length != 9) {
        alert("You have entered an invalid Identity number!");
        item.focus();
        return false;
    }
    return true;
}
function checkTel(item) {
    if (item.value.indexOf("-") == -1) {
        alert("Valid Phone No: xxx-yyyyyy");
        item.focus();
        return false;
    }
    return true;
}
function checkEmail(item) {
    if ((item.value.indexOf("@") == -1) || (item.value.indexOf(".") == -1)) {
        alert("Valid email address format: x@y.z");
        item.focus();
        return false;
    }
    return true;
}

function convertAllUnicode(form) {
    form.firstName.value = toUnicode(form.firstName.value);
    form.lastName.value = toUnicode(form.lastName.value);
    form.address.value = toUnicode(form.address.value);
}