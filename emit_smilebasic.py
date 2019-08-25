import sys

exports = dict()

imports = dict()

declared_func_types = dict()
function_types = dict()
scope_stack = []

def filter_var_name(var_name):
    return var_name.replace('$', 'VAR_')

def filter_func_name(func_name):
    return "F_" + func_name.replace("$", "")


def filter_label_name(func_name):
    return "L_" + func_name.replace("$", "")

def emit_parameter_list_start():
    sys.stdout.write("(")


def emit_parameter_list_end():
    print("DUMMY_PAR )\nDIM STACK[128]\nDIM TOP\nDIM AX\nDIM BX\nDIM DUMMY\nDIM PC")


def emit_i32_load8_u(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_load8_s(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_get(data):
    print("STACK[TOP + 1] = L" + filter_var_name(data[1]) + "\nINC TOP")


def emit_func(data):
    sys.stdout.write("REM---------------\nDEF " + filter_func_name(data[1]))


def emit_local_get(data):
    print("STACK[TOP + 1] = L" + filter_var_name(data[1]) + "\nINC TOP")


def emit_i32_const(data):
    print("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i64_const(data):
    print("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i32_add(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = AX + BX\nDEC TOP")


def emit_global_get(data):
    print("STACK[TOP + 1] = G" + filter_var_name(data[1]) + "\nINC TOP")


def emit_i32_sub(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX - BX)\nDEC TOP")


def emit_block(data):
    print("@BLOCK_" + filter_label_name(data[1]) + ":")


def emit_end(data):
    print("@END_"+ filter_label_name(data[1]) + ":")


def emit_i32_le_u(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX <= BX)\nDEC TOP")


def emit_i32_gt_u(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX > BX)\nDEC TOP")


def emit_i32_ge_u(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX >= BX)\nDEC TOP")


def emit_i32_load(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = MEMORY[MEMORY_ADDRESS]")


def emit_i64_load(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = MEMORY[MEMORY_ADDRESS]")


def emit_i32_and(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX AND BX)\nDEC TOP")


def emit_i32_lt_u(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX < BX)\nDEC TOP")


def emit_i32_shr_u(data):
    print()


def emit_i32_shl(data):
    print()


def emit_offset(data):
    print("REM OFFSET=" + data[1])


def emit_align(data):
    print()


def emit_i32_xor(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX XOR BX)\nDEC TOP")


def emit_i32_eq(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX == BX)\nDEC TOP")


def emit_i32_eqz(data):
    print("STACK[TOP] = ( STACK[TOP] == 0 )")


def emit_i32_ne(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX != BX)\nDEC TOP")


def emit_i32_or(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX OR BX)\nDEC TOP")


def emit_i32_rotl(data):
    print()


def emit_i32_store(data):
    print("MEMORY[STACK[TOP - 1 ]] = STACK[TOP]\nTOP = TOP - 2")


def emit_i64_store(data):
    print("MEMORY[STACK[TOP - 1 ]] = STACK[TOP]\nTOP = TOP - 2")


def emit_select(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nIF (STACK[TOP - 2] != 0) THEN\nSTACK[TOP - 2] = AX\nELSE\nSTACK[TOP - 2] = BX\nENDIF\nTOP = TOP - 2")


def emit_if(data):
    print("IF (STACK[TOP] == 0) THEN")


def emit_else(data):
    print("ELSE")


def emit_loop(data):
    print("@BLOCK_" + filter_label_name(data[1]) + ":")


def emit_drop(data):
    print("DEC TOP")


def emit_return(data):
    print("RETURN 0")


def emit_memory_grow(data):
    print("REM MEMORY GROW NOT SUPPORTED")


def emit_unreachable(data):
    print('PRINT "UNREACHABLE REACHED!!"\n END')


def emit_local_tee(data):
    print("L" + filter_var_name(data[1]) + " = STACK[TOP]")


def emit_local_set(data):
    print("L" + filter_var_name(data[1]) + " = STACK[TOP]\nDEC TOP")

def emit_br(data):

    label_to_jump = "@END_" + filter_label_name(data[1])

    for scope in scope_stack:
        if scope[1] == data[1] and scope[0] == "loop":
            label_to_jump = "@BLOCK_" + filter_label_name(data[1])


    print("GOTO " + label_to_jump )

def emit_local_declaration(data):
    print("DIM L" + filter_var_name(data))

def emit_call(data):

    if data[1] in imports:
        func_name = imports[data[1]]
    else:
        func_name = data[1]

    func_type = None

    if func_name in function_types:
        func_type = function_types[func_name]

    if func_type is not None:
        print("TOP = TOP - " + str(len(func_type.parameters)))

    sys.stdout.write("DUMMY = " + filter_func_name(func_name) + "(")
    new_top = 0

    if func_type is not None:
        for unused in func_type.parameters:
            sys.stdout.write("STACK[ TOP + " + str(new_top + 1) + "], ")
            new_top = new_top + 1

    print(" 0 )")  # dummy parameter
    if func_type is not None and func_type.returnType is not None:
        print("INC TOP")
        print("STACK[TOP] = DUMMY")

def emit_br_if(data):

    label_to_jump = "@END_" + filter_label_name(data[1])

    for scope in scope_stack:
        if scope[1] == data[1] and scope[0] == "loop":
            label_to_jump = "@BLOCK_" + filter_label_name(data[1])

    print("DEC TOP\nIF (STACK[TOP + 1] != 0) THEN GOTO " + label_to_jump )


def emit_global_set(data):
    print("G" + data[1] + " = STACK[TOP]\nDEC TOP")


def emit_end_function(data, func_type):
    if func_type is not None and func_type.returnType is not None:
        print("RETURN STACK[TOP]")
    else:
        print("RETURN 0")
    print("END")


def emit_memory():
    print("DIM MEMORY[1024 * 64]\nDIM MEMORY_ADDRESS")


def emit_empty_param_list():
    emit_parameter_list_start()
    emit_parameter_list_end()


def emit_parameter_definition(name):
    sys.stdout.write(filter_var_name(name) + ", ")

def emit_string_at_address(starting_address, null_terminated_string):
    offset = 0
    for ascii_letter in null_terminated_string:
        if ascii_letter is "\\" and null_terminated_string[ offset + 1 ] == '0':
            print("MEMORY[" + str(starting_address + offset) + "] = 0")
            return
        else:
            print("MEMORY[" + str(starting_address + offset) + "] = " + str(ord(ascii_letter)) )
        offset += 1

def emit_puts():
    sys.stdout.write("REM---------------\nDEF " + filter_func_name("puts"))
    emit_parameter_list_start()
    sys.stdout.write("PTR, ")
    emit_parameter_list_end()
    print("DIM OFFSET = 0")
    print("WHILE (MEMORY[PTR + OFFSET] != 0)")
    print("PRINT CHR$(MEMORY[PTR + OFFSET]);")
    print("INC OFFSET")
    print("WEND")
    print("PRINT '' ")
    emit_end_function(None, None)

def emit_strlen():
    sys.stdout.write("REM---------------\nDEF " + filter_func_name("strlen"))
    emit_parameter_list_start()
    sys.stdout.write("PTR, ")
    emit_parameter_list_end()
    print("DIM OFFSET = 0")
    print("WHILE (MEMORY[PTR + OFFSET] != 0)")
    print("INC OFFSET")
    print("WEND")
    print("RETURN OFFSET ")
    emit_end_function(None, None)

def emit_putchar():
    sys.stdout.write("REM---------------\nDEF " + filter_func_name("putchar"))
    emit_parameter_list_start()
    sys.stdout.write("CHAR, ")
    emit_parameter_list_end()
    print("PRINT CHR$(CHAR);")
    emit_end_function(None, None)