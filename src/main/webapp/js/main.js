// Main JavaScript features for Farm 2 Shop Web Application

document.addEventListener("DOMContentLoaded", function() {
    // Alert auto-hide logic
    const alerts = document.querySelectorAll(".alert");
    alerts.forEach(function(alert) {
        setTimeout(function() {
            alert.style.opacity = '0';
            alert.style.transform = 'translateY(-10px)';
            alert.style.transition = 'all 0.5s ease';
            setTimeout(function() {
                alert.remove();
            }, 500);
        }, 4000);
    });

    // Confirmation dialogs
    const deleteButtons = document.querySelectorAll(".btn-delete-confirm");
    deleteButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            if (!confirm("Are you sure you want to delete this item? This action cannot be undone.")) {
                event.preventDefault();
            }
        });
    });
});

// Modal toggle functions
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.add("active");
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.classList.remove("active");
    }
}
