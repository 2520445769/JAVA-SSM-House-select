
function confirmDeleteCell(id,name) {
    if (confirm("您确定要删除吗？")) {
        // 用户点击“确定”，执行删除操作
        window.location.href = "deleteCell?id=" + id+"&name="+name;
    }
    // 用户点击“取消”，不执行任何操作
}

function closeModal() {
    document.getElementById("error").style.display = "none";
    window.location.href="adminCell";
}

