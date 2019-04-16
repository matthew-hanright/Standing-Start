print_text = argument0
xorigin = argument1
yorigin = argument2
xbound = argument3
ybound = argument4
length = string_length(print_text)
next_word = ""
text_width = 0
text_height = 0
current_char = 0
should_print = true
while (should_print) {
    for (i = current_char; i < length; i++;) {
        if (string_char_at(print_text, i) == " ") {
            next_word = string_copy(print_text, current_char, i)
        } 
    }
    if (text_width + string_width(next_word) > xbound) {
        text_height += string_height(next_word)
        text_width = 0
    }
    if (text_height <= ybound) {
        for (j = 0; j <= string_length(next_word); j++) { 
            if (j < string_length(next_word)) {
                draw_text(xorigin + text_width, yorigin + text_height, string_char_at(print_text, current_char))
                current_char++
                text_width += string_width(string_char_at(print_text, current_char))
                //show_debug_message("xorigin: " + string(xorigin) + " text_width: " +  string(text_width) + " yorigin: " +  string(yorigin) + " text_height: " +  string(text_height))
            }
            else {
                draw_text(xorigin + text_width, yorigin + text_height, " ")
                current_char++
            }
        }
    }
    else {
        should_print = false
        return current_char
    }
}
