function makeDraggable(dragElement) {
    dragElement.on('mousedown', function (e) {
        const modal = $(this).closest('.modal');
        let offset = modal.offset();
        let mouseX = e.pageX - offset.left;
        let mouseY = e.pageY - offset.top;

        $(document).on('mousemove.draggable', function (e) {
            modal.offset({
                left: e.pageX - mouseX,
                top: e.pageY - mouseY
            });
        });

        $(document).on('mouseup.draggable', function () {
            $(document).off('mousemove.draggable mouseup.draggable');
        });

        return false;
    });
}