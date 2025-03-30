function clean_line(line) {
    if (line == undefined) return;

    for (var i = array_length(line) - 1; i >= 0; i--) {
        var bloc = line[i];

        if (!is_undefined(bloc) && !instance_exists(bloc)) {
            array_delete(line, i, 1);
        }
    }
}
