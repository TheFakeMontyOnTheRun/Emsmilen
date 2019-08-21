import sys


def emit_i32_load8_u(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")

def emit_i32_load8_s(data):
    print("MEMORY_ADDRESS = STACK[TOP]\nSTACK[TOP] = (MEMORY[MEMORY_ADDRESS])")


def emit_i32_get(data):
    print("STACK[TOP + 1] = L" + data[1] + "\nINC TOP")


def emit_func(data):
    sys.stdout.write("REM---------------\nDEF F_" + data[1].replace("$", ""))


def emit_local_get(data):
    print("STACK[TOP + 1] = L" + data[1] + "\nINC TOP")


def emit_i32_const(data):
    print("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i64_const(data):
    print("STACK[TOP + 1] = " + data[1] + "\nINC TOP")


def emit_i32_add(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = AX + BX\nDEC TOP")


def emit_global_get(data):
    print("STACK[TOP + 1] = G" + data[1] + "\nINC TOP")


def emit_i32_sub(data):
    print("AX = STACK[TOP]\nBX = STACK[TOP - 1]\nSTACK[TOP - 1] = (AX - BX)\nDEC TOP")


def emit_block(data):
    print()


def emit_end(data):
    print("ENDIF")


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
    print()


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
    print("WHILE (TRUE)")


def emit_drop(data):
    print("DEC TOP")


def emit_return(data):
    print("RETURN")


def emit_memory_grow(data):
    print("REM MEMORY GROW NOT SUPPORTED")


def emit_unreachable(data):
    print('PRINT "UNREACHABLE REACHED!!"\n END')


def emit_local_tee(data):
    print("L" + data[1] + " = STACK[TOP]")


def emit_local_set(data):
    print("L" + data[1] + " = STACK[TOP]\nDEC TOP" )


def emit_br(data):
    print()


def emit_call(data):
    print("F_" + data[1].replace("$", "") + "()")


def emit_br_if(data):
    print()


def emit_global_set(data):
    print("G" + data[1] + " = STACK[TOP]\nDEC TOP")

def emit_end_function(data, func_type ):
    if func_type is not None and func_type.returnType is not None:
        print("RETURN STACK[TOP]")
    print("END")

def emit_memory():
    print("DIM MEMORY[1024 * 64]\nDIM MEMORY_ADDRESS")

def emit_empty_param_list():
    print("()\nDIM STACK[128]\nDIM TOP\nDIM AX\nDIM BX\nDIM PC")

def emit_parameter_list(params_without_param_token):
    sys.stdout.write("(")
    index = 0

    for param in params_without_param_token:
        sys.stdout.write("L" + str(index) )
        index = index + 1

        if index < len(params_without_param_token):
            sys.stdout.write(", ")
        else:
            print(")\nDIM STACK[128]\nDIM TOP")