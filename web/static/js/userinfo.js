function openModal() {
    document.getElementById("passwordModal").style.display = "block";
}

function closeModal() {
    document.getElementById("passwordModal").style.display = "none";
}
function validateForm() {
    // 获取表单元素
    const newPassword = document.getElementsByName('password')[0].value;
    const confirmPassword = document.getElementsByName('confirmPassword')[0].value;

    // 验证新密码和确认密码是否一致
    if (newPassword !== confirmPassword) {
        alert("新密码和确认密码不一致！");
        return false;
    }

    // 验证新密码的复杂度
    const passwordRegex = /.{6,}/;
    if (!passwordRegex.test(newPassword)) {
        alert("新密码必须包含至少6个字符！");
        return false;
    }

    // 如果所有验证都通过，返回 true 提交表单
    return true;
}