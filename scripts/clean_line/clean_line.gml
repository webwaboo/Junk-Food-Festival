function clean_line(line) {
    for (var i = array_length(line) - 1; i >= 0; i--) {
        if (!instance_exists(line[i])) {
            array_delete(line, i, 1);
        }
    }
}
