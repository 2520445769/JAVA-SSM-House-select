

    function confirmDeleteHouse(id) {
        if (confirm("您确定要删除吗？")) {
            // 用户点击“确定”，执行删除操作
            window.location.href = "deleteHouse?id=" + id;
        }
        // 用户点击“取消”，不执行任何操作
    }

    function closeModal() {
        document.getElementById("del").style.display = "none";
        window.location.href="adminCell";
    }
