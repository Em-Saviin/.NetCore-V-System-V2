 class AlertMessage {
    static success(message, title = 'Success') {
        Swal.fire({
            title: title,
            type: 'success',
            html: message
        });
    }

    static error(message, title = 'Error') {
        Swal.fire({
            title: title,
            type: 'error',
            html: message
        });
    }

    static warning(message, title = 'Warning') {
        Swal.fire({
            title: title,
            type: 'warning',
            html: message
        });
    }

    static info(message, title = 'Info') {
        Swal.fire({
            title: title,
            type: 'info',
            html: message
        });
    }

    static question(message, title = 'Question') {
        Swal.fire({
            title: title,
            type: 'question',
            html: message
        });
    }

    static loading(title = 'Loading...') {
        Swal.fire({
            title: title,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });
    }

    static close() {
        Swal.close();
    }

    static toastSuccess(message, timer = 3000) {
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'success',
            title: message,
            showConfirmButton: false,
            timer: timer,
            timerProgressBar: true
        });
    }

    static toastError(message, timer = 3000) {
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'error',
            title: message,
            showConfirmButton: false,
            timer: timer,
            timerProgressBar: true
        });
    }

    static confirm(message, onConfirm, onCancel = null, title = 'Are you sure?') {
        Swal.fire({
            title: title,
            html: message,
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                if (onConfirm) onConfirm();
            } else if (result.dismiss === Swal.DismissReason.cancel && onCancel) {
                onCancel();
            }
        });
    }
}
