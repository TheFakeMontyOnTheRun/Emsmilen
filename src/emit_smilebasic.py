import sys

exports = dict()
generated_code = []
imports = dict()

declared_func_types = dict()
function_types = dict()
scope_stack = []
pages_number = 0

def appendLine(line):
    generated_code.append(line)
    generated_code.append("\n")

def appendText(line):
    generated_code.append(line)

def filter_var_name(var_name):
    return var_name.replace('$', 'VAR_')

def filter_func_name(func_name):
    return "F_" + func_name.replace("$", "")


def filter_label_name(func_name):
    return "L_" + func_name.replace("$", "")

def emit_parameter_list_start():
    appendText("(")


def emit_parameter_list_end():
    appendLine("DUMMY_PAR )\nDIM STACK[128]\nDIM TOP\nDIM AX\nDIM BX\nDIM DUMMY\nDIM PC")


def emit_i32_load8_u(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_load8_s(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")

def emit_i32_load16_u(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_load16_s(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_get(data):
    appendLine("STACK[TOP + 1] = L" + filter_var_name(data[1]) + "\nINC TOP")


def emit_func(data):
    appendText("REM---------------\nDEF " + filter_func_name(data[1]))


def emit_local_get(data):
    appendLine("STACK[TOP + 1] = L" + filter_var_name(data[1]) + "\nINC TOP")


def emit_i32_const(data):
    appendLine("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i64_const(data):
    appendLine("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i32_add(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = AX + BX\nDEC TOP")


def emit_global_get(data):
    appendLine("STACK[TOP + 1] = G" + filter_var_name(data[1]) + "\nINC TOP")


def emit_i32_sub(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX - BX)\nDEC TOP")


def emit_block(data):
    appendLine("@BLOCK_" + filter_label_name(data[1]) + ":")


def emit_end(data):
    if len(data) > 1:
        appendLine("@END_"+ filter_label_name(data[1]) + ":")
    else:
        name = scope_stack[ len(scope_stack) - 1 ][1]
        appendLine("@END_" + filter_label_name(name) + ":")


def emit_i32_le_u(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX >= BX)\nDEC TOP")

def emit_i32_lt_u(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX > BX)\nDEC TOP")

def emit_i32_gt_u(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX < BX)\nDEC TOP")

def emit_i32_eq(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX == BX)\nDEC TOP")


def emit_i32_eqz(data):
    appendLine("STACK[TOP] = ( STACK[TOP] == 0 )")


def emit_i32_ne(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX != BX)\nDEC TOP")


def emit_i32_ge_u(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX <= BX)\nDEC TOP")


def emit_i32_load(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = MEMORY[MEMORY_ADDRESS]")


def emit_i64_load(data):
    appendLine("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = MEMORY[MEMORY_ADDRESS]")


def emit_i32_and(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX AND BX)\nDEC TOP")


def emit_i32_shr_u(data):
    appendLine("")


def emit_i32_shl(data):
    appendLine("")


def emit_offset(data):
    appendLine("REM OFFSET=" + data[1])


def emit_align(data):
    appendLine("")


def emit_i32_xor(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX XOR BX)\nDEC TOP")


def emit_i32_or(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX OR BX)\nDEC TOP")


def emit_i32_rotl(data):
    appendLine("")


def emit_i32_store(data):
    appendLine("MEMORY[STACK[TOP - 1 ]] = STACK[TOP]\nTOP = TOP - 2")


def emit_i64_store(data):
    appendLine("MEMORY[STACK[TOP - 1 ]] = STACK[TOP]\nTOP = TOP - 2")


def emit_select(data):
    appendLine("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nIF (STACK[TOP - 2] != 0) THEN\nSTACK[TOP - 2] = AX\nELSE\nSTACK[TOP - 2] = BX\nENDIF\nTOP = TOP - 2")


def emit_if(data):
    appendLine("IF (STACK[TOP] == 0) THEN")


def emit_else(data):
    appendLine("ELSE")


def emit_loop(data):
    appendLine("@BLOCK_" + filter_label_name(data[1]) + ":")


def emit_drop(data):
    appendLine("DEC TOP")


def emit_return(data):
    appendLine("RETURN 0")


def emit_memory_grow(data):
    appendLine("REM MEMORY GROW NOT SUPPORTED")


def emit_unreachable(data):
    appendLine('PRINT "UNREACHABLE REACHED!!"\n END')

def emit_unsupported(data):
    appendLine('PRINT "UNSUPPORTED OPERATION REACHED!!"\n END')

def emit_current_memory(data):
    appendLine("STACK[TOP + 1] = " + (pages_number) + "\nINC TOP")

def emit_local_tee(data):
    appendLine("L" + filter_var_name(data[1]) + " = STACK[TOP]")


def emit_local_set(data):
    appendLine("L" + filter_var_name(data[1]) + " = STACK[TOP]\nDEC TOP")

def emit_br(data):

    label_to_jump = "@END_" + filter_label_name(data[1])

    for scope in scope_stack:
        if scope[1] == data[1] and scope[0] == "loop":
            label_to_jump = "@BLOCK_" + filter_label_name(data[1])


    appendLine("GOTO " + label_to_jump )

def emit_local_declaration(data):
    appendLine("DIM L" + filter_var_name(data))

def emit_call(data):

    if data[1] in imports:
        func_name = imports[data[1]]
    else:
        func_name = data[1]

    func_type = None

    if func_name in function_types:
        func_type = function_types[func_name]

    if func_type is not None:
        appendLine("TOP = TOP - " + str(len(func_type.parameters)))

    appendText("DUMMY = " + filter_func_name(func_name) + "(")
    new_top = 0

    if func_type is not None:
        for unused in func_type.parameters:
            appendText("STACK[ TOP + " + str(new_top + 1) + "], ")
            new_top = new_top + 1

    appendLine(" 0 )")  # dummy parameter
    if func_type is not None and func_type.returnType is not None:
        appendLine("INC TOP")
        appendLine("STACK[TOP] = DUMMY")

def emit_br_if(data):

    label_to_jump = "@END_" + filter_label_name(data[1])

    for scope in scope_stack:
        if scope[1] == data[1] and scope[0] == "loop":
            label_to_jump = "@BLOCK_" + filter_label_name(data[1])

    appendLine("DEC TOP\nIF (STACK[TOP + 1] != 0) THEN GOTO " + label_to_jump )


def emit_global_set(data):
    appendLine("G" + data[1] + " = STACK[TOP]\nDEC TOP")


def emit_end_function(data, func_type):
    if func_type is not None and func_type.returnType is not None:
        appendLine("RETURN STACK[TOP]")
    else:
        appendLine("RETURN 0")
    appendLine("END")


def emit_memory(pages):
    global pages_number
    pages_number = pages
    appendLine("DIM MEMORY[1024 * 64 * " + str(pages) + "]\nDIM MEMORY_ADDRESS")


def emit_empty_param_list():
    emit_parameter_list_start()
    emit_parameter_list_end()


def emit_parameter_definition(name):
    appendText(filter_var_name(name) + ", ")

def emit_string_at_address(starting_address, null_terminated_string):
    offset = 0
    for ascii_letter in null_terminated_string:
        if ascii_letter is "\\" and null_terminated_string[ offset + 1 ] == '0':
            appendLine("MEMORY[" + str(starting_address + offset) + "] = 0")
            return offset
        else:
            appendLine("MEMORY[" + str(starting_address + offset) + "] = " + str(ord(ascii_letter)) )
        offset += 1

    return offset

def emit_puts():
    appendText("REM---------------\nDEF " + filter_func_name("puts"))
    emit_parameter_list_start()
    appendText("PTR, ")
    emit_parameter_list_end()
    appendLine("DIM OFFSET = 0")
    appendLine("WHILE (MEMORY[PTR + OFFSET] != 0)")
    appendLine("PRINT CHR$(MEMORY[PTR + OFFSET]);")
    appendLine("INC OFFSET")
    appendLine("WEND")
    appendLine("PRINT '' ")
    emit_end_function(None, None)

def emit_strlen():
    appendText("REM---------------\nDEF " + filter_func_name("strlen"))
    emit_parameter_list_start()
    appendText("PTR, ")
    emit_parameter_list_end()
    appendLine("DIM OFFSET = 0")
    appendLine("WHILE (MEMORY[PTR + OFFSET] != 0)")
    appendLine("INC OFFSET")
    appendLine("WEND")
    appendLine("RETURN OFFSET ")
    emit_end_function(None, None)

def emit_putchar():
    appendText("REM---------------\nDEF " + filter_func_name("putchar"))
    emit_parameter_list_start()
    appendText("CHAR, ")
    emit_parameter_list_end()
    appendLine("PRINT CHR$(CHAR);")
    emit_end_function(None, None)