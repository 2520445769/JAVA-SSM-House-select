document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
        const inputs = form.querySelectorAll('input[type="text"], input[type="password"]');
        let hasError = false;

        inputs.forEach(input => {
            if (input.value.trim() === '') {
                alert(`${input.placeholder} 不能为空`);
                input.focus();
                hasError = true;
            }
        });

        if (hasError) {
            event.preventDefault(); // 阻止表单提交
        }
    });
});